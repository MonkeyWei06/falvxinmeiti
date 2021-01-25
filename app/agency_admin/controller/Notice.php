<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31
 * Time: 9:19
 */
namespace app\agency_admin\controller;
use think\Db;
class Notice extends Agency
{
     public function index()
     {
        return view();
     }
    public function getlist(){
         $where = [];
         $where['NewsState'] = 1;
         $List= Db::name('notice')
                 ->where($where)
                 ->order('NewsSort asc,NewsID Desc')
                 ->paginate(20);
         $arr = $List->items();
         foreach ($arr as $key=>$val)
         {
             $arr[$key]['NewsTime'] = date('Y-m-d',$val['NewsTime']);
             $arr[$key]['NewsTitle'] = '<a href="'.url('info',['id'=>$val['NewsID']]).'">'.$val['NewsTitle'].'</a>';
             $arr[$key]['look'] = '<a href="'.url('info',['id'=>$val['NewsID']]).'">查看</a>';
         }
        $Back=array();
        $Back['code']='0';
        $Back['count']=$List->total();
        $Back['msg']='图片列表';
        $Back['data']=$arr;
        return json($Back);
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