<?php
$FilePath=APP_PATH.'extra/systemparam.php';
$SysParam=[];
if(is_file($FilePath)){
        $SysParam=include($FilePath);
}
return $config = array (
        //应用ID,您的APPID。
        'app_id' =>$SysParam['AliPayAppID'],//"2018072660790424",

        //商户私钥，您的原始格式RSA私钥
        'merchant_private_key' =>$SysParam['AliPayPrivateKey'],// "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDGrh+vnkYnADkJ7nJJqcbIOawcIDavKON+B78Mqd5r9Yi3icOUqyXk60fO0dsRBC08dI5FzMEWNro5VQ5bVzCsnba/2mbqf073QQM0kd0d0rDnvEC4shWfzAHfsOnQrGnBm5IH55tuCCO3KpxKqJXgY6dFJ9qi3oFcoY1P/0rPYoDyZqRyqrMT1GLfM8Mfp1v3S2m9mz0XjvG9+P2Oh/73XojoZ0kgg7OAeoAuUXFcF3cBKPSGAc4dzeWaFUYxGShI+VIrBO6Wl42ehP/h2CW6Xwm9pcPisRc1hpm5A1McHUDCryNgToDHkM2nV+kntuUD/4uIogC8+hdF0m56T4g7AgMBAAECggEAI/qMSmVDFvT3X1EK6UQRd1jaTg2XWYjyCXSlqElqueow4+vSuy1zI01oJ4/hN+eluXjx+rnljXxDpPY+L1ROwDOfUIbgdD6xshzX08FGZYwt9QkmP0wgllt/S17iOKPAUws1GrFaeEaJETZqLyrwWT4yoFdjRHM+weOPj5kPlxZRi0GbV5PODdbARhsIolVMOg4QMU8uvdSlJ3MGeMeMKg7OV2PotObTVBWfUHIKPtSc9gvz76XTp4z6OO6RgQStYxK3qtBOHmBvKI2eP1SRVupJSL/BylIB6y1ltfCZweCpzpFqjluQYCfKmPsBkKinlDQKK7GO8Ilud+mN9SyJ4QKBgQD0JE6N6OHhWZV7rX/WLOCO5Wr5O3Tq8f/RtfOUjAhJ/Kdj/4+OQaQuGuOyTdgGvk4detpVL8NK6DOsGnd9+iGIwCC+Xcx84CiiKGWbKnnhKhCuWxX0ORrAyphjLY67/6t3mNhcTRxZtyhjLkWQSL1HK9w8Lx9ofeM5TsMO5dwTzQKBgQDQVIpbMYkxo10ObyafQ8ENGvkncNIFl6NANm/tdR/pv+SbPd5fIodV4PPUY8RWfmeCiacE5mJVtXWaRCaS0JbZQ0zTtDL9ADxpU4Gx6ynLLOqySs/HKXZSVjzMFiXSKT+Tgyh2fffERtk2xeorwKRdSVlFhOqCHOnZXPWI2a6UJwKBgC0VP0RJStzYNBhgk4izRMxeZQCdEBwKkBjjppU5vpYbB7YZjSLR0EWLRZy5bzjfj4E2HHc6mK+ObWxMfuBOfj7Ia8N7grVUl2xKVWjv0Q3ZPLdVrpooqV4Mi1NVKFRjBADTwrBYtPGENvsJomLga8NmwAaFFSGwjXMZrj9kBt3JAoGBAJrTCVPGl6AVOXYdssVP9CvKLPpbxSm0zPVOv5XoooP0QXAB5b4sCgoPuQXR8zsYi9KefEqO8OujhLfWCBi5/jGO64y18eLGhx77mXphO1ksk2tXX90yeiWsw1gk6YyrbP0yzyJocXcj9A/ZvDMx4rUVasvYgPObi0sn464FoNGnAoGBAIH+p3brbLPAR9GiKPsmNbqjsPL7vfWY8DkjNlb5Cluv5fi3wpyZqLLZhHVd06l/GdPYkQZGeZiCzh1zCGUlHQmGXIylbr7S5Ar/jtOmfUaP+rGp9sv+euMeqYo3azITP1ID0ZVC93knZbWku05m784X4rUxI9fU3ycnanHXxVGb",
        
        //异步通知地址,只有扫码支付预下单可用
        'notify_url' => "http://pgg.sxol.com/Alipaydeposit/alipaynotify.html",

        //同步跳转
        'return_url' => "http://pgg.sxol.com/Alipaydeposit/paydepositwan.html",

        //编码格式
        'charset' => "UTF-8",

        //签名方式
        'sign_type'=>"RSA2",

        //支付宝网关
        'gatewayUrl' => "https://openapi.alipay.com/gateway.do",

        //支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
        'alipay_public_key' =>$SysParam['AliPayPublicKey'],// ;//"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6WgT7aWQ54tRnX/lpIAGnC7Iebi0eljIMboueIwxqj8v0kQvwxlEh1LK925HWVLyjO+CHeT57S2C8UunFajUhg/cgwVk+HD/p0RNbnIy4lh7CmNCJyb8WFICGQyoh5MbrKyRPhl4boThC13uWyEvbkwnAU+fr4aoVQhJEGwESHCqyy7QHS4b3FpYDhYnYJDhAEMMiPTkKDtRvaRoHsU9SMiawZYCp0Zh8GwfTXkHKH+M2YGIh7kJEhfOYp2gnMoPJYaGAjP/HkPCGkkTYO+9Hj6KKEuwVz7NDcEk7saWTV+LLLCAEUdSSXhAo888peARej7Ozy8HtEdAhfBTWOQqUwIDAQAB",
        
    
);
