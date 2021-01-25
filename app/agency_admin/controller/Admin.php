<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/5
 * Time: 10:57
 */
namespace app\agency_admin\controller;
use think\Db;
class Admin extends Agency
{
    public function index()
    {
		//获取会员类型
		$Membertype= Db::name('member')
            ->where('MemberID',$this->AgencyMemberInfo['MemberID'])
             ->find();
		if($Membertype['MemberTypeID']==2){
			$Membertype['type']='二级代理商';
		 }if($Membertype['MemberTypeID']==3){
			$Membertype['type']='一级代理商';
		 }
        $this->assign('Membertype',$Membertype);

		//获取用户信息
		$ConfigInfo=array();
        if(empty($this->AgencyMemberInfo['MemberRecommendID']) || $this->AgencyMemberInfo['MemberRecommendID']==0){
            $ConfigInfo=db('config')->where('MemberID','-1')->find();
        }else{
            $ConfigInfo=db('config')->where('MemberID',$this->AgencyMemberInfo['MemberRecommendID'])->find();
        }
        $this->assign('ConfigInfo',$ConfigInfo);
		//获取优惠公告
		 $List= Db::name('newsdynamics')
            ->where('NewsState',1)
            ->order('NewsSort desc,NewsID Desc')
            ->limit(4)
			->select();
        $this->assign('list',$List);
        return $this->fetch();
    }
}
