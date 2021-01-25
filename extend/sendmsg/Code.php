<?php
require_once "Config.php";
require_once "CVerifyInfo.php";
require_once "StringUtility.php";

$verify = new CVerifyInfo();
$verify->_mobile = $_POST["AimMobiles"];
$verify->_code = StringUtility::LoadVerifyString(1, 4);

session_start();
$_SESSION["_VerifyCode"] = $verify;

header("Content-type: text/html; charset=utf-8");
echo "您的验证码是" . $verify->_code; // . $config["Signature"];