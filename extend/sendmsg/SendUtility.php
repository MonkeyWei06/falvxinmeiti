<?php
namespace sendmsg;
use sendmsg\Config;
use sendmsg\CDetectInfo;
class SendUtility {
	private $_config = array();
	
	function __construct() {
		$this->_config = Config::config();
	}
	function BuildContent($AimMobiles, $Content) {
		$str  = "accName=" . urlencode($this->_config["UserName"]);
		$str .= "&accPwd=" . urlencode(strtoupper(md5($this->_config["Password"])));
		$str .= "&aimcodes=" . urlencode($AimMobiles);
		$str .= "&content=" . urlencode($Content . $this->_config["Signature"]);
		return $str;
	}
	function Send($AimMobiles, $Content) {
		$content = $this->BuildContent($AimMobiles, $Content);
		$counter = 0;
		while ($counter < count($this->_config["Addresses"])) {
			$opts = array('http' =>  array("method" => "POST", "timeout" => $this->_config["HttpTimeout"], "header" => "Content-type: application/x-www-form-urlencoded", "content" => $content));
			$message = file_get_contents($this->_config["Addresses"][$counter] . "/send", false, stream_context_create($opts));
			if ($message == false) $counter++;
			else break;
		}
		if ($message == false) return "发送失败";
		$RtnString = explode(";", $message);
		if ($RtnString[0] != "1") return $RtnString[1];
		return $RtnString[0];
	}
	function BuildContentjs($AimMobiles, $Content,$UserNamejs,$Passwordjs,$Signaturejs) {
		$str  = "accName=" . urlencode($UserNamejs);
		$str .= "&accPwd=" . urlencode(strtoupper(md5($Passwordjs)));
		$str .= "&aimcodes=" . urlencode($AimMobiles);
		$str .= "&content=" . urlencode($Content . $Signaturejs);
		return $str;
	}
	
	function Sendjs($AimMobiles, $Content,$UserNamejs,$Passwordjs,$Signaturejs) {
		$content = $this->BuildContentjs($AimMobiles, $Content,$UserNamejs,$Passwordjs,$Signaturejs);
		$counter = 0;
		while ($counter < count($this->_config["Addresses"])) {
			$opts = array('http' =>  array("method" => "POST", "timeout" => $this->_config["HttpTimeout"], "header" => "Content-type: application/x-www-form-urlencoded", "content" => $content));
			$message = file_get_contents($this->_config["Addresses"][$counter] . "/send", false, stream_context_create($opts));

			if ($message == false) $counter++;
			else break;
		}

		if ($message == false) return "发送失败";
		$RtnString = explode(";", $message);
		if ($RtnString[0] != "1") return $RtnString[1];
		return $RtnString[0];
	}
	
	function Query() {
		$content  = "accName=" . urlencode($this->_config["UserName"]);
		$content .= "&accPwd=" . urlencode(strtoupper(md5($this->_config["Password"])));
		
		$opts = array('http' =>  array("method" => "POST", "header" => "Content-type: application/x-www-form-urlencoded", "content" => $content));
		$message = file_get_contents($this->_config["Addresses"][0] . "/qryBalance", false, stream_context_create($opts));
		
		if ($message == false) return "查询失败";
		$RtnString = explode(";", $message);
		if ($RtnString[0] != "1") return $RtnString[1];
		return $RtnString[2];
	}
}