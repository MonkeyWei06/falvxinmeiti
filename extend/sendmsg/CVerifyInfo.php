<?php
namespace sendmsg;
class CVerifyInfo {
	public $_mobile = "";
	public $_code = "";
	public $_dt = 0;
	
	function __construct() {
		$this->_dt = time();
	}
}