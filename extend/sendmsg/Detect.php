<?php
require_once "Config.php";
require_once "CVerifyInfo.php";

$code = $_POST["Code"];

session_start();
header("Content-type: text/html; charset=utf-8");

if (isset($_SESSION["_VerifyCode"]) == false) {
	echo "超时或不存在";
	exit;
}

$verify = $_SESSION["_VerifyCode"]; 
if ((time() - $verify->_dt) > $config["CodeTimeout"] * 60) {
	echo "超时";
	exit;
}

if($verify->_code != $code) {
	echo "不正确";
	exit;
}

$verify->_code = "";
echo "验证码正确";