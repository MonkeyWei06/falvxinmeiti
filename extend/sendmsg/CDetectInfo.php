<?php
namespace sendmsg;
class CDetectInfo {
	public $_mobile = "";
	public $_address = "";
	public $_dt = 0;

	function __construct() {
		$this->_dt = time();
	}
}