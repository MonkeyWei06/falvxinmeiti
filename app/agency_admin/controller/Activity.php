<?php 
/**
 * created by phpstorm.
 * user: administrator
 * date: 2017/8/5
 * time: 10:57
 */
namespace app\agency_admin\controller;
use think\Db;
use think\Session;
use think\Request;
use think\Loader;
class Activity extends Common
{
	protected $AgencyMemberID='';
    protected $AgencyMemberName='';
    protected $AgencyMemberInfo=array();
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->AgencyMemberInfo=Db::name('member')->where('MemberID',$this->AgencyMemberID)->find();
        $this->assign('AgencyMemberInfo',$this->AgencyMemberInfo);
        $this->assign('AgencyMemberID',$this->AgencyMemberID);
        $this->assign('AgencyMemberName',$this->AgencyMemberName);
    }

    public function index()
    {		
 		$this->assign('sessionMemberID',$_SESSION['think']['AgencyMemberID']);
		$drawcount = Db::name('member')->field("drawcount")->where('MemberID',$_SESSION['think']['AgencyMemberID'])->find();
		$this->assign('drawcount',$drawcount['drawcount']);
		return view();
    }

	//立即抽奖
	public function drawaction()
    {
		//结束时间
		//$endtime=1559318400;
		//if(time()>$endtime){
		$ConfigInfo=db('config')->field('is_draw')->where('MemberID','-1')->find();
		if($ConfigInfo['is_draw']==1){
			$result=array('code'=>'201','msg'=>'活动已结束!感谢您的关注~~', 'data'=>'');
            exit(json_encode($result));
		}
		if(empty($_SESSION['think']['AgencyMemberID'])){
			$result=array('code'=>'201','msg'=>'请登录~~', 'data'=>'');
            exit(json_encode($result));	
		}
		$drawcount = Db::name('member')->field("drawcount")->where('MemberID',$_SESSION['think']['AgencyMemberID'])->find();

		//查询抽奖次数
		if(intval($drawcount['drawcount']) <= 0){
			$result=array('code'=>'202');
            exit(json_encode($result));
		}

		/*根据概率随机抽奖 start======================*/
		$prize_arr = Db::name('draw_actlist')->where('aid',3)->select();
		foreach ($prize_arr as $key => $val) { 
			$arr[$val['lid']] = $val['randnum']; 
		}
		$rid = get_rand($arr); //根据概率获取奖项id
		$res['yes'] = $prize_arr[$rid-1]['title']; //中奖项 
		$data['yes']=$prize_arr[$rid-1]['title'];
		$data['num']=$prize_arr[$rid-1]['num'];
		$data['key']=$rid-1;
		unset($prize_arr[$rid-1]); //将中奖项从数组中剔除，剩下未中奖项 
		shuffle($prize_arr); //打乱数组顺序 
		for($i=0;$i<count($prize_arr);$i++){ 
			$pr[] = $prize_arr[$i]['title']; 
		}
		$res['no'] = $pr;
		$result=array('code'=>'200','msg'=>'', 'data'=>$data);
		
		/*根据概率随机抽奖 end========================*/
		$datalog = [
			'uid' => $_SESSION['think']['AgencyMemberID'], 
			'class_name' => $data['yes'],
			'money' => $data['num'],
			'order_sn' => 'cj'.order_num(),
			'issend' => '1',
			'createtime' => time()
		];
		$logid=Db::name('draw_actlog')->insertgetid($datalog);
		if($logid){
			Db::name('member')
			->where('MemberID', $_SESSION['think']['AgencyMemberID'])
			->setdec('drawcount', 1);

			Db::name('member')
			->where('MemberID', $_SESSION['think']['AgencyMemberID'])
			->setinc('MemberAgentBalanceCount', $data['num']);

			$MemberAgentBalanceCount = Db::name('member')->field("MemberAgentBalanceCount")->where('MemberID',$_SESSION['think']['AgencyMemberID'])->find();

			$balance = [
				'BalanceMemberID' => $_SESSION['think']['AgencyMemberID'], 
				'BalanceNumber' => $datalog['order_sn'],
				'BalanceTitle' => '抽奖红包',
				'BalanceType' => '1',
				'BalanceGroup' => '1',
				'BalanceCount' =>$data['num'],
				'BalanceCurrentCount'=>$MemberAgentBalanceCount['MemberAgentBalanceCount'],
				'BalancePayState' =>'1',
				'BalanceTime' => time()
			];
			Db::name('balance')->insertgetid($balance);
		}
		exit(json_encode($result));
    }

	//我的奖品
	public function mygift()
    {
         $List = Db::name('draw_actlog')->where('uid',$_SESSION['think']['AgencyMemberID'])->order('lid desc')->paginate(20);
         $this->assign('List',$List);
		 return view();
    }
}