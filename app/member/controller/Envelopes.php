<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 15:53
 */
namespace app\member\controller;
use think\Db;
use think\Session;
use think\Request;
class Envelopes extends Common
{
    /**
     * 红包记录
     */
    public function index()
    {
        $MemberID = Session::get('MemberID');
		$Where=[];
        $Where['MemberID']=$MemberID;
		$data=input();
		if(!empty($data) && $data['order_num']){
			$Where['OrderNumber']=$data['order_num'];
			$this->assign('OrderNumber',$data['order_num']);
		}else{
			$this->assign('OrderNumber','');
		}
		$MemberData =  Db::name('envelopes')
			->where($Where)
			->order('Time desc')
			->paginate(20,false,['query'  => $data]);
        $this->assign('MemberData',$MemberData);
        return $this->fetch();
    }
	  /**
     * 查询提现账号
     */
    public function balance()
    {
        $MemberID = $_SESSION['think']['MemberID'];
 		$sk_money = Db::name('Member')->where('MemberID',$MemberID)->find();
 		return $sk_money['MemberProfit'];
    }
}