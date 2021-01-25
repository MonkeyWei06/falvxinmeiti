<?php
namespace sendmsg;
use think\Db;
class Config {
	public static function config(){
		$config = array(
		"UserName" => "账户",
		"Password" => "密码",
		"Signature" => "【签名】",
		"Addresses" => array("http://sdk.lx198.com/sdk", "http://101.200.141.210/sdk"),
		"HttpTimeout" => 5,
		"CodeTimeout" => 15,
		"DetectMobile" => 30,
		"DetectAddress" => 30
		);
		return $config;
	}
}