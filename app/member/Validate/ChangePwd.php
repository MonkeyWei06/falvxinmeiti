<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 17:28
 */
namespace app\member\Validate;
class ChangePwd extends BaseValidate
{
    protected $rule = [
        'MemberPwd' => 'require',
        'NewMemberPwd' => 'require|min:6',
        'NewMemberPwds' => 'require|confirm:NewMemberPwd',
    ];
    protected  $message = [
        'MemberPwd' =>'当前密码不能为空',
        'NewMemberPwd.require'=>'新密码不能为空',
        'NewMemberPwd.min'=>'新密码不能少于6位',
        'NewMemberPwds.require'=>'确认新密码不能为空',
        'NewMemberPwds.confirm'=>'两次密码输入的不一致',
    ];
}