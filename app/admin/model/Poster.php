<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class Poster extends Model
{
    protected $resultSetType = 'collection';// 查询数据集对象
    // 是否需要自动写入时间戳 如果设置为字符串 则表示时间字段的类型
    protected $autoWriteTimestamp = true;
    // 创建时间字段
    protected $createTime = 'PosterTime';
    // 更新时间字段
    protected $updateTime = false;
    // 时间字段取出后的默认时间格式
    //protected $dateFormat = 'Y-m-d H:i:s';
    public function GetList($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['key'])){
            $Where['PosterName']=['like','%'.trim($UrlParam['key']).'%'];
        }
        $List=$this->where($Where)->order('PosterSort Desc,PosterID Desc')->paginate($PageCount,false,[
            'query'     => $UrlParam,
        ]);
        if(!empty($List)){
            foreach ($List as $key=>$val){
                $PosterTypePath='';
                if(!empty($val['PosterTypePath'])) $PosterTypePath=substr($val['PosterTypePath'],0,-1);
                $PosterSeat=$this->GetPosterSeat($PosterTypePath);
                $List[$key]['PosterSeat']=$PosterSeat;
            }
        }
        return $List;
    }
    public function GetSeatList()
    {
        $Where=array();
        $Where['PosterState']='1';
        return $this->field('PosterID,PosterName')->where($Where)->order('PosterSort Asc,PosterID Asc')->select();
    }
    private function GetPosterSeat($PosterSeat){
        if(empty($PosterSeat)) return false;
        $PosterSeat=explode(',',$PosterSeat);
        $Where=array();
        $Where['TypeID']=['in',$PosterSeat];
        $List=db('postertype')->where($Where)->order('TypeID Asc')->column('TypeName');
        //echo db()->getLastSql();
        return implode('->',$List);
    }
}