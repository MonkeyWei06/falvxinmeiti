<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31
 * Time: 20:37
 */
namespace app\member\controller;
use app\member\model\Invoice as InvoiceModel;
use think\Db;
class Invoice extends Common
{
    public function index()
    {
        session('MenuCookie','4');
        $UrlParam=input('get.');
        $Model=new InvoiceModel();
        $List=$Model->GetList($UrlParam,20,$this->MemberID);
        $this->assign('list',$List);
        $this->assign('UrlParam',$UrlParam);
         return view();
    }
    public function add()
    {
        session('MenuCookie','4');
        if($this->request->isPost()){
            $data=input('post.');
//            echo '<pre>';
//            print_r($data);
            $data['InvoiceMemberID']=$this->MemberID;
            $data['InvoiceTime'] =time();
            $data['InvoiceState']='0';
            Db::name('invoice')->insert($data);
            $this->success('更新成功！');
        }
        $this->assign('InvoiceExpress',$this->GetCurrentWholeType(1));//快递名称
        $this->assign('InvoiceType',$this->GetCurrentWholeType(2));//发票类型
        $this->assign('InvoiceDetail',$this->GetCurrentWholeType(3));//发票明细
        return view();
    }
    public function invoiceinfo()
    {
        $ID=input('id','','abs');
        $Where=array();
        $Where['InvoiceMemberID']=$this->MemberID;
        $Where['InvoiceID']=$ID;
        $Info=db('invoice')->where('InvoiceID',$ID)->find();
        $Info['InvoiceTypeName']=db('wholetype')->where('TypeID',$Info['InvoiceType'])->value('TypeName');
        $InvoiceDetailName='';
        if($Info['InvoiceDetail']==999){
            $InvoiceDetailName='其他';
        }else{
            $InvoiceDetailName=db('wholetype')->where('TypeID',$Info['InvoiceDetail'])->value('TypeName');
        }
        $Info['InvoiceDetailName']=$InvoiceDetailName;
        $Info['InvoiceExpressName']=db('wholetype')->where('TypeID',$Info['InvoiceExpress'])->value('TypeName');
        $InvoiceStateName='';
        if($Info['InvoiceState']==0){
            $InvoiceStateName='申请中';
        }else if($Info['InvoiceState']==1){
            $InvoiceStateName='申请失败';
        }else if($Info['InvoiceState']==2){
            $InvoiceStateName='已寄出';
        }
        $Info['InvoiceStateName']=$InvoiceStateName;
        $this->assign('InvoiceExpress',$this->GetCurrentWholeType(1));//快递名称
        $this->assign('InvoiceType',$this->GetCurrentWholeType(2));//发票类型
        $this->assign('InvoiceDetail',$this->GetCurrentWholeType(3));//发票明细
        $this->assign('Info',$Info);
        return view();
    }
    //获取全局分类名称
    protected function GetWholeTypeName($TypeID){
        $Where=array();
        $Where['TypeID']=$TypeID;
        $Where['TypeState']=1;
        $Info=db::name('wholetype')->field('TypeName')->where($Where)->find();
        //echo db::name('wholetype')->getLastSql();
        return $Info;
    }
    //获取全局分类
    protected function GetCurrentWholeType($TypeID){
        $Where=array();
        $Where['TypePID']=$TypeID;
        $Where['TypeState']=1;
        $List=db::name('wholetype')->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        return $List;
    }
}