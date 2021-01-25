<?php
<?php 
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/5
 * Time: 10:57
 */
namespace app\home\controller;
use think\Controller;
use think\Db;
use think\Session;
use think\Config;
use think\Request;
use think\Loader;

class Freedbook extends controller
{
	public function index()
	{
		if (!isset($_SERVER['HTTP_REFERER']) || stripos($_SERVER['HTTP_REFERER'], 'localhost')) {
			$this->ajaxReturn(array('status'=>0, 'info'=>'没有权限'));
		} else {
			$CustomerModel = D('Customer');
			if($this->isPost()){
				$data = I('post.');
					$rules = array(
						array('name', 'require', '请输入姓名'),
						array('mobile', 'require', '请输入电话'),
						array('content', 'require', '请输入咨询内容'),
					);
					$result['name'] = $data['name'];//客户名称
					$result['mobile'] = $data['mobile'];//客户电话
					$result['content'] = $data['content'];
					$result['addtime'] = time();
					header("Access-Control-Allow-Headers: x-requested-with,content-type");
					header('Access-Control-Allow-Methods: OPTIONS,POST,GET');
					if($CustomerModel->add($result)){
						$this->ajaxReturn(array('status'=>1, 'info'=>'信息提交成功，请保持电话畅通，我们稍后将会跟您联系！'));
					}else{
						$this->ajaxReturn(array('status'=>0, 'info'=>'失败，请联系管理员'));
					}
			}
		}
    }
}