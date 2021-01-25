<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/5
 * Time: 10:57
 */
namespace app\agency_admin\controller;
use \app\admin\model\Member as MemberModel;
use think\Db;
class Agencyagent extends Agency
{
    public function index()
    {
        return view();
    }
    public function getlist()
    {
        $UrlParam=input('get.');
        $this->assign('UrlParam',$UrlParam);
        $Where=array();
        $Where['MemberRecommendID']=$this->AgencyMemberInfo['MemberID'];
        $Where['MemberTypeID']=2;
        $Model=new \app\agency_admin\model\Member();
        $List=$Model->GetList($UrlParam,$Where,20,'MemberID,MemberName,MemberMobile,MemberQQ,MemberState,MemberTime,MemberTypeID,MemberBalanceCount,MemberAgentBalanceCount,MemberInviteCode,GroupID,MemberPriceType');
        $Back=array();
        $Back['code']='0';
        $Back['count']=$List->total();
        $Back['msg']='会员列表';
        $Back['data']=$List->items();
        return json($Back);
    }
    public function add()
    {
        if($this->request->isPost())
        {
            $Post = input('');
            $Model=new MemberModel();
            $State=$Model->where('MemberName',$Post['MemberName'])->count();
            if($State!=0) $this->error('您所输入的会员名称已被注册');
            if (!preg_match("/^[\x{4e00}-\x{9fa5}A-Za-z0-9]+$/u", $Post['MemberName'])) $this->error('名称不能有非法字符');
            if(empty($Post['MemberPwd']))$this->error('当前会员密码不能为空');
            if($Post['MemberPwd']!=$Post['MemberAffirmPwd']) $this->error('您的两次密码输入不一致');
            unset($Post['MemberAffirmPwd']);
            //手机号验证
            //$State=$Model->where('MemberMobile',$Post['MemberMobile'])->count();
            //if($State!=0) $this->error('您所输入的会员手机号已被注册');
//        //邮箱验证
//        $State=$Model->where('MemberEmail',$Post['MemberEmail'])->count();
//        if($State!=0) $this->error('您所输入的会员邮箱已被注册');
//        //图片上传
//        $PicPath=$this->OneUpload('MemberPicPath');
//        if(!empty($PicPath)) $Post['MemberPicPath']=$PicPath;
            $MemberPwd=$Post['MemberPwd'];
            $MemberName=$Post['MemberName'];
            $Post['MemberPwd']=md5(config('config.MemberPwdKey').md5($MemberPwd.$MemberName).md5($MemberPwd));
            $Post['GroupID']=2;
            $data = [];
            $data['MemberName'] = $Post['MemberName'];
            $data['MemberPriceType'] = $Post['MemberPriceType'];
            $data['MemberPwd'] = $Post['MemberPwd'];
            $data['MemberMobile'] = $Post['MemberMobile'];
            $data['MemberQQ'] = $Post['MemberQQ'];
            $data['MemberState'] = $Post['MemberState'];

            $data['Domain'] = $Post['Domain'];
			$data['oneDomain'] = $Post['oneDomain'];
			$State=$Model->where('Domain',$Post['Domain'])->count();
			if($State!=0) $this->error('此域名已被占用');

			$oneState=$Model->where('oneDomain',$Post['oneDomain'])->count();
			if($oneState!=0) $this->error('此一级域名已被占用');

            $data['MemberCompanyName'] = $Post['MemberCompanyName'];
            $data['MemberInviteCode'] = $Post['MemberInviteCode'];
           
            $data['AgentAuditState'] = 2;
            $data['GroupID'] = 2;
            $data['MemberTypeID'] = 2;
            $data['MemberRecommendID'] = $this->AgencyMemberID;
            $data['MemberTime'] = time();
            $data['AgentApplyTime']=time();
            Db::name('member')->insert($data);
            $InsertID=Db::name('member')->getLastInsID();
            $Where=array();$Where['MemberID']=$InsertID;
            $data = [];
            $MemberRecommendPath=$InsertID;
            if(!empty($this->AgencyMemberInfo['MemberRecommendPath'])){
                $MemberRecommendPath.=','.$this->AgencyMemberInfo['MemberRecommendPath'];
            }
            $data['MemberRecommendPath'] = $MemberRecommendPath;
            Db::name('member')->where($Where)->update($data);
            $this->success('添加成功,等待管理员审核',url('index'));
        }
        $Where=array();
        $Where['TypePID']=115;
        $Where['TypeState']=1;
        $List=db::name('wholetype')->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        $this->assign('MemberPriceType',$List);
        return view();
    }
}