<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31
 * Time: 20:37
 */
namespace app\member\controller;
use think\Db;
class Feedback extends Common
{
    public function add()
    {
        session('MenuCookie','5');
        if($this->request->isPost()){
            $data = [];
            $data['MessageContent'] = input('MessageContent');
            if(!$data['MessageContent']) return '反馈内容不能为空';
            $data['MessageMemberID'] = $this->MemberID;
            $data['MessageTime'] =time();
            Db::name('message')->insert($data);
            return 1;
        }
        return view();
    }
    public function messagelist()
    {
        session('MenuCookie','5');
        $List= Db::name('message')->where('MessageMemberID',$this->MemberID)->order('MessageID Desc')->paginate(20);
        $this->assign('list',$List);
        return view();
    }
}