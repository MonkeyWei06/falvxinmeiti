<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/28
 * Time: 16:32
 */
namespace app\agency_admin\controller;
use think\Db;
class Ajax extends Common
{
    //会员信息验证
    public function MemberInfoCheck()
    {
        $Val=input('post.Val','','trim');
        $Field=input('post.Field','','trim');
        $ID=input('post.ID','','abs');
        if(!empty($ID))
        {
            $Info=Db::name('member')->where('MemberID',$ID)->value($Field);
            if($Val==$Info){
                $Back=array();
                $Back['InfoState']=-1;
                $this->result($Back,'0','会员信息');
            }
        }
        $Where=array();
        $Where[$Field]=$Val;
        $State=Db::name('member')->where($Where)->count();
        $Back=array();
        $Back['InfoState']=empty($State) ? '0' : '1';
        $this->result($Back,'0','会员信息');
    }
    //会员信息验证
    public function MemberInfoCheck2()
    {
        $Val=input('post.Val','','trim');
        $Field=input('post.Field','','trim');
        $Where=array();
        $Where[$Field]=$Val;
        $Where['MemberTypeID']=3;
        $State=Db::name('member')->where($Where)->count();
        $Back=array();
        $Back['InfoState']=empty($State) ? '1' : '0';
        $this->result($Back,'0','会员信息');
    }
    //会员邀请码是否存在，针对主站
    public function MemberInfoCheck3()
    {
        //$this->AgencyMemberInfo['MemberID'];
        $Val=input('post.Val','','trim');
        $memberid=input('post.memberid','','trim');
        $Where=array();
        $Where['InviteMemberID']=$memberid;
        $Where['InviteCode']=$Val;
        $State=Db::name('invite')->where($Where)->count();
        $Back=array();
        $Back['InfoState']=empty($State) ? '1' : '0';
        $this->result($Back,'0','邀请码信息');
    }
    //获取会员类别数据
    public function getmemberlist()
    {
        $Name=input('post.Name');
        $List=array();
        if(!empty($Name))
        {
            $MemberModel=new \app\admin\model\Member();
            $List=$MemberModel->GetList($Name);
        }
        return $this->result($List,'0','会员列表数据');
    }
    
    //更改是否禁用状态
    public function ListStateChange()
    {
        $ID=input('post.ID');
        $State=input('post.State');
        $TableName=input('post.TableName');
        $MainFieldID=input('post.MainFieldID');
        $ChangeField=input('post.ChangeField');
        $Where=array();
        $Where[$MainFieldID]=$ID;
        $Data=array();
        $Data[$ChangeField]=$State;
        db::name($TableName)->where($Where)->update($Data);
        $this->result('','0','状态更新成功！');
    }
    
    
}