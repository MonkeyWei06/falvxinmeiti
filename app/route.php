<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// +----------------------------------------------------------------------
return [
/*
主站前台   home    public/index.php
主站后台  admin  public/admin_mjh.php
主站会员后台和代理站会员后台  member     public/member.php和public_agency/member.php  ##执行统一位置
代理站前台   agency   public_agency/index.php    ##DirectoryIndex index_agency.php
代理站后台   agency/admin   public_agency/index.php  ##有点别扭，应该和主站后台一样设置个单独模块，要分开，分为agency和agency_admin
*/
'reg/[:invite]'  =>  'member/login/index?act=reg',
];