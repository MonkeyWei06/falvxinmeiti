<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class Invite extends Model
{
    protected $resultSetType = 'collection';// 查询数据集对象
    // 是否需要自动写入时间戳 如果设置为字符串 则表示时间字段的类型
    protected $autoWriteTimestamp = true;
    // 创建时间字段
    protected $createTime = 'InviteTime';
    // 更新时间字段
    protected $updateTime = false;
    // 时间字段取出后的默认时间格式
    //protected $dateFormat = 'Y-m-d H:i:s';
    //商品品牌列表
    public function GetList($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['InviteCode'])){
            $Where['InviteCode']=['like','%'.trim($UrlParam['InviteCode']).'%'];
        }
        if(!empty($UrlParam['InviteName'])){
            $Where['InviteName']=['like','%'.trim($UrlParam['InviteName']).'%'];
        }
        $List=$this
            ->where($Where)->order('InviteID Desc')
            ->paginate($PageCount,false,['query'  => $UrlParam]);
		//echo db()->getLastSql();

        if(!empty($List)){
			$Whered['BalanceType']=1;
			$Whered['BalanceGroup']=2;
			$Whered['BalancePayState']=1;

			$Wherex['BalanceType']=2;
			$Wherex['BalanceGroup']=4;

			$Wheret['BalanceType']=1;
			$Wheret['BalanceGroup']=3;

            foreach($List as $key=>$val){

				$data=db("member")->field('MemberID')->where('MemberInviteCode','eq',$val['InviteCode'])->select();

				$user_id_list=array_column($data,'MemberID');

				$user_idstring=implode(',',$user_id_list);

				if($user_idstring){
					$Whered['BalanceMemberID'] = array('in',$user_idstring);
					$Wherex['BalanceMemberID'] = array('in',$user_idstring);
					$Wheret['BalanceMemberID'] = array('in',$user_idstring);
					$czcount = db("Balance")->where($Whered)->sum('BalanceCount');
					$List[$key]['TopUpMoney']=$czcount;
					$List[$key]['DowMoney'] =  db("Balance")->where($Wherex)->sum('BalanceCount');
					$List[$key]['TgMoney'] =  db("Balance")->where($Wheret)->sum('BalanceCount');
				}else{
					$List[$key]['TopUpMoney']=0;
					$List[$key]['DowMoney']=0;
					$List[$key]['TgMoney']=0;
				}
            }
        }
        return $List;
    }
    //商品品牌列表
    public function GetList2($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['InviteCode'])){
            $Where['t1.InviteCode']=['like','%'.trim($UrlParam['InviteCode']).'%'];
        }
        if(!empty($UrlParam['keyword'])){
            $Where['t2.MemberName']=['like','%'.trim($UrlParam['keyword']).'%'];
        }
        if(!empty($UrlParam['InviteName'])){
            $Where['t1.InviteName']=['like','%'.trim($UrlParam['InviteName']).'%'];
        }
        $Where['t2.GroupID']=2;
        $List=$this->alias('t1')
            ->field('t1.*,t2.MemberName')
            ->join('__MEMBER__ t2','t1.InviteMemberID=t2.MemberID','left')
            ->where($Where)->order('t1.InviteID Desc')
            ->paginate($PageCount,false,['query'  => $UrlParam]);
        return $List;
    }
}