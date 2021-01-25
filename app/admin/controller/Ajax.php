<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/28
 * Time: 16:32
 */
namespace app\admin\controller;
use think\Db;
use sendmsg\SendUtility;
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
        $Val=input('post.Val','','trim');
        $Where=array();
        //$Where['InviteState']=1;		
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
    //快递编号查询
    public function ExpressNumberSearch()
    {
        $ExpressName=input('post.ExpressName','','trim');
        $ExpressNumber=input('post.ExpressNumber','','trim');
        $Result=ExpressNumberSearch($ExpressName,$ExpressNumber);
        $this->result($Result);
    }
    //获取联级菜单子分类数据
    public function GetSeatListData()
    {
        $TableName=input('post.TableName','','trim');
        $TypeID=input('post.TypeID','','abs');
        $List=$this->GetSeatTypeList($TableName,$TypeID);
        $this->result($List,0,'分类列表数据');
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
        $upture=db::name($TableName)->where($Where)->update($Data);
		if($upture && $TableName=='Withdrawal'){
			$resultw=db::name('withdrawal')->where($Where)->find();
			$phone=Getmemberinfo($resultw['MemberID'],"MemberName");
			/*增加短信注册提醒*/
			$utility = new SendUtility();
			$RtnString = $utility->Send();
			/*增加短信注册提醒*/
		}
        $this->result('','0','状态更新成功！');
    }
    //代理商审核更改状态
    public function ListAuditStateChange()
    {
        $ID=input('post.ID');
        $State=input('post.State');
        $TableName=input('post.TableName');
        $MainFieldID=input('post.MainFieldID');
        $ChangeField=input('post.ChangeField');
        $Where=array();
        $Where[$MainFieldID]=$ID;
        $AgentAuditTime=db::name($TableName)->where($Where)->value('AgentAuditTime');
        $Data=array();
        $Data[$ChangeField]=$State;
        if(empty($AgentAuditTime)) $Data['AgentAuditTime']=time();
        db::name($TableName)->where($Where)->update($Data);
        $this->result('','0','状态更新成功！');
    }
    //邀请推荐
    public function Atlas(){
        $PID=input('id');
        $Model=new \app\admin\model\Member();
        $List=$Model->alias('t1')
            ->field('t1.*,t2.TypeName')
            ->join('__MEMBERTYPE__ t2','t1.MemberTypeID=t2.TypeID','left')
            ->where(['t1.MemberRecommendID'=>$PID])
            ->order('t1.MemberID Desc')->select();
        $Str='';
        if(!empty($List)){
            $Str.='<ul class="content">';
            foreach ($List as $key=>$val){
                $Str.='<li>
                    <div>
                        <span class="layui-badge-dot layui-bg-blue"></span>
                        <a onclick="OpenNextLevel(this,\''.url('ajax/Atlas',['id'=>$val['MemberID']]).'\');">会员名称：'.$val['MemberName'].'(会员级别：'.$val['TypeName'].')</a>
                        <span class="ShowHide" onclick="ShowHideNextLevel(this);">显示</span>
                    </div>
                </li>';
            }
            $Str.='</ul>';
        }
        echo $Str;
    }
    //验证码验证
    public function InviteCodeCheck(){
        $Val=input('Val','','trim');
        $InviteMemberID=input('InviteMemberID','','trim');
        if(empty($Val)) $this->result('','1','请输入您的邀请码！');
        if(empty($InviteMemberID)) $this->result('','3','会员名称不能为空！');
        $Where=array();
        $Where['InviteMemberID']=$InviteMemberID;
        $Where['InviteCode']=$Val;
        $Count=db::name('Invite')->where($Where)->count();
        if(empty($Count)){
            $this->result('','0','可以使用！');
        }else{
            $this->result('','2','已被使用！');
        }
    }
    public function setdownstate(){
        $ID=input('ID');
        $down_state=db('article')->where('article_id',$ID)->value('down_state');
        if(empty($down_state)){
            db('article')->where('article_id',$ID)->update(['down_state'=>'1']);
        }else{
            db('article')->where('article_id',$ID)->update(['down_state'=>'0']);
        }
        $this->result('','0','更新成功！');
    }
}