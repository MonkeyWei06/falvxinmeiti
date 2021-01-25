<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class News extends Model
{
    protected $resultSetType = 'collection';// 查询数据集对象
    // 是否需要自动写入时间戳 如果设置为字符串 则表示时间字段的类型
    protected $autoWriteTimestamp = true;
    // 创建时间字段
    protected $createTime = 'NewsTime';
    // 更新时间字段
    protected $updateTime = false;
    // 时间字段取出后的默认时间格式
    //protected $dateFormat = 'Y-m-d H:i:s';
    //商品品牌列表
    public function GetList($PageCount,$Keyword)
    {
        $Where=[];
        if(!empty($Keyword))
        {
            $Where['NewsTitle']=['like','%'.$Keyword.'%'];
        }
        return $this->where($Where)->order('NewsSort Desc,NewsID Desc')->paginate($PageCount,false,[
            'query'=>['keyword'=>$Keyword],
        ]);
    }
}