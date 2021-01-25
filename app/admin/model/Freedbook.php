<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class Freedbook extends Model
{
    protected $resultSetType = 'collection';// 查询数据集对象
    // 是否需要自动写入时间戳 如果设置为字符串 则表示时间字段的类型
    protected $autoWriteTimestamp = true;
    // 创建时间字段
    protected $createTime = 'addtime';
    // 更新时间字段
    protected $updateTime = false;
    // 时间字段取出后的默认时间格式
    protected $dateFormat = 'Y-m-d H:i:s';
    //商品品牌列表
    public function GetList($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['keyword'])){
            $Where['name']=['like','%'.trim($UrlParam['keyword']).'%'];
        }
        $List=$this->where($Where)->order('id Desc')
            ->paginate($PageCount,false,['query'  => $UrlParam]);
        foreach ($List as $key=>$val)
        {
            //$time = date('Y-m-d',$val['addtime']);
			$List[$key]['addtime'] = empty($val['addtime']) ? '' : time();
        }
        return $List;
    }
}