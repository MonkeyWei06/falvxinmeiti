<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/5
 * Time: 10:57
 */
namespace app\agency_admin\controller;
use think\Config;
use think\Db;
class Agencymember extends Agency
{
    /**
     *  会员列表
     */
    public function member()
    {
        return $this->fetch();
    }
    public function getMemberlist(){
        $UrlParam=input('get.');
        $this->assign('UrlParam',$UrlParam);
        $Where=array();
        $Where['RegDomain']=$this->AgencyMemberInfo['Domain'];
        $Where['MemberTypeID']=1;
        //dump($this->AgencyMemberInfo);
        //dump($Where);
        $Model=new \app\agency_admin\model\Member();
        $List=$Model->GetList($UrlParam,$Where,20,'MemberID,MemberName,MemberMobile,MemberQQ,MemberState,MemberTime,MemberTypeID,MemberBalanceCount,MemberAgentBalanceCount,MemberInviteCode,GroupID,MemberPriceType');
        $Back=array();
        $Back['code']='0';
        $Back['count']=$List->total();
        $Back['msg']='会员列表';
        $Back['data']=$List->items();
        return json($Back);
    }
    //启用
    public function enable(){
        $MemberID=input('MemberID','','abs');
        if(empty($MemberID)) return json('1');
        $Model=new \app\agency_admin\model\Member();
        $Model->where('MemberID',$MemberID)->update(['MemberState'=>'1']);
        return json('0');
    }
    //禁用
    public function forbidden(){
        $MemberID=input('MemberID','','abs');
        if(empty($MemberID)) return json('1');
        $Model=new \app\agency_admin\model\Member();
        $Model->where('MemberID',$MemberID)->update(['MemberState'=>'0']);
        return json('0');
    }
    /**
     * 会员财务报表
     */
    public function topup()
    {
        $MemberID=input('MemberID','','abs');
        $this->assign('MemberID',$MemberID);
        return $this->fetch();
    }
    public function gettopuplist(){
        $UrlParam=input();
        $this->assign('UrlParam',$UrlParam);
        $StartDate = input('startdate', '');
        $EndDate = input('enddate', '');
        if(!empty($StartDate) || !empty($EndDate)){
            if(empty($StartDate)) $StartDate=date('Y-m-d');
            if(empty($EndDate)) $EndDate=date('Y-m-d');
        }
        if(!empty($StartDate) && !empty($EndDate)){
            $StartDate=strtotime($StartDate);$EndDate=strtotime($EndDate);
            $MinDate=min($StartDate,$EndDate);$MaxDate=max($StartDate,$EndDate);
            $MaxDate+=86399;
            $UrlParam['startdate']=date('Y-m-d',$MinDate);
            $UrlParam['enddate']=date('Y-m-d',$MaxDate);
            $UrlParam['MinDate']=$MinDate;$UrlParam['MaxDate']=$MaxDate;
        }
        $Where=array();
        if(empty($UrlParam['MemberID'])){
            $Where['BalanceMemberID']=$this->AgencyMemberID;
        }else{
            $Where['BalanceMemberRecommendID']=$this->AgencyMemberID;
            $Where['BalanceMemberID']=$UrlParam['MemberID'];
        }
        $Model=new \app\agency_admin\model\Balance();
        $List=$Model->GetMemberBalanceList($UrlParam,$Where,20);
        $Back=array();
        $Back['code']='0';
        $Back['count']=$List->total();
        $Back['msg']='充值列表';
        $Back['data']=$List->items();
        return json($Back);
    }
    /**
     * 修改会员密码
     */
    public function modify_pwd(){
        if($this->request->isPost()){
            $Post=input('post.');
            $this->ModifyPwdSave($Post);
            return json('0');
        }else {
            $MemberID=input('MemberID','','abs');
            $MemberName=input('MemberName','','trim');
            $this->assign('MemberID',$MemberID);
            $this->assign('MemberName',$MemberName);
            return $this->fetch();
        }
    }
    private function ModifyPwdSave($Post){
        $Model=new \app\agency_admin\model\Member();
        $MemberPwd=md5(config('config.MemberPwdKey').md5($Post['MemberPwd'].$Post['MemberName']).md5($Post['MemberPwd']));
        $Model->where('MemberID',$Post['MemberID'])->update(['MemberPwd'=>$MemberPwd]);
    }
    /**
     * 会员价格
     */
    public function userlevel(){
        if($this->request->isPost()){
            $Post=input('post.');
            $Model=new \app\agency_admin\model\Member();
            $Model->where('MemberID',$Post['MemberID'])->update(['MemberPriceType'=>$Post['MemberPriceType']]);
            return json('0');
        }else {
            $MemberID = input('MemberID', '', 'abs');
            $this->assign('GetMemberPriceTypeList', $this->GetMemberPriceTypeList(115));
            $Info = db('member')->where('MemberID', $MemberID)->find();
            $this->assign('Info', $Info);
            $this->assign('MemberID', $MemberID);
            return $this->fetch();
        }
    }
    //获取会员价格类型信息
    protected function GetMemberPriceTypeList($ParentID='0')
    {
        $Where=array();
        $Where['TypePID']=['in',$ParentID];
        $Where['TypeState']='1';
        return Db::name('wholetype')->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
    }
    /**
     * 资金调整
     */
    public function modify_wallet(){
        if($this->request->isPost()){
            $Post=input('post.');
            $MemberID=$Post['MemberID'];
            $Money=$Post['Money'];
            if(empty($Money)) return json(1);
            $Content=$Post['Content'];
            $Info=db('member')->where('MemberID',$MemberID)->find();
            $this->ModifyWalletSave($Info,$Money,$MemberID,$Content);
            if(empty($Info)) return json(2);
            return json('0');
        }else {
            $MemberID=input('MemberID','','abs');
            $this->assign('MemberID',$MemberID);
            return $this->fetch();
        }
    }
    private function ModifyWalletSave($Info,$Money,$MemberID,$Content){
        $Type = $Money<0 ? 2 : 1;
        $Money=abs($Money);
        $GroupID=$Info['GroupID'];
        $Sum=0;$Mark='';
        if($Type==1)
        {
            $Mark='充值';
            if($GroupID==1){
                $Sum=$Info['MemberBalanceCount']+$Money;
            }elseif($GroupID==2){
                $Sum=$Info['MemberAgentBalanceCount']+$Money;
            }
        }else if($Type==2){
            $Mark='扣除';
            if($GroupID==1){
                if($Info['MemberBalanceCount']>=$Money){
                    $Sum=$Info['MemberBalanceCount']-$Money;
                }else{
                    $Money=$Info['MemberBalanceCount'];
                    $Sum=0;
                }
            }elseif($GroupID==2){
                if($Info['MemberAgentBalanceCount']>=$Money){
                    $Sum=$Info['MemberAgentBalanceCount']-$Money;
                }else{
                    $Money=$Info['MemberAgentBalanceCount'];
                    $Sum=0;
                }
            }
        }
        if($Money>0){
            $Data=array();
            if($GroupID==1){
                $Data['MemberBalanceCount']=$Sum;
            }elseif($GroupID==2){
                $Data['MemberAgentBalanceCount']=$Sum;
            }
            db('member')->where('MemberID',$MemberID)->update($Data);
            $Data=array();
            $Data['BalanceNumber']=$Info['MemberID'] . date('YmdHis') . mt_rand(10000,99999);
            $Data['BalanceMemberRecommendID']=$Info['MemberRecommendID'];
            $Data['BalanceMemberRecommendPath']=$Info['MemberRecommendPath'];
            $Data['BalanceMemberID']=$MemberID;
            $Data['BalanceTitle']=$Content;
            $Data['BalanceType']=$Type;
            $Data['BalanceCount']=$Money;
            $Data['BalanceCurrentCount']=$Sum;
            $Data['BalanceGroup']=1;
            $Data['BalanceState']=1;
            $Data['BalancePayState']=1;
            $Data['BalanceTime']=time();
            db('balance')->data($Data)->insert();
        }
    }
}