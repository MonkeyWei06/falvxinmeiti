<?php
/**
 *
 */
namespace Classes;

use think\Request;
use think\Config;
use think\Controller;
use think\Session;
use app\api\Model\Member as MemberModel;
class WxmsgService
{
	  /**
     * @param $params [参数]
     * @param $appid [小程序appid]
     * @param $secret [小程序secret]
     * @param $type [模板消息的类型] 如：审核，通知， 签到 。。。。
     */
    public function send($to_openid,$money,$ordernum,$time)
    {
		$list=array();
		$list=array(
			'touser'=>$to_openid,
			'template_id'=>'nJ_tnUirUIBOY_RnAn_fF8jtYR5hRMaF7_e-gitChJU',//'nJ_tnUirUIBOY_RnAn_fF8jtYR5hRMaF7_e-gitChJU',
			'page'=>'/pages/member/order/order',
			'data'=>[
					"thing1"=>[
						"value"=>'来新订单啦'//订单详情
					],
					"phrase2"=>[
						"value"=>'待审核'//订单状态
					],
					"amount3"=>[
						"value"=>$money//订单金额
					],
					"character_string6"=>[

						"value"=>$ordernum//订单号
					],
					"time8"=> [
						"value"=>$time//订单时间
					],
				]
			);
		$url = "https://api.weixin.qq.com/cgi-bin/token?";
		// 参数
		$params['appid']= config('appid');
		$params['secret']= config('secret');
		$params['grant_type']= 'client_credential';
		// 微信API返回的access_token 和 expires_in 有效时间
		$arr = httpCurl($url,$params, 'POST');
		$arr = json_decode($arr,true);
		$access_token=$arr['access_token'];
		$urls = 'https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token='.$access_token;
		//dump(json_encode($list));
        $ret =$this->httpCurl($urls,json_encode($list),'POST');
 		$ret = json_decode($ret,true);
        return $ret;
    }
	public function httpCurl($url, $params, $method = 'GET', $header = array(), $multi = false){
        date_default_timezone_set('PRC');
        $opts = array(
            CURLOPT_TIMEOUT        => 30,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false,
            CURLOPT_HTTPHEADER     => $header,
            CURLOPT_COOKIESESSION  => true,
            CURLOPT_FOLLOWLOCATION => 1,
            CURLOPT_COOKIE
            =>session_name().'='.session_id(),
        );
        /* 根据请求类型设置特定参数 */
        switch(strtoupper($method)){
        case 'GET':
         $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
        // 链接后拼接参数  &  非？
			$opts[CURLOPT_URL] = $url;
			break;
		case 'POST'://判断是否传输文件
			//$params = $multi ? $params : http_build_query($params);                
			$opts[CURLOPT_URL] = $url;                
			$opts[CURLOPT_POST] = 1;
			$opts[CURLOPT_POSTFIELDS] = $params;                
			break;
		default:
			throw new Exception('不支持的请求方式！');
        }
        /* 初始化并执行curl请求 */
        $ch = curl_init();
        curl_setopt_array($ch, $opts);
        $data  = curl_exec($ch);
        $error = curl_error($ch);
        curl_close($ch);
        if($error) throw new Exception('请求发生错误：' . $error);
        return  $data;
    }
}