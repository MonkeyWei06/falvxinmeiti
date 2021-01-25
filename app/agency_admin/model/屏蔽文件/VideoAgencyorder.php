<?php
/**
 * Created by PhpStorm.
 * User: Memberistrator
 * Date: 2018/1/4
 * Time: 10:54
 */
namespace app\agency_admin\model;
use think\Model;
use think\Db;
class VideoAgencyorder extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='MemberTime';
    protected $updateTime=false;
    protected $resultSetType = 'collection';// 查询数据集对象
	protected $table = 'web_agencyorder';
    //会员订单及我的订单
    public function GetOrderList($UrlParam,$Where,$PageCount,$MemberTypeID,$AgencySiteInfo=array(),$type) 
		//$type=1 是会员订单，2是我的订单3代理订单
    {
        $Where=array_merge($UrlParam,$Where);
        $WhereArr=array();
        if(!empty($Where['title'])) $WhereArr['A.article_title|O.order_number']=['like','%'.trim($Where['title']).'%'];//文章标题
        if(!empty($Where['name'])) $WhereArr['M.MemberName']=['like','%'.trim($Where['name']).'%'];//用户名
        if(!empty($Where['date1']) || !empty($Where['date2'])){
            if(!empty($Where['date1']) && !empty($Where['date2'])){
                $Where['date1']=strtotime($Where['date1']);
                $Where['date2']=strtotime($Where['date2']);
                $begin_time=min($Where['date1'],$Where['date2']);
                $end_time=max($Where['date1'],$Where['date2']);$end_time+=86399;
                $WhereArr['O.order_time']=['between',[$begin_time,$end_time]];
            }else if(!empty($Where['date1']) && empty($Where['date2'])){
                $Where['date1']=strtotime($Where['date1'].' 00:00:00');
                $WhereArr['O.order_time']=['>=',$Where['date1']];
            }else if(empty($Where['date1']) && !empty($Where['date2'])){
                $Where['date1']=strtotime($Where['date1'].' 00:00:00');
                $WhereArr['O.order_time']=['<=',$Where['date1']];
            }
        }
        if(isset($Where['status']) && $Where['status']>='0')$WhereArr['O.order_state']=$Where['status'];//状态
        if(!empty($Where['MediaTitle']))$WhereArr['MD.MediaTitle']=['like','%'.trim($Where['MediaTitle']).'%'];
        if(!empty($Where['article_title']))$WhereArr['A.article_title']=['like','%'.trim($Where['article_title']).'%'];
        if($type==1){//获得会员订单
            $WhereArr['O.RegDomain']=$AgencySiteInfo['Domain'];//本域名的订单 by yuyang
            $WhereArr['A.member_id']=['neq',$AgencySiteInfo['MemberID']];//不是代理自己发的订单
        }else if($type==2){//获得我的订单
            $WhereArr['O.RegDomain']=$AgencySiteInfo['Domain'];//本域名的订单
            $WhereArr['M.GroupID']=['>=',2];//而且是代理订单
        }else if($type==3){//获得代理订单
            $WhereArr['O.agency_id1']=$Where['agency_id'];//筛选一级代理
            $WhereArr['O.agency_id']=['neq',0];//而且是代理订单
        }

        /**
         * 订单没有存放会员名称，有很大的不便
         */
		 $WhereArr['O.media_type']=3;
        $List=$this
            ->field('O.*,A.article_title,A.article_website,A.article_id,M.MemberName,MD.MediaTitle')
            ->alias('O')//订单表
            ->where($WhereArr)
            ->join('article A','A.article_id=O.article_id','left')//订单对应的文章
            ->join('member M','M.MemberID=A.member_id','left')//文章对应的会员名称
            ->join('videomedia MD','MD.MediaID=O.media_id','left')//订单对应的媒体
            ->order('O.agencyorder_id Desc')
            ->paginate($PageCount,false,[
            'query' => $UrlParam,
        ]);
        //echo db()->getLastSql();
        $Money = [2=>'order_money2',3=>'order_money1'];
        if(!empty($List)){
            foreach ($List as $Key=>$Val){
                $List[$Key]['order_time']=date("Y-m-d H:i",$Val['order_time']);
                $List[$Key]['order_stateold']=$Val['order_state'];
                if($type==1||$type==3){
                    $List[$Key]['order_money']=$Val['order_money'];
                }else{
                    if($AgencySiteInfo['MemberTypeID'] ==3){
                        $List[$Key]['order_money']=$Val['order_money1'];
                    }else if($AgencySiteInfo['MemberTypeID'] ==2){
                        $List[$Key]['order_money']=$Val['order_money2'];
                    }else{
                        $List[$Key]['order_money']=$Val['order_money'];
                    }
                }
                if($AgencySiteInfo['MemberTypeID'] ==3){
                    $List[$Key]['order_moneyaffirm']=$Val['order_money1'];
                }else if($AgencySiteInfo['MemberTypeID'] ==2){
                    $List[$Key]['order_moneyaffirm']=$Val['order_money2'];
                }
            }
        }
        return $List;
    }
    /**
     * 财务财务报表
     */
    public function GetBillList($UrlParam,$Where,$PageCount,$Field='*',$type='member')
    {
        $Where=array_merge($UrlParam,$Where);
        $WhereArr=array();
        if(!empty($Where['keyword'])) $WhereArr['A.article_title|M.MemberName|O.order_number']=['like','%'.trim($Where['keyword']).'%'];//文章标题
        if(!empty($Where['code'])) $WhereArr['M.MemberInviteCode']=trim($Where['code']);//文章标题
        //if(!empty($Where['date1'])) $WhereArr['O.order_time']=['>'=>$Where['date1']];//开始时间
        //if(!empty($Where['date2'])) $WhereArr['O.order_time']=['<'=>$Where['date2']];//结束时间
        $StartDate  = empty($Where['date1'])?'':$Where['date1'];
        $EndDate    = empty($Where['date2'])?'':$Where['date2'];
        if(!empty($StartDate) || !empty($EndDate)){
            if(empty($StartDate)) $StartDate=date('Y-m-d');
            if(empty($EndDate)) $EndDate=date('Y-m-d');
        }
        if(!empty($StartDate) && !empty($EndDate)){
            $StartDate=strtotime($StartDate);$EndDate=strtotime($EndDate);
            $MinDate=min($StartDate,$EndDate);$MaxDate=max($StartDate,$EndDate);
            $MaxDate+=86399;
            $UrlParam['startdate']=date('Y-m-d',$MinDate);
            $UrlParam['enddate']=date('Y-m-d',$MaxDate);
            $UrlParam['MinDate']=$MinDate;$UrlParam['MaxDate']=$MaxDate;
            $WhereArr['O.order_time']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
        if($Where['MemberTypeID']==2){//二级代理,只有会员
            $WhereArr['O.agency_id']=$Where['agency_id'];//状态
            $WhereArr['O.agency_id1']=['>',0];//状态
            if($type=='member') {
                
                $WhereArr['M.MemberTypeID']='1';
            }else{
                $WhereArr['M.MemberTypeID']=['>',1];
            }
            
        }elseif($Where['MemberTypeID']==3){//一级代理
            
            if($type=='member') {
                $WhereArr['O.agency_id1']=$Where['agency_id'];//状态
                $WhereArr['O.agency_id']=0;//状态
                $WhereArr['M.MemberTypeID']=1;
            } else {
                $WhereArr['O.agency_id1']=$Where['agency_id'];//状态
                
                $WhereArr['M.MemberTypeID']=['>',1];
            }
            
        }
        $WhereArr['O.order_state']=['in','2'];
		$WhereArr['O.media_type']=3;
       
        //dump($WhereArr);
        $List=$this
            ->field('O.*,A.article_title,M.MemberName,M.GroupID,M.MemberTypeID,MD.MediaTitle,W2.TypeName as hylx,M2.TypeName as dllx')
            ->alias('O')//订单表
            ->where($WhereArr)
            ->join('article A','A.article_id=O.article_id','left')//订单对应的文章
            ->join('member M','M.MemberID=A.member_id','left')//文章对应的会员名称
            ->join('media MD','MD.MediaID=O.media_id','left')//订单对应的媒体
//            ->join('wholetype W','W.TypeID=M.GroupID','left')//会员代理
            ->join('wholetype W2','W2.TypeID=M.MemberPriceType','left')//会员类型
            ->join('membertype M2','M2.TypeID=M.MemberTypeID','left')//代理类型
            ->order('O.agencyorder_id Desc')
            ->paginate($PageCount,false,[
            'query' => $UrlParam,
        ]);
        //echo $this->getLastSql();
        if(!empty($List)){
            foreach ($List as $Key=>$Val){
                $List[$Key]['order_time']=date("m-d H:i",$Val['order_time']);
                $List[$Key]['release_time']=date("m-d H:i",$Val['release_time']);
                $name = $Val['GroupID'] == 1?$Val['hylx']:$Val['dllx'];
                $List[$Key]['hylx']=$name;
                if($Where['MemberTypeID'] ==3){ //一级代理
                    $List[$Key]['cbj']=$Val['order_money1'];
                    $List[$Key]['cjj']=$Val['order_money'];
                    $List[$Key]['lr']=$Val['order_money']-$Val['order_money1'];
                }elseif($Where['MemberTypeID'] == 2){//二级代理
                    $List[$Key]['cbj']=$Val['order_money2'];
                    $List[$Key]['cjj']=$Val['order_money'];
                    $List[$Key]['lr']=$Val['order_money']-$Val['order_money2'];
                }
            }
        }
        $TotalList=$this
            ->field('O.*,A.article_title,M.MemberName,M.GroupID,M.MemberTypeID,MD.MediaTitle,W2.TypeName as hylx,M2.TypeName as dllx')
            ->alias('O')//订单表
            ->where($WhereArr)
            ->join('article A','A.article_id=O.article_id','left')//订单对应的文章
            ->join('member M','M.MemberID=A.member_id','left')//文章对应的会员名称
            ->join('media MD','MD.MediaID=O.media_id','left')//订单对应的媒体
//            ->join('wholetype W','W.TypeID=M.GroupID','left')//会员代理
            ->join('wholetype W2','W2.TypeID=M.MemberPriceType','left')//会员类型
            ->join('membertype M2','M2.TypeID=M.MemberTypeID','left')//代理类型
            ->select();
        $TotalMoney='0.00';
        if(!empty($TotalList)){
            foreach ($TotalList as $Key=>$Val){
                if($Where['MemberTypeID'] == 3){
                    if(!($Val['order_money2']*1)){
                        $TotalList[$Key]['cbj']=$Val['order_money1'];
                        $TotalList[$Key]['cjj']=$Val['order_money'];
                        $TotalList[$Key]['lr']=$Val['order_money']-$Val['order_money1'];
                    }else{
                        $TotalList[$Key]['cbj']=$Val['order_money2'];
                        $TotalList[$Key]['cjj']=$Val['order_money'];
                        $TotalList[$Key]['lr']=$Val['order_money']-$Val['order_money2'];
                    }
                }elseif($Where['MemberTypeID'] == 2){
                    $TotalList[$Key]['cbj']=$Val['order_money2'];
                    $TotalList[$Key]['cjj']=$Val['order_money'];
                    $TotalList[$Key]['lr']=$Val['order_money']-$Val['order_money2'];
                }
                $TotalMoney+=$TotalList[$Key]['lr'];
            }
        }
        return [$List,$TotalMoney];
    }
}
