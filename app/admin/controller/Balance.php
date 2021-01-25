<?php
/**
 * Created by PhpStorm.
 * User: Balanceistrator
 * Date: 2018/1/4
 * Time: 9:49
 */
namespace app\admin\controller;
use \app\admin\model\Balance as BalanceModel;
use think\Db;
class Balance extends Common
{
    private $PageCount=20;
    private $MenuName='会员账户余额';//栏目名称
    public function _initialize()
    {
        parent::_initialize();
        $this->assign('MenuName',$this->MenuName);
    }
    public function index()
    {
        $UrlParam=input();
        $StartDate = input('startdate', '');
        $EndDate = input('enddate', '');
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
        }
        $Model=new BalanceModel();
        $arr=$Model->GetList($UrlParam,$this->PageCount);
        $this->assign('List',$arr[0]);
		$Where=array();
		$czcount=$Model->Getsumcount($UrlParam,1);
		$this->assign('czcount',$czcount);

		if(!empty($UrlParam['MinDate']) && !empty($UrlParam['MaxDate'])){
            $Where['order_time']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
		$Where['order_state']=2;
		//消费计算
		$xfcount=Db::name('agencyorder')->where( $Where)->sum("order_money");
		$this->assign('xfcount',$xfcount);

		//成本计算
		$tgcount=Db::name('agencyorder')->where( $Where)->sum("media_money");
		$this->assign('tgcount',$tgcount);

        $this->assign('UrlParam',$UrlParam);
        return $this->fetch();
    }
    public function add()
    {
        if($this->request->isPost())
        {
            $Post=input('post.');
            $this->AddSave($Post);
        }else{
            return $this->fetch();
        }
    }
    //保存数据
    private function AddSave($Post)
    {
        //dump($Post);
        $MemberName=$Post['MemberName'];
        if(empty($MemberName)) $this->error('请填写您要充值/扣除的会员');
        unset($Post['MemberName']);
        $Model=new BalanceModel();
        $MemberModel=new \app\admin\model\Member();
        $Info=$MemberModel->where('MemberName',$MemberName)->find();
        if(empty($Info['MemberID'])) $this->error('您所填写的会员名称不存在');
        $Post['BalanceMemberRecommendID']=$Info['MemberRecommendID'];
        $Post['BalanceMemberRecommendPath']=$Info['MemberRecommendPath'];
        $MemberID=$Info['MemberID'];
        $GroupID=$Info['GroupID'];
        if(empty($GroupID)) $this->error('账户类型系统错误');
        $Sum=0;$Mark='';
        if($Post['BalanceType']==1)
        {
            $Mark='充值';
            if($GroupID==1){
                $Sum=$Info['MemberBalanceCount']+$Post['BalanceCount'];
            }elseif($GroupID==2){
                $Sum=$Info['MemberAgentBalanceCount']+$Post['BalanceCount'];
            }
			$Post['BalancePayState']=1;
        }else if($Post['BalanceType']==2){
            $Mark='扣除';
            if($GroupID==1){
                if($Info['MemberBalanceCount']>=$Post['BalanceCount']){
                    $Sum=$Info['MemberBalanceCount']-$Post['BalanceCount'];
                }else{
                    $Post['BalanceCount']=$Info['MemberBalanceCount'];
                    $Sum=0;
                }
            }elseif($GroupID==2){
                if($Info['MemberAgentBalanceCount']>=$Post['BalanceCount']){
                    $Sum=$Info['MemberAgentBalanceCount']-$Post['BalanceCount'];
                }else{
                    $Post['BalanceCount']=$Info['MemberAgentBalanceCount'];
                    $Sum=0;
                }
            }
        }
        //会员账户积分余额变更
        $Data=array();
        if($GroupID==1){
            $Data['MemberBalanceCount']=$Sum;
        }elseif($GroupID==2){
            $Data['MemberAgentBalanceCount']=$Sum;
        }
        $MemberModel->EditInfo($MemberID,$Data);
        $Post['BalanceMemberID']=$MemberID;
        $Post['BalanceCurrentCount']=$Sum;
        $Post['BalanceState']=1;
        $Post['BalanceNumber']='cz'.order_num();
        $Model->data($Post)->save();
        $IDStr=$Model->getLastInsID();
        AdminLogDetail(['LogOperateTitle'=>$this->MenuName.$Mark.'操作成功','LogOperateContent'=>'ID:'.$IDStr]);
        $this->success($this->MenuName.$Mark.'操作成功',url('index'));
    }
    //删除数据
    public function del(){
        $ID=input('param.id','0','abs');
        if(empty($ID)){
            $ID=input('post.Del/a');
        }
        if(empty($ID)){$this->error('请不要发非法操作');}
        $where=array();
        $where['BalanceID']=['in',$ID];
        \think\Db::name('balance')->where($where)->delete();
        $IDStr=is_array($ID)?implode(',',$ID):$ID;
        AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'数据删除','LogOperateContent'=>'ID:'.$IDStr]);
        $this->success($this->MenuName.'删除成功');
    }

    //主站财务报表
    public function bill_member()
    {
        $UrlParam=input();
        $where = array();
        if(@$UrlParam['MemberTypeID']) $where['A3.MemberTypeID'] =$UrlParam['MemberTypeID'];
        if(@$UrlParam['keyword']) $where['AO.order_number|A.article_num|A3.MemberName'] = ['like','%'.$UrlParam['keyword'].'%'];
        if(@$UrlParam['keyword2']){
            $where['A3.MemberInviteCode'] = trim($UrlParam['keyword2']);
        }
        $StartDate = input('startdate', '');
        $EndDate = input('enddate', '');
        if(empty($StartDate)||(strtotime($StartDate)<strtotime('2019-01-15'))){
            $StartDate=date('2019-01-15');
        }
        if(empty($EndDate)){
            $EndDate=date('Y-m-d');
        }

        if(!empty($StartDate) && !empty($EndDate)){
            $StartDate=strtotime($StartDate);$EndDate=strtotime($EndDate);
            $MinDate=min($StartDate,$EndDate);$MaxDate=max($StartDate,$EndDate);
            $MaxDate+=86399;
            $UrlParam['startdate']=date('Y-m-d',$MinDate);
            $UrlParam['enddate']=date('Y-m-d',$MaxDate);
            $UrlParam['MinDate']=$MinDate;$UrlParam['MaxDate']=$MaxDate;
            $where['AO.release_time']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
        //$where['AO.RegDomain'] = '-1';
        //$where['A1.MemberTypeID']=['in','1,3'];
        $where['AO.order_state']=['eq','2'];
        $List = Db::name('agencyorder')
            ->alias('AO')
            ->field('AO.*,A.*,A3.MemberTypeID,A3.MemberPriceType,M.MediaTitle,M.MediaWebPrice,M.MediaMemberPrice1,M.MediaMemberPrice2,M.MediaMemberPrice3,M.MediaMemberPrice4,A3.MemberName as Mem3,A3.GroupID,MT.TypeName as dljb,WT.TypeName as hyjb')
            ->join('article A','A.article_id=AO.article_id','left')//文章
            ->join('media M', 'M.MediaID=AO.media_id', 'left')//媒体
            ->join('member A3', 'A3.MemberID=A.member_id', 'left')//发布会员
            ->join('membertype MT', 'MT.TypeID=A3.MemberTypeID', 'left')
            ->join('wholetype WT', 'WT.TypeID=A3.MemberPriceType', 'left')
            ->where($where)
            ->order('A.article_time desc')
            ->paginate(20,false,['query'  => $UrlParam])
            ->each(function($val,$key){
                $val['LiRunPrice']=$val['order_money']-$val['media_money'];
                return $val;
            });
        $TotalList = Db::name('agencyorder')
            ->alias('AO')
            ->field('AO.*,A.*,A3.MemberTypeID,A3.MemberPriceType,M.MediaTitle,M.MediaWebPrice,M.MediaMemberPrice1,M.MediaMemberPrice2,M.MediaMemberPrice3,M.MediaMemberPrice4,A3.MemberName as Mem3,A3.GroupID,MT.TypeName as dljb,WT.TypeName as hyjb')
            ->join('article A','A.article_id=AO.article_id','left')//文章
            ->join('media M', 'M.MediaID=AO.media_id', 'left')//媒体
            ->join('member A3', 'A3.MemberID=A.member_id', 'left')//发布会员
            ->join('membertype MT', 'MT.TypeID=A3.MemberTypeID', 'left')
            ->join('wholetype WT', 'WT.TypeID=A3.MemberPriceType', 'left')
            ->where($where)
            ->select();
        //var_dump($where);
       //     echo Db::name('agencyorder')->getLastSql();
        $TotalMoney='0.00';
        if(!empty($TotalList)){
            foreach($TotalList as $key=>$val){
                $val['LiRunPrice']=$val['order_money']-$val['media_money'];
                $TotalMoney+=$val['LiRunPrice'];
            }
        }
        $this->assign('List',$List);
        $this->assign('TotalMoney',$TotalMoney);
        $this->assign('GetMemberTypeList',$this->GetAgentTypeList(1));
        return view();
    }
    //代理商财务报表
    public function bill_agent()
    {
        $UrlParam=input();
        $where = array();
        if(@$UrlParam['MemberTypeID']) $where['A3.MemberTypeID'] =$UrlParam['MemberTypeID'];
        if(@$UrlParam['keyword']) $where['AO.order_number|A.article_num|A1.MemberName|A2.MemberName|A3.MemberName'] = ['like','%'.$UrlParam['keyword'].'%'];
        if(@$UrlParam['keyword2']){
            $where['A3.MemberInviteCode'] = trim($UrlParam['keyword2']);
        }
        $StartDate = input('startdate', '');
        $EndDate = input('enddate', '');
        

        if(empty($StartDate)||(strtotime($StartDate)<strtotime('2019-01-15'))){
            $StartDate=date('2019-01-15');
        }
        if(empty($EndDate)){
            $EndDate=date('Y-m-d');
        }


        if(!empty($StartDate) && !empty($EndDate)){
            $StartDate=strtotime($StartDate);
            $EndDate=strtotime($EndDate);
            $MinDate=min($StartDate,$EndDate);$MaxDate=max($StartDate,$EndDate);
            $MaxDate+=86399;
            $UrlParam['startdate']=date('Y-m-d',$MinDate);
            $UrlParam['enddate']=date('Y-m-d',$MaxDate);
            $UrlParam['MinDate']=$MinDate;$UrlParam['MaxDate']=$MaxDate;
            $where['AO.release_time']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
        //$where['A3.RegDomain'] = '-1';
        //$where['A1.MemberTypeID']=['in','1,3'];
        $where['AO.RegDomain']=['neq','-1'];
        $where['AO.order_state']=['eq','2'];
       // var_dump($where);
        $List = Db::name('agencyorder')
            ->alias('AO')
            ->field('AO.*,A.*,A3.MemberTypeID,A3.MemberPriceType,M.MediaTitle,M.MediaWebPrice,M.MediaMemberPrice1,M.MediaMemberPrice2,M.MediaMemberPrice3,M.MediaMemberPrice4,A1.MemberName as Mem1,A2.MemberName as Mem2,A3.MemberName as Mem3,A3.GroupID,MT.TypeName as dljb,WT.TypeName as hyjb')
            ->join('article A','A.article_id=AO.article_id','left')//文章
            ->join('media M', 'M.MediaID=AO.media_id', 'left')//媒体
            ->join('member A1', 'A1.MemberID=AO.agency_id1', 'left')//一级代理
            ->join('member A2', 'A2.MemberID=AO.agency_id', 'left')//二级代理
            ->join('member A3', 'A3.MemberID=A.member_id', 'left')//发布会员
            ->join('membertype MT', 'MT.TypeID=A3.MemberTypeID', 'left')
            ->join('wholetype WT', 'WT.TypeID=A3.MemberPriceType', 'left')
            ->where($where)
            ->order('A.article_time desc')
            ->paginate(20,false,['query'  => $UrlParam])
            ->each(function($val,$key){
//                $Money='0.00';
//                if($val['MemberPriceType']==116){//游客价格
//                    $Money=$val['MediaMemberPrice1'];
//                }else if($val['MemberPriceType']==117){//大侠价格
//                    $Money=$val['MediaMemberPrice2'];
//                }else if($val['MemberPriceType']==118){//掌门价格
//                    $Money=$val['MediaMemberPrice3'];
//                }else if($val['MemberPriceType']==119){//盟主价格
//                    $Money=$val['MediaMemberPrice4'];
//                }
               /* if($val['MemberTypeID']==1){
                    $val['LiRunPrice']=$val['order_money']-$val['MediaWebPrice'];
                }else if($val['MemberTypeID']==2){
                    $val['LiRunPrice']=$val['order_money2']-$val['MediaWebPrice'];
                }else if($val['MemberTypeID']==3){
                    $val['LiRunPrice']=$val['order_money1']-$val['MediaWebPrice'];
                }else $val['LiRunPrice']=0;*/
                $val['LiRunPrice']=$val['order_money1']-$val['media_money'];
                return $val;
            });
        $TotalList = Db::name('agencyorder')
            ->alias('AO')
            ->field('AO.*,A.*,A3.MemberTypeID,A3.MemberPriceType,M.MediaTitle,M.MediaWebPrice,M.MediaMemberPrice1,M.MediaMemberPrice2,M.MediaMemberPrice3,M.MediaMemberPrice4,A1.MemberName as Mem1,A2.MemberName as Mem2,A3.MemberName as Mem3,A3.GroupID,MT.TypeName as dljb,WT.TypeName as hyjb')
            ->join('article A','A.article_id=AO.article_id','left')//文章
            ->join('media M', 'M.MediaID=AO.media_id', 'left')//媒体
            ->join('member A1', 'A1.MemberID=AO.agency_id1', 'left')//一级代理
            ->join('member A2', 'A2.MemberID=AO.agency_id', 'left')//二级代理
            ->join('member A3', 'A3.MemberID=A.member_id', 'left')//发布会员
            ->join('membertype MT', 'MT.TypeID=A3.MemberTypeID', 'left')
            ->join('wholetype WT', 'WT.TypeID=A3.MemberPriceType', 'left')
            ->where($where)
            ->select();
        //echo Db::name('agencyorder')->getLastSql();
        $TotalMoney='0.00';
        if(!empty($TotalList)){
            foreach($TotalList as $key=>$val){
//                $Money='0.00';
//                if($val['MemberPriceType']==116){//游客价格
//                    $Money=$val['MediaMemberPrice1'];
//                }else if($val['MemberPriceType']==117){//大侠价格
//                    $Money=$val['MediaMemberPrice2'];
//                }else if($val['MemberPriceType']==118){//掌门价格
//                    $Money=$val['MediaMemberPrice3'];
//                }else if($val['MemberPriceType']==119){//盟主价格
//                    $Money=$val['MediaMemberPrice4'];
//                }
                /*if($val['MemberTypeID']==1){
                    $val['LiRunPrice']=$val['order_money']-$val['MediaWebPrice'];
                }else if($val['MemberTypeID']==2){
                    $val['LiRunPrice']=$val['order_money2']-$val['MediaWebPrice'];
                }else if($val['MemberTypeID']==3){
                    $val['LiRunPrice']=$val['order_money1']-$val['MediaWebPrice'];
                }else $val['LiRunPrice']=0;*/
                $val['LiRunPrice']=$val['order_money1']-$val['media_money'];
                $TotalMoney+=$val['LiRunPrice'];
            }
        }
        $this->assign('List',$List);
        $this->assign('TotalMoney',$TotalMoney);
        $this->assign('GetMemberTypeList',$this->GetAgentTypeList(1));
        return view();
    }
}