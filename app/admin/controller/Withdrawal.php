<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 15:53
 */
namespace app\admin\controller;
use think\Db;
use \app\admin\model\Balance as BalanceModel;
class Withdrawal extends Common
{
    /**
     * 提现明细
     */
    public function index()
    {
		$Where=[];
		$data=input();
		if(!empty($data) && $data['order_num']){
			$Where['OrderNumber']=$data['order_num'];
			$this->assign('OrderNumber',$data['order_num']);
		}else{
			$this->assign('OrderNumber','');
		}
		$MemberData =  Db::name('withdrawal')
			->where($Where)
			->order('Time desc')
			->paginate(20,false,['query'  => $data]);		
        $this->assign('List',$MemberData);
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