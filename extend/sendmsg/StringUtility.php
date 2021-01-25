<?php
//随机字符串类
namespace sendmsg;
class StringUtility {
	
	public static function LoadOriginString($mode) {
		$os = "";
		if (($mode & 1) > 0)
			$os = $os . "0123456789";
		if (($mode & 2) > 0)
			$os = $os . "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		return $os;
	}
	
	public static function LoadRandomString($os, $length) {
		$cs = "";
		for ($y = 0; $y < $length; $y++) {
			$p = rand(0, strlen($os) - 1);
			$cs = $cs . substr($os, $p, 1);
		}

		return $cs;
	}
	
	public static function LoadVerifyString($mode, $length)
	{
		$os = StringUtility::LoadOriginString($mode);
		return StringUtility::LoadRandomString($os, $length);
	}
}