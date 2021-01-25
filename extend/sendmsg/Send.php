<?php

require_once "Config.php";
require_once "SendUtility.php";
require_once "CDetectInfo.php";

$AimMobiles = $_POST["AimMobiles"];
$Content = $_POST["Content"];

$detect = new CDetectInfo();
$detect->_mobile = $AimMobiles;
$detect->_address = $_SERVER["REMOTE_ADDR"];

session_start();
header("Content-type: text/html; charset=utf-8");
if (DetectMobile($detect->_mobile, $config) == 0) {
	echo "手机号限速";
	exit;
}
if (DetectAddress($detect->_address, $config) == 0) {
	echo "地址限速";
	exit;
}

$utility = new SendUtility($config);
$RtnString = $utility->Send($AimMobiles, $Content);
if ($RtnString == "1") {
	$_SESSION["_" . $detect->_mobile] = $detect;
    if (isset($detect->_address))
    	$_SESSION[$detect->_address] = $detect;
}
echo $RtnString;


function DetectMobile($mobile, $config) {
	if (isset($_SESSION["_" . $mobile]) == false) return 1;
	
	$detect = $_SESSION["_" . $mobile];
	if ((time() - $detect->_dt) > $config["DetectMobile"])
		return 1;
	
	return 0;
}

function DetectAddress($address, $config) {
	if (isset($address) == false) return 1;
	if (isset($_SESSION[$address]) == false) return 1;

	$detect = $_SESSION[$address];
	if ((time() - $detect->_dt) > $config["DetectAddress"])
		return 1;

	return 0;
}
