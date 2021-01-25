<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/24
 * Time: 11:31
 */
namespace app\admin\model;
use think\Model;
class Videomedia extends Model
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
		
        if(!empty($UrlParam['Platformtype'])){
            $Where['t1.Platformtype']=$UrlParam['Platformtype'];
        }
        if(!empty($UrlParam['classification'])){
            $Where['t1.classification']=$UrlParam['classification'];
        }
        if(isset($UrlParam['Coverage']) && intval($UrlParam['Coverage'])>0 ){
            $Where['t1.Coverage']=$UrlParam['Coverage'];
        }
        if(!empty($UrlParam['keyword'])){
          $Where['t1.MediaTitle|M.MemberMobile|M.MemberWeiXin']=array('like','%'.$UrlParam['keyword'].'%');
			 
        }
		if(!empty($UrlParam['MediaState'])){
            $Where['t1.MediaState']=$UrlParam['MediaState'];
        }
        $List=$this->alias('t1')
            ->field('t1.*,t2.TypeName as TypeName2,t3.TypeName as TypeName3,t4.TypeName as TypeName4,M.MemberPicPath,M.MemberMobile,M.MemberWeiXin')
            ->join('__WHOLETYPE__ t2','t1.Platformtype=t2.TypeID','left')
            ->join('__WHOLETYPE__ t3','t1.classification=t3.TypeID','left')
            ->join('__CITYTYPE__ t4','t1.Coverage=t4.TypeID','left')
			->join('__MEMBER__ M','t1.MediaMemberID=M.MemberID','left')			
            ->where($Where)->order('t1.Recommend Desc,t1.MediaState desc,t1.MediaID Desc')
            ->paginate($PageCount,false,['query'  => $UrlParam]);
		//die;
        return $List;
    }
}