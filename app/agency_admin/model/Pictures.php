<?php
/**
 * Created by PhpStorm.
 * User: Memberistrator
 * Date: 2018/1/4
 * Time: 10:54
 */
namespace app\agency_admin\model;
use think\Model;
use think\Db;
class Pictures extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='MemberTime';
    protected $updateTime=false;
    protected $resultSetType = 'collection';// 查询数据集对象
    public function GetList($UrlParam,$Where,$PageCount,$Field='*')
    {
        $Where=array_merge($UrlParam,$Where);
        $WhereArr=array();
        if(!empty($Where['picmember_id'])) $WhereArr['picmember_id']=$Where['picmember_id'];
        $List=$this->field($Field)
            ->where($WhereArr)
            ->order('pictures_sort asc,pictures_id asc')
            ->paginate($PageCount);
        if(!empty($List)){
            foreach ($List as $Key=>$Val){
                $List[$Key]['pictures_path']='<span class="look layui-btn layui-btn-xs" onclick="look('.$Val['pictures_id'].')" data="'.$Val['pictures_id'].'">查看</span><img style="display: none;max-width:500px" id="Img'.$Val['pictures_id'].'" src="'.config('MainDoMain').'/uploads/lbt/'.$Val['pictures_path'].'">';
                $List[$Key]['pictures_state']=$Val['pictures_state']?'启用':'禁用';
            }
        }
        return $List;
    }
}