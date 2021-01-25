<?php
$FilePath=APP_PATH.'extra/systemparam.php';
$SysParam=[];
if(is_file($FilePath)) $SysParam=include($FilePath);

return $config = array (
    //应用ID,您的APPID。
    'app_id' => $SysParam['AliPayAppID'],//"2018102561765654",

    //商户私钥
    'merchant_private_key' =>$SysParam['AliPayPrivateKey'],//

    //异步通知地址,只有扫码支付预下单可用
    'notify_url' => "http://pgg.sxol.com/alipay/alipaynotify.html",

    //同步跳转
    'return_url' => "http://pgg.sxol.com/alipay/paywan.html",

    //编码格式
    'charset' => "UTF-8",

    //签名方式
    'sign_type'=>"RSA2",

    //支付宝网关
    'gatewayUrl' => "https://openapi.alipay.com/gateway.do",

    //支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    'alipay_public_key' =>$SysParam['AliPayPublicKey'],
);
