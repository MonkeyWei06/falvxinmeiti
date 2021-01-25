<?php
//配置文件
define('PUBLIC_PATH','./public'.DS);
return [
    'template'               => [
        // 模板引擎类型 支持 php think 支持扩展
        'type'         => 'Think',
        // 模板路径
        'view_path'    => '',
        // 模板后缀
        'view_suffix'  => 'html',
        // 模板文件名分隔符
        'view_depr'    => DS,
        // 模板引擎普通标签开始标记
        'tpl_begin'    => '<{',
        // 模板引擎普通标签结束标记
        'tpl_end'      => '}>',
        // 标签库标签开始标记
        'taglib_begin' => '<{',
        // 标签库标签结束标记
        'taglib_end'   => '}>',
    ],
     'default_controller'     => 'Admin',
    //验证码设置
    'captcha'  => [
        // 验证码字符集合
        'codeSet'  => '1234567890',
        // 验证码字体大小(px)
        'fontSize' => 22,
        // 是否画混淆曲线
        'useCurve' => true,
        // 验证码图片高度
        'imageH'   => 48,
        // 验证码图片宽度
        'imageW'   => 150,
        // 验证码位数
        'length'   => 4,
        // 验证成功后是否重置
        'reset'    => true,
        'useNoise' => false,
    ],
    // 视图输出字符串内容替换
    'view_replace_str' => [
        '__PUBLIC__' => '/',
        '__STATIC__' => '/static',
        '__CSS__'    => '/static',
        '__JS__'     => '/static',
    ],
];