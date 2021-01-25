<?php
namespace app\home\controller;
use think\Controller;
use think\Config;
use think\Db;
class Payback extends Controller
{
    private $AgencySiteInfo=array();
    private $Config=array();
    private $SessionMemberID='';
    private $SessionMemberName='';
    public function _initialize(){
        $Controller=controller('common/Common');
        $GetCurrentDomainInfo=$Controller->GetCurrentDomainInfo();
        //echo '<pre>';
        //dump($GetCurrentDomainInfo);
        $this->AgencySiteInfo=$GetCurrentDomainInfo['SiteInfo'];
        $Config=Db::name('config')->where(['ID'=>'1','MemberID'=>'-1'])->find();
        $this->Config=$Config;
        $this->assign('Config',$Config);
        $Music  = Db::name('config')->where('MemberID','<',0)->find();
        $this->assign('WebSiteMusic',$Music['WebSiteMusic']);
        $this->SessionMemberID=session('MemberID');
        $this->SessionMemberName=session('MemberName');
        $this->assign('SessionMemberID',$this->SessionMemberID);
        $this->assign('SessionMemberName',$this->SessionMemberName);
    }
    public function alipay_notify()
    {
        //file_put_contents('55.txt',var_export($_POST,true));
        $System=Config::get('systemparam');
        AliPayApiNotifyCall($this->AgencySiteInfo,$System);
    }
    public function alipay_successhtml(){
        //dump(input('get.'));
        $this->assign('OrderInfo',input('get.'));
        return $this->fetch();
    }
}