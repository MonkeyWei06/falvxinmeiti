<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31
 * Time: 19:10
 */
namespace app\agency_admin\controller;
use think\Db;
class Feedback extends Agency
{
    public function add()
    {
        if($this->request->isPost())
        {
            $data = [];
            $data['MessageContent'] = input('MessageContent');
            if(!$data['MessageContent']) return '反馈内容不能为空';
            $data['MessageMemberID'] = $this->AgencyMemberID;
            $data['MessageTime'] =time();
            Db::name('message')->insert($data);
            return 1;
        }
        return view();
    }
    public function messagelist()
    {
		$Where=array();
        $Where['MessageMemberID']=$this->AgencyMemberInfo['MemberID'];
        $Model=new \app\admin\model\Message();
        $list=$Model->GetList($Where,20);
		$this->assign('list',$list);
        return view();
    }
}