<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 15:44
 */
namespace app\member\Validate;
use think\validate;
class Member extends BaseValidate
{
    protected $rule = [
		'type'=>'require',
		'MemberTrueName'=>'require',
		'MemberCompanyName'=>'require',
        'MemberName'=>'require',
        'MemberPwd'=>'require|min:6',
        'passwords'=>'require|confirm:MemberPwd',
        'MemberQQ'=>'require|number',
       // 'MemberMobile' =>'require|checkMobile',//|unique:member
    ];
    protected $message =[
		'type'=>'请选择角色',
        'MemberName' => '用户名必须填写',		
        'MemberPwd.require' => '密码必须填写',
        'MemberPwd.min' => '密码长度不能小于6位',
        'passwords.require' =>'确认密码不能为空',
        'passwords.confirm' =>'两次输入的密码不一致',
        'MemberQQ.require' =>'QQ号必须填写',
        'MemberQQ.number'=>'QQ号格式不正确',
        //'MemberMobile.require' =>'手机号必须填写',
		// 'MemberMobile.checkMobile' =>'手机号不合法',
        //'MemberMobile.unique' =>'该手机号已被注册',
    ];
    protected $scene = [
        'login' =>['MemberName','MemberPwd'],
        'updateUser' =>[ 'MemberQQ','MemberMobile'],
    ];
}