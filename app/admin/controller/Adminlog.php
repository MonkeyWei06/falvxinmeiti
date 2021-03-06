<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:23
 */
namespace app\admin\controller;
use app\admin\model\AdminLog as AdminLogModel;
class Adminlog extends Common
{
    private $MenuName = '日志';
    private $PageCount=15;
    //公共的方法调用
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->assign('FileSeat','/'.config('config.FileSeat').'/');
        $this->assign('MenuName', $this->MenuName);
    }
    //日志列表
    public function index()
    {
        $UrlParam=input('get.');
        $this->assign('UrlParam',$UrlParam);
        $Keyword=input('param.keyword','','trim');
        $Model=new AdminLogModel();
        $List = $Model->GetList($this->PageCount,$Keyword);
        $this->assign('List', $List);
        return $this->fetch();
    }
    //批量删除记录
    public function del()
    {
        $DelID=input('post.Del/a');
        //dump($DelID);
        if(!empty($DelID))
        {
            $DelIDStr=implode(',',$DelID);
            $Model=new AdminLogModel();
            $Model->where('LogID','in',$DelIDStr)->delete();
            AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'批量删除成功','LogOperateContent'=>'ID:'.$DelIDStr]);
        }
       // $this->success('此记录批量删除成功');
        $this->alert('此记录批量删除成功','back');
        exit;
    }
}