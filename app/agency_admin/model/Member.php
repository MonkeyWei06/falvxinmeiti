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
class Member extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='MemberTime';
    protected $updateTime=false;
    protected $resultSetType = 'collection';// 查询数据集对象
    public function GetList($UrlParam,$Where,$PageCount,$Field='*')
    {
        $Where=array_merge($UrlParam,$Where);
        $WhereArr=array();
        if(!empty($Where['RegDomain'])) $WhereArr['RegDomain']=$Where['RegDomain'];
        if(!empty($Where['MemberTypeID'])) $WhereArr['MemberTypeID']=$Where['MemberTypeID'];
        if(!empty($Where['MemberRecommendID'])) $WhereArr['MemberRecommendID']=$Where['MemberRecommendID'];
        if(!empty($Where['GroupID'])) $WhereArr['GroupID']=$Where['GroupID'];
        if(!empty($Where['keyword'])) $WhereArr['MemberName']=['like','%'.trim($Where['keyword']).'%'];
        if(!empty($Where['invitecode']))$WhereArr['MemberInviteCode']=['like','%'.trim($Where['invitecode']).'%'];
        $List=$this->field($Field)->where($WhereArr)->order('MemberSort Desc,MemberID Desc')->paginate($PageCount,false,[
            'query' => $UrlParam,
        ]);
        if(!empty($List)){
            foreach ($List as $Key=>$Val){
                $List[$Key]['MemberTypeIDName']=\think\Db::name('membertype')->where('TypeID',$Val['MemberTypeID'])->value('TypeName');
                $List[$Key]['MemberPriceTypeName']=\think\Db::name('wholetype')->where('TypeID',$Val['MemberPriceType'])->value('TypeName');
                $List[$Key]['MemberState']=empty($Val['MemberState'])?'<span style="color: red;">禁用</span>':'<span style="color: green;">启用</span>';
            }
        }
        return $List;
    }
    public function GetList2($UrlParam,$Where,$PageCount,$Field='*'){
        $list = $this
            ->where($Where)
            ->paginate($PageCount,false,[
                'query' => $UrlParam,
            ]);
        foreach ($list as $key=>$val)
        {
            $Money = Db::name('balance')->where('BalanceMemberID',$val['MemberID'])->where('BalanceType',1)->where('BalancePayState',1)->sum('BalanceCount');
            $list[$key]['MemberBalanceCount'] =$Money?$Money:0;
        }
        return $list;
    }
}