<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/5
 * Time: 11:21
 */
namespace app\agency_admin\controller;
use think\Db;
use think\Controller;
class Common extends Controller
{
    protected $AgencySiteInfo=array();
    protected $Config=array();
    protected $AgencyMemberID='';
    protected $AgencyMemberName='';
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $Controller=controller('common/Common');
        $GetCurrentDomainInfo=$Controller->GetCurrentDomainInfo();
        //dump($GetCurrentDomainInfo);
        $this->AgencySiteInfo=$GetCurrentDomainInfo['SiteInfo'];
        $this->Config=$GetCurrentDomainInfo['Config'];
        $this->assign('Config',$this->Config);
		$this->assign('articleDomain',config("MainDomain"));
		$this->assign('path',config("MainDomain").'uploads/');
        $this->BaseCall();//基础调用部分
        $this->LoginCheck();//基础调用部分
		//获取会员类型
		$Membertype= Db::name('member')
            ->where('MemberID',session('AgencyMemberID'))
             ->find();
		if($Membertype['MemberTypeID']==2){
			$Membertype['type']='二级代理商';
		 }if($Membertype['MemberTypeID']==3){
			$Membertype['type']='一级代理商';
		 }
        $this->assign('Membertype',$Membertype);
		//获取用户信息
    }
    //登录时时验证
    private function LoginCheck()
    {
        $AgencyMemberID=session('AgencyMemberID');
        $AgencyMemberName=session('AgencyMemberName');
        $AgencyMemberLoginTime=session('AgencyMemberLoginTime');
        $this->AgencyMemberID=$AgencyMemberID;
        $this->AgencyMemberName=$AgencyMemberName;
        if(empty($AgencyMemberID) || empty($AgencyMemberName) || empty($AgencyMemberLoginTime)){
            $this->redirect('adminlogin/index');
        }
        if(time()-$AgencyMemberLoginTime>3600)
        {
            $this->alert('您当前账户已连接超时，请重新登录','top',url('adminlogin/index'));
        }else{
            session('AgencyMemberLoginTime',time());
        }
        $Info = Db::name('member')->where('MemberID',$AgencyMemberID)->find();
        if(!$Info || @!$Info['MemberState'])
        {
            $this->alert('当前账号异常','top',url('adminlogin/index'));
        }
    }
    //基础调用部分
    private function BaseCall()
    {
        //调用公共配置文件
        $this->CallCommonSettingParam();
    }
    //调用公共的配置文件
    private function CallCommonSettingParam()
    {
        $FilePath=APP_PATH.'extra/website.php';
        $WebSite=[];
        if(is_file($FilePath)){
            $WebSite=include($FilePath);
            $WebSite['WebSiteAddress']=str_replace('&amp;nbsp;','&nbsp;',$WebSite['WebSiteAddress']);
            $WebSite['WebSiteCopyright']=str_replace('&amp;nbsp;','&nbsp;',$WebSite['WebSiteCopyright']);
        }
        $this->assign('WebSite',$WebSite);
    }
    //广告位数据调用 $ClassID 1为图片 2为文字
    protected function CallPosterList($TypeID,$Count=1,$ClassID=1)
    {
        $Where=[];
        $Where['PosterTypeID']=$TypeID;
        $Where['PosterClass']=$ClassID;
        $Where['PosterState']='1';
        $List=Db::name('poster')->cache(true)->field('PosterTitle,PosterUrl,PosterPicPath,BgPosterPicPath,PosterLeftOneLine,PosterLeftTwoLine')->where($Where)->order('PosterSort Desc,PosterID Desc')->limit($Count)->select();
        return $List;
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
    //调用栏目列表数据
    private function CallRuleList($PID='0',$BackData=array()){
        $Where=[];
        $Where['parentid']=$PID;
        $Where['isshow']='1';
        $Where['status']='1';
        $List=Db::name('auth_rule')->field('id,parentid,title,node,name,path')->where($Where)->order('sort asc,id asc')->select();
        if(empty($List)){
            return $BackData;
        }else{
            foreach ($List as $key=>$val){
                $BackData[]=$val;
                $BackData=$this->CallRuleList($val['id'],$BackData);
            }
            return $BackData;
        }
    }
    //获取全局分类
    protected function GetCurrentWholeType($TypeID){
        $Where=array();
        $Where['TypePID']=$TypeID;
        $Where['TypeState']=1;
        $List=db::name('wholetype')->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        return $List;
    }
    //获取省市县id
    protected  function GetCityTypeId($Value)
    {
        $Where=array();
        $Where['TypeName']=array('like','%'.$Value.'%');
        $TypeID=db::name('citytype')->where($Where)->value('TypeID');
        return $TypeID;
    }
    protected  function GetCityTypeList($PID)
    {
        $Where=array();
        $Where['TypePID']=$PID;
        $Where['TypeState']=1;
        $List=db::name('citytype')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        return $List;
    }
    //单文件上传
    protected function OneUpload($FileName=''){
        if(empty($FileName)) return false;
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file($FileName);
        if(empty($file)){ return false;}
        // 移动到框架应用根目录/public/uploads/ 目录下
        $FileSize=config('config.FileSize');
        $FileSeat=config('config.FileSeat');
        $FileExt=config('config.FileExt');
        $info = $file->validate(['size'=>$FileSize,'ext'=>$FileExt])->move(PUBLIC_PATH . $FileSeat);
        if($info){
            $getSaveName=$info->getSaveName();
            $getSaveName=str_replace('\\','/',$getSaveName);
            return $getSaveName;
        }else{
            return false;
        }
    }
}