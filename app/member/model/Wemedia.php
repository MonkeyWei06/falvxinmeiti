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
class Wemedia extends Model
{
    //媒体列表分页
    public function GetMediaList($UrlParam,$Where,$PageCount=20,$MemberInfo,$AgencyMemberID,$AgencySiteInfo,$pricelevel=1)
    {
        $Where = array_merge($UrlParam, $Where);
        $WhereArr = array();
		$WhereArror = array();		
        $OrderStr='';
        $arr = explode(',',@$UrlParam['where']);
        foreach ($arr as $key=>$val){
            if($val){
                $lsarr = explode('-',$val);
				//dump($lsarr);2019/5/15 星期三
                if($lsarr[0]!='MediaPrice'&&$lsarr[0]!='OrderWay'){
                    if($lsarr[1] != 0) $WhereArr[$lsarr[0]] = $lsarr[1];
                }else if($lsarr[0]=='MediaPrice'){
                    if($lsarr[1] != 0){
						 if($lsarr[1]==1){
							$WhereArr['MediaMemberPrice'.$pricelevel]=['<=',50];
						}else if($lsarr[1]==2){
							$WhereArr['MediaMemberPrice'.$pricelevel]=[['>=',51],['<=',200]];;
						}else if($lsarr[1]==3){
							$WhereArr['MediaMemberPrice'.$pricelevel]=[['>=',201],['<=',501]];;
						}else if($lsarr[1]==4){
							$WhereArr['MediaMemberPrice'.$pricelevel]=[['>',501],['<=',1000]];;
						}else if($lsarr[1]==5){
							$WhereArr['MediaMemberPrice'.$pricelevel]=[['>=',1001],['<=',2001]];;
						}else if($lsarr[1]==6){
							$WhereArr['MediaMemberPrice'.$pricelevel]=[['>',2001],['<=',5000]];;
						}else if($lsarr[1]==7){
							$WhereArr['MediaMemberPrice'.$pricelevel]=['>',5000];
						}
                    }
                }else if($lsarr[0]=='OrderWay'){
                    $Order=$lsarr[1];
                    if($Order==1){
                       $OrderStr=" M.MediaMemberPrice".$pricelevel." asc,M.Recommend desc";
                    }elseif($Order==11){
						$OrderStr=" M.MediaMemberPrice".$pricelevel." desc,M.Recommend desc";
					}elseif($Order==2){
						$OrderStr=" M.fans_num asc,M.Recommend desc";
					}elseif($Order==21){
						$OrderStr=" M.fans_num desc,M.Recommend desc";
					}
                }else{
					$OrderStr=" M.Recommend desc,M.MediaID asc";
				}
				if(!empty($Where['MediaWebNameID'])) $WhereArr['M.MediaWebNameID']=$lsarr[1];
				if(!empty($Where['MediaIndustryID'])) $WhereArr['M.MediaIndustryID']=$lsarr[1];

				if(!empty($Where['MediaCityID'])) $WhereArr['M.MediaCityID']=$lsarr[1];

				if(!empty($Where['fans_num'])) $WhereArr['M.fans_num']=$lsarr[1];
				if(!empty($Where['read_num'])) $Where['M.read_num']=$lsarr[1];
				if(!empty($Where['account_auth'])) $WhereArr['M.account_auth']=$lsarr[1];
            }
        }
		//dump($WhereArr);
		if (!empty($Where['media_name'])) $WhereArr['M.MediaTitle'] = ['like','%'.trim($Where['media_name']).'%'];
		//if (!empty($Where['MediaContent'])) $WhereArr['M.MediaContent'] = ['like','%'.trim($Where['MediaContent']).'%'];
		if (!empty($Where['MediaContent'])) $WhereArror['M.MediaContent'] = ['like','%'.trim($Where['MediaContent']).'%'];
		if (!empty($Where['yearstate'])) $WhereArr['M.yearstate'] =1;
        $WhereArr['M.MediaState'] = 1;
		
		if(empty($OrderStr)){
			$OrderStr=" M.Recommend desc,M.MediaID asc";
		}
        if(!empty($UrlParam['collect']) && $UrlParam['collect']=='list'){
            
			$WhereArr['W6.CollectMemberID']=$MemberInfo['MemberID'];
            $WhereArr['W6.CollectAgencyDomainID']=$AgencySiteInfo['MemberID'];		
			$WhereArr['W6.ctype']=2;
			$List = $this
                ->field('M.*,W2.TypeName as TypeName2,W3.TypeName as TypeName3,W4.TypeName as TypeName4')
                ->alias('M')
                ->where($WhereArr)
				->order($OrderStr)
				->join('__WHOLETYPE__ W2','M.MediaWebNameID=W2.TypeID','left')
                ->join('__WHOLETYPE__ W3','M.MediaIndustryID=W3.TypeID','left')
				->join('__CITYTYPE__ W4','M.MediaCityID=W4.TypeID','left')
				->join('collect W6', 'W6.CollectGoodsID=M.MediaID', 'left')//收藏
                ->paginate(20, false, [
                    'query' => $UrlParam,
                ]);
        }elseif(!empty($UrlParam['collect']) && $UrlParam['collect']=='todayjia'){

            $List = $this
                ->field('M.*,W2.TypeName as TypeName2,W3.TypeName as TypeName3,W4.TypeName as TypeName4')
                ->alias('M')
                ->where($WhereArr)
				->whereTime('M.MediaTime','>','-1 days')
                ->order($OrderStr)
                ->join('__WHOLETYPE__ W2','M.MediaWebNameID=W2.TypeID','left')
                ->join('__WHOLETYPE__ W3','M.MediaIndustryID=W3.TypeID','left')
				->join('__CITYTYPE__ W4','M.MediaCityID=W4.TypeID','left')
				->join('collect W6', 'W6.CollectGoodsID=M.MediaID', 'left')//收藏
                ->paginate(20, false, [
                    'query' => $UrlParam,
                ]);
            //echo db()->getLastSql();
        }else{

            $List = $this
                ->field('M.*,W2.TypeName as TypeName2,W3.TypeName as TypeName3,W4.TypeName as TypeName4')
                ->alias('M')
                ->where($WhereArr)
				->whereor($WhereArror)
				->order($OrderStr)
                ->join('__WHOLETYPE__ W2','M.MediaWebNameID=W2.TypeID','left')
                ->join('__WHOLETYPE__ W3','M.MediaIndustryID=W3.TypeID','left')
				->join('__CITYTYPE__ W4','M.MediaCityID=W4.TypeID','left')
                ->paginate($PageCount, false, [
                    'query' => $UrlParam
                ]);
        }
        if (!empty($List)) {
            foreach ($List as $key=>$val)
            {
				if($val['TypeName4']==''){
                   $List[$key]['TypeName4']='综合全国';
                }
				$List[$key]['TypeName5']=ArrayCheck($val['fans_num'],'FanNum');
				$List[$key]['TypeName6']=ArrayCheck($val['read_num'],'ReadNum');
                //价格及选择！
                $pic = controller('common/Common')->weprice($MemberInfo['MemberID'],$val['MediaID']);
                $List[$key]['check'] = '<div class="bai" pic="'.$pic.'" id="'.$val['MediaID'].'" name="'.$val['MediaTitle'].'" onclick="checka('.$val['MediaID'].')" pic="'.$pic.'"></div>';
                $List[$key]['price'] = $pic;

                //入口链接
                $InLink='';
                if(!empty($val['MediaInUrl'])){
                    $InLink='<a href=\''.$val['MediaInUrl'].'\' target=\'_blank\' class=\'tips\' data-tips=\'入口仅供参考\' style=\'color:red;font-size:12px\' title="提示:入口仅供参考,不代表一定是此入口或者一定有入口">（入口）</a>';
                }

				//$List[$key]['MediaTitle'] = $val['MediaTitle'].$InLink;

				 $List[$key]['MediaTitle'] = '<span class=\'media_name_url\'><a style=\'color:#438eb9\' href=\''.$val['MediaCaseUrl'].'\' target=\'_blank\'>'.$val['MediaTitle'].'</a>'.$InLink.'<div class="refresh_span">链接打不开?<a style="color:red" href="javascript:update_case_link('.$val['MediaID'].');">反馈</a></div></span>';

				if($val['Medialog']){
					$List[$key]['MediaTitle'].='<div class="info_pic am-hide-sm-only" style="background-image: url('.$val['Medialog'].')"></div>';
				}
				if($val['Recommend']==1){
					$List[$key]['MediaTitle'].='<span style="background: url(/static/assets/i/recommend.gif) center center no-repeat;padding:0 7px;"></span>';
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
		//dump($List);
		//die;
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
                $Moneyarr =  $str = controller('common/Common')->weallprice($Where['agency_id'],$Val['MediaID']);
                $List[$Key]['MediaMemberPrice1'] = $Moneyarr['price_one'];
                $List[$Key]['MediaMemberPrice2'] = $Moneyarr['price_two'];
                $List[$Key]['MediaMemberPrice3'] = $Moneyarr['price_three'];
                $List[$Key]['MediaMemberPrice4'] = $Moneyarr['price_four'];
                $List[$Key]['MediaTitle']='<a href="'.$Val['MediaCaseUrl'].'" target="_blank">'.$Val['MediaTitle'].'</a>
                <a href="'.$Val['MediaInUrl'].'" target="_blank" class="tips" data-tips="入口仅供参考" style="color:red;" title="提示:入口仅供参考,不代表一定是此入口或者一定有入口">入口</a>';
                $WebUrl=0;
                if($Val['MediaComputerWeightID']==89) $WebUrl=0;
                if($Val['MediaComputerWeightID']==90) $WebUrl=1;

                //$List[$Key]['dnqz'] = $WebUrl; //给数据集追加字段num并赋值
                $List[$Key]['dnqz']='<img src="'.config('MainDomain').'public/static/agency/images/baidu'.$WebUrl.'.png">';
                $MobileUrl=0;
                if($Val['MediaMobileWeightID']==100) $MobileUrl=0;
                if($Val['MediaMobileWeightID']==101) $MobileUrl=1;

                $List[$Key]['ydqz']='<img src="'.config('MainDomain').'public/static/agency/images/baidu'.$MobileUrl.'.png">';
            }
        }
        if (!empty($Where['name'])) $WhereArr['O.push_state'] = $Where['status'];//状态
        return $List;
    }
	
    //媒体列表全部
     public function GetWemediaListFull($UrlParam=array(),$Where=array(),$MemberId)
    {
		$this->AgencyMemberInfo=Db::name('member')->where('MemberID',$MemberId)->find();
		$pricelevelt=intval($this->AgencyMemberInfo['MemberPriceType']-115);
        $WhereArr = $Where;
        $Where = array_merge($UrlParam, $Where);
        $arr = explode(',',@$UrlParam['where']);
		$WhereArror = array();
         foreach ($arr as $key=>$val){
            if($val){
                $lsarr = explode('-',$val);
 				//die;
                if($lsarr[0]!='MediaPrice'&&$lsarr[0]!='OrderWay'){
                    if($lsarr[1] != 0) $WhereArr[$lsarr[0]] = $lsarr[1];
                }else if($lsarr[0]=='MediaPrice'){

					//var_dump($lsarr);
					//die;
                    if($lsarr[1] != 0){
						 if($lsarr[1]==1){
							$WhereArr['MediaMemberPrice'.$pricelevelt]=['<=',50];
						}else if($lsarr[1]==2){
							$WhereArr['MediaMemberPrice'.$pricelevelt]=[['>=',51],['<',200]];;
						}else if($lsarr[1]==3){
							$WhereArr['MediaMemberPrice'.$pricelevelt]=[['>=',201],['<',501]];;
						}else if($lsarr[1]==4){
							$WhereArr['MediaMemberPrice'.$pricelevelt]=[['>=',501],['<',1000]];;
						}else if($lsarr[1]==5){
							$WhereArr['MediaMemberPrice'.$pricelevelt]=[['>=',1001],['<',2001]];;
						}else if($lsarr[1]==6){
						 
							$WhereArr['MediaMemberPrice'.$pricelevelt]=[['>=',2001],['<',5000]];;
						}else if($lsarr[1]==7){
							$WhereArr['MediaMemberPrice'.$pricelevelt]=['>',5000];
						}
                    }
                }
            }
        }
 
        //echo $OrderStr;
        if (!empty($Where['media_name'])) $WhereArr['M.MediaTitle'] = ['like','%'.trim($Where['media_name']).'%'];
		if (!empty($Where['MediaContent'])) $WhereArror['M.MediaContent'] = ['like','%'.trim($Where['MediaContent']).'%'];
		//if(!empty($UrlParam['fennumid'])) $WhereArr['M.fans_num']=$UrlParam['fennumid'];
		if(!empty($UrlParam['MediaRedID'])) $WhereArr['M.read_num']=$UrlParam['MediaRedID'];
		if(!empty($UrlParam['auth'])) $WhereArr['M.account_auth']=$UrlParam['auth'];
        $WhereArr['M.MediaState'] = 1;
        //var_dump($WhereArr);return;
        if(!empty($UrlParam['collect']) && $UrlParam['collect']=='list') {
				$List = Db::name('wemedia')
				->field('M.*,W2.TypeName as TypeName2,W3.TypeName as TypeName3,W4.TypeName as TypeName4')
                ->alias('M')
                ->where($WhereArr)
				->whereor($WhereArror)
				 ->join('__WHOLETYPE__ W2','M.MediaWebNameID=W2.TypeID','left')
                ->join('__WHOLETYPE__ W3','M.MediaIndustryID=W3.TypeID','left')
				->join('__CITYTYPE__ W4','M.MediaCityID=W4.TypeID','left')
                ->order('M.MediaID Desc')
                ->select();
        }else{
            $List = Db::name('wemedia')
               ->field('M.*,W2.TypeName as TypeName2,W3.TypeName as TypeName3,W4.TypeName as TypeName4')
                ->alias('M')
                ->where($WhereArr)
				->whereor($WhereArror)
				->join('__WHOLETYPE__ W2','M.MediaWebNameID=W2.TypeID','left')
                ->join('__WHOLETYPE__ W3','M.MediaIndustryID=W3.TypeID','left')
				->join('__CITYTYPE__ W4','M.MediaCityID=W4.TypeID','left')
                ->order('M.MediaID Desc')
                ->select();
        }
       // echo Db::name('wemedia')->getLastSql();return;
		//die;
       // if(sizeof($List)>1000) return $List;
        if (!empty($List)) {
            //$MemberInfo['MemberPriceType']-=115;
            foreach ($List as $key=>$val)
            {

                $pic = controller('common/Common')->weprice($MemberId,$val['MediaID']);
                $List[$key]['check'] = '<div class="bai" pic="'.$pic.'" id="'.$val['MediaID'].'" name="'.$val['MediaTitle'].'" onclick="checka('.$val['MediaID'].')" pic="'.$pic.'"></div>';
                $List[$key]['price'] = $pic;

				 if(!empty($val['MediaWebNameID']))
                {
                    $TypeName=Db::name('wholetype')->where('TypeID',$val['MediaWebNameID'])->value('TypeName');
                    $List[$key]['MediaWebNameIDNew']=$TypeName;
                }else{
                    $List[$key]['MediaWebNameIDNew']='';
                }
                if(!empty($val['MediaIndustryID']))
                {
                    $TypeName=Db::name('wholetype')->where('TypeID',$val['MediaIndustryID'])->value('TypeName');
                    $List[$key]['MediaIndustryIDNew']=$TypeName;
                }else{
                    $List[$key]['MediaIndustryIDNew']='';
                }
                if(!empty($val['MediaCityID']))
                {
                    $TypeName=Db::name('citytype')->where('TypeID',$val['MediaCityID'])->value('TypeName');
                    $List[$key]['MediaCityIDNew']=$TypeName;
                }else{
                    $List[$key]['MediaCityIDNew']='';
                }
            }
        }
           
        return $List;
    }
	//查询会员自媒体资源
	public function GetMemberMediaList($UrlParam,$Where,$PageCount,$MemberID)
		{

			 $List = Db::name('wemedia')
                ->field('M.*,C.TypeName as city,W1.TypeName as pdlx,W2.TypeName as mtmc')
                ->alias('M')
                ->where('MediaMemberID','eq',$MemberID)
				->where($Where)
                ->join('citytype C', 'C.TypeID=M.MediaCityID', 'left')//所在区域
                ->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
                ->join('wholetype W2', 'W2.TypeID=M.MediaIndustryID', 'left')//媒体名称
                 ->join('collect W8', 'W8.CollectGoodsID=M.MediaID', 'left')//移动权重
                ->order('M.MediaID Desc')
                ->paginate($PageCount, false, ['query' => $UrlParam]);
 				return $List;
		}
}