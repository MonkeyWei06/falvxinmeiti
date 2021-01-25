<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 15:56
 */
namespace app\agency_admin\model;
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
    public function GetAgencyInvoiceList($UrlParam,$Where,$PageCount)
    {
        $WhereArr=array();
        if(!empty($UrlParam['keyword'])){
            $WhereArr['InvoiceTitle']=['like','%'.trim($UrlParam['keyword']).'%'];
        }
        if(!empty($UrlParam['InvoiceType'])){
            $WhereArr['InvoiceType']=['like','%'.trim($UrlParam['InvoiceType']).'%'];
        }
        if(!empty($UrlParam['InvoiceDetail'])){
            $WhereArr['InvoiceDetail']=['like','%'.trim($UrlParam['InvoiceDetail']).'%'];
        }
        $WhereArr=array_merge($WhereArr,$Where);
        $List=$this
            ->where($WhereArr)->order('InvoiceID Desc')
            ->paginate($PageCount,false,['query'  => $UrlParam]);
        return $List;
    }
    public function getInvoiceTypeAttr($Val)
    {
        $TypeName=\think\Db::name('wholetype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('InvoiceType');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back['New'];
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
        return $Back['New'];
    }
    public function getInvoiceStateAttr($Val)
    {
        $Arr=array();
        $Arr[]='申请中';
        $Arr[]='申请失败';
        $Arr[]='已寄出';
        $Back=array();
        $Back['New']=$Arr[$Val];
        return $Back['New'];
    }
}