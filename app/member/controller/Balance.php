<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 15:53
 */
namespace app\member\controller;
use think\Session;
use think\Request;
class Balance extends Common
{
    public $model ;
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Balance');
		parent::checktype();
    }
    /**
     * 财务明细
     */
    public function index()
    {
        session('MenuCookie','1');
        $MemberID = Session::get('MemberID');
		$Where=[];
        $Where['BalanceMemberID']=$MemberID;
		$data=input();
		if(!empty($data['finance_type'])&& $data['finance_type']==2){
			$Where['BalanceGroup']=$data['finance_type'];
			$Where['BalanceType']=1;
			$Where['BalancePayState']=1;
		}elseif(!empty($data['finance_type'])){
			$Where['BalanceGroup']=$data['finance_type'];
		}else{
			$data['finance_type']='';
		}
		$BalanceMemberData =  $this->model
			->where($Where)
			->order('BalanceTime desc')
			->paginate(20,false,['query'  => $data]);
		
		$this->assign('finance_type',$data['finance_type']);
		
        $this->assign('BalanceMemberData',$BalanceMemberData);

		//支付宝充值统计
		$zfb_money =  $this->model->where('BalanceMemberID',$MemberID)->where('BalanceType',1)->where('BalanceGroup',2)->where('BalancePayState',1)->sum('BalanceCount');
		$this->assign('zfb_money',$zfb_money);
		//总充值
		//发布文章
		$order_money =$this->model
            ->alias('b')
            ->field('b.*,o.order_state')
            ->join('agencyorder o', 'b.BalanceNumber=o.order_number', 'left')
            ->where('b.BalanceGroup',4)
			->where('o.order_state',2)
			->where('b.BalanceMemberID',$MemberID)
            ->sum('BalanceCount');
		$this->assign('order_money',$order_money);
		//取消订单退回
		$th_money = $this->model
            ->alias('b')
            ->field('b.*,o.order_state')
            ->join('agencyorder o', 'b.BalanceNumber=o.order_number', 'left')
            ->where('b.BalanceGroup',3)
			->where('o.order_state=3 OR o.order_state=4')
			->where('b.BalanceMemberID',$MemberID)
            ->sum('BalanceCount');
		$this->assign('th_money',$th_money);

        return $this->fetch();
    }
}