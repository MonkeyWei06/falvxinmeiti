<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class Wemedia extends Model
{
    protected $resultSetType = 'collection';// 查询数据集对象
    // 是否需要自动写入时间戳 如果设置为字符串 则表示时间字段的类型
    protected $autoWriteTimestamp = true;
    // 创建时间字段
    protected $createTime = 'MediaTime';
    // 更新时间字段
    protected $updateTime = false;
    // 时间字段取出后的默认时间格式
    //protected $dateFormat = 'Y-m-d H:i:s';
    //商品品牌列表
    public function GetList($UrlParam,$PageCount)
    {
        $Where=array();
        if(!empty($UrlParam['MediaWebNameID'])){
            $Where['t1.MediaWebNameID']=$UrlParam['MediaWebNameID'];
        }
        if(!empty($UrlParam['MediaIndustryID'])){
            $Where['t1.MediaIndustryID']=$UrlParam['MediaIndustryID'];
        }
        if(!empty($UrlParam['MediaCityID'])){
            $Where['t1.MediaCityID']=$UrlParam['MediaCityID'];
        }
        if(!empty($UrlParam['keyword'])){
            $Where['t1.MediaTitle']=array('like','%'.$UrlParam['keyword'].'%');
        }
		if(!empty($UrlParam['UserType'])){
            $Where['t1.UserType']=$UrlParam['UserType'];
        }
		if(!empty($UrlParam['MediaState'])){
            $Where['t1.MediaState']=$UrlParam['MediaState'];
        }
        $List=$this->alias('t1')
            ->field('t1.*')
            ->join('__WHOLETYPE__ t2','t1.MediaWebNameID=t2.TypeID','left')
            ->join('__WHOLETYPE__ t3','t1.MediaIndustryID=t3.TypeID','left')
            ->join('__CITYTYPE__ t4','t1.MediaCityID=t4.TypeID','left')
            ->where($Where)->order('t1.UserType asc,t1.MediaID Desc')
            ->paginate($PageCount,false,['query'  => $UrlParam]);
        return $List;
    }
    public function getMediaWebNameIDAttr($Val)
    {
        $TypeName=\think\Db::name('wholetype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaWebNameID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaIndustryIDAttr($Val)
    {
        $TypeName=\think\Db::name('wholetype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaIndustryID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaCityIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaCityID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaInLevelIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaInLevelID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaUrlTypeIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaUrlTypeID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaSpeedIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaSpeedID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaNewsSourceIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaNewsSourceID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaCanSendIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaCanSendID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaSpecialIndustryIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaSpecialIndustryID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaSituationIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaSituationID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaComputerWeightIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaComputerWeightID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
    public function getMediaMobileWeightIDAttr($Val)
    {
        $TypeName=\think\Db::name('citytype')->where('TypeID',$Val)->value('TypeName');
        $Back=array();
        $Back['Old']=$this->getData('MediaMobileWeightID');
        $Back['New']=empty($TypeName)?'--':$TypeName;
        return $Back;
    }
}