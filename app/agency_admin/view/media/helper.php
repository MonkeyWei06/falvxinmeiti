<?php
use sendmsg\SendUtility;
use think\Db;
use think\Request;
use think\Loader;
use think\Session;
use app\admin\model\Wholetype as WholetypeModel;
use app\home\model\Question as QuestionModel;
use Org\pscws4;
    //获取全局分类
    function GetCurrentWholeType($Tablename='wholetype',$TypeID){
        $Where=array();
        $Where['TypePID']=$TypeID;
        $Where['TypeState']=1;
        $List=db::name($Tablename)->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        return $List;
    }
    /**
     * 导出excecl
        member ：导出订单，导出媒体
     */
    function GetExportTitle($TabName)
    {
        $FilePath=APP_PATH.'extra/ExportTitleConfig.php';
        $Config=[];
        if(is_file($FilePath))
        {
            $Config=include $FilePath;
        }
        $TitleInfo=$Config[$TabName];
        return $TitleInfo;
    }
    function excelExport($fileName = '', $headArr = [], $data = [])
    {
        $fileName .= "_" . date("Y_m_d", Request::instance()->time()) . ".xlsx";
        Loader::import('Classes/PHPExcel/IOFactory', EXTEND_PATH);
        Loader::import('Classes/PHPExcel', EXTEND_PATH);
        Loader::import('Classes/PHPExcel/Reader/Excel2007', EXTEND_PATH);
        $objPHPExcel = new \PHPExcel();
        $objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
            ->setLastModifiedBy("Maarten Balliauw")
            ->setTitle("Office 2007 XLSX Test Document")
            ->setSubject("Office 2007 XLSX Test Document")
            ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("Test result file");
        $key =0; // 设置表头
        foreach ($headArr as $v) {
            $colum = \PHPExcel_Cell::stringFromColumnIndex($key);
            $objPHPExcel->setActiveSheetIndex(0)->setCellValue($colum . '1', $v);
            $key += 1;
        }
        $column = 2;
        $objActSheet = $objPHPExcel->getActiveSheet();
        foreach ($data as $key => $rows) { // 行写入
            $span = 0;
            foreach ($headArr as $keyName => $value) { // 列写入
                $j = \PHPExcel_Cell::stringFromColumnIndex($span);
                $objActSheet->setCellValueExplicit($j . $column, $rows[$keyName],\PHPExcel_Cell_DataType::TYPE_STRING);
                $span++;
            }
            $column++;
        }
        $fileName = iconv("utf-8", "gb2312", $fileName); // 重命名表
        $objPHPExcel->setActiveSheetIndex(0); // 设置活动单指数到第一个表,所以Excel打开这是第一个表
        // Redirect output to a client’s web browser (Excel2007)
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="'.$fileName.'"');
        header('Cache-Control: max-age=0');
        // If you're serving to IE 9, then the following may be needed
        header('Cache-Control: max-age=1');
        // If you're serving to IE over SSL, then the following may be needed
        header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
        header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
        header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
        header ('Pragma: public'); // HTTP/1.0
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        $objWriter->save('php://output');
        exit;
    }
	/*****************************************************************/
	//公共函数 匹配自定义数组checked选中状态
	function ArrayCheck($kid,$fname){
		$data='';
		foreach($fname() as $k=>$vl){
			if($k==$kid){
				$data=$vl;
			}	
		}
		return $data;
	}
	function wherepay(){
		return array('wxpay'=>'微信','alipay'=>'支付宝','yezf'=>'余额','sdfk'=>'罚款','sdkc'=>'扣除','sdcz'=>'代充值','sdauto'=>'提现','cardk'=>'银行卡');
	}
	/*
	  * 创建log记录
	  * $data String 记录内容
	  * $texname String text 名称
	*/
	function write_log($data,$texname,$type=1){ 
		//$years = date('Y-m'); //设置路径目录信息 
		$url =date('Ymdhis').$texname;
		$dir_name=dirname($url); //目录不存在就创建 
		if(!file_exists($dir_name)) { 
			//iconv防止中文名乱码 
			$res = mkdir(iconv("UTF-8", "GBK", $dir_name),0777,true); 
		}
		$fp = fopen($url,"a");
		//打开文件资源通道 不存在则自动创建       
		fwrite($fp,var_export($data,true)."\r\n\r\n");
		//写入文件 
		fclose($fp);
		//关闭资源通道 
	}
	function getconfig(){
		$Controller=controller('common/Common');
		$GetCurrentDomainInfo=$Controller->GetCurrentDomainInfo();
		return $GetCurrentDomainInfo['Config'];
	}
	/*
	 * 经典的概率算法，
	 * $proArr是一个预先设置的数组，
	 * 假设数组为：array(100,200,300，400)，
	 * 开始是从1,1000 这个概率范围内筛选第一个数是否在他的出现概率范围之内， 
	 * 如果不在，则将概率空间，也就是k的值减去刚刚的那个数字的概率空间，
	 * 在本例当中就是减去100，也就是说第二个数是在1，900这个范围内筛选的。
	 * 就相当于去一个箱子里摸东西，
	 * 第一个不是，第二个不是，第三个还不是，那最后一个一定是。
	 * 这个算法简单，而且效率非常高，
	 * 这个算法在大数据量的项目中效率非常棒。
	 */
	function get_rand($proArr) { 
		 $result = ''; 
		 //概率数组的总概率精度 
		 $proSum = array_sum($proArr); 
		//概率数组循环 
		  foreach ($proArr as $key => $proCur) { 

			$randNum = mt_rand(1, $proSum); 
				if ($randNum <= $proCur) { 
				  $result = $key; 
				  break; 
				} else { 
				  $proSum -= $proCur; 
				}  
		  }
	  unset ($proArr); 
	  return $result; 
	}
	//2019/11/21 星期四
	function Send_Sms($mibile,$mtext){
		if($mibile){
			$utility = new SendUtility();
			$RtnString = $utility->Send($mibile,$mtext);
		}
	}

	/***********************************************/

	function httpCurl($url, $params, $method = 'GET', $header = array(), $multi = false){

        date_default_timezone_set('PRC');
        $opts = array(

            CURLOPT_TIMEOUT        => 30,

            CURLOPT_RETURNTRANSFER => 1,

            CURLOPT_SSL_VERIFYPEER => false,

            CURLOPT_SSL_VERIFYHOST => false,

            CURLOPT_HTTPHEADER     => $header,

            CURLOPT_COOKIESESSION  => true,

            CURLOPT_FOLLOWLOCATION => 1,

            CURLOPT_COOKIE         

            =>session_name().'='.session_id(),

        );
        /* 根据请求类型设置特定参数 */
        switch(strtoupper($method)){
        case 'GET':
        // $opts[CURLOPT_URL] = $url . '?' . http_build_query($params);
        // 链接后拼接参数  &  非？
			$opts[CURLOPT_URL] = $url . '?' . http_build_query($params);                
			break;            
		case 'POST'://判断是否传输文件
			//$params = $multi ? $params : http_build_query($params);                
			$opts[CURLOPT_URL] = $url;                
			$opts[CURLOPT_POST] = 1;                
			$opts[CURLOPT_POSTFIELDS] = $params;                
			break;
			
		default:               
			throw new Exception('不支持的请求方式！');

        }
        /* 初始化并执行curl请求 */

        $ch = curl_init();

        curl_setopt_array($ch, $opts);        

        $data  = curl_exec($ch);        

        $error = curl_error($ch);

        curl_close($ch);        

        if($error) throw new Exception('请求发生错误：' . $error);        

        return  $data;

    }
	/**
     * JS提示跳转
     * @param  $tip  弹窗口提示信息(为空没有提示)
     * @param  $type 设置类型 close = 关闭 ，back=返回 ，refresh=提示重载，jump提示并跳转url
     * @param  $url  跳转url
     */
    function alert($tip = "", $type = "", $url = "") {
        $js="<meta http-equiv='Content-Type'' content='text/html; charset=utf-8'>";
        $js.= "<script>";
        if ($tip)
            $js .= "alert('" . $tip . "');";
        switch ($type) {
            case "close" : //关闭页面
                $js .= "window.close();";
                break;
            case "back" : //返回
                $js .= "history.back(-1);";
                break;
            case "refresh" : //刷新
                $js .= "parent.location.reload();";
                break;
            case "top" : //框架退出
                if ($url)
                    $js .= "top.location.href='" . $url . "';";
                break;
            case "jump" : //跳转
                if ($url)
                    $js .= "window.location.href='" . $url . "';";
                break;
            default :
                break;
        }
        $js .= "</script>";
        echo $js;
        if($type) {
            exit();
        }
    }
	function generate_str( $length = 6) {
		// 字符集，可任意添加你需要的字符   
		$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';  
		$str = '';  
		for ( $i = 0; $i < $length; $i++ )  
		{
			$str .= $chars[ mt_rand(0, strlen($chars) - 1) ];  
		}  
		return $str;
	}
	//试题验证
	function Checktiku($member_id){
		$data=array();
        $data['ckuser']=session('ckuser');	
		$data['checkqs']=MD5($member_id);
		if($data['checkqs']==$data['ckuser']){
			return true;
		}else{
			return false;
		}
		//Cookie::delete('d_uid');
    }
	//获取用户头像
	function Getuserface($MemberID){
        $Where=array();
        $Where['MemberID']=$MemberID;
        $List=db::name('member')->field('MemberPicPath')->where($Where)->find();
        return $List['MemberPicPath'];
    }
	//获取用户指定字段
	function Getmemberinfo($MemberID,$fname){
        $Where=array();
        $Where['MemberID']=$MemberID;
        $List=db::name('member')->field($fname)->where($Where)->find();
        return $List[$fname];
    }

	//获取用户头像
	function Getsumclick($userid){
        $Where=array();
        $Where['userid']=$userid;
        $result=db::name('question')->field('clicks')->where($Where)->sum('clicks');
        return $result;
    }

	/*2020/07/02
	*STRING content 内容 
	*NUM count		字符长度
	*/
	//截取内容长度 摘要
	function getDescriptionFromContent($content, $count,$replace=0)
	{
		$content = preg_replace("@<script(.*?)</script>@is", "", $content);
		$content = preg_replace("@<iframe(.*?)</iframe>@is", "", $content);
		$content = preg_replace("@<style(.*?)</style>@is", "", $content);
		$content = preg_replace("@<(.*?)>@is", "", $content);
		$content = preg_replace("/(\s|\&nbsp\;|　|\xc2\xa0)/", " ", strip_tags($content));
		$content = preg_replace("/style=[\"\'](.*?)[\"\']/", "",$content);
		$content = str_replace(PHP_EOL, '', $content);
		$space = array(" ", "　", "  ", " ", " ");
		$go_away = array("", "", "", "", "");
		$content = str_replace($space, $go_away, $content);
		if($replace==1){
			return $content;
		}
		$res = mb_substr($content, 0, $count, 'UTF-8');
		if (mb_strlen($content, 'UTF-8') > $count) {
			$res = $res . "...";
		}
		return $res;
	}
	 function returnfloat($num)
    {
		return floatval($num);
	}

	//获取联级菜单子分类数据无限极
    function GetTypeListAjaxData($TableName,$TypeID)
    {
        $List=$this->GetTypeListAjax($TableName,$TypeID);
        $this->result($List,0,'分类列表数据');
    }
	 //获取局部位置的分类数据
    function GetTypeListAjax($TableName,$ParentID=0)
    {
        $Where=array();
        $Where['TypePID']=$ParentID;
        $Where['TypeState']='1';
        return db::name($TableName)->field('TypeID,TypeName,TypePath,TypeNode,TypePID')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();

    }
	 //获取局部位置的分类数据
    function GetTypeOne($TableName,$TypeID=0)
    {
        $Where=array();
        $Where['TypeID']=$TypeID;
        $Where['TypeState']='1';
        $typename=db::name($TableName)->field('TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->find();
		return $typename['TypeName'];

    }
	/*首页通用栏目子类调用*/
	function GetZtypeList($tablename,$TypePID,$num=3){
		$WholetypeModel = new WholetypeModel;
		$list=$WholetypeModel->GetSeatTypeLimit($tablename,$TypePID,$num);
		return $list;
	}
	/*首页通用题库调用*/
	function GetQeustList($pid,$num=5){
		$QuestionModel = new QuestionModel;
		$UrlParam['limit']=$num;
		$UrlParam['pid']=$pid;
		$questionList = $QuestionModel->GetQuestionList(0,$UrlParam);
		return $questionList;
	}
	
	/** 
	 *中文分词
	 * params字符串$ title需要分词的语句
	 * params int $ num分词个数，否则不用填充
	 **/ 
	function get_tags($text,$num=5){
		$cws = new PSCWS4('utf-8');
		$cws->set_dict(CONF_PATH.'etc/dict.utf8.xdb');
		$cws->set_rule(CONF_PATH.'etc/rules.utf8.ini');
		$cws->set_charset('utf-8');
		$cws->set_debug(false);
		//$cws->set_ignore(true);
        $cws->send_text($text);
		$words = $cws->get_tops($num);
        $tags = array();
        foreach ($words as $val) {
			if(mb_strlen($val['word'],"utf-8")>=2){
				$tags[] = $val['word'];
			}
        }
        $cws->close();		 
 		return implode(',',$tags); 
	}

	/*WAP广告调用*/
	function GetMPoster($PosterTypeID,$num=1){
		$Controller=controller('common/Common');
		$list=$Controller->GetpostList($PosterTypeID,$num);
		return $list;
	}
	//详情展示过滤
	function getContenttohtml($content)
	{
		$content = preg_replace("@<script(.*?)</script>@is", "", $content);
		$content = preg_replace("@<iframe(.*?)</iframe>@is", "", $content);
		$content = preg_replace("@<style(.*?)</style>@is", " ", $content);
		//$content = preg_replace("/style=[\"\'](.*?)[\"\']/", "",$content);
		$content = preg_replace("/[\s]*style=[\"](?!text-decoration)(.*?)[\"][\s]*/", "",$content);
		$content=preg_replace("/(?<!<img|<p|<table|<tr|<td|<col|<span|\") /", "&nbsp;", $content);
		$space = array(" ", "　", "  ", " ", " ");
		$go_away = array(" ", " ", " ", " ", " ");
		//$content = str_replace($space, $go_away,$content);
		return $content;
	}
	//新闻详情过滤
	function getnewsContenttohtml($content)
	{
		$content = preg_replace("@<script(.*?)</script>@is", "", $content);
		$content = preg_replace("@<iframe(.*?)</iframe>@is", "", $content);
		$content=preg_replace("/\s+/", " ", $content);
		$content = preg_replace("/style=[\"](?!text-decoration|color)(.*?)[\"]/", "",$content);
		$space = array(" ", "　", "  ", " ", " ");
		$go_away = array(" ", " ", " ", " ", " ");
		$content = str_replace($space, $go_away, $content);
		return $content;
	}
	//保存摘要过滤
	function saveabstract($content)
	{
		$content = preg_replace("@<script(.*?)</script>@is", "", $content);
		$content = preg_replace("@<iframe(.*?)</iframe>@is", "", $content);
		$content = preg_replace("@<style(.*?)</style>@is", " ", $content);
		$content=preg_replace("/\s+/", " ", $content);
		//$content = preg_replace("/style=[\"\'](.*?)[\"\']/", "",$content);
		$content = preg_replace("/style=[\"](?!text-decoration)(.*?)[\"]/", "",$content);
		$content = preg_replace("@<(.*?)>@is", "", $content);
		//$content = preg_replace("/(\&nbsp\;)/", " ", strip_tags($content));
		$content = str_replace(PHP_EOL, '', $content);
		$space = array(" ", "　", "  ", " ", " ");
		$go_away = array(" ", " ", " ", " ", " ");
		$content = str_replace($space, $go_away, $content);
		return $content;
	}
	//搜索过滤
	function seaech_tags($keyword){
		$keyword = preg_replace('/(\（|\(|\)|\）)[\s]*/', "", $keyword);
		$keyword = preg_replace('/(\')[\s]*/', " ", $keyword);
		$keyword = preg_replace('/(\。)*$/', '', $keyword);
		return $keyword;
	}
	//计算文件大小
	function gefilesize($num) {
		$format='bytes';
		$pt=0;
		if($num>0 && $num<1024) {
			$pt=0;
			return number_format($num).' '.$format;
		}
		if($num>=1024 && $num<pow(1024, 2)){
			$pt=1;
			$format = 'KB';
		}
		if($num>=pow(1024, 2) && $num<pow(1024, 3)) {
			$pt=2;
			$format = 'MB';
		}
		if ($num>=pow(1024, 3) && $num<pow(1024, 4)) {
			$pt=3;
			$format = 'GB';
		}
		if ($num>=pow(1024, 4) && $num<pow(1024, 5)) {
			$pt=3;
			$format = 'TB';
		}
		$num /= pow(1024, $pt);
		return number_format($num, 2).' '.$format;
	}