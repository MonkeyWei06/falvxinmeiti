<?php
require_once "Config.php";
require_once "SendUtility.php";

header("Content-type: text/html; charset=utf-8");

$utility = new SendUtility($config);
echo $utility->Query();
