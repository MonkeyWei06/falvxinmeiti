<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 15:56
 */
namespace app\member\model;
use think\Model;
class Invoice extends Model
{
    public function GetList($UrlParam,$PageCount,$MemberID)
    {
        $Where=array();
        if(!empty($UrlParam['keyword'])){
            $Where['InvoiceTitle']=['like','%'.trim($UrlParam['keyword']).'%'];
        }
        if(!empty($UrlParam['InvoiceName'])){
            $Where['InvoiceName']=['like','%'.trim($UrlParam['InvoiceName']).'%'];
        }
        if(!empty($UrlParam['InvoiceMobile'])){
            $Where['InvoiceMobile']=['like','%'.trim($UrlParam['InvoiceMobile']).'%'];
        }
        $Where['InvoiceMemberID']=$MemberID;
        $List=$this
            ->where($Where)->order('InvoiceID Desc')
            ->paginate($PageCount,false,['query'  => $UrlParam]);
        return $List;
    }
    public function getInvoiceTypeAttr($Val)
    {
        $TypeName=\think\Db::name('wholetype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('InvoiceType');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getInvoiceDetailAttr($Val)
    {
        if($Val==999){
            $Back['Old']=$this->getData('InvoiceDetail');
            $Back['New']='其他-'.$this->getData('InvoiceOtherContent');
        }else{
            $TypeName=\think\Db::name('wholetype')->where('TypeID',$Val)->value('TypeName');
            $Back=array();
            $Back['Old']=$this->getData('InvoiceDetail');
            $Back['New']=empty($TypeName)?'--':$TypeName;
        }
        return $Back;
    }
}