<?php
/**
 *
 */
namespace Classes;

use think\Request;
use Classes\JsonService;

class UtilService
{
	/**
     * 是否为微信内部浏览器
     * @return bool
     */
    public static function isWechatBrowser()
    {
        return (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false);
    }

    /**
     * 身份证验证
     * @param $card
     * @return bool
     */
    public static function setCard($card){
        $city = [11=>"北京",12=>"天津",13=>"河北",14=>"山西",15=>"内蒙古",21=>"辽宁",22=>"吉林",23=>"黑龙江 ",31=>"上海",32=>"江苏",33=>"浙江",34=>"安徽",35=>"福建",36=>"江西",37=>"山东",41=>"河南",42=>"湖北 ",43=>"湖南",44=>"广东",45=>"广西",46=>"海南",50=>"重庆",51=>"四川",52=>"贵州",53=>"云南",54=>"西藏 ",61=>"陕西",62=>"甘肃",63=>"青海",64=>"宁夏",65=>"新疆",71=>"台湾",81=>"香港",82=>"澳门",91=>"国外 "];
        $tip = "";
        $match = "/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/";
        $pass= true;
        if(!$card || !preg_match($match,$card)){
            //身份证格式错误
            $pass = false;
        }else if(!$city[substr($card,0,2)]){
            //地址错误
            $pass = false;
        }else{
            //18位身份证需要验证最后一位校验位
            if(strlen($card) == 18){
                $card = str_split($card);
                //∑(ai×Wi)(mod 11)
                //加权因子
                $factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                //校验位
                $parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                $sum = 0;
                $ai = 0;
                $wi = 0;
                for ($i = 0; $i < 17; $i++)
                {
                    $ai = $card[$i];
                    $wi = $factor[$i];
                    $sum += $ai * $wi;
                }
                $last = $parity[$sum % 11];
                if($parity[$sum % 11] != $card[17]){
//                        $tip = "校验位错误";
                    $pass =false;
                }
            }else{
                $pass =false;
            }
        }
        if(!$pass) return false;/* 身份证格式错误*/
        return true;/* 身份证格式正确*/
    }
     
    /**
     * TODO 修改 https 和 http
     * @param $url $url 域名
     * @param int $type  0 返回https 1 返回 http
     * @return string
     */
    public static function setHttpType($url, $type = 0)
    {
        $domainTop = substr($url,0,5);
        if($type){ if($domainTop == 'https') $url = 'http'.substr($url,5,strlen($url)); }
        else{ if($domainTop != 'https') $url = 'https:'.substr($url,5,strlen($url)); }
        return $url;
    }
}