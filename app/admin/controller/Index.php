<?php
namespace app\admin\controller;
class Index extends Common
{
    public function index()
    {
      return $this->fetch();
    }
    public function main()
   {
       //----------------------------------------------------------------------------------
       //验证是否支持GD库 对图片操作的函数
       if(function_exists('imagecreate')){
           $GDState='支持';
       }else{
           $GDState='不支持';
       }
       $this->assign('ServerName',$_SERVER['SERVER_NAME']);
       $this->assign('ServerIP',$this->request->ip());
       $this->assign('ServerPort',$_SERVER['SERVER_PORT']);
       $this->assign('PHPVersion',phpversion());//获取PHP版本
       $this->assign('WebServer',$_SERVER['SERVER_SOFTWARE']);
       $this->assign('ServerSystem',php_uname());
       $this->assign('GDState',$GDState);
       $this->assign('FileUpSize',ini_get("upload_max_filesize"));//允许图片上传尺寸大小
       $this->assign('MySQLVersion',$this->MySQLVersion());
       //----------------------------------------------------------------------------------
      return $this->fetch();
   }
    public function main_index()
    {
        //获取当前URL的信息
        $GetMenuTwoThreeList=$this->GetCurrentUrlInfo($this->BackMenu);
        $this->assign('GetMenuTwoThreeList',$GetMenuTwoThreeList);
        //----------------------------------------------------------------------------------
       //验证是否支持GD库 对图片操作的函数
       if(function_exists('imagecreate')){
           $GDState='支持';
       }else{
           $GDState='不支持';
       }
       $this->assign('ServerName',$_SERVER['SERVER_NAME']);
       $this->assign('ServerIP',$_SERVER['SERVER_ADDR']);
       $this->assign('ServerPort',$_SERVER['SERVER_PORT']);
       $this->assign('PHPVersion',phpversion());//获取PHP版本
       $this->assign('WebServer',$_SERVER['SERVER_SOFTWARE']);
       $this->assign('ServerSystem',php_uname());
       $this->assign('GDState',$GDState);
       $this->assign('FileUpSize',ini_get("upload_max_filesize"));//允许图片上传尺寸大小
       $this->assign('MySQLVersion',$this->MySQLVersion());
       //----------------------------------------------------------------------------------
        return $this->fetch();
    }
    private function MySQLVersion()
    {
        $Model = db();
        $version = $Model->query("select version() as ver");
        return $version[0]['ver'];
    }
}