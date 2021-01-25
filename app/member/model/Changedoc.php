<?php
/**
 * Created by PhpStorm.
 * User: Memberistrator
 * Date: 2018/1/4
 * Time: 10:54
 */
namespace app\member\model;
use think\Model;
use think\Db;
class Changedoc extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='addtime';
     protected $resultSetType = 'collection';// 查询数据集对象
    public function GetList($UrlParam,$Where,$PageCount,$Field='*'){
        $Where=array_merge($UrlParam,$Where);
        $WhereArr=array();
        if(!empty($Where['keyword'])) $WhereArr['ordernum']=['like','%'.trim($Where['keyword']).'%'];
        $List=$this->field($Field)->where($WhereArr)->order('id Desc')->
			paginate($PageCount,false,[
            'query' => $UrlParam,
        ]);
        //echo $this->getLastSql();
        return $List;
    }
}