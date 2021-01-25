<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/1
 * Time: 11:11
 */
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Session;
class Login extends Controller
{
    public function index()
    {
        //获取广告位
        $this->assign('PosterList',$this->CallPosterList('103','1'));
        return $this->fetch();
    }
    //登录验证
    public function check()
    {
        $AdminName=input('post.AdminName');
        $AdminPwd=input('post.AdminPwd');
        $AdminCode=input('post.AdminCode');
        //dump($AdminCode);
        //dump($AdminName);
        //dump($AdminPwd);
        if(!captcha_check($AdminCode)){
            $this->error('您的验证码输入有误');
        }
        $AdminPwd=md5(config('AdminKey').$AdminPwd.config('AdminPwd'));
        //dump($AdminPwd);exit();
        $Where=[];
        $Where['AdminName']=$AdminName;
        $Where['AdminPwd']=$AdminPwd;
        $Where['AdminState']='1';
        $Info=Db::name('admin')->field('AdminID,AdminName,count(*) as c')->where($Where)->find();
        //dump($Info);
        if($Info['c']!=1){
//            $this->error('您是用户名或密码输入有误');
            $this->alert('您是用户名或密码输入有误','back');
            exit;
        }
        Session::set('AdminID',$Info['AdminID']);
        Session::set('AdminName',$Info['AdminName']);
        Session::set('AdminPwd',$AdminPwd);
        Session::set('AdminLoginTime',time());
        //给当前账户登录成功之后添加一个标示 让每一个账户只能同时登录一次
        $RandPwd=mt_rand(100000,999999);
        $RandPwd=md5(config('AdminPwd').$RandPwd.$AdminPwd);
        Db::name('admin')->where(['AdminID'=>$Info['AdminID']])->data(['AdminRandPwd'=>$RandPwd,'AdminLoginCheckTime'=>time()])->update();
        //Session::set('AdminRandPwd',$RandPwd);
        AdminLogDetail(['LogOperateTitle'=>'管理员：'.$Info['AdminName'].'，登录成功','LogOperateContent'=>'']);
//        $this->success($Info['AdminName'].' 您好，欢迎您的登录',url('index/index'));
        $this->alert($Info['AdminName'].' 您好，欢迎您的登录','top',url('index/index'));
        exit;
    }
    public function logout()
    {
        Session::clear();
//       $this->success('您已安全退出，欢迎您的再次登录','home/index');
        $this->alert('您已安全退出，欢迎您的再次登录','top',url('/index'));
        exit;
    }
    //广告位数据调用 $ClassID 1为图片 2为文字
    protected function CallPosterList($TypeID,$Count=1,$ClassID=1)
    {
        $Where=[];
        $Where['PosterTypeID']=$TypeID;
        $Where['PosterClass']=$ClassID;
        $Where['PosterState']='1';
        $List=Db::name('poster')->cache(true)->field('PosterTitle,PosterUrl,PosterPicPath')->where($Where)->order('PosterSort Desc,PosterID Desc')->limit($Count)->select();
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
        if ($type) {
            exit();
        }
    }
}