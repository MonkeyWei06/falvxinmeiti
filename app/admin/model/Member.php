<?php
/**
 * Created by PhpStorm.
 * User: Memberistrator
 * Date: 2018/1/4
 * Time: 10:54
 */
namespace app\admin\model;
use think\Model;
class Member extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='MemberTime';
    protected $updateTime=false;
    public function GetList($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['RegDomain'])) $Where['RegDomain']=$UrlParam['RegDomain'];
        if(!empty($UrlParam['MemberTypeID'])) $Where['MemberTypeID']=$UrlParam['MemberTypeID'];
        if(!empty($UrlParam['GroupID'])) $Where['GroupID']=$UrlParam['GroupID'];
		if(!empty($UrlParam['MemberID'])) $Where['MemberRecommendID']=$UrlParam['MemberID'];
        if(!empty($UrlParam['keyword'])) $Where['MemberName']=['like','%'.trim($UrlParam['keyword']).'%'];
        if(!empty($UrlParam['invitecode']))$Where['MemberInviteCode']=['like','%'.trim($UrlParam['invitecode']).'%'];

		 if(!empty($UrlParam['balance'])&&intval($UrlParam['balance'])>0) $Where['MemberBalanceCount|MemberAgentBalanceCount']=['>=',1];
		 if(!empty($UrlParam['gift'])&&intval($UrlParam['gift'])>0) $Where['MemberProfit']=['>=',1]; 

        $List=$this
           // ->field('*')
            ->where($Where)
            ->order('MemberSort Desc,MemberID Desc')
            //->join('member M','MM.MemberRecommendID = M.MemberID','left')
            //->join('member MMM','M.MemberRecommendID = MM.MemberID','left')
            ->paginate($PageCount,false,[
            'query' => $UrlParam,
        ]);

 
        
        if(!empty($List)){
            foreach ($List as $key=>$val){
                $MemberRecommendPath=$val['MemberRecommendPath'];
                if(!empty($MemberRecommendPath)){
                    $Arr=explode(',',$MemberRecommendPath);
                    if(!empty($Arr[1])){
                        $List[$key]['MemberName2']=db('member')->where('MemberID',$Arr[1])->value('MemberName');
                    }
                    if(!empty($Arr[2])){
                        $List[$key]['MemberName3']=db('member')->where('MemberID',$Arr[2])->value('MemberName');
                    }
                }
            }
        }
        
        return $List;
    }
    public function GetAgentList($UrlParam,$PageCount)
    {
        $Where=array();
        $Where['MemberTypeID']=['gt','1'];
        //$Where['AgentAuditState']=['neq','2'];
        if(!empty($UrlParam['GroupID'])) $Where['GroupID']=$UrlParam['GroupID'];
        if(!empty($UrlParam['MemberTypeID'])){
            $Where['MemberTypeID']=$UrlParam['MemberTypeID'];
        }
        if(!empty($UrlParam['keyword'])){
            $Where['MemberName']=['like','%'.trim($UrlParam['keyword']).'%'];
        }
        $List=$this->where($Where)->order('MemberSort Desc,MemberID Desc')->paginate($PageCount,false,['query' => $UrlParam]);
        return $List;
    }
    public function GetAgentList2($UrlParam,$PageCount)
    {
        $Where=array();
        $Where['MemberTypeID']=['eq','2'];
        $Where['AgentAuditState']=['neq','1'];
        if(!empty($UrlParam['MemberTypeID'])){
            $Where['MemberTypeID']=$UrlParam['MemberTypeID'];
        }
        if(!empty($UrlParam['keyword'])){
            $Where['MemberName']=['like','%'.trim($UrlParam['keyword']).'%'];
        }
        $List=$this->where($Where)->order('MemberSort Desc,MemberID Desc')->paginate($PageCount,false,[
            'query'     => $UrlParam,
        ]);
        return $List;
    }
    public function GetAgentNextList($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['id'])) $Where['MM.MemberRecommendID']=$UrlParam['id'];
        if(!empty($UrlParam['GroupID'])) $Where['MM.GroupID']=$UrlParam['GroupID'];
        if(!empty($UrlParam['MemberTypeID'])) $Where['MM.MemberTypeID']=2;
        if(!empty($UrlParam['keyword'])) $Where['MM.MemberName']=['like','%'.trim($UrlParam['keyword']).'%'];
        if(!empty($UrlParam['invitecode']))$Where['MM.MemberInviteCode|M.MemberName|MMM.MemberName']=['like','%'.trim($UrlParam['invitecode']).'%'];
        //var_dump($Where);
        $List=$this
            ->alias('MM')
            ->field('MM.*,M.MemberName as MemberName2')//,MMM.MemberName as MemberName3
            ->where($Where)
            ->order('MemberSort Desc,MemberID Desc')
            ->join('member M','M.MemberID = MM.MemberRecommendID')
            ->paginate($PageCount,false,[
                'query' => $UrlParam,
            ]);
        //SELECT `MM`.*,M.MemberName as MemberName2,MMM.MemberName as MemberName3 FROM `web_member` `MM` INNER JOIN `web_member` `M` ON `M`.`MemberID`=`MM`.`MemberRecommendID` INNER JOIN `web_member` `MMM` ON `MMM`.`MemberID`=`M`.`MemberRecommendID` WHERE `MM`.`MemberRecommendID` = '124' ORDER BY MemberSort Desc,MemberID Desc LIMIT 0,20
        //echo db()->getLastSql();
        return $List;
    }
    public function getMemberTypeIDAttr($Val)
    {
        $Back=array();
        $Back['Old']=$this->getData('MemberTypeID');
        $Back['New']=\think\Db::name('membertype')->where('TypeID',$Val)->value('TypeName');;
        return $Back;
    }
    public function getMemberPriceTypeAttr($Val)
    {
        $Back=array();
        $Back['Old']=$this->getData('MemberPriceType');
        $Back['New']=\think\Db::name('wholetype')->where('TypeID',$Val)->value('TypeName');;
        return $Back;
    }
    public function SearchNameGetList($Name)
    {
        $Where=array();
        $Where['MemberName']=['like','%'.$Name.'%'];
        $Where['MemberState']='1';
        return $this->field('MemberID,MemberName')->where($Where)->order('MemberSort Desc,MemberID Desc')->select();
    }
    //更新数据
    public function EditInfo($MemberID,$Data)
    {
        $this->where('MemberID',$MemberID)->update($Data);
    }
    //获取某条记录的值
    public function GetOneFieldInfo($MemberID,$Field)
    {
        return $this->field($Field)->where('MemberID',$MemberID)->find();
    }
}