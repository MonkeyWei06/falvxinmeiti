<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 11:33
 */
namespace app\member\controller;
use think\Controller;
use think\Session;
use think\Config;
class Common extends Controller
{
    protected $MemberID = '';
    protected $MemberName = '';
    protected $MemberInfo = '';
	protected $articleDomain = '';
    protected $AgencySiteInfo=array();
    protected $Config=array();
    //判断用户的登录状态
    public function _initialize()
    {
        parent::_initialize();
        $Controller=controller('common/Common');
        $GetCurrentDomainInfo=$Controller->GetCurrentDomainInfo();
        //dump($GetCurrentDomainInfo);
        $this->AgencySiteInfo=$GetCurrentDomainInfo['SiteInfo'];
        $this->Config=$GetCurrentDomainInfo['Config'];
        $this->assign('Config',$this->Config);
        $this->assign('AgencySiteInfo',$this->AgencySiteInfo);
        $MenuCookie=Session::get('MenuCookie');
        if(empty($MenuCookie)) $MenuCookie=1;
        $this->assign('MenuCookie',$MenuCookie);
		$this->articleDomain=config("MainDomain");
		$this->assign('articleDomain',$this->articleDomain);
		$this->assign('path',config("MainDomain").'uploads/');
        $this->checkLogin();
    }
	public function checktype(){
		$MemberID = session('MemberID');
		$Where=array();
        $Where['MemberID'] = $MemberID;
		$Info = model('member') ->where($Where)->find();
		if(empty($Info['type']) || empty($Info['MemberQQ'])){
            $this->error('请先完善资料','./member/index');
            exit();
        }
	}

	public function checkmedia_man(){
		$MemberID = session('MemberID');
		$Where=array();
        $Where['MemberID'] = $MemberID;
		$Info = model('member') ->where($Where)->find();
		if($Info['type']==1){
            $this->error('权限不足');
            exit();
        }
	}
    //登录时时验证
    private function checkLogin()
    {
        $MemberID = session('MemberID');
        $MemberName = session('MemberName');
        $MemberRandPwd = session('MemberRandPwd');
        $MemberLoginTime = session('MemberLoginTime');
        $this->MemberID = $MemberID;
        $this->MemberName = $MemberName;
        if($this->AgencySiteInfo['MemberID']=='-1'){
            $Url=url('/login/index');
        }else{
            $Url=url('login/index');
        }
        if(empty($MemberID) || empty($MemberName) || empty($MemberRandPwd ) || empty($MemberLoginTime))
        {
            $this->redirect($Url);
        }
//        if((time()-$MemberLoginTime)>3600)
//        {
//            session('MemberID',null);
//            session('MemberName',null);
//            session('MemberRandPwd',null);
//            session('MemberLoginTime',null);
//            $this->error('您当前账户身份已经失效，请重新登录',$Url);
//            exit;
//        }
        session('MemberLoginTime',time());
        $Where=array();
        $Where['MemberID'] = $MemberID;
        $Where['MemberName'] = $MemberName;
        $Where['MemberRandPwd'] = $MemberRandPwd;
        $Info = model('member') ->where($Where)->find();
        $this->MemberInfo = $Info;
        if(empty($Info)){
            $this->error('您的账户登录异，请重新登录',$Url);
            exit();
        }
		
        //查询用户最后一条余额记录
        $BalanceCurrentCount = model('Balance')->where('BalanceMemberID',$MemberID)->order("BalanceTime desc")->value('BalanceCurrentCount');
        $this->assign('BalanceCurrentCount',$BalanceCurrentCount);
        $this->assign('MemberName',$this->MemberName );
		$this->assign('type',$Info['type'] );
    }
    //单文件上传
    protected function OneUpload($FileName=''){
        if(empty($FileName)) return false;
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file($FileName);
        if(empty($file)){ return false;}
        // 移动到框架应用根目录/public/uploads/ 目录下
        $FileSize=20*1024*1024;
        $FileSeat='uploads/word/';
        $FileExt='doc,docx,txt';
        $info = $file->validate(['size'=>$FileSize,'ext'=>$FileExt])->move(PUBLIC_PATH . $FileSeat);
        if($info){
            $getSaveName=$info->getSaveName();
            $getSaveName=str_replace('\\','/',$getSaveName);
            return $getSaveName;
        }else{
            return $info;
        }
    }
    /**
     * JS提示跳转
     * @param  $tip  弹窗口提示信息(为空没有提示)
     * @param  $type 设置类型 close = 关闭 ，back=返回 ，refresh=提示重载，jump提示并跳转url
     * @param  $url  跳转url
     */
    function alert($tip = "", $type = "", $url = "") {
        $js="<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>";
        $js.= "<script>";
        if ($tip)
            $js .= "alert('" . $tip . "');";
        switch ($type) {
            case "close" : //关闭页面
                $js .= "window.close();";
                break;
            case "back" : //返回
                $js .= "history.back(-1);";
                break;
            case "refresh" : //刷新
                $js .= "parent.location.reload();";
                break;
            case "top" : //框架退出
                if ($url)
                    $js .= "top.location.href='" . $url . "';";
                break;
            case "jump" : //跳转
                if ($url)
                    $js .= "window.location.href='" . $url . "';";
                break;
            default :
                break;
        }
        $js .= "</script>";
        echo $js;
        if($type) {
            exit();
        }
    }
}
