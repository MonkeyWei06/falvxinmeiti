<?php
//配置文件
define('PUBLIC_PATH',ROOT_PATH.'public'.DS);
return [
    'AdmiNovertime'=>'3600',
    'AdminKey'=>'ABC123zyx()',
    'session'            => [
        'prefix'         => 'admin',
        'auto_start'     => true,
		'expire'=>3600*24*30,//过期时间
		'path'=>TEMP_PATH,//表示session保存在自己网站根目录中的runtime目录中
    ],
    //分页配置
    'paginate'               => [
        'type'     => '\app\admin\org\Bootstrap',//或者存放到更目录下的 extend 中 引用文件为：\common\Bootstrap
        'var_page' => 'page',
    ],
    'CouponsMoeny'=>[
        10=>'10元',
        20=>'20元',
        50=>'50元',
        100=>'100元'
    ],
    'GoodsThumbWidth'=>['280','180','260','90','495'],//商品缩略尺寸宽度
    'GoodsThumbHeight'=>['200','130','260','60','400'],//商品缩略尺寸高度
    'MerchantGoodsThumbWidth'=>['673','163'],//商家店铺商品缩略尺寸宽度
    'MerchantGoodsThumbHeight'=>['389','107'],//商家店铺商品缩略尺寸高度
    'token'=>'__admintoken__',
    //验证码设置
    'captcha'  => [
        // 验证码字符集合
        'codeSet'  => '1234567890',
        // 验证码字体大小(px)
        'fontSize' => 14,
        // 是否画混淆曲线
        'useCurve' => true,
        // 验证码图片高度
        'imageH'   => 35,
        // 验证码图片宽度
        'imageW'   => 75,
        // 验证码位数
        'length'   => 3,
        // 验证成功后是否重置
        'reset'    => true,
        'useNoise' => false,
    ],
];