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
class Home extends Controller
{
    public function index()
    {
        return $this->fetch();
    }
   public function jiage()
    {
        return $this->fetch();
    }
public function about()
    {
        return $this->fetch();
    }
}