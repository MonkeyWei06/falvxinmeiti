<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31
 * Time: 20:37
 */
namespace app\member\controller;
use think\Db;
class Notice extends Common
{
    public function index()
    {
        session('MenuCookie','3');
        $List= Db::name('notice')
            ->where('NewsState',1)
            ->order('NewsSort desc,NewsID Desc')
            ->paginate(20);
        $this->assign('list',$List);
        return view();
    }
    public function info()
    {
        $info=Db::name('notice')
            ->where('NewsID',input('id'))
            ->find();
        $this->assign('info',$info);
        return view();
    }
}