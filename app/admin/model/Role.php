<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/11
 * Time: 10:08
 */
namespace app\admin\model;
use think\Model;
class Role extends Model
{
    //protected $resultSetType='collection'; 如果模型方法里面使用 find select 获取出来的数据为对象可使用当前属性对其转换为数组
    protected $autoWriteTimestamp = true;
    protected $createTime = 'addtime';
    //protected $updateTime='addtime';
    protected $updateTime = false;
    public function GetList($Keyword='',$WhereState='')
    {
        $Where=[];
        if(!empty($Keyword))
        {
            $Where['title']=array('like','%'.$Keyword.'%');
        }
        if(!empty($WhereState))
        {
            $Where=$WhereState;
        }
        $DataObj=$this->where($Where)->order('sort asc,id asc')->select();
        //if(empty($DataObj)) return false;
        //return $DataObj->toArray();
        return $DataObj;
    }
    //获取单条记录数据、
    public function GetInfo($ID)
    {
        $DataObj=$this->where('id',$ID)->find();
        if(empty($DataObj)){ return false;}
        //dump($DataObj);
        $Info=$DataObj->getData();
        return $Info;
    }
}