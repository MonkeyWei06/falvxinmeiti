<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author:  <1227187938@qq.com>
// +----------------------------------------------------------------------
// 应用公共文件
//快递编号查询
use sendmsg\SendUtility;
use think\Log;
function ExpressNumberSearch($ExpressName,$ExpressNumber)
{
    $AppKey=config('config.KuaiDi100ApiKey');//请将XXXXXX替换成您在http://kuaidi100.com/app/reg.html申请到的KEY
    //$url ='http://api.kuaidi100.com/api?id='.$AppKey.'&com='.$typeCom.'&nu='.$typeNu.'&show=2&muti=1&order=asc';
    $url= 'http://www.kuaidi100.com/applyurl?key='.$AppKey.'&com='.$ExpressName.'&nu='.$ExpressNumber;//生成完整的请求URL
    //请勿删除变量$powered 的信息，否者本站将不再为你提供快递接口服务。
    //$powered = '查询数据由：<a href="http://kuaidi100.com" target="_blank">KuaiDi100.Com （快递100）</a> 网站提供 ';
    //优先使用curl模式发送数据
    if (function_exists('curl_init') == 1){
        $curl = curl_init();
        curl_setopt ($curl, CURLOPT_URL, $url);
        curl_setopt ($curl, CURLOPT_HEADER,0);
        curl_setopt ($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt ($curl, CURLOPT_USERAGENT,$_SERVER['HTTP_USER_AGENT']);
        curl_setopt ($curl, CURLOPT_TIMEOUT,5);
        $get_content = curl_exec($curl);
        curl_close ($curl);
    }else{
        import('common/Snoopy', EXTEND_PATH);
        $snoopy=new Snoopy();
        $snoopy->referer ='http://www.baicu.com/';
        $snoopy->fetch($url);
        $get_content = $snoopy->results;
   }
    return '<iframe src="'.$get_content.'" width="580"height="340" marginheight="0" marginwidth="0" frameborder="0" scrolling="0" vspace="0" hspace="0"></iframe>';
}
/**
 * 字符串截取，支持中文和其他编码
 * static
 * access public
 * @param string $str 需要转换的字符串
 * @param string $start 开始位置
 * @param string $length 截取长度
 * @param string $charset 编码格式
 * @param string $suffix 截断显示字符
 * return string
 */
function msubstr($str,$start=0,$length,$charset="utf-8",$suffix=true){
    if(function_exists("mb_substr"))
        $slice=mb_substr($str,$start,$length,$charset);
    elseif(function_exists('iconv_substr')){
        $slice = iconv_substr($str,$start,$length,$charset);
        if(false===$slice){$slice = '';}
    }else{
        $re['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $re['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        $slice = join("",array_slice($match[0], $start, $length));
    }
    return $suffix ? $slice.'.' : $slice;
}
//支付宝支付接口调用
function AliPayApiCall($OrderNumber,$PayMoney)
{
    $SystemParam=include APP_PATH.'extra/systemparam.php';
    $alipay_config=include APP_PATH.'common/org/alipay/alipay.config.php';
    include APP_PATH.'common/org/alipay/lib/alipay_submit.class.php';
    /**************************请求参数**************************/
    //支付类型
    $payment_type = "1";
    //必填，不能修改
    //服务器异步通知页面路径
    $notify_url = config('DomainName').url('payrequest/alipay_notify');
    //需http://格式的完整路径，不能加?id=123这类自定义参数
    //页面跳转同步通知页面路径
    $return_url = config('DomainName').url('payrequest/done',['ordernumber'=>$OrderNumber]);
    //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
    //商户订单号
    $out_trade_no = $OrderNumber;
    //商户网站订单系统中唯一订单号，必填
    //订单名称
    $subject = '在线支付';
    //必填
    //付款金额
    $total_fee = $PayMoney;
    //必填
    //订单描述
    $body = '';
    //商品展示地址
    $show_url = '';
    //需以http://开头的完整路径，例如：http://www.商户网址.com/myorder.html
    //防钓鱼时间戳
    $anti_phishing_key = "";
    //若要使用请调用类文件submit中的query_timestamp函数
    //客户端的IP地址
    $exter_invoke_ip = "";
    //非局域网的外网IP地址，如：221.0.0.1
    /************************************************************/
//构造要请求的参数数组，无需改动
    $parameter = array(
        "service" => "create_direct_pay_by_user",
        "partner" => trim($alipay_config['partner']),
        "seller_email" => trim($alipay_config['seller_email']),
        "payment_type"	=> $payment_type,
        "notify_url"	=> $notify_url,
        "return_url"	=> $return_url,
        "out_trade_no"	=> $out_trade_no,
        "subject"	=> $subject,
        "total_fee"	=> $total_fee,
        "body"	=> $body,
        "show_url"	=> $show_url,
        "anti_phishing_key"	=> $anti_phishing_key,
        "exter_invoke_ip"	=> $exter_invoke_ip,
        "_input_charset"	=> trim(strtolower($alipay_config['input_charset']))
    );
    //建立请求
    $alipaySubmit = new AlipaySubmit($alipay_config);
    $html_text = $alipaySubmit->buildRequestForm($parameter,"post", "支付宝支付");
    $Sign=$alipaySubmit->buildRequestPara($parameter);
    $Back=array();
    $Back['HTML']=$html_text;
    $Back['Sign']=$Sign['sign'];
    return $Back;
}
//支付宝扫描支付接口调用
function AliPaySaoMaApiCall($OrderNumber,$PayMoney)
{
    $config=array();
    require_once APP_PATH.'common/org/alipaysaoma/f2fpay/model/builder/AlipayTradePrecreateContentBuilder.php';
    require_once APP_PATH.'common/org/alipaysaoma/f2fpay/service/AlipayTradeService.php';
    // 创建请求builder，设置请求参数
    $qrPayRequestBuilder = new AlipayTradePrecreateContentBuilder();
    $qrPayRequestBuilder->setOutTradeNo($OrderNumber);
    $qrPayRequestBuilder->setTotalAmount($PayMoney);
    $qrPayRequestBuilder->setSubject('在线支付');
    // 调用qrPay方法获取当面付应答
    //dump($config);
    $qrPay = new AlipayTradeService($config);
    $qrPayResult = $qrPay->qrPay($qrPayRequestBuilder);
    $qrPayResult->getTradeStatus();
    $response = $qrPayResult->getResponse();
    $Back='';
    if(!empty($response->qr_code)) $Back=$response->qr_code;
    return urlencode($Back);
}
//支付宝支付成功返回调用，即：支付宝服务器异步请求 $Type=1 会员 2代理商
function AliPayApiNotifyCall($AgencySiteInfo,$System,$Type=1)
{
    //echo $Type;
   //file_put_contents('66.txt',var_export(input('post.'),true));
  //  file_put_contents('77.txt',var_export($AgencySiteInfo,true));
  //  file_put_contents('88.txt',var_export($System,true));
    $OrderNumber=input('out_trade_no','');
    Log::record($OrderNumber,'error');
    Log::record($AgencySiteInfo,'error');
  //  file_put_contents('55.txt',var_export($OrderNumber,true));
    if(!empty($OrderNumber))
    {
        $Where=array();
        $Where['BalanceNumber']=$OrderNumber;
        $Where['BalancePayState']='0';
        $BalanceMemberID=db('balance')->where($Where)->value('BalanceMemberID');
        $GroupID=db('member')->where('MemberID',$BalanceMemberID)->value('GroupID');
        if($GroupID==1){
            $Type=1;
        }else{
            $Type=2;
        }
        if($Type==1){
            $alipay = db('alipay')->where('AliPayMemberID',$AgencySiteInfo['MemberID'])->where('AliPayState',1)->find();
            if(empty($alipay)){
                $alipay=array();
                $alipay['AliPayAPPID']=$System['AliPayAPPID'];
                $alipay['AliPayPublicKey']=$System['AliPayPublicKey'];
                $alipay['AliPayPrivateKey']=$System['AliPayPrivateKey'];
            }
        }elseif($Type==2){
            $MInfo=db('member')->where('MemberID',$AgencySiteInfo['MemberID'])->find();
            if(empty($MInfo) || $MInfo['MemberTypeID']==3){
                $alipay=array();
                $alipay['AliPayAPPID']=$System['AliPayAPPID'];
                $alipay['AliPayPublicKey']=$System['AliPayPublicKey'];
                $alipay['AliPayPrivateKey']=$System['AliPayPrivateKey'];
            }elseif($MInfo['MemberTypeID']==2 && !empty($MInfo['MemberRecommendID'])){
                $alipay = db('alipay')->where('AliPayMemberID',$MInfo['MemberRecommendID'])->where('AliPayState',1)->find();
            }else{
                $alipay=array();
                $alipay['AliPayAPPID']=$System['AliPayAPPID'];
                $alipay['AliPayPublicKey']=$System['AliPayPublicKey'];
                $alipay['AliPayPrivateKey']=$System['AliPayPrivateKey'];
            }
        }
        $Param=array();
        $Param=input('post.');
       // file_put_contents('99.txt',var_export($AgencySiteInfo,true));
        if($AgencySiteInfo['MemberID']=='-1'){
            $notify_url="http://".$_SERVER['HTTP_HOST']."/payback/alipay_notify.html";
            $return_url="http://".$_SERVER['HTTP_HOST']."/payback/alipay_successhtml";
        }else{
            $notify_url="http://".$_SERVER['HTTP_HOST']."/admin.php/payback/alipay_notify.html";
            $return_url="http://".$_SERVER['HTTP_HOST']."/admin.php/payback/alipay_successhtml";
        }
        $config = array (
            //应用ID,您的APPID。
            'app_id' => $alipay['AliPayAPPID'],
            //商户私钥，您的原始格式RSA私钥
            'merchant_private_key' => $alipay['AliPayPrivateKey'],
            //异步通知地址,只有扫码支付预下单可用
            'notify_url' => $notify_url,
            //同步跳转
            'return_url' => $return_url,
            //编码格式
            'charset' => "UTF-8",
            //签名方式
            'sign_type'=>"RSA2",
            //支付宝网关
            'gatewayUrl' => "https://openapi.alipay.com/gateway.do",
            //支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
            'alipay_public_key' =>  $alipay['AliPayPublicKey'],
        );
        //file_put_contents('1010.txt',var_export($config,true));
        $alipaySevice = new \alipay\lib\AlipayTradeWapService($config);
        $result = $alipaySevice->check($Param);
       // file_put_contents('10.txt', var_export($result,true));
        if($result) {
            //file_put_contents('2.txt', 123);
            if($Param['trade_status'] == 'TRADE_FINISHED') {
                 //file_put_contents('3.txt', 123);
            }else if ($Param['trade_status'] == 'TRADE_SUCCESS') {
                //file_put_contents('4.txt', 123);
                //$this->PayNotify($OrderNumber);
                PayOperationDispose($OrderNumber);
            }
            echo "success";exit;
        }
    }
    echo "fail";exit;
}
//支付宝扫描支付成功返回调用，即：支付宝服务器异步请求
function AliSaoMaPayApiNotifyCall()
{
    require_once APP_PATH.'common/org/alipaysaoma/f2fpay/service/AlipayTradeService.php';
    if (!empty($_POST['out_trade_no'])&& trim($_POST['out_trade_no'])!=""){
        ////获取商户订单号
        $out_trade_no = trim($_POST['out_trade_no']);
        //第三方应用授权令牌,商户授权系统商开发模式下使用
        $appAuthToken = "";//根据真实值填写
        //构造查询业务请求参数对象
        $queryContentBuilder = new AlipayTradeQueryContentBuilder();
        $queryContentBuilder->setOutTradeNo($out_trade_no);
        $queryContentBuilder->setAppAuthToken($appAuthToken);
        //初始化类对象，调用queryTradeResult方法获取查询应答
        $queryResponse = new AlipayTradeService($config);
        $queryResult = $queryResponse->queryTradeResult($queryContentBuilder);
        //根据查询返回结果状态进行业务处理
        switch ($queryResult->getTradeStatus()){
            case "SUCCESS":
                //echo "支付宝查询交易成功:"."<br>--------------------------<br>";
                //print_r($queryResult->getResponse());
                PayOperationDispose($out_trade_no,'',2);
                break;
        }
        return ;
    }
}
//微信二维码调用
function WeiXinErWeiMaCall($OrderNumber,$OrderMoney)
{
    $SystemParam=include APP_PATH.'extra/systemparam.php';
    require_once APP_PATH.'common/org/wxpay/lib/WxPay.Api.php';
    require_once APP_PATH.'common/org/wxpay/example/WxPay.NativePay.php';
    require_once APP_PATH.'common/org/wxpay/example/log.php';
    define('APPID',$SystemParam['WXAPPID']);
    define('MCHID',$SystemParam['WXMCHID']);
    define('KEY',$SystemParam['WXKEY']);
    define('APPSECRET',$SystemParam['WXAPPSECRET']);
    $notify = new NativePay();
    $input = new WxPayUnifiedOrder();
    $input->SetBody("在线支付");
    $input->SetAttach("");
    $input->SetOut_trade_no($OrderNumber);
    $input->SetTotal_fee($OrderMoney*100);
    $input->SetTime_start(date("YmdHis"));
    $input->SetTime_expire(date("YmdHis", time() + 600));
    $input->SetGoods_tag("");
    //$input->SetNotify_url('http://192.168.0.188:196/home/clearing/weixinpay_notify.html');
    $input->SetNotify_url(config('DomainName').url('payrequest/weixinpay_notify'));
    $input->SetTrade_type("NATIVE");
    $input->SetProduct_id("");
    $result = $notify->GetPayUrl($input);
    if(empty($result["code_url"])){
        $result=array();
        $result['code_url']='';
        $result['sign']='';
    }
    $url = $result["code_url"];
    $Data=urlencode($url);
    $Back=array();
    $Back['Sign']=$result['sign'];
    $Back['Data']=$Data;
    return $Back;
}
//微信服务器异步调用
function WeiXinPayApiNotifyCall()
{
    require_once APP_PATH.'common/org/wxpay/example/notify.php';
}
function CreateErWeiMaImg($Data)
{
    //vendor("phpqrcode.phpqrcode");
    require_once APP_PATH.'common/org/wxpay/example/phpqrcode/phpqrcode.php';
    //生成二维码图片
    $Data = urldecode($Data);
    QRcode::png($Data,false,QR_ECLEVEL_L,7);
}
//支付成功后订单处理业务
function PayOperationDispose($OrderNumber,$Sign='')
{
    $PayTime=time();
    $Where=array();
    $Where['BalanceNumber']=$OrderNumber;
    //$Where['OrderSignAliPay|OrderSignWXPay']=$Sign;
    $Where['BalancePayState']='0';
    $Info=db('balance')->where($Where)->find();
	
    if(!empty($Info)){
        $MInfo=db('member')->field('GroupID,RegDomain,MemberRecommendID,MemberName')->where('MemberID',$Info['BalanceMemberID'])->find();
		// 抽奖次数
		$result = 0;
        if ($MInfo['GroupID']==1 && $MInfo['RegDomain']=='-1') {
			// 判断是否主站用户
            db('member')->where('MemberID',$Info['BalanceMemberID'])->setInc('MemberBalanceCount',$Info['BalanceCount']);
			// 增加抽奖次数
			$result = intval($Info['BalanceCount']/1000);
        } elseif ($MInfo['GroupID']==2 && $MInfo['MemberRecommendID']==0) {
			// 是代理商并且没有推荐人
			$result = intval($Info['BalanceCount']/1000);
			// 增加抽奖次数
            db('member')->where('MemberID',$Info['BalanceMemberID'])->setInc('MemberAgentBalanceCount',$Info['BalanceCount']);
        } else {
			// 其他用户直接充值
			db('member')->where('MemberID',$Info['BalanceMemberID'])->setInc('MemberBalanceCount',$Info['BalanceCount']);
		}

		if($result > 0){
			db('member')->where('MemberID',$Info['BalanceMemberID'])->setInc('drawcount',$result);
		}
        $Data=array();
        $Data['BalanceNumber']=$OrderNumber;
        $Data['BalancePayState']='1';
        $Data['BalancePayTime']=$PayTime;
        if($MInfo['GroupID']==1){
            $Data['BalanceCurrentCount']=db('member')->where('MemberID',$Info['BalanceMemberID'])->value('MemberAgentBalanceCount');
        }elseif($MInfo['GroupID']==2){
            $Data['BalanceCurrentCount']=db('member')->where('MemberID',$Info['BalanceMemberID'])->value('MemberAgentBalanceCount');
        }
        db('balance')->where($Where)->update($Data);
		/*增加短信注册提醒*/
		//$utility = new SendUtility();
		//$RtnString = $utility->Send('1553822xxxx',"会员".$MInfo['MemberName']."，充值".$Info['BalanceCount']."元");
		/*增加短信注册提醒*/
    }
}
//短信发送接口
function NoteSendApi($Mobile,$Content){
    $NoteArr=config('config.Note');
    $Url=$NoteArr['Url'];
    $Data=array();
    $Data['name']=$NoteArr['Name'];
    $Data['pwd']=$NoteArr['Pwd'];
    $Data['dst']=$Mobile;
    $Data['msg']=$Content;
    $Data['time']=time();
    //dump($Data);
    $Str = '';
    foreach ( $Data as $k => $v ) {
        $Str .= $k . '=' . iconv('utf-8','gbk',$v) . '&';
    }
    $Str = substr ($Str, 0, - 1);
    return CurlCall($Url,'post',$Str);
}
//CUrl请求调用接口
function CurlCall($Url,$Method='get',$Data='')
{
    $ch = curl_init();
    $header = array('Accept-Charset: utf-8');
    curl_setopt($ch, CURLOPT_URL, $Url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, strtoupper($Method));
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $Data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $Result = curl_exec($ch);
    if($error=curl_error($ch)){
        return $error;
    }
    curl_close($ch);
    //dump($Result);
    return $Result;
}
//Json 中汉字转换
function encode_json($Array)
{
    $str=json_encode($Array);
    return preg_replace_callback('/\\\\u([0-9a-f]{4})/i', create_function( '$matches', 'return mb_convert_encoding(pack("H*", $matches[1]), "UTF-8", "UCS-2BE");' ), $str);
}
//邮件发送接口调用
function EmailSendApi($EMail,$Title,$Content)
{
    require_once APP_PATH.'common/org/PHPMailer/class.phpmailer.php';
//include("class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded
    $EMailArr=config('config.EMail');
    $mail             = new PHPMailer();
    $mail->IsSMTP(); // telling the class to use SMTP
    $mail->Host       = $EMailArr['Host']; // SMTP server
    $mail->SMTPDebug  = 0;                     // enables SMTP debug information (for testing)
    // 1 = errors and messages
    // 2 = messages only
    $mail->SMTPAuth   = true;                  // enable SMTP authentication
    $mail->Port       = $EMailArr['Port'];                    // set the SMTP port for the GMAIL server
    $mail->Username   = $EMailArr['UserName']; // SMTP account username
    $mail->Password   = $EMailArr['Password'];        // SMTP account password
    $mail->SetFrom($EMailArr['SendFromEMail'],$EMailArr['SendFromName']);
    $mail->Subject    = $Title;
    $mail->MsgHTML($Content);
    $mail->AddAddress($EMail,"");
    //$mail->AddAttachment("images/phpmailer.gif");      // attachment
    //$mail->AddAttachment("images/phpmailer_mini.gif"); // attachment
    if(!$mail->Send()) {
        return "Mailer Error: " . $mail->ErrorInfo;
    } else {
        return "Message sent!";
    }
}
//使用 fsockopen 实现PHP异步请求
function doRequest($url, $param=array()){
    $urlinfo = parse_url($url);
    $host = $urlinfo['host'];
    $path = $urlinfo['path'];
    $query = isset($param)? http_build_query($param) : '';
    $port = 80;
    $errno = 0;
    $errstr = '';
    $timeout = 10;
    $fp = fsockopen($host, $port, $errno, $errstr, $timeout);
    $out = "POST ".$path." HTTP/1.1\r\n";
    $out .= "host:".$host."\r\n";
    $out .= "content-length:".strlen($query)."\r\n";
    $out .= "content-type:application/x-www-form-urlencoded\r\n";
    $out .= "connection:close\r\n\r\n";
    $out .= $query;
    fputs($fp, $out);
    fclose($fp);
}
//验证当前微信端随机出来的用户名是否被注册
function CheckRandMemberName()
{
    $RandMemberName='wxwmjh'.mt_rand(10000000,99999999);
    $Where=array();
    $Where['MemberName']=$RandMemberName;
    $Count=db('member')->where($Where)->count();
    if($Count=='0'){
        return $RandMemberName;
    }else{
        CheckRandMemberName();
    }
}
//保存 APP 手机端 Token
function SaveToken($MemberID,$MemberName,$MemberPwdMd5,$MemberPwdKey)
{
    $Token=md5($MemberID.$MemberName.$MemberPwdMd5);
    $RandCode=mt_rand(1,999999999);
    $RandCode=md5($MemberPwdKey.$RandCode.md5($MemberPwdKey));
    $Where=array();
    $Where['Token']=$Token;
    db('appmembertoken')->where($Where)->delete();
    $Data=array();
    $Data['Token']=$Token;
    $Data['RandCode']=$RandCode;
    $Data['MemberID']=$MemberID;
    $Data['MmeberName']=$MemberName;
    $Data['LoginTime']=time();
    db('appmembertoken')->data($Data)->insert();
    session('Token',$Token);
    session('RandCode',$RandCode);
    $Back=array();
    $Back['Token']=$Token;
    $Back['RandCode']=$RandCode;
    return $Back;
}
function deldir($dir)
{
    $dh = @opendir($dir);
    while($file =readdir($dh))
    {
        if($file!="." && $file!="..")
        {
            $fullpath = $dir."/".$file;
            @unlink($fullpath);
        }
    }
}
//删除目录
function DeleteDir($dir)
{
    dump($dir);
    //先删除目录下的文件：
    $dh = @opendir($dir);
    while ($file = readdir($dh)) {
        if($file != "." && $file!="..") {
            $fullpath = $dir."/".$file;
            if(!is_dir($fullpath)) {
                @unlink($fullpath);
            } else {
                DeleteDir($fullpath);
            }
        }
    }
    closedir($dh);
    //删除当前文件夹：
    if(@rmdir($dir)) {
        return true;
    } else {
        return false;
    }
}
/**
 * @ string 需要转换的文字
 * @ encoding 目标编码
 **/
function detect_encoding($string,$encoding = 'gbk'){
    $is_utf8 = preg_match('%^(?:[\x09\x0A\x0D\x20-\x7E]| [\xC2-\xDF][\x80-\xBF]| \xE0[\xA0-\xBF][\x80-\xBF] | [\xE1-\xEC\xEE\xEF][\x80-\xBF]{2} | \xED[\x80-\x9F][\x80-\xBF] | \xF0[\x90-\xBF][\x80-\xBF]{2} | [\xF1-\xF3][\x80-\xBF]{3} | \xF4[\x80-\x8F][\x80-\xBF]{2} )*$%xs',$string);
    if($is_utf8 && $encoding == 'utf8'){
        return $string;
    }else if($is_utf8){
        return mb_convert_encoding($string, $encoding, "UTF-8");
    }else{
        return mb_convert_encoding($string, $encoding, 'gbk,gb2312,big5');
    }
}
function order_num()
{
    return date('Ymd') . str_pad(mt_rand(1, 999999), 6, '0', STR_PAD_LEFT) ;
}
function ToUrlParams($arr)
{
    $buff = "";
    foreach ($arr as $k => $v)
    {
        if($k != "sign" && $v != "" && !is_array($v)){
            $buff .= $k . "=" . $v . "&";
        }
    }
    $buff = trim($buff, "&");
    return $buff;
}
  function  curl_w($url,$data){
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, $url);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
                curl_setopt($ch, CURLOPT_POST, TRUE);
                curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
                curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
                $output=curl_exec($ch);
                curl_close($ch);
                return $output;
        }

/*
 * 改变手机号码格式
 * @param $mobile string 号码
 * @return string
 */
function division_mobile($mobile)
{
    $new_tel = substr($mobile, 0, 3) . '-' . substr($mobile, 3, 4) . '-' . substr($mobile, 7, 11);
    return $new_tel;
}
//时间转行函数
function transfer_time($time)
{
    $rtime = date("m-d H:i",$time);
    $htime = date("H:i",$time);

    $time = time() - $time;

    if ($time < 60)
    {
        $str = '刚刚';
    }
    elseif ($time < 60 * 60)
    {
        $min = floor($time/60);
        $str = $min.'分钟前';
    }
    elseif ($time < 60 * 60 * 24)
    {
        $h = floor($time/(60*60));
        $str = $h.'小时前 '.$htime;
    }
    elseif ($time < 60 * 60 * 24 * 3)
    {
        $d = floor($time/(60*60*24));
        if($d==1)
            $str = '昨天 '.$rtime;
        else
            $str = '前天 '.$rtime;
    }
    else
    {
        //$str = $rtime;
		$str='刚刚';
    }
    return $str;
}

function str_membername($str){

	//判断是否包含中文字符
	if(preg_match("/[\x{4e00}-\x{9fa5}]+/u", $str)) {
		//按照中文字符计算长度
		$len = mb_strlen($str, 'UTF-8');
		//echo '中文';
		if($len >= 3){
			//三个字符或三个字符以上掐头取尾，中间用*代替
			$str = mb_substr($str, 0, 2, 'UTF-8') . '***' . mb_substr($str, -1, 1, 'UTF-8');
		} elseif($len == 2) {
			//两个字符
			$str = mb_substr($str, 0, 1, 'UTF-8') . '*';
		}
	} else {
		//按照英文字串计算长度
		$len = strlen($str);
		//echo 'English';
		if($len >= 3) {
			//三个字符或三个字符以上掐头取尾，中间用*代替
			$str = substr($str, 0, 1) . '***' . substr($str, -1);
		} elseif($len == 2) {
			//两个字符
			$str = substr($str, 0, 1) . '*';
		}
	}
	return $str;
}

function msubstrprice($str,$start=0,$length,$charset="utf-8",$suffix=true){
    if(function_exists("mb_substr"))
        $slice=mb_substr($str,$start,$length,$charset);
    elseif(function_exists('iconv_substr')){
        $slice = iconv_substr($str,$start,$length,$charset);
        if(false===$slice){$slice = '';}
    }else{
        $re['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
        $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
        $re['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
        $re['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
        preg_match_all($re[$charset], $str, $match);
        $slice = join("",array_slice($match[0], $start, $length));
    }
    return $suffix ? $slice.'' : $slice;
}