<?php
namespace app\common\controller;
use think\Controller;
use think\Session;
use think\Db;
//业务
class Common extends Controller {
	public function price($MemberID,$MediaID) {
		//个人信息
		$MemberInfo = Db::name('member')->field('MemberPriceType,MemberRecommendID')->where('MemberID',$MemberID)->find();
		//媒体信息
		$MediaInfo = Db::name('media')->where('MediaID',$MediaID)->find();
		//父级代理
		$daili1 = Db::name('member')
		            ->field('MemberPriceType,MemberRecommendID,MemberID')
		            ->where('MemberID',$MemberInfo['MemberRecommendID'])
		            ->find();
		//父父级代理
		$daili2 = '';
		if($daili1) {
			$daili2 = Db::name('member')
			                ->field('MemberPriceType,MemberID')
			                ->where('MemberID',$daili1['MemberRecommendID'])
			                ->find();
		}
		$Money = 0;
		//价格信息
		$pricearr = ['price_one','price_two','price_three','price_four'];
		//父父级代理存在就取出父父级别的价格
		if($daili2) {
			$Money += $MediaInfo['MediaMemberPrice'.($daili2['MemberPriceType']-115)];
			//父父级增加价格
			$home_price = Db::name('home_price')
			                ->where('member_id',$daili2['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			//父级价格
			$Money+=$home_price?$home_price[$pricearr[$daili1['MemberPriceType']-116]]:0;
			//父级增加价格
			$home_price = Db::name('home_price')
			                ->where('member_id',$daili1['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$home_price?$home_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} elseif($daili1){
			//父级存在
			$Money += $MediaInfo['MediaMemberPrice'.($daili1['MemberPriceType']-115)];
			//父级增加价格
			$home_price = Db::name('home_price')
			                ->where('member_id',$daili1['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$home_price?$home_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} else {
			$Money += $MediaInfo['MediaMemberPrice'.($MemberInfo['MemberPriceType']-115)];
		}
		return $Money;
	}
	public function allprice($MemberID,$MediaID) {
		//$MemberID代理的memberid
		//价格信息
		$pricearr = ['price_one','price_two','price_three','price_four'];
		//当前代理信息
		$MemberInfo = Db::name('member')->field('MemberPriceType,MemberRecommendID')->where('MemberID',$MemberID)->find();
		//当前媒体信息
		$MediaInfo = Db::name('media')->where('MediaID',$MediaID)->find();
		//父级代理
		$FMemberInfo = Db::name('member') ->field('MemberPriceType,MemberRecommendID,MemberID') ->where('MemberID',$MemberInfo['MemberRecommendID'])->find();
		if($FMemberInfo) {
			//有父级，表明其是二级，那么他的父级就可以直接使用媒体价格
			$Money = $MediaInfo['MediaMemberPrice'.($FMemberInfo['MemberPriceType']-115)];
			//父级增加价格
			$home_price = Db::name('home_price')
			                ->where('member_id',$FMemberInfo['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$home_price?$home_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} else {
			//没有父级，就表明其是一级。
			$Money = $MediaInfo['MediaMemberPrice'.($MemberInfo['MemberPriceType']-115)];
		}
		$home_price = Db::name('home_price')
		            ->where('member_id',$MemberID)
		            ->where('price_start','<=',$Money)
		            ->where('price_end','>=',$Money)
		            ->where('price_state',1)
		            ->find();
		$Moneyarr = [
		            'price_one'=>$home_price?$home_price[$pricearr[0]]+$Money:$Money
		            ,'price_two'=>$home_price?$home_price[$pricearr[1]]+$Money:$Money
		            ,'price_three'=>$home_price?$home_price[$pricearr[2]]+$Money:$Money
		            ,'price_four'=>$home_price?$home_price[$pricearr[3]]+$Money:$Money
		        ];
		return $Moneyarr;
	}
	public function alipay($order_num,$Money,$config) {
		// 调用手机端支付宝支付
		//商户订单号，商户网站订单系统中唯一订单号，必填
		$out_trade_no = $order_num;
		//订单名称，必填
		$subject = '在线支付';
		//付款金额，必填
		$total_amount = $Money;
		//构造参数
		$payRequestBuilder = new \alipaypc\lib\AlipayTradePagePayContentBuilder();
		//$payRequestBuilder->setBody($subject);
		$payRequestBuilder->setSubject($subject);
		$payRequestBuilder->setTotalAmount($total_amount);
		$payRequestBuilder->setOutTradeNo($out_trade_no);
		$aop = new \alipaypc\lib\AlipayTradeService($config);
		/**
         * pagePay 电脑网站支付请求
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @param $return_url 同步跳转地址，公网可以访问
         * @param $notify_url 异步通知地址，公网可以访问
         * @return $response 支付宝返回的信息
         */
		$response=$aop->pagePay($payRequestBuilder,$config['return_url'],$config['notify_url']);
		var_dump($response);
		exit;
	}
	public function alipaywan() {
		$Param=input('post.');
		$OrderNumber=input('post.out_trade_no');
		if (!empty($OrderNumber)) {
			$config=require_once EXTEND_PATH.'/alipay/lib/config.php';
			$alipaySevice = new \alipay\lib\AlipayTradeWapService($config);
			$result = $alipaySevice->check($Param);
			if($result) {
				$Info = Db::name('balance')->where('BalanceNumber',$OrderNumber)->find();
				if($Info) {
					$MemberInfo = Db::name('member')->where('MemberID',$Info['BalanceMemberID'])->find();
					if($MemberInfo) {
						$MemberBalanceCount = $MemberInfo['MemberTypeID'] == 1?'MemberBalanceCount':'MemberAgentBalanceCount';
						Db::name('member')->where('MemberID',$MemberInfo['MemberID'])->setInc($MemberBalanceCount,$Info['BalanceCount']);
						//增加抽奖次数
						if($MemberInfo['MemberTypeID']==1) {
							$result=intval($Info['BalanceCount']/1000);
						} else {
							$result=intval($Info['BalanceCount']/2000);
						}
						Db::name('member')->where('MemberID',$MemberInfo['MemberID'])->setInc('drawcount',$result);
						/*======增加抽奖次数===============*/
						Db::name('balance')->where('BalanceNumber',$OrderNumber)->update(['BalanceState'=>1]);
					}
				}
				echo "success";
			}
		}
		echo "fail";
	}
	public function GetCurrentDomainInfo() {
		$Host=$this->request->host();
		//dump($Host);
		 if($Host=='www.agent.com' || $Host=='localhost'|| $Host=='127.0.0.1'){
			$SiteInfo=array();
			$SiteInfo['MemberID']='-1';
			$SiteInfo['Domain']='-1';
			$SiteInfo['MemberRecommendID']='-1';
			$Config=array();
			$Config=Db::name('config')->where(['ID'=>'1','MemberID'=>'-1'])->find();
			//echo "<br>".Db::name('config')->getLastSql();
			//die;
		} else {
			$HostArr=explode('.',$Host);
			$TwoDomain=empty($HostArr)?'':$HostArr[0];
			$Where=array();
			if($HostArr[0]=='www' && $HostArr[1]!='agent') {
				$Where['oneDomain']=$Host;
			} elseif($HostArr[0]!='www' && $HostArr[1]=='agent') {
				$Where['Domain']=$TwoDomain;
			} else {
				echo '<script type="text/javascript">alert("请不要非法操作");history.back();</script>';
				exit;
			}
			$Where['GroupID']=2;
			$SiteInfo=Db::name('member')->field('AgentAuditState,MemberID,MemberTypeID,MemberInviteCode,MemberRecommendID,MemberRecommendPath,MemberCompanyName,MemberName,MemberPriceType,MemberTrueName,MemberMobile,MemberEmail,MemberBalanceCount,MemberAgentBalanceCount,MemberAddress,MemberQQ,MemberWeiXin,MemberPicPath,MemberState,Domain,oneDomain')->where($Where)->find();
			//echo "<br>".Db::name('member')->getLastSql();
			//die;
			if(empty($SiteInfo)) {
				echo '<script type="text/javascript">alert("请不要非法操作");history.back();</script>';
				exit;
			}
			if($SiteInfo['MemberState']==0) {
				echo '<script type="text/javascript">alert("网站被禁用");history.back();</script>';
				exit;
			}
			if($SiteInfo['AgentAuditState']!=1) {
				echo '<script type="text/javascript">alert("网站未通过审核");history.back();</script>';
				exit;
			}
			//if(empty($SiteInfo)) $this->redirect(config('MainDomain'));
			session('AgencySiteInfo',$SiteInfo);
			//dump($this->AgencySiteInfo['MemberPriceType']);//116 游客价格 铜牌；117 大侠价格 银牌；118 掌门价格 金牌；119 盟主价格 钻石
			//获取会员配置信息
			$Config=Db::name('config')->where(['MemberID'=>$SiteInfo['MemberID']])->find();
			if(!empty($Config['WebSiteCopyright'])) $Config['WebSiteCopyright']=str_replace("\n",'<br>',$Config['WebSiteCopyright']);
			if(!empty($Config['WebSiteWXWBContent'])) $Config['WebSiteWXWBContent']=str_replace("\n",'<br>',$Config['WebSiteWXWBContent']);
			if(!empty($Config['WebSiteLogo'])) $Config['WebSiteLogo']=$Config['WebSiteLogo'];
		}
		$Back=array();
		$Back['SiteInfo']=$SiteInfo;
		$Back['Config']=$Config;
		//dump($Back);
		return $Back;
	}
	//退款
	public function Refund($ID,$order_state,$fabu_site,$fabu_content) {
		$Info = Db::name('agencyorder')->where('agencyorder_id',$ID)->where('media_type','1')->find();
		$data = [];
		$data['order_state'] = $order_state;

		if($Info['order_state']==4 || $Info['order_state'] == 3) $this->error('订单已不可更改');

		if(!empty($fabu_site)) $data['fabu_site'] = $fabu_site;
		if(!empty($fabu_content)) $data['fabu_content'] = $fabu_content;
		//if($data['order_state']==2) $data['release_time'] = time();

		Db::name('agencyorder')->where('agencyorder_id',$ID)->where('media_type','1')->update($data);

		if($data['order_state'] == 4 || $data['order_state'] == 3 ) {

			$articleinfo = Db::name('article')->where('article_id',$Info['article_id'])->find();

			$resulttrue=Db::name('balance')->where('BalanceNumber',$Info['order_number'])->where('BalanceGroup','3')->where('BalanceMemberID',$articleinfo['member_id'])->find();

			if(!$resulttrue){
				//$articleinfo = Db::name('article')->where('article_id',$Info['article_id'])->find();
				$mediainfo = Db::name('media')->where('MediaID',$Info['media_id'])->find();
				$MemberTypeID=db('member')->where('MemberID',$articleinfo['member_id'])->value('MemberTypeID');

				if($MemberTypeID==1) {
					//普通会员
					if($Info['order_money']>0) {
						// 启动事务
						Db::startTrans();
						try{
							$result=Db::name('member')->where('MemberID',$articleinfo['member_id'])->setInc('MemberBalanceCount',$Info['order_money']);
							$data = [];
							$data['BalanceMemberID'] = $articleinfo['member_id'];
							$data['BalanceNumber'] = $Info['order_number'];
							$data['BalanceTitle'] = '订单退款';
							$data['BalanceType'] = 1;
							$data['BalanceCount'] = $Info['order_money'];
							$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID',$articleinfo['member_id'])->value('MemberBalanceCount');
							$data['BalanceGroup'] = 3;
							$data['BalancePayState'] = 1;
							$data['BalanceState'] = 1;
							$data['BalanceTime'] = time();
							Db::name('balance')->insert($data);
							if($mediainfo['UserType']==2){
								$returndata=Db::name('Member')->where('MemberID',$mediainfo['MediaMemberID'])->setDec('MemberProfit',$mediainfo['MediaWebPrice']);
								$xj = Db::name('Member')->where('MemberID',$mediainfo['MediaMemberID'])->value('MemberProfit');
								$data['BalanceMemberID'] = $mediainfo['MediaMemberID'];
								$data['BalanceNumber'] = $Info['order_number'];
								$data['BalanceType'] = 1;
								$data['BalanceCount'] = $mediainfo['MediaWebPrice'];
								$data['BalanceCurrentCount'] = $xj;
								$data['BalanceTime'] = time();
								$data['BalanceGroup'] = '5';
								$data['BalanceState'] = '1';
								$data['BalanceTitle'] = '媒体退稿';
								$resultdd=Db::name('balance')->insert($data);
							}

							if($result !== false){
								// 提交事务
								Db::commit();
							}
						} catch (\Exception $e) {
							// 回滚事务
							Db::rollback();
						}					
					}
				}elseif($MemberTypeID==3) {
					if($Info['order_money1']>0) {
						Db::startTrans();
						try{
							$result=Db::name('member')->where('MemberID', $Info['agency_id1'])->setInc('MemberAgentBalanceCount', $Info['order_money1']);
							$data = [];
							$data['BalanceMemberID'] = $Info['agency_id1'];
							$data['BalanceNumber'] = $Info['order_number'];
							$data['BalanceTitle'] = '订单退款';
							$data['BalanceType'] = 1;
							$data['BalanceCount'] = $Info['order_money1'];
							$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID', $Info['agency_id1'])->value('MemberAgentBalanceCount');
							$data['BalanceGroup'] = 3;
							$data['BalancePayState'] = 1;
							$data['BalanceState'] = 1;
							$data['BalanceTime'] = time();
							Db::name('balance')->insert($data);
							if($result !== false){
								// 提交事务
								Db::commit();
							}
						} catch (\Exception $e) {
							// 回滚事务
							Db::rollback();
						}

					}
				}
			}
		}
	}
	public function weprice($MemberID,$MediaID) {
		//个人信息
		$MemberInfo = Db::name('member')->field('MemberPriceType,MemberRecommendID')->where('MemberID',$MemberID)->find();
		//媒体信息
		$MediaInfo = Db::name('wemedia')->where('MediaID',$MediaID)->find();
		//父级代理
		$daili1 = Db::name('member')
		            ->field('MemberPriceType,MemberRecommendID,MemberID')
		            ->where('MemberID',$MemberInfo['MemberRecommendID'])
		            ->find();
		//父父级代理
		$daili2 = '';
		if($daili1) {
			$daili2 = Db::name('member')
			                ->field('MemberPriceType,MemberID')
			                ->where('MemberID',$daili1['MemberRecommendID'])
			                ->find();
		}
		$Money = 0;
		//价格信息
		$pricearr = ['price_one','price_two','price_three','price_four'];
		//父父级代理存在就取出父父级别的价格
		if($daili2) {
			$Money += $MediaInfo['MediaMemberPrice'.($daili2['MemberPriceType']-115)];
			//父父级增加价格
			$home_price = Db::name('home_price')
			                ->where('member_id',$daili2['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			//父级价格
			$Money+=$home_price?$home_price[$pricearr[$daili1['MemberPriceType']-116]]:0;
			//父级增加价格
			$home_price = Db::name('home_price')
			                ->where('member_id',$daili1['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$home_price?$home_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} elseif($daili1) {
			//父级存在
			$Money += $MediaInfo['MediaMemberPrice'.($daili1['MemberPriceType']-115)];
			//父级增加价格
			$home_price = Db::name('home_price')
			                ->where('member_id',$daili1['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$home_price?$home_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} else {
			$Money += $MediaInfo['MediaMemberPrice'.($MemberInfo['MemberPriceType']-115)];
		}
		return $Money;
	}
	public function weallprice($MemberID,$MediaID) {
		//$MemberID代理的memberid
		//价格信息
		$pricearr = ['price_one','price_two','price_three','price_four'];
		//当前代理信息
		$MemberInfo = Db::name('member')->field('MemberPriceType,MemberRecommendID')->where('MemberID',$MemberID)->find();
		//当前媒体信息
		$MediaInfo = Db::name('wemedia')->where('MediaID',$MediaID)->find();
		//父级代理
		$FMemberInfo = Db::name('member') ->field('MemberPriceType,MemberRecommendID,MemberID') ->where('MemberID',$MemberInfo['MemberRecommendID'])->find();
		if($FMemberInfo) {
			//有父级，表明其是二级，那么他的父级就可以直接使用媒体价格
			$Money = $MediaInfo['MediaMemberPrice'.($FMemberInfo['MemberPriceType']-115)];
			//父级增加价格
			$home_price = Db::name('home_price')
			                ->where('member_id',$FMemberInfo['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$home_price?$home_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} else {
			//没有父级，就表明其是一级。
			$Money = $MediaInfo['MediaMemberPrice'.($MemberInfo['MemberPriceType']-115)];
		}
		$home_price = Db::name('home_price')
		            ->where('member_id',$MemberID)
		            ->where('price_start','<=',$Money)
		            ->where('price_end','>=',$Money)
		            ->where('price_state',1)
		            ->find();
		$Moneyarr = [
		            'price_one'=>$home_price?$home_price[$pricearr[0]]+$Money:$Money
		            ,'price_two'=>$home_price?$home_price[$pricearr[1]]+$Money:$Money
		            ,'price_three'=>$home_price?$home_price[$pricearr[2]]+$Money:$Money
		            ,'price_four'=>$home_price?$home_price[$pricearr[3]]+$Money:$Money
		        ];
		return $Moneyarr;
	}
	/**************************************************************/
	//视频自媒体价格获取
	public function VideoPrice($MemberID,$MediaID,$Release) {
		//个人信息
		$MemberInfo = Db::name('member')->field('MemberPriceType,MemberRecommendID')->where('MemberID',$MemberID)->find();
		//媒体信息
		$MediaInfo = Db::name('videomedia')->where('MediaID',$MediaID)->find();
		
		//父级代理
		$daili1 = Db::name('member')
		            ->field('MemberPriceType,MemberRecommendID,MemberID')
		            ->where('MemberID',$MemberInfo['MemberRecommendID'])
		            ->find();
		//父父级代理
		$daili2 = '';
		if($daili1) {
			$daili2 = Db::name('member')
			                ->field('MemberPriceType,MemberID')
			                ->where('MemberID',$daili1['MemberRecommendID'])
			                ->find();
		}
		$Money = 0;
		//价格信息
		$pricearr = ['price_one','price_two','price_three','price_four'];
		//父父级代理存在就取出父父级别的价格
		if($daili2) {

			if($Release==1){
				$Money += $MediaInfo['MediaMemberPrice'.($daili2['MemberPriceType']-115)];
			}elseif($Release==2){
				$Money += $MediaInfo['VideoWebPrice'.($daili2['MemberPriceType']-115)];
			}elseif($Release==3){
				$Money += $MediaInfo['LiveWebPrice'.($daili2['MemberPriceType']-115)];
			}
			
			//父父级增加价格
			$video_price = Db::name('video_price')
			                ->where('member_id',$daili2['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			//父级价格
			$Money+=$video_price?$video_price[$pricearr[$daili1['MemberPriceType']-116]]:0;
			//父级增加价格
			$video_price = Db::name('video_price')
			                ->where('member_id',$daili1['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$video_price?$video_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} elseif($daili1) {
			//父级存在
 			if($Release==1){
				$Money += $MediaInfo['MediaMemberPrice'.($daili1['MemberPriceType']-115)];
			}elseif($Release==2){
				$Money += $MediaInfo['VideoWebPrice'.($daili1['MemberPriceType']-115)];
			}elseif($Release==3){
				$Money += $MediaInfo['LiveWebPrice'.($daili1['MemberPriceType']-115)];
			}
			//父级增加价格
			$video_price = Db::name('video_price')
			                ->where('member_id',$daili1['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$video_price?$video_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} else {
			if($Release==1){
				$Money += $MediaInfo['MediaMemberPrice'.($MemberInfo['MemberPriceType']-115)];
			}elseif($Release==2){
				$Money += $MediaInfo['VideoWebPrice'.($MemberInfo['MemberPriceType']-115)];
			}elseif($Release==3){
				$Money += $MediaInfo['LiveWebPrice'.($MemberInfo['MemberPriceType']-115)];
			}
		}
		return $Money;
	}
	public function videoallprice($MemberID,$MediaID) {
		//$MemberID代理的memberid
		//价格信息
		$pricearr = ['price_one','price_two','price_three','price_four'];
		//当前代理信息
		$MemberInfo = Db::name('member')->field('MemberPriceType,MemberRecommendID')->where('MemberID',$MemberID)->find();
		//当前媒体信息
		$MediaInfo = Db::name('videomedia')->where('MediaID',$MediaID)->find();
		//父级代理
		$FMemberInfo = Db::name('member') ->field('MemberPriceType,MemberRecommendID,MemberID') ->where('MemberID',$MemberInfo['MemberRecommendID'])->find();
		if($FMemberInfo) {
			//有父级，表明其是二级，那么他的父级就可以直接使用媒体价格
			$Money = $MediaInfo['MediaMemberPrice'.($FMemberInfo['MemberPriceType']-115)];
			//父级增加价格
			$video_price = Db::name('video_price')
			                ->where('member_id',$FMemberInfo['MemberID'])
			                ->where('price_start','<=',$Money)
			                ->where('price_end','>=',$Money)
			                ->where('price_state',1)
			                ->find();
			$Money+=$video_price?$video_price[$pricearr[$MemberInfo['MemberPriceType']-116]]:0;
		} else {
			//没有父级，就表明其是一级。
			$Money = $MediaInfo['MediaMemberPrice'.($MemberInfo['MemberPriceType']-115)];
		}
		$video_price = Db::name('video_price')
		            ->where('member_id',$MemberID)
		            ->where('price_start','<=',$Money)
		            ->where('price_end','>=',$Money)
		            ->where('price_state',1)
		            ->find();
		$Moneyarr = [
		            'price_one'=>$video_price?$video_price[$pricearr[0]]+$Money:$Money
		            ,'price_two'=>$video_price?$video_price[$pricearr[1]]+$Money:$Money
		            ,'price_three'=>$video_price?$video_price[$pricearr[2]]+$Money:$Money
		            ,'price_four'=>$video_price?$video_price[$pricearr[3]]+$Money:$Money
		        ];
		return $Moneyarr;
	}
	/*****************************************************************************/
	//自媒体退款
	public function WeRefund($ID,$order_state,$fabu_site,$fabu_content) {
		$Info = Db::name('agencyorder')->where('agencyorder_id',$ID)->where('media_type','2')->find();
		$data = [];
		$data['order_state'] = $order_state;
		if(!empty($fabu_site)) $data['fabu_site'] = $fabu_site;
		if(!empty($fabu_content)) $data['fabu_content'] = $fabu_content;
		//if($data['order_state']==2) $data['release_time'] = time();
		if($Info['order_state']==4 || $Info['order_state'] == 3) $this->error('订单已不可更改');
		Db::name('agencyorder')->where('agencyorder_id',$ID)->where('media_type','2')->update($data);
		if($data['order_state'] == 4 || $data['order_state'] == 3 ) {
			$articleinfo = Db::name('wearticle')->where('article_id',$Info['article_id'])->find();
			$resulttrue=Db::name('balance')->where('BalanceNumber',$Info['order_number'])->where('BalanceGroup','3')->where('BalanceMemberID',$articleinfo['member_id'])->find();

			if(!$resulttrue){
				$mediainfo = Db::name('wemedia')->where('MediaID',$Info['media_id'])->find();
				$MemberTypeID=db('member')->where('MemberID',$articleinfo['member_id'])->value('MemberTypeID');
				if($MemberTypeID==1) {
					//普通会员
					if($Info['order_money']>0) {
						// 启动事务
						Db::startTrans();
						try{
							$result=Db::name('member')->where('MemberID',$articleinfo['member_id'])->setInc('MemberBalanceCount',$Info['order_money']);
							$data = [];
							$data['BalanceMemberID'] = $articleinfo['member_id'];
							$data['BalanceNumber'] = $Info['order_number'];
							$data['BalanceTitle'] = '订单退款';
							$data['BalanceType'] = 1;
							$data['BalanceCount'] = $Info['order_money'];
							$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID',$articleinfo['member_id'])->value('MemberBalanceCount');
							$data['BalanceGroup'] = 3;
							$data['BalancePayState'] = 1;
							$data['BalanceState'] = 1;
							$data['BalanceTime'] = time();
							Db::name('balance')->insert($data);
							if($mediainfo['UserType']==2){
								$returndata=Db::name('Member')->where('MemberID',$mediainfo['MediaMemberID'])->setDec('MemberProfit',$mediainfo['MediaWebPrice']);
								$xj = Db::name('Member')->where('MemberID',$mediainfo['MediaMemberID'])->value('MemberProfit');
								$data['BalanceMemberID'] = $mediainfo['MediaMemberID'];
								$data['BalanceNumber'] = $Info['order_number'];
								$data['BalanceType'] = 1;
								$data['BalanceCount'] = $mediainfo['MediaWebPrice'];
								$data['BalanceCurrentCount'] = $xj;
								$data['BalanceTime'] = time();
								$data['BalanceGroup'] = '5';
								$data['BalanceState'] = '1';
								$data['BalanceTitle'] = '媒体退稿';
								$resultdd=Db::name('balance')->insert($data);
							}
							if($result !== false){
								// 提交事务
								Db::commit();
							}
						} catch (\Exception $e) {
							// 回滚事务
							Db::rollback();
						}
					}
				}elseif($MemberTypeID==3) {
					//一级代理
					if($Info['order_money1']>0) {
						Db::startTrans();
						try{
							$result=Db::name('member')->where('MemberID', $Info['agency_id1'])->setInc('MemberAgentBalanceCount', $Info['order_money1']);
							$data = [];
							$data['BalanceMemberID'] = $Info['agency_id1'];
							$data['BalanceNumber'] = $Info['order_number'];
							$data['BalanceTitle'] = '订单退款';
							$data['BalanceType'] = 1;
							$data['BalanceCount'] = $Info['order_money1'];
							$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID', $Info['agency_id1'])->value('MemberAgentBalanceCount');
							$data['BalanceGroup'] = 3;
							$data['BalancePayState'] = 1;
							$data['BalanceState'] = 1;
							$data['BalanceTime'] = time();
							Db::name('balance')->insert($data);
							if($result !== false){
								// 提交事务
								Db::commit();
							}
						} catch (\Exception $e) {
							// 回滚事务
							Db::rollback();
						}
					}
				}
			}
		}
	}
	//*******************************************************************************
	//视频自媒体退款
	public function VRefund($ID,$order_state,$fabu_site,$fabu_content) {
		$Info = Db::name('agencyorder')->where('agencyorder_id',$ID)->where('media_type','3')->find();
		$data = [];
		$data['order_state'] = $order_state;
		if(!empty($fabu_site)) $data['fabu_site'] = $fabu_site;
		if(!empty($fabu_content)) $data['fabu_content'] = $fabu_content;
		if($data['order_state']==2) $data['release_time'] = time();
		if($Info['order_state']==4 || $Info['order_state'] == 3) $this->error('订单已不可更改');
		Db::name('agencyorder')->where('agencyorder_id',$ID)->where('media_type','3')->update($data);		 
		if($data['order_state'] == 4 || $data['order_state'] == 3 ) {

			$articleinfo = Db::name('article')->where('article_id',$Info['article_id'])->find();
			$resulttrue=Db::name('balance')->where('BalanceNumber',$Info['order_number'])->where('BalanceGroup','3')->where('BalanceMemberID',$articleinfo['member_id'])->find();
			if(!$resulttrue){
				$MemberTypeID=db('member')->where('MemberID',$articleinfo['member_id'])->value('MemberTypeID');
				if($MemberTypeID==1) {
					//普通会员
					if($Info['order_money']>0) {
						Db::name('member')->where('MemberID',$articleinfo['member_id'])->setInc('MemberBalanceCount',$Info['order_money']);
						$data = [];
						$data['BalanceMemberID'] = $articleinfo['member_id'];
						$data['BalanceNumber'] = $Info['order_number'];
						$data['BalanceTitle'] = '订单退款';
						$data['BalanceType'] = 1;
						$data['BalanceCount'] = $Info['order_money'];
						$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID',$articleinfo['member_id'])->value('MemberBalanceCount');
						$data['BalanceGroup'] = 3;
						$data['BalancePayState'] = 1;
						$data['BalanceState'] = 1;
						$data['BalanceTime'] = time();
						Db::name('balance')->insert($data);
					}
					//一级代理
					if($Info['order_money1']>0) {
						Db::name('member')->where('MemberID', $Info['agency_id1'])->setInc('MemberAgentBalanceCount', $Info['order_money1']);
						$data = [];
						$data['BalanceMemberID'] = $Info['agency_id1'];
						$data['BalanceNumber'] = $Info['order_number'];
						$data['BalanceTitle'] = '订单退款';
						$data['BalanceType'] = 1;
						$data['BalanceCount'] = $Info['order_money1'];
						$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID', $Info['agency_id1'])->value('MemberAgentBalanceCount');
						$data['BalanceGroup'] = 3;
						$data['BalancePayState'] = 1;
						$data['BalanceState'] = 1;
						$data['BalanceTime'] = time();
						Db::name('balance')->insert($data);
					}
					//二级代理
					if($Info['order_money2']>0) {
						Db::name('member')->where('MemberID', $Info['agency_id'])->setInc('MemberAgentBalanceCount', $Info['order_money2']);
						$data = [];
						$data['BalanceMemberID'] = $Info['agency_id'];
						$data['BalanceNumber'] = $Info['order_number'];
						$data['BalanceTitle'] = '订单退款';
						$data['BalanceType'] = 1;
						$data['BalanceCount'] = $Info['order_money2'];
						$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID', $Info['agency_id'])->value('MemberAgentBalanceCount');
						$data['BalanceGroup'] = 3;
						$data['BalancePayState'] = 1;
						$data['BalanceState'] = 1;
						$data['BalanceTime'] = time();
						Db::name('balance')->insert($data);
					}
					//dump($data);exit();
				} elseif($MemberTypeID==2) {
					//二级代理
					//一级代理
					if($Info['order_money1']>0) {
						Db::name('member')->where('MemberID', $Info['agency_id1'])->setInc('MemberAgentBalanceCount', $Info['order_money1']);
						$data = [];
						$data['BalanceMemberID'] = $Info['agency_id1'];
						$data['BalanceNumber'] = $Info['order_number'];
						$data['BalanceTitle'] = '订单退款';
						$data['BalanceType'] = 1;
						$data['BalanceCount'] = $Info['order_money1'];
						$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID', $Info['agency_id1'])->value('MemberAgentBalanceCount');
						$data['BalanceGroup'] = 3;
						$data['BalancePayState'] = 1;
						$data['BalanceState'] = 1;
						$data['BalanceTime'] = time();
						Db::name('balance')->insert($data);
					}
					//二级代理
					if($Info['order_money2']>0) {
						Db::name('member')->where('MemberID', $Info['agency_id'])->setInc('MemberAgentBalanceCount', $Info['order_money2']);
						$data = [];
						$data['BalanceMemberID'] = $Info['agency_id'];
						$data['BalanceNumber'] = $Info['order_number'];
						$data['BalanceTitle'] = '订单退款';
						$data['BalanceType'] = 1;
						$data['BalanceCount'] = $Info['order_money2'];
						$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID', $Info['agency_id'])->value('MemberAgentBalanceCount');
						$data['BalanceGroup'] = 3;
						$data['BalancePayState'] = 1;
						$data['BalanceState'] = 1;
						$data['BalanceTime'] = time();
						Db::name('balance')->insert($data);
					}
				} elseif($MemberTypeID==3) {
					//一级代理
					//一级代理
					if($Info['order_money1']>0) {
						Db::name('member')->where('MemberID', $Info['agency_id1'])->setInc('MemberAgentBalanceCount', $Info['order_money1']);
						$data = [];
						$data['BalanceMemberID'] = $Info['agency_id1'];
						$data['BalanceNumber'] = $Info['order_number'];
						$data['BalanceTitle'] = '订单退款';
						$data['BalanceType'] = 1;
						$data['BalanceCount'] = $Info['order_money1'];
						$data['BalanceCurrentCount'] = Db::name('member')->where('MemberID', $Info['agency_id1'])->value('MemberAgentBalanceCount');
						$data['BalanceGroup'] = 3;
						$data['BalancePayState'] = 1;
						$data['BalanceState'] = 1;
						$data['BalanceTime'] = time();
						Db::name('balance')->insert($data);
					}
				}
			}
		}
	}
}