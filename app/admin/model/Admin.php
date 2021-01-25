<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/10
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class Admin extends Model
{
    //protected $resultSetType='collection'; 如果模型方法里面使用 find select 获取出来的数据为对象可使用当前属性对其转换为数组
    protected $autoWriteTimestamp = true;
    protected $createTime = 'AdminTime';
    //protected $updateTime='AdminTime';
    protected $updateTime = false;
    public function GetList($Keyword)
    {
        $Where=[];
        if(!empty($Keyword))
        {
            $Where['AdminName']=array('like','%'.$Keyword.'%');
        }
        return $this->where($Where)->order('AdminSort asc,AdminID asc')->select();
    }
    //获取单条记录数据、
    public function GetInfo($ID)
    {
        $DataObj=$this->where('AdminID',$ID)->find();
        if(empty($DataObj)){ return false;}
        $Info=$DataObj->getData();
        return $Info;
    }
    //管理员名称验证
    public function AdminInfoCheck($AdminName)
    {
        return $this->field('count(*) as c')->where('AdminName',$AdminName)->count();
    }
}