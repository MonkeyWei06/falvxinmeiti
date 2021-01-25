<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/18
 * Time: 15:55
 */
namespace app\member\Validate;
use think\validate;
class BaseValidate extends  Validate
{
    public function goCheck($params,$scene='')
    {
        //获取验证的参数
        $result = $this->scene($scene)->check($params);
        if (!$result) {
            return false;
        } else {
            return true;
        }
    }
    protected  function checkMobile($value)
    {
        $strLen = strlen($value);
        if ($strLen != 11) {
            return false;
        }
        if(preg_match("/^1[345789]\d{9}$/", $value)){
            return true;
        } else {
            return false;
        }
    }
}