<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/10
 * Time: 12:21
 */
namespace app\admin\model;
use think\Model;
class AuthGroupAccess extends Model
{
    protected $resultSetType='collection';
    public function GetList($ID)
    {
        $Obj=$this->where('uid',$ID)->select();
        if(empty($Obj)) return false;
        return $Obj->toArray();
    }
    //删除管理员所对应的权限
    public function DeleteList($ID)
    {
        $this->where('uid',$ID)->delete();
    }
}