<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 11:36
 */
namespace app\member\controller;
use app\member\Validate\Member as MemberValidate;
use sendmsg\SendUtility;
use think\Controller;
use think\Session;
use think\Db;
use think\Config;
class Login extends Controller
{
    private $AgencySiteInfo=array();
    private $Config=array();
    protected $model;
    public function _initialize()
    {
        $Controller=controller('common/Common');
        $GetCurrentDomainInfo=$Controller->GetCurrentDomainInfo();
        //dump($GetCurrentDomainInfo);
        $this->AgencySiteInfo=$GetCurrentDomainInfo['SiteInfo'];
        $this->Config=$GetCurrentDomainInfo['Config'];
        $this->assign('Config',$this->Config);
        $MainConfig=db('config')->where('ID','1')->find();
        $this->assign('MainConfig',$MainConfig);
		$this->assign('path',config("MainDomain").'uploads/');
		//$article_new=db('article')->order('article_id desc')->limit(10)->column('article_title');
		$article_new=Db::view('article','member_id,article_time')
		->view('member', 'MemberName', 'member.MemberID=article.member_id')
		->group('member_id')
		->order('article_id desc')
		->select();
		$this->assign('article_new',$article_new);
        $this->model=model('member');
    }
    /**
     * 会员用户登录
     * http://www.meitihuiclub.com/member/login/loginout.html
     * http://www.meitihuiclub.com/member/login/index.html
     */
    public function index()
    {
        $Invite=input('get.invite');
        $Act=input('act','','trim');
        $this->assign('Act',$Act);
        $this->assign('Invite',trim($Invite));
		if($Act=='reg'){
			return $this->fetch('register');
		}else{
			return $this->fetch();
		}
    }
    /**
     * 用户登录验证
     */
    public function check()
    {
        $data = input('post.');
        $validate = new MemberValidate();
        $scene = 'login';
        $result = $validate->goCheck($data,$scene);
        if (!$result) {
            $error =  $validate->getError();
            return json(array('code'=>'1','msg'=>$error));
        }
        $Code = input('post.code');
        if(!captcha_check($Code)) return ['code'=>'1','msg'=>'验证码错误'];
        $result =  $this->model->checkUser($data['MemberName'],$data['MemberPwd'],$this->AgencySiteInfo['Domain']);
        if (!$result) {
            return json(array('code'=>'1','msg'=>$this->model->getError()));
        } else {
            return json(array('code'=>'0','msg'=>'登录成功'));
        }
    }
    /**
     * 新用户注册
     */
    public function register()
    {
        $data = input('post.');
        $MemberInviteCode = input('post.MemberInviteCode');
		$mobile_code = input('post.mobile_code');		
        if(!empty($MemberInviteCode)){
            $MemberInviteInfo =  Db::name('invite')->where('InviteCode',$data['MemberInviteCode'])->find();
            $Fuji =  Db::name('member')->where('MemberID',$MemberInviteInfo['InviteMemberID'])->find();
            if (!$MemberInviteInfo) {
                return ['code'=>'1','msg'=>'邀请码错误'];
            }
        }
        //检测当前的用户名是否已经注册
        $Where=array();
        $Where['MemberMobile']=Session::get('verify_mobile');
        $Where['RegDomain']=$this->AgencySiteInfo['Domain'];
		$mobile_code1=Session::get('mobile_rand');

		if($mobile_code!=$mobile_code1){
			return ['code'=>'201','msg'=>'短信验证码不正确'];
		}

        $result =  $this->model->where($Where)->find();
        if ($result) {
            return ['code'=>'201','msg'=>'当前手机号已被注册'];
        }
		$data['MemberName']=Session::get('verify_mobile');
        $userInfo['MemberName'] =Session::get('verify_mobile'); //$data['MemberName'];
        $userInfo['MemberPwd'] = md5(config('config.MemberPwdKey').md5($data['MemberPwd'].$data['MemberName']).md5($data['MemberPwd']));
        $userInfo['MemberQQ'] = '';
        $userInfo['MemberMobile'] = Session::get('verify_mobile');
        $userInfo['MemberTypeID'] = 1;
        $userInfo['MemberPriceType'] = 116;
        $userInfo['MemberState'] = 1;
        if(!empty($MemberInviteCode)) {
           $userInfo['MemberRecommendPath'] = $Fuji['MemberRecommendPath'];
            $userInfo['MemberRecommendID'] = $MemberInviteInfo['InviteMemberID'];
        }
        $userInfo['MemberRecommendID'] = $this->AgencySiteInfo['MemberID']==-1?0:$this->AgencySiteInfo['MemberID'];
        $userInfo['MemberInviteCode'] = $data['MemberInviteCode'];
        $userInfo['RegDomain'] = $this->AgencySiteInfo['Domain'];
        $userInfo['MemberTime'] = time();
        $result =  $this->model->create($userInfo);
        $InsertID=Db::name('member')->getLastInsID();
        //dump($InsertID);
		 if (!$result) {
            return ['code'=>'201','msg'=>'注册失败'];
        }
        $Data=array();
        if(!empty($this->AgencySiteInfo['MemberRecommendPath'])){
            $Data['MemberRecommendPath'] = $InsertID.','.$this->AgencySiteInfo['MemberRecommendPath'];
        }else{
            $Data['MemberRecommendPath'] = $InsertID;
        }
        $Where=array();$Where['MemberID']=$InsertID;
        Db::name('member')->where($Where)->data($Data)->update();
		Session::delete('mobile_rand');
		Session::delete('send_time');
		Session::delete('verify_mobile');
		return ['code'=>'200','msg'=>'注册成功'];
		
    }
	/*找回密码*/
	public function repwd()
    {

		return $this->fetch();
    }
	/*重置密码*/
	public function resetpwd()
    {
		$data = input();
		$mobile = Session::get('verify_mobile');
		$mobile_code=$data['mobile_code'];
		$PassWord=$data['MemberPwd'];
		$result =  $this->model->where('MemberMobile',$mobile)->find();
        if (!$result) {
            return ['code'=>'201','msg'=>'用户不存在'];
        }
		$MemberName=$result['MemberName'];
		$MemberPwd=md5(config('config.MemberPwdKey').md5($PassWord.$MemberName).md5($PassWord));
		
		$mobile_code1=Session::get('mobile_rand');

		if($mobile_code!=$mobile_code1){
			return ['code'=>'201','msg'=>'短信验证码不正确'];
		}
		$result=$this->model->where('MemberMobile',$mobile)->update(['MemberPwd'=>$MemberPwd]);
		if($result){
			Session::delete('mobile_rand');
			Session::delete('send_time');
			Session::delete('verify_mobile');
			return ['code'=>'200','msg'=>'密码更新成功'];
		}

    }
	/**
     * 手机验证码
     */
    public function send_mcode()
    {
        $data = input('post.');
		$mobile = input('post.mobile');
		$type = input('post.type');
		 if (empty($mobile) || !preg_match("/^(13|15|18|14|17|19|16)\d{9}$/", $mobile)) {
			  return json(array('code'=>'201','msg'=>'手机号错误'));
		}
		$rand = mt_rand(1000, 9999);
		/*增加短信注册提醒*/
		$utility = new SendUtility();
		
		if($type==1){

			if($this->AgencySiteInfo['Domain']=='-1'){
				$text="您好:您在媒介联盟注册的验证码是".$rand.",请勿泄露";
			}else{
				$text="您好，您的注册的验证码是".$rand.",请勿泄露";
			}
			$result =  $this->model->where('MemberMobile',$mobile)->find();
			if ($result) {
				return ['code'=>'201','msg'=>'当前手机号已被注册'];
			}
		}elseif($type==2){
			$text="".$mobile."您正在做密码找回操作，验证码是".$rand.",为了您的账户安全，请勿向其他人透漏";
			$result =  $this->model->where('MemberMobile',$mobile)->find();
			if (!$result) {
				return ['code'=>'201','msg'=>'用户不存在'];
			}
		}
		if (session('send_time') && (time() - session('send_time')) < 60) {
 			return json(array('code'=>'201','msg'=>'不要频繁操作，稍等下吧'));
        }
		$RtnString='';
		if($this->AgencySiteInfo['Domain']=='-1'){
			/*增加短信注册提醒*/
 			$RtnString =$utility->Send($mobile,$text);
		}else{
			$msginfo =  Db::name('msg')->where('msgMemberID',$this->AgencySiteInfo['MemberID'])->find();
			if($msginfo){
				$RtnString =$utility->Sendjs($mobile,$text,$msginfo['msgname'],$msginfo['msgpass'],$msginfo['msgSignature']);
			}
		}
		if ($RtnString!=1){
			return json(array('code'=>'201','msg'=>'验证码获取失败'));
		}
		Session::set('mobile_rand',$rand);
		Session::set('send_time',time());
		Session::set('verify_mobile',$mobile);
		/*增加短信注册提醒*/
		return json(array('code'=>'200'));
    }
    /**
     * 退出登录
     */
    public function loginout()
    {
        Session::clear();
        //dump($this->AgencySiteInfo['MemberID']);
     // exit;
        if($this->AgencySiteInfo['MemberID']>0){
            $this->success('您已安全退出，欢迎您的再次登录','/');
        }else{
            $this->success('您已安全退出，欢迎您的再次登录','/');
        }
        //$this->redirect(url('/login'));
        exit;
    }
}