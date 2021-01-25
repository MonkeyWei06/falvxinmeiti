<?php
$RouteUrl=request()->url();
define('PUBLIC_PATH',ROOT_PATH.'public'.DS);
//配置文件
$Config=[
    //验证码设置
    'captcha'  => [
        // 验证码字符集合
        'codeSet'  => '0123456789',
        // 验证码字体大小(px)
        'fontSize' => 18,
        // 是否画混淆曲线
        'useCurve' => false,
        // 验证码图片高度
        'imageH'   => 34,
        // 验证码图片宽度
        'imageW'   => 150,
        // 验证码位数
        'length'   => 4,
        // 验证成功后是否重置
        'reset'    => true,
        'useNoise' => false,
    ],
    'config'=>[
        'MemberPwdKey'=>'User_Name(Key)-654123',
    ],
];
// 视图输出字符串内容替换
//echo $RouteInfo;
if(stripos($RouteUrl,'/member.php/')!==false){
    $Arr=[
        'view_replace_str' => [
        '__PUBLIC__' => '/',
        '__STATIC__' => '/static',
        '__CSS__'    => '/static',
        '__JS__'     => '/static',
        ],
    ];
    $Config=array_merge($Config,$Arr);
}else{
    $Arr=[
        'view_replace_str' => [
            '__PUBLIC__' => '/',
            '__STATIC__' => '/static',
            '__CSS__'    => '/static',
            '__JS__'     => '/static',
        ],
    ];
    $Config=array_merge($Config,$Arr);
}
//dump($Config);
return $Config;