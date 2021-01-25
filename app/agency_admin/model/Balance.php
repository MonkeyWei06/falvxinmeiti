<?php
/**
 * Created by PhpStorm.
 * User: Memberistrator
 * Date: 2018/1/4
 * Time: 10:54
 */
namespace app\agency_admin\model;
use think\Model;
class Balance extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='BalanceTime';
    protected $updateTime=false;
    protected $resultSetType = 'collection';// 查询数据集对象
    public function GetMemberBalanceList($UrlParam,$Where,$PageCount,$Field='*'){
        $Where=array_merge($UrlParam,$Where);
        $WhereArr=array();
        if(!empty($Where['keyword'])) $WhereArr['BalanceNumber']=['like','%'.trim($Where['keyword']).'%'];
        if(!empty($Where['code'])) $WhereArr['BalanceNumber']=['like','%'.trim($Where['code']).'%'];
        if(!empty($Where['BalanceMemberID'])) $WhereArr['BalanceMemberID']=$Where['BalanceMemberID'];
        if(!empty($UrlParam['MinDate']) && !empty($UrlParam['MaxDate'])){
            $WhereArr['BalanceTime']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
        $List=$this->field($Field)->where($WhereArr)->order('BalanceSort Desc,BalanceID Desc')->paginate($PageCount,false,[
            'query' => $UrlParam,
        ]);
        //echo $this->getLastSql();
        return $List;
    }
}