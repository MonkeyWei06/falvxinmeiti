<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/5
 * Time: 10:57
 */
namespace app\agency_admin\controller;
use think\Db;
use think\Session;
use think\Controller;
class Adminlogin extends Controller
{
    private $AgencySiteInfo=array();
    private $Config=array();
    public function _initialize()
    {
        $Controller=controller('common/Common');
        $GetCurrentDomainInfo=$Controller->GetCurrentDomainInfo();
        //dump($GetCurrentDomainInfo);
        $this->AgencySiteInfo=$GetCurrentDomainInfo['SiteInfo'];
        $this->Config=$GetCurrentDomainInfo['Config'];
        $this->assign('Config',$this->Config);
    }
    public function index()
    {
        return $this->fetch();
    }
    public function check(){
        $MemberName=input('post.username');
        $MemberPwd=input('post.password');
        $Code=input('post.code');
        if(!captcha_check($Code)) $this->result([],'1','您的验证码输入有误');
        $MemberPwd=md5(config('config.MemberPwdKey').md5($MemberPwd.$MemberName).md5($MemberPwd));
        //echo $MemberPwd;exit;
        $Where=array();
        $Where['MemberName']=$MemberName;
        $Where['MemberPwd']=$MemberPwd;
		$Where['MemberState']='1';
		$Where['GroupID']='2';
        $Info=Db::name('member')->where($Where)->find();
		 
        if(empty($Info['MemberID'])) $this->result([],'1','您的用户名或密码输入有误');
		if($Info['Domain']!=$this->AgencySiteInfo['Domain']) $this->result([],'1','您不是此平台的代理商');

        session('AgencyMemberID',$Info['MemberID']);
        session('AgencyMemberName',$Info['MemberName']);
        session('MemberTypeID',$Info['MemberTypeID']);
        session('AgencyMemberLoginTime',time());
        $this->result([],'0','登录成功');
        exit;
    }
    public function logout()
    {
        session('AgencyMemberID',null);
        session('AgencyMemberName',null);
        session('AgencyMemberLoginTime',null);
		//Session::clear();
       $this->success('您已安全退出，欢迎您的再次登录','adminlogin/index');
//        $this->alert('您已安全退出，欢迎您的再次登录','top',url('index/index'));
        exit;
    }
    public function alipaynotify()
    {
        controller('common/Common')->alipaywan();
    }
}