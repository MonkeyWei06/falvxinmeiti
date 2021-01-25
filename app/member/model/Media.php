<?php
/**
 * Created by PhpStorm.
 * User: Memberistrator
 * Date: 2018/1/4
 * Time: 10:54
 */
namespace app\member\model;
use think\Model;
use think\Db;
class Media extends Model
{
    //媒体列表分页
    public function GetMediaList($UrlParam,$Where,$PageCount=20,$MemberInfo,$AgencyMemberID,$AgencySiteInfo,$pricelevel=1)
    {
        $Where = array_merge($UrlParam, $Where);
        $WhereArr = array();
		$WhereArror=array();
        $OrderStr='';
        $arr = explode(',',@$UrlParam['where']);
        foreach ($arr as $key=>$val){
            if($val){
                $lsarr = explode('_',$val);
                if($lsarr[0]!='MediaPrice'&&$lsarr[0]!='OrderWay'){
                    if($lsarr[1] != 0) $WhereArr[$lsarr[0]] = $lsarr[1];
                }else if($lsarr[0]=='MediaPrice'){
                    if($lsarr[1] != 0){
                        if($lsarr[1]==1){
                                $WhereArr['MediaMemberPrice'.$pricelevel]=['<=',50];
                        }else if($lsarr[1]==2){
                                $WhereArr['MediaMemberPrice'.$pricelevel]=[['<=',100],['>',50]];
                        }else if($lsarr[1]==3){
                                $WhereArr['MediaMemberPrice'.$pricelevel]=[['<=',200],['>',100]];
                        }else if($lsarr[1]==4){
                                $WhereArr['MediaMemberPrice'.$pricelevel]=['>',200];
                        }
                    }
                }else if($lsarr[0]=='OrderWay'){
                    $Order=$lsarr[1];
                    if($Order==1){
                       $OrderStr=" M.MediaMemberPrice".$pricelevel." asc,M.Recommend desc";
                    }elseif($Order==11){
						$OrderStr=" M.MediaMemberPrice".$pricelevel." desc,M.Recommend desc";
					}elseif($Order==2){
						$OrderStr=" M.MediaPlatformCGL asc,M.Recommend desc";
					}elseif($Order==21){
						$OrderStr=" M.MediaPlatformCGL desc,M.Recommend desc";
					}elseif($Order==3){
						$OrderStr=" M.MediaComputerWeightID asc,M.Recommend desc";
					}elseif($Order==31){
						$OrderStr=" M.MediaComputerWeightID desc,M.Recommend desc";
					}elseif($Order==4){
						$OrderStr=" M.MediaMobileWeightID asc,M.Recommend desc";
					}elseif($Order==41){
						$OrderStr=" M.MediaMobileWeightID desc,M.Recommend desc";
					}
                }else{
					$OrderStr=" M.Recommend desc,M.MediaID asc";
				}
            }
        }

		if(!$OrderStr || empty($OrderStr)){
			$OrderStr=" M.Recommend desc,M.MediaID asc";
		}
		//echo $OrderStr;
        if (!empty($Where['media_name'])) $WhereArr['M.MediaTitle'] = ['like','%'.trim($Where['media_name']).'%'];
		//if (!empty($Where['MediaContent'])) $WhereArr['M.MediaContent'] = ['like','%'.trim($Where['MediaContent']).'%'];
		if (!empty($Where['MediaContent'])) $WhereArror['M.MediaContent'] = ['like','%'.trim($Where['MediaContent']).'%'];
		if (!empty($Where['yearstate'])) $WhereArr['M.yearstate'] =1;
        $WhereArr['M.MediaState'] = 1;
        if(!empty($UrlParam['collect']) && $UrlParam['collect']=='list'){
            //$WhereArr['W6.CollectMemberID']=$AgencyMemberID;
            $WhereArr['W6.CollectMemberID']=$MemberInfo['MemberID'];
            $WhereArr['W6.CollectAgencyDomainID']=$AgencySiteInfo['MemberID'];
			$WhereArr['W6.ctype']=1;
            $List = $this
                ->field('M.*,W1.TypeName as pdlx,W2.TypeName as mtmc,W3.TypeName as xwy,W4.TypeName as dnqz,W5.TypeName as ydqz')
                ->alias('M')
                ->where($WhereArr)
                ->order($OrderStr)
                //->join('citytype C', 'C.TypeID=A.MediaCityID', 'left')//所在区域
                ->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
                ->join('wholetype W2', 'W2.TypeID=M.MediaIndustryID', 'left')//媒体名称
                ->join('wholetype W3', 'W3.TypeID=M.MediaNewsSourceID', 'left')//新闻源
                ->join('wholetype W4', 'W4.TypeID=M.MediaComputerWeightID', 'left')//电脑权重
                ->join('wholetype W5', 'W5.TypeID=M.MediaMobileWeightID', 'left')//移动权重
                ->join('collect W6', 'W6.CollectGoodsID=M.MediaID', 'left')//收藏
                ->paginate(20, false, [
                    'query' => $UrlParam,
                ]);
            //echo db()->getLastSql();
        }elseif(!empty($UrlParam['collect']) && $UrlParam['collect']=='todayjia'){
            $List = $this
                ->field('M.*,W1.TypeName as pdlx,W2.TypeName as mtmc,W3.TypeName as xwy,W4.TypeName as dnqz,W5.TypeName as ydqz')
                ->alias('M')
                ->where($WhereArr)
				->whereTime('MediaTime','>','-1 days')
                ->order($OrderStr)
                ->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
                ->join('wholetype W2', 'W2.TypeID=M.MediaIndustryID', 'left')//媒体名称
                ->join('wholetype W3', 'W3.TypeID=M.MediaNewsSourceID', 'left')//新闻源
                ->join('wholetype W4', 'W4.TypeID=M.MediaComputerWeightID', 'left')//电脑权重
                ->join('wholetype W5', 'W5.TypeID=M.MediaMobileWeightID', 'left')//移动权重
                ->paginate(20, false, [
                    'query' => $UrlParam,
                ]);
            //echo db()->getLastSql();
        }else{
            $List = $this
                ->field('M.*,W1.TypeName as pdlx,W2.TypeName as mtmc,W3.TypeName as xwy,W4.TypeName as dnqz,W5.TypeName as ydqz,W6.TypeName as link_type')
                ->alias('M')
                ->where($WhereArr)
                ->order($OrderStr)
				->whereor($WhereArror)
				//->join('citytype C', 'C.TypeID=A.MediaCityID', 'left')//所在区域
                ->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
                ->join('wholetype W2', 'W2.TypeID=M.MediaIndustryID', 'left')//媒体名称
                ->join('wholetype W3', 'W3.TypeID=M.MediaNewsSourceID', 'left')//新闻源
                ->join('wholetype W4', 'W4.TypeID=M.MediaComputerWeightID', 'left')//电脑权重
                ->join('wholetype W5', 'W5.TypeID=M.MediaMobileWeightID', 'left')//移动权重
                ->join('wholetype W6', 'W6.TypeID=M.MediaUrlTypeID', 'left')//连接类型
                ->paginate($PageCount, false, [
                    'query' => $UrlParam
                ]);
        }
        if (!empty($List)) {
            foreach ($List as $key=>$val)
            {
                $List[$key]['dnqz']='<div class=\'qzbg\'>'.($List[$key]['dnqz']?$List[$key]['dnqz']:0).'</div>';
                $List[$key]['ydqz']='<div class=\'qzbg\'>'.($List[$key]['ydqz']?$List[$key]['ydqz']:0).'</div>';
                //出稿率
				 if ($List[$key]['UserType']<=2){

                     $Count1=Db::name('agencyorder')->where('media_id',$val['MediaID'])->count();
                     $Count2=Db::name('agencyorder')->where(['media_id'=>$val['MediaID'],'order_state'=>2])->count();
                     $List[$key]['cgl']=empty($Count2)? '100%' : round($Count2/$Count1*100,2).'%';
                 }else {
					 $List[$key]['cgl']=$val['MediaPlatformCGL'].'%';
					}


                //价格及选择！
                $pic = controller('common/Common')->price($MemberInfo['MemberID'],$val['MediaID']);
                $List[$key]['check'] = '<div class="bai" pic="'.$pic.'" id="'.$val['MediaID'].'" name="'.$val['MediaTitle'].'" onclick="checka('.$val['MediaID'].')" pic="'.$pic.'"></div>';
                $List[$key]['price'] = $pic;
                //入口链接
                $InLink='';
                if(!empty($val['MediaInUrl'])){
                    $InLink='<a href=\''.$val['MediaInUrl'].'\' target=\'_blank\' class=\'tips\' data-tips=\'入口仅供参考\' style=\'color:red;font-size:12px\' title="提示:入口仅供参考,不代表一定是此入口或者一定有入口">（入口）</a>';
                }
                $List[$key]['MediaTitle'] = '<span class=\'media_name_url\' style=\'text-align: left;\'><a style=\'color:#438eb9\' href=\''.$val['MediaCaseUrl'].'\' target=\'_blank\'>'.$val['MediaTitle'].'</a>'.$InLink.'<div class="refresh_span">链接打不开?<a style="color:red" href="javascript:update_case_link('.$val['MediaID'].');">反馈</a></div></span>';
				if($val['Recommend']==1){
					$List[$key]['MediaTitle'].='<span style="background: url(/static/assets/i/recommend.gif) center center no-repeat;padding:0 10px;"></span>';
				}
                //收藏
                $WhereArr=array();
                $WhereArr['CollectMemberID']=$MemberInfo['MemberID'];
                $WhereArr['CollectAgencyDomainID']=$AgencySiteInfo['MemberID'];
                $WhereArr['CollectGoodsID']=$val['MediaID'];
                $State=db('collect')->where($WhereArr)->find();
                if($State){
                    $List[$key]['mediaid_checks']='<a class=\'Media'.$val['MediaID'].' ClassStyle2\' onclick=\'CollectMedia('.$val['MediaID'].')\' ></a>';
                }else{
                    $List[$key]['mediaid_checks']='<a class=\'Media'.$val['MediaID'].' ClassStyle1\' onclick=\'CollectMedia('.$val['MediaID'].')\' ></a>';
                }
            }
        }
        return $List;
    }
    //媒体列表分页,前台查询，含全部价格
    public function GetMediaList2($UrlParam,$Where,$PageCount)
    {
        $Where = array_merge($UrlParam, $Where);
        $WhereArr = array();
        if(!empty($Where['media_name']))$WhereArr['A.MediaTitle']=['like','%'.trim($Where['media_name']).'%'];//状态
        $List = $this
            ->alias('A')//订单表
            ->field('A.*,W1.TypeName as pdlx,W2.TypeName as mtmc,W3.TypeName as xwy,W4.TypeName as rkjb,W5.TypeName as ljlx,C.TypeName as city')
            ->where($WhereArr)
            ->join('wholetype W1', 'W1.TypeID=A.MediaWebNameID', 'left')//频道类型
            ->join('wholetype W2', 'W2.TypeID=A.MediaIndustryID', 'left')//媒体类型
            ->join('wholetype W3', 'W3.TypeID=A.MediaNewsSourceID', 'left')//新闻源
            ->join('wholetype W4', 'W4.TypeID=A.MediaInLevelID', 'left')//入口级别
            ->join('wholetype W5', 'W5.TypeID=A.MediaUrlTypeID', 'left')//连接类型
            ->join('citytype C', 'C.TypeID=A.MediaCityID', 'left')//所在区域
            ->order('A.MediaID Desc')
            ->paginate($PageCount, false, ['query' => $UrlParam]);
        if (!empty($List)) {
            foreach ($List as $Key => $Val) {
//                $List[$Key]['order_time']=date("m-d H:i",$Val['order_time']);
                $ordercount = Db::name('agencyorder')->where('media_id',$Val['MediaID'])->count();
                $Ycount =  Db::name('agencyorder')->where('media_id',$Val['MediaID'])->where('order_state',1)->count();
                if(!$Ycount || !$ordercount)
                {
                    $List[$Key]['cgl'] = '100%';
                }else{
                    $List[$Key]['cgl']=round($Ycount*100/$ordercount,2).'%';
                }
                $Moneyarr =  $str = controller('common/Common')->allprice($Where['agency_id'],$Val['MediaID']);
                $List[$Key]['MediaMemberPrice1'] = $Moneyarr['price_one'];
                $List[$Key]['MediaMemberPrice2'] = $Moneyarr['price_two'];
                $List[$Key]['MediaMemberPrice3'] = $Moneyarr['price_three'];
                $List[$Key]['MediaMemberPrice4'] = $Moneyarr['price_four'];
                $List[$Key]['MediaTitle']='<a href="'.$Val['MediaCaseUrl'].'" target="_blank">'.$Val['MediaTitle'].'</a>
                <a href="'.$Val['MediaInUrl'].'" target="_blank" class="tips" data-tips="入口仅供参考" style="color:red;" title="提示:入口仅供参考,不代表一定是此入口或者一定有入口">入口</a>';
                $WebUrl=0;
                if($Val['MediaComputerWeightID']==89) $WebUrl=0;
                if($Val['MediaComputerWeightID']==90) $WebUrl=1;
                if($Val['MediaComputerWeightID']==91) $WebUrl=2;
                if($Val['MediaComputerWeightID']==92) $WebUrl=3;
                if($Val['MediaComputerWeightID']==93) $WebUrl=4;
                if($Val['MediaComputerWeightID']==94) $WebUrl=5;
                if($Val['MediaComputerWeightID']==95) $WebUrl=6;
                if($Val['MediaComputerWeightID']==96) $WebUrl=7;
                if($Val['MediaComputerWeightID']==97) $WebUrl=8;
                if($Val['MediaComputerWeightID']==98) $WebUrl=9;
                //$List[$Key]['dnqz'] = $WebUrl; //给数据集追加字段num并赋值
                $List[$Key]['dnqz']='<img src="'.config('MainDomain').'public/static/agency/images/baidu'.$WebUrl.'.png">';
                $MobileUrl=0;
                if($Val['MediaMobileWeightID']==100) $MobileUrl=0;
                if($Val['MediaMobileWeightID']==101) $MobileUrl=1;
                if($Val['MediaMobileWeightID']==102) $MobileUrl=2;
                if($Val['MediaMobileWeightID']==103) $MobileUrl=3;
                if($Val['MediaMobileWeightID']==104) $MobileUrl=4;
                if($Val['MediaMobileWeightID']==105) $MobileUrl=5;
                if($Val['MediaMobileWeightID']==106) $MobileUrl=6;
                if($Val['MediaMobileWeightID']==107) $MobileUrl=7;
                if($Val['MediaMobileWeightID']==108) $MobileUrl=8;
                if($Val['MediaMobileWeightID']==109) $MobileUrl=9;
                $List[$Key]['ydqz']='<img src="'.config('MainDomain').'public/static/agency/images/baidu'.$MobileUrl.'.png">';
            }
        }
        if (!empty($Where['name'])) $WhereArr['O.push_state'] = $Where['status'];//状态
        return $List;
    }
    //媒体列表全部
     public function GetMediaListFull($UrlParam=array(),$Where=array(),$MemberId,$Agencyid)
    {
        $WhereArr = $Where;
		$pricelevel=1;
        $Where = array_merge($UrlParam, $Where);
        $arr = explode(',',@$UrlParam['where']);
		$WhereArror=array();
		  foreach ($arr as $key=>$val){
            if($val){
                $lsarr = explode('_',$val);
                if($lsarr[0]!='MediaPrice'){
                    if($lsarr[1] != 0) $WhereArr[$lsarr[0]] = $lsarr[1];
                }else if($lsarr[0]=='MediaPrice'){
                    if($lsarr[1] != 0){
                        if($lsarr[1]==1){
                                $WhereArr['MediaMemberPrice'.$pricelevel]=['<=',50];
                        }else if($lsarr[1]==2){
                                $WhereArr['MediaMemberPrice'.$pricelevel]=[['<=',100],['>',50]];
                            }else if($lsarr[1]==3){
                                $WhereArr['MediaMemberPrice'.$pricelevel]=[['<=',200],['>',100]];
                            }else if($lsarr[1]==4){
                                $WhereArr['MediaMemberPrice'.$pricelevel]=['>',200];
                        }
                    }
                }
            }
        }
        if (!empty($Where['media_name'])) $WhereArr['M.MediaTitle'] = ['like','%'.trim($Where['media_name']).'%'];
		if (!empty($Where['MediaContent'])) $WhereArror['M.MediaContent'] = ['like','%'.trim($Where['MediaContent']).'%'];
        $WhereArr['M.MediaState'] = 1;
       // var_dump($WhereArr);return;
		//die;
        if(!empty($UrlParam['collect']) && $UrlParam['collect']=='list') {
            $WhereArr['W8.CollectMemberID']=$MemberId;
            $WhereArr['W8.CollectAgencyDomainID']=$Agencyid;
            $List = Db::name('media')
                ->field('M.*,C.TypeName as city,W1.TypeName as pdlx,W2.TypeName as mtmc,W3.TypeName as xwy,W4.TypeName as dnqz,W5.TypeName as ydqz,W6.TypeName as ljlx,W7.TypeName as rkjb')
                ->alias('M')
                ->where($WhereArr)
				->whereor($WhereArror)
                ->join('citytype C', 'C.TypeID=M.MediaCityID', 'left')//所在区域
                ->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
                ->join('wholetype W2', 'W2.TypeID=M.MediaIndustryID', 'left')//媒体名称
                ->join('wholetype W3', 'W3.TypeID=M.MediaNewsSourceID', 'left')//新闻源
                ->join('wholetype W4', 'W4.TypeID=M.MediaComputerWeightID', 'left')//电脑权重
                ->join('wholetype W5', 'W5.TypeID=M.MediaMobileWeightID', 'left')//移动权重
                ->join('wholetype W6', 'W6.TypeID=M.MediaUrlTypeID', 'left')//连接类型
                ->join('wholetype W7', 'W7.TypeID=M.MediaInLevelID', 'left')//入口级别
                ->join('collect W8', 'W8.CollectGoodsID=M.MediaID', 'left')//移动权重
                ->order('M.MediaID Desc')
                ->select();
        }else{
            $List = Db::name('media')
                ->field('M.*,C.TypeName as city,W1.TypeName as pdlx,W2.TypeName as mtmc,W3.TypeName as xwy,W4.TypeName as dnqz,W5.TypeName as ydqz,W6.TypeName as ljlx,W7.TypeName as rkjb')
                ->alias('M')
                ->where($WhereArr)
				->whereor($WhereArror)
                ->join('citytype C', 'C.TypeID=M.MediaCityID', 'left')//所在区域
                ->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
                ->join('wholetype W2', 'W2.TypeID=M.MediaIndustryID', 'left')//媒体名称
                ->join('wholetype W3', 'W3.TypeID=M.MediaNewsSourceID', 'left')//新闻源
                ->join('wholetype W4', 'W4.TypeID=M.MediaComputerWeightID', 'left')//电脑权重
                ->join('wholetype W5', 'W5.TypeID=M.MediaMobileWeightID', 'left')//移动权重
                ->join('wholetype W6', 'W6.TypeID=M.MediaUrlTypeID', 'left')//连接类型
                ->join('wholetype W7', 'W7.TypeID=M.MediaInLevelID', 'left')//入口级别
                ->order('M.MediaID Desc')
                ->select();
        }
        if(sizeof($List)>1000) return $List;
        if (!empty($List)) {
            foreach ($List as $key=>$val)
            {
                $ordercount = Db::name('agencyorder')->where('media_id',$val['MediaID'])->count();
                $Ycount =  Db::name('agencyorder')->where('media_id',$val['MediaID'])->where('order_state',1)->count();
                if(!$Ycount || !$ordercount)
                {
                    $List[$key]['cgl'] = '100%';
                }else{
                    $List[$key]['cgl']=round($Ycount*100/$ordercount,2).'%';
                }
                $pic = controller('common/Common')->price($MemberId,$val['MediaID']);
                $List[$key]['check'] = '<div class="bai" pic="'.$pic.'" id="'.$val['MediaID'].'" name="'.$val['MediaTitle'].'" onclick="checka('.$val['MediaID'].')" pic="'.$pic.'"></div>';
                $List[$key]['price'] = $pic;
            }
        }
        return $List;
    }
	//查询会员媒体资源
	public function GetMemberMediaList($UrlParam,$Where,$PageCount,$MemberID)
		{

			 $List = Db::name('media')
                ->field('M.*,C.TypeName as city,W1.TypeName as pdlx,W2.TypeName as mtmc,W3.TypeName as xwy,W4.TypeName as dnqz,W5.TypeName as ydqz,W6.TypeName as ljlx,W7.TypeName as rkjb,W9.TypeName as tshy')
                ->alias('M')
                ->where('MediaMemberID','eq',$MemberID)
				->where($Where)
                ->join('citytype C', 'C.TypeID=M.MediaCityID', 'left')//所在区域
                ->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
                ->join('wholetype W2', 'W2.TypeID=M.MediaIndustryID', 'left')//媒体名称
                ->join('wholetype W3', 'W3.TypeID=M.MediaNewsSourceID', 'left')//新闻源
                ->join('wholetype W4', 'W4.TypeID=M.MediaComputerWeightID', 'left')//电脑权重
                ->join('wholetype W5', 'W5.TypeID=M.MediaMobileWeightID', 'left')//移动权重
                ->join('wholetype W6', 'W6.TypeID=M.MediaUrlTypeID', 'left')//连接类型
                ->join('wholetype W7', 'W7.TypeID=M.MediaInLevelID', 'left')//入口级别
				->join('wholetype W9', 'W9.TypeID=M.MediaSpecialIndustryID', 'left')//入口级别
                ->join('collect W8', 'W8.CollectGoodsID=M.MediaID', 'left')//移动权重
                ->order('M.MediaID Desc')
                ->paginate($PageCount, false, ['query' => $UrlParam]);
 				return $List;
		}
}