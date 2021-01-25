<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 11:36
 */
namespace app\home\controller;
use app\member\Validate\Member as MemberValidate;
use app\member\model\Member as Member;
use think\Controller;
use think\Session;
use think\Db;
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
        $this->model=new Member;
    }
    /**
     * 新用户注册
     */
    public function register()
    {
        $data = input('post.');
        $Code = input('post.code');
        $MemberInviteCode = input('post.MemberInviteCode');
        if(!captcha_check($Code)) return ['code'=>'1','msg'=>'验证码错误'];
        if(!empty($MemberInviteCode)){
            $MemberInviteInfo =  Db::name('invite')->where('InviteCode',$data['MemberInviteCode'])->find();
            $Fuji =  Db::name('member')->where('MemberID',$MemberInviteInfo['InviteMemberID'])->find();
            if (!$MemberInviteInfo) {
                return ['code'=>'1','msg'=>'邀请码错误'];
            }
        }
        /*$validate = new MemberValidate();
        $result = $validate->goCheck($data);
        if (!$result) {
            $error = $validate->getError();
            return ['code'=>'1','msg'=>$error];
        }*/
        //检测当前的用户名是否已经注册
        $Where=array();
        $Where['MemberName']=$data['MemberName'];
        $Where['RegDomain']=$this->AgencySiteInfo['Domain'];
        $result =  $this->model->where($Where)->find();
        if ($result) {
            return ['code'=>'1','msg'=>'当前用户名已经注册'];
        }
        $userInfo['MemberName'] = $data['MemberName'];
        $userInfo['MemberPwd'] = md5(config('config.MemberPwdKey').md5($data['MemberPwd'].$data['MemberName']).md5($data['MemberPwd']));
        $userInfo['MemberQQ'] = $data['MemberQQ'];
        $userInfo['MemberMobile'] = $data['MemberMobile'];
        $userInfo['MemberTypeID'] = 1;
        $userInfo['MemberPriceType'] = 116;
        $userInfo['MemberState'] = 1;
        if(!empty($MemberInviteCode)) {
            $userInfo['MemberRecommendPath'] = $Fuji['MemberRecommendPath'];
            $userInfo['MemberRecommendID'] = $MemberInviteInfo['InviteMemberID'];
        }
        $userInfo['MemberInviteCode'] = $data['MemberInviteCode'];
        $userInfo['RegDomain'] = $this->AgencySiteInfo['Domain'];
        $userInfo['MemberTime'] = time();
        $result =  $this->model->create($userInfo);
        if (!$result) {
            return ['code'=>'1','msg'=>'注册失败'];
        }
        return ['code'=>'0','msg'=>'注册成功'];
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
            $this->success('您已安全退出，欢迎您的再次登录','/member.php/login');
        }else{
            $this->success('您已安全退出，欢迎您的再次登录','/login');
        }
        //$this->redirect(url('/login'));
        exit;
    }
}