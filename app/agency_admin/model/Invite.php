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
class Invite extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='InviteTime';
    protected $updateTime=false;
    protected $resultSetType = 'collection';// 查询数据集对象
    public function GetList($UrlParam,$Where,$PageCount,$Field='*'){
        $Where=array_merge($UrlParam,$Where);
        $WhereArr=array();
        if(!empty($Where['InviteMemberID'])) $WhereArr['InviteMemberID']=$Where['InviteMemberID'];
        if(!empty($Where['keyword'])) $WhereArr['InviteCode']=['like','%'.trim($Where['keyword']).'%'];
        if(!empty($Where['InviteName'])) $WhereArr['InviteName']=['like','%'.trim($Where['InviteName']).'%'];
        $List=$this->field($Field)->where($WhereArr)->order('InviteID Desc')->
			paginate($PageCount,false,[
            'query' => $UrlParam,
        ]);
        //echo $this->getLastSql();
        if(!empty($List)){
            foreach ($List as $Key=>$Val){
                $idarr = Db::name('member')->where('MemberInviteCode',$Val['InviteCode'])->column('MemberID');
				/*充值统计*/
				if (!$idarr){
					$idarr='-1';
				}
                $Num = Db::name('balance')->where('BalanceMemberID','in',$idarr)->where('BalanceType',1)->where('BalanceGroup',2)->where('BalancePayState',1)->sum('BalanceCount');
				$List[$Key]['InvitePerformance']='<a href="'.url('achievement',['code'=>$Val['InviteCode']]).'">点击查看</a>';
				/***/
				$DowMoney=Db::name('balance')->where('BalanceMemberID','in',$idarr)->where('BalanceType',2)->where('BalanceGroup',4)->sum('BalanceCount');

				$TgMoney=Db::name('balance')->where('BalanceMemberID','in',$idarr)->where('BalanceType',1)->where('BalanceGroup',3)->sum('BalanceCount');

                $Url=$Val['Invitehost'];

                $List[$Key]['InviteGeneralizeUrl']='<a href="'.$Url.'" target="_blank">'.$Url.'</a>';
				$List[$Key]['ewm']='<a href="'.url('ewmhb',['code'=>$Val['InviteCode']]).'" class="am-btn am-btn-warning am-radius am-btn-xs" target="_blank">查看</a>';
                 $List[$Key]['InviteMoney']=$Num;
				//$List[$Key]['DowMoney']=$DowMoney;
				//$List[$Key]['TgMoney']=$TgMoney;
                if($Val['InviteState']==1){
                    $List[$Key]['InviteState']='<p style="color: green">启用</p>';
                }else{
                    $List[$Key]['InviteState']='<p style="color: red">禁用</p>';
                }
            }
        }
        return $List;
    }
	 public function GetList2($UrlParam,$PageCount)
    {
        $Where=array();
		$Where['MemberRecommendID']=intval($UrlParam['MemberID']);
		$List=db("member")->where($Where)->paginate($PageCount,false,['query'  => $UrlParam]);
        //$Where['t2.GroupID']!=4;
        /*$List=$this->alias('t1')
            ->field('t1.*,t2.MemberName')
            ->join('__MEMBER__ t2','t1.InviteMemberID=t2.MemberID','left')
            ->where($Where)->order('t1.InviteID Desc')
            ->paginate($PageCount,false,['query'  => $UrlParam]);
			*/
        return $List;
    }

}