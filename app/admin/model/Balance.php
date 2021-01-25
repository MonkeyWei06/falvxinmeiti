<?php
/**
 * Created by PhpStorm.
 * User: Balanceistrator
 * Date: 2018/1/4
 * Time: 10:54
 */
namespace app\admin\model;
use think\Model;
use think\Db;
class Balance extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='BalanceTime';
    protected $updateTime=false;
    public function GetList($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['keyword'])){
            $Where['t1.BalanceTitle|t2.MemberName|t1.BalanceNumber']=['like','%'.trim($UrlParam['keyword']).'%'];
        }
        if(!empty($UrlParam['keyword2'])){
            $Where['t2.MemberInviteCode']=trim($UrlParam['keyword2']);
        }
         if(!empty($UrlParam['BalanceType'])){
			if($UrlParam['BalanceType']==1){
				$Where['t1.BalanceType']=1;
				$Where['t1.BalanceGroup']=2;
				$Where['t1.BalancePayState']=1;
			}elseif($UrlParam['BalanceType']==2){
				$Where['t1.BalanceType']=2;
				$Where['t1.BalanceGroup']=4;
			}elseif($UrlParam['BalanceType']==3){
				$Where['t1.BalanceType']=1;
				$Where['t1.BalanceGroup']=3;
			}
        }
        if(!empty($UrlParam['MinDate']) && !empty($UrlParam['MaxDate'])){
            $Where['t1.BalanceTime']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
        if(!empty($UrlParam['MemberID'])){
            $Where['t1.BalanceMemberID']=$UrlParam['MemberID'];
        }

        $Where['t2.MemberTypeID']=['in','1,3'];
        $List=$this->alias('t1')->field('t1.*,t2.MemberName')->join('__MEMBER__ t2','t1.BalanceMemberID=t2.MemberID','left')->where($Where)->order('t1.BalanceSort Desc,t1.BalanceID Desc')->paginate($PageCount,false,[
            'query'     => $UrlParam,
        ]);
        $Where['t1.BalanceType']=1;
        $Money=$this->alias('t1')->field('t1.*,t2.MemberName')->join('__MEMBER__ t2','t1.BalanceMemberID=t2.MemberID','left')->where($Where)->order('t1.BalanceSort Desc,t1.BalanceID Desc')->sum('BalanceCount');
        return [$List,$Money];
    }
    public function getBalanceTypeAttr($Val)
    {
        $Arr=['--','充值','消费'];
        $Back=array();
        $Back['Old']=$this->getData('BalanceType');
        $Back['New']=$Arr[$Val];
        return $Back;
    }
    /*public function getBalanceGroupAttr($Val)
    {
        $Arr=['--','手动充值','支付宝','系统返还','广告发布'];
        $Back=array();
        $Back['Old']=$this->getData('BalanceGroup');
        $Back['New']=$Arr[$Val];
        return $Back;
    }*/
	public function Getsumcount($UrlParam=[], $typex)
    {
        $Where=array();
		$Whereor=array();
        if($typex==1){
				$Where['t1.BalanceType']=1;
				$Where['t1.BalanceGroup']=2;
				$Where['t1.BalancePayState']=1;
			}elseif($typex==2){
				$Where['t1.BalanceType']=2;
				$Where['t1.BalanceGroup']=4;
			}elseif($typex==3){
				$Where['t1.BalanceType']=1;
				$Where['t1.BalanceGroup']=3;
		}
        if(!empty($UrlParam['MinDate']) && !empty($UrlParam['MaxDate'])){
            $Where['t1.BalanceTime']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
        if(!empty($UrlParam['MemberID'])){
            $Where['t1.BalanceMemberID']=$UrlParam['MemberID'];
        }

		if(!empty($UrlParam['keyword2'])){
            $data=db("member")->field('MemberID')->where('MemberInviteCode','eq',trim($UrlParam['keyword2']))->select();
			$user_id_list=array_column($data,'MemberID');
			$user_idstring=implode(',',$user_id_list);
			if($user_idstring){
				$Where['BalanceMemberID'] = array('in',$user_idstring);
			}else{
				$Where['BalanceMemberID'] = array('in','-1');
			}
        }
        $Money=$this->alias('t1')->where($Where)->order('t1.BalanceSort Desc,t1.BalanceID Desc')->sum('BalanceCount');
        return $Money;
    }
}