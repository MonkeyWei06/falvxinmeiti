<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 11:48
 */
namespace app\member\controller;
use think\Config;
use think\Session;
use think\Db;
use think\Log;
class Memberset extends Common
{
    protected  $model;
    public function  _initialize()
    {
        parent::_initialize();
        $this->model = model('memberset');
    }

    public function  push_manage()
    {
		$WhereArr=array();
        $WhereArr['member_id']=$_SESSION['think']['MemberID'];
		$State=$this->model->where($WhereArr)->find();
 		$this->assign('State',$State);
        return $this->fetch();
    }

	public function addsave()
    {
		$Post=input('post.');
		$member_id=$_SESSION['think']['MemberID'];
		$WhereArr['member_id']=$member_id;
		$State=$this->model->where($WhereArr)->find();
		if(count($State)>0){
			$result =$this->model->where('member_id',$member_id)->update($Post);
			   if ($result) {
 				    $this->success('操作成功');
			   } else {
				    $this->error('操作失败');
			   }
		}else{
			$Post['member_id']=$member_id;
			$Post['addTime']=time();
			$this->model->save($Post);
			$InsertID=$this->model->getLastInsID();
			if ($InsertID>0){

 				 $this->success('操作成功');

			}else{

				 $this->error('操作失败');
			}
		}
    }
}