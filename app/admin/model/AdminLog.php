<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class AdminLog extends Model
{
    protected $resultSetType = 'collection';// 查询数据集对象
    //商品品牌列表
    public function GetList($PageCount,$Keyword)
    {
        $Where=[];
        if(!empty($Keyword))
        {
            $Where['t1.LogOperateTitle|t2.AdminName']=['like','%'.$Keyword.'%'];
        }
        return $this->alias('t1')->field('t1.*,t2.AdminName')->where($Where)->join('__ADMIN__ t2','t1.LogAdminID=t2.AdminID','left')->order('t1.LogID Desc')->paginate($PageCount,false,[
            'query'=>['keyword'=>$Keyword],
        ]);
    }
}