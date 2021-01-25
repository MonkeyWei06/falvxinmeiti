<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class Invoice extends Model
{
    protected $resultSetType = 'collection';// 查询数据集对象
    // 是否需要自动写入时间戳 如果设置为字符串 则表示时间字段的类型
    protected $autoWriteTimestamp = true;
    // 创建时间字段
    protected $createTime = 'InvoiceTime';
    // 更新时间字段
    protected $updateTime = false;
    // 时间字段取出后的默认时间格式
    //protected $dateFormat = 'Y-m-d H:i:s';
    //商品品牌列表
    public function GetList($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['keyword'])){
            $Where['t1.InvoiceInvoiceTitle|t2.MemberName']=['like','%'.trim($UrlParam['keyword']).'%'];
        }
        if(!empty($UrlParam['InvoiceName'])){
            $Where['t1.InvoiceName']=['like','%'.trim($UrlParam['InvoiceName']).'%'];
        }
        if(!empty($UrlParam['InvoiceMobile'])){
            $Where['t1.InvoiceMobile']=['like','%'.trim($UrlParam['InvoiceMobile']).'%'];
        }
        $List=$this->alias('t1')
            ->field('t1.*,t2.MemberName')
            ->join('__MEMBER__ t2','t1.InvoiceMemberID=t2.MemberID','left')
            ->where($Where)->order('t1.InvoiceID Desc')
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