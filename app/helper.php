<?php
use sendmsg\SendUtility;
use think\Db;
use think\Request;
use think\Loader;
    //获取全局分类
    function GetCurrentWholeType($TypeID){
        $Where=array();
        $Where['TypePID']=$TypeID;
        $Where['TypeState']=1;
        $List=db::name('wholetype')->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        return $List;
    }
    //获取城市分类
    function GetCityTypeList($PID)
    {
        $Where=array();
        $Where['TypePID']=$PID;
        $Where['TypeState']=1;
        $List=db::name('citytype')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        return $List;
    }
    /**
     * 获得价格列表，刷新页面，用于前端显示：home agency模块公用
     */
    function getJiageList($UrlParam,$AgencySiteInfo,$Key,$pricelevel=1){
        $Where=array();
        $Where['MediaState']=1;
        if(!empty($Key)) $Where['t1.MediaTitle']=['like','%'.$Key.'%'];
        if(!empty($UrlParam['MediaWebNameID'])) $Where['t1.MediaWebNameID']=$UrlParam['MediaWebNameID'];
        if(!empty($UrlParam['MediaIndustryID'])) $Where['t1.MediaIndustryID']=$UrlParam['MediaIndustryID'];
        if(!empty($UrlParam['MediaCityID'])) $Where['t1.MediaCityID']=$UrlParam['MediaCityID'];
        if(!empty($UrlParam['MediaUrlTypeID'])) $Where['t1.MediaUrlTypeID']=$UrlParam['MediaUrlTypeID'];
        if(!empty($UrlParam['MediaSpeedID'])) $Where['t1.MediaSpeedID']=$UrlParam['MediaSpeedID'];
        if(!empty($UrlParam['MediaNewsSourceID'])) $Where['t1.MediaNewsSourceID']=$UrlParam['MediaNewsSourceID'];
        if(!empty($UrlParam['MediaCanSendID'])) $Where['t1.MediaCanSendID']=$UrlParam['MediaCanSendID'];
        if(!empty($UrlParam['MediaSpecialIndustryID'])) $Where['t1.MediaSpecialIndustryID']=$UrlParam['MediaSpecialIndustryID'];
        if(!empty($UrlParam['MediaSituationID'])) $Where['t1.MediaSituationID']=$UrlParam['MediaSituationID'];
        //if(!empty($UrlParam['MediaComputerWeightID'])) $Where['MediaComputerWeightID']=$UrlParam['MediaComputerWeightID'];
        if(!empty($UrlParam['MediaInLevelID'])) $Where['t1.MediaInLevelID']=$UrlParam['MediaInLevelID'];
        if(!empty($UrlParam['MediaPrice'])){
            if($UrlParam['MediaPrice']==1){
                $Where['t1.MediaMemberPrice'.$pricelevel]=['<=',50];
            }else if($UrlParam['MediaPrice']==2){
                $Where['t1.MediaMemberPrice'.$pricelevel]=[['<=',100],['>',50]];;
            }else if($UrlParam['MediaPrice']==3){
                $Where['t1.MediaMemberPrice'.$pricelevel]=[['<=',200],['>',100]];;
                $Where['t1.MediaMemberPrice'.$pricelevel]=['>',100];
            }else if($UrlParam['MediaPrice']==4){
                $Where['t1.MediaMemberPrice'.$pricelevel]=['>',200];
            }
        }
        $Sort=2;
        if(!empty($UrlParam['OrderWay'])){
            $Order=$UrlParam['OrderWay'];
            if($Order==1){
                $OrderStr=$Sort==2?'t1.MediaMemberPrice'.$pricelevel.' asc': 't1.MediaSpeedID asc';
            }elseif($Order==2){
                $OrderStr=$Sort==2?'t1.MediaPlatformCGL desc' : 't1.MediaPlatformCGL asc';
            }elseif($Order==3){
                $OrderStr=$Sort==2?'t1.MediaComputerWeightID desc' : 't1.MediaComputerWeightID asc';
            }elseif($Order==4){
                $OrderStr=$Sort==2?'t1.MediaMobileWeightID desc' : 't1.MediaMemberPrice1 asc';
            }
        }else $OrderStr='t1.MediaId asc';
        /*if(!empty($Order)){
            if($Order==1){
                $OrderStr=$Sort==1?'t1.MediaMobileWeightID desc' : 't1.MediaMobileWeightID asc';
            }elseif($Order==2){
                $OrderStr=$Sort==2?'t1.MediaSpeedID desc' : 't1.MediaSpeedID asc';
            }elseif($Order==3){
                $OrderStr=$Sort==2?'t1.MediaComputerWeightID desc' : 't1.MediaComputerWeightID asc';
            }elseif($Order==4){
                $OrderStr=$Sort==2?'t1.MediaMemberPrice1 desc' : 't1.MediaMemberPrice1 asc';
            }
        }*/
        $Collect=input('collect','','trim');
		
        if($Collect=='list')
        {
            if(!empty(session('MemberID'))) $Where['W6.CollectMemberID']=session('MemberID');
            if(!empty($AgencySiteInfo['MemberID'])) $Where['W6.CollectAgencyDomainID']=$AgencySiteInfo['MemberID'];
            $List=db('Media')->alias('t1')
                ->field('t1.*,t2.TypeName as TypeName2,t4.TypeName as TypeName4,t5.TypeName as TypeName5,t6.TypeName as TypeName6')
                ->join('__WHOLETYPE__ t2','t1.MediaWebNameID=t2.TypeID','left')
                //->join('__WHOLETYPE__ t3','t1.MediaIndustryID=t3.TypeID','left')t3.TypeName as TypeName3,
                ->join('__WHOLETYPE__ t4','t1.MediaNewsSourceID=t4.TypeID','left')
                ->join('__WHOLETYPE__ t5','t1.MediaNewsSourceID=t5.TypeID','left')
                ->join('__WHOLETYPE__ t6','t1.MediaUrlTypeID=t6.TypeID','left')
                ->join('__COLLECT__ W6', 'W6.CollectGoodsID=t1.MediaID', 'left')
                ->where($Where)->order($OrderStr)
                ->paginate(20,false,['query'  => $UrlParam])
                ->each(function($val, $key)use($AgencySiteInfo){
                    $WebUrl=0;
                    if($val['MediaComputerWeightID']==89) $WebUrl=0;
                    if($val['MediaComputerWeightID']==90) $WebUrl=1;
                    if($val['MediaComputerWeightID']==91) $WebUrl=2;
                    if($val['MediaComputerWeightID']==92) $WebUrl=3;
                    if($val['MediaComputerWeightID']==93) $WebUrl=4;
                    if($val['MediaComputerWeightID']==94) $WebUrl=5;
                    if($val['MediaComputerWeightID']==95) $WebUrl=6;
                    if($val['MediaComputerWeightID']==96) $WebUrl=7;
                    if($val['MediaComputerWeightID']==97) $WebUrl=8;
                    if($val['MediaComputerWeightID']==98) $WebUrl=9;
                    $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                    $MobileUrl=0;
                    if($val['MediaMobileWeightID']==100) $MobileUrl=0;
                    if($val['MediaMobileWeightID']==101) $MobileUrl=1;
                    if($val['MediaMobileWeightID']==102) $MobileUrl=2;
                    if($val['MediaMobileWeightID']==103) $MobileUrl=3;
                    if($val['MediaMobileWeightID']==104) $MobileUrl=4;
                    if($val['MediaMobileWeightID']==105) $MobileUrl=5;
                    if($val['MediaMobileWeightID']==106) $MobileUrl=6;
                    if($val['MediaMobileWeightID']==107) $MobileUrl=7;
                    if($val['MediaMobileWeightID']==108) $MobileUrl=8;
                    if($val['MediaMobileWeightID']==109) $MobileUrl=9;
                    $val['MobileUrl']=$MobileUrl;
                    if($val['UserType']<=2){
                        $Count1=db('agencyorder')->where('media_id',$val['MediaID'])->count();
                        $Count2=db('agencyorder')->where(['media_id'=>$val['MediaID'],'order_state'=>2])->count();
                        $val['ChuGaoLv']=empty($Count2)? '100' : round($Count2/$Count1*100,2);
                    }else $val['ChuGaoLv']=$val['MediaPlatformCGL'];
                    $val['MemberLevelPrice']=$val['MediaMemberPrice1'];
                    $val['MemberLevelPrice2']=$val['MediaMemberPrice2'];
                    $MInfo=Db::name('member')->where('MemberID',session('MemberID'))->find();
                    if(!empty($MInfo['MemberPriceType']) && ($MInfo['MemberPriceType']==118)){
                        $val['MemberLevelPrice3']=$val['MediaMemberPrice3'];
                    }
                    $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                    $Media=db('collect')
                        ->where('CollectMemberID',session('MemberID'))
                        ->where('CollectAgencyDomainID',$AgencySiteInfo['MemberID'])
                        ->where('CollectGoodsID',$val['MediaID'])
                        ->find();
                    $val['CollectState']=empty($Media['CollectID'])?'0':'1';
                    if($AgencySiteInfo['MemberID']!=-1){
                        $AllPrice=controller('common/Common')->allprice($AgencySiteInfo['MemberID'],$val['MediaID']);
                        $val['MemberLevelPrice']=$AllPrice['price_one'];
                        $val['MemberLevelPrice2']=$AllPrice['price_two'];
                        $val['MemberLevelPrice3']=$AllPrice['price_three'];
                    }
                    return $val;
                });
        }else{
            $List=db('Media')->alias('t1')
                ->field('t1.*,t2.TypeName as TypeName2,t4.TypeName as TypeName4,t5.TypeName as TypeName5,t6.TypeName as TypeName6')
                ->join('__WHOLETYPE__ t2','t1.MediaWebNameID=t2.TypeID','left')
                //->join('__WHOLETYPE__ t3','t1.MediaIndustryID=t3.TypeID','left')t3.TypeName as TypeName3,
                ->join('__WHOLETYPE__ t4','t1.MediaNewsSourceID=t4.TypeID','left')
                ->join('__WHOLETYPE__ t5','t1.MediaNewsSourceID=t5.TypeID','left')
                ->join('__WHOLETYPE__ t6','t1.MediaUrlTypeID=t6.TypeID','left')
                ->where($Where)->order($OrderStr)
				
                ->paginate(20,false,['query'  => $UrlParam])
				//echo db('Media')->getLastsql();
				//die;
			
                ->each(function($val, $key)use($AgencySiteInfo){
					
                    $WebUrl=0;
                    if($val['MediaComputerWeightID']==89) $WebUrl=0;
                    if($val['MediaComputerWeightID']==90) $WebUrl=1;
                    if($val['MediaComputerWeightID']==91) $WebUrl=2;
                    if($val['MediaComputerWeightID']==92) $WebUrl=3;
                    if($val['MediaComputerWeightID']==93) $WebUrl=4;
                    if($val['MediaComputerWeightID']==94) $WebUrl=5;
                    if($val['MediaComputerWeightID']==95) $WebUrl=6;
                    if($val['MediaComputerWeightID']==96) $WebUrl=7;
                    if($val['MediaComputerWeightID']==97) $WebUrl=8;
                    if($val['MediaComputerWeightID']==98) $WebUrl=9;
                    $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                    $MobileUrl=0;
                    if($val['MediaMobileWeightID']==100) $MobileUrl=0;
                    if($val['MediaMobileWeightID']==101) $MobileUrl=1;
                    if($val['MediaMobileWeightID']==102) $MobileUrl=2;
                    if($val['MediaMobileWeightID']==103) $MobileUrl=3;
                    if($val['MediaMobileWeightID']==104) $MobileUrl=4;
                    if($val['MediaMobileWeightID']==105) $MobileUrl=5;
                    if($val['MediaMobileWeightID']==106) $MobileUrl=6;
                    if($val['MediaMobileWeightID']==107) $MobileUrl=7;
                    if($val['MediaMobileWeightID']==108) $MobileUrl=8;
                    if($val['MediaMobileWeightID']==109) $MobileUrl=9;
                    $val['MobileUrl']=$MobileUrl;
                    if($val['UserType']<=2){
                        $Count1=db('agencyorder')->where('media_id',$val['MediaID'])->count();
                        $Count2=db('agencyorder')->where(['media_id'=>$val['MediaID'],'order_state'=>2])->count();
                        $val['ChuGaoLv']=empty($Count2)? '100' : round($Count2/$Count1*100,2);
                    }else $val['ChuGaoLv']=$val['MediaPlatformCGL'];
                    $val['MemberLevelPrice']=$val['MediaMemberPrice1'];
                    $val['MemberLevelPrice2']=$val['MediaMemberPrice2'];
                    $MInfo=Db::name('member')->where('MemberID',session('MemberID'))->find();
                    if(!empty($MInfo['MemberPriceType']) && ($MInfo['MemberPriceType']==118)){
                        $val['MemberLevelPrice3']=$val['MediaMemberPrice3'];
                    }else  $val['MemberLevelPrice3']=$val['MediaMemberPrice3'];
                    $Media=db('collect')
                        ->where('CollectMemberID',session('MemberID'))
                        ->where('CollectAgencyDomainID',$AgencySiteInfo['MemberID'])
                        ->where('CollectGoodsID',$val['MediaID'])
                        ->find();
                    if($AgencySiteInfo['MemberID']!=-1){
                        $AllPrice=controller('common/Common')->allprice($AgencySiteInfo['MemberID'],$val['MediaID']);
                        $val['MemberLevelPrice']=$AllPrice['price_one'];
                        $val['MemberLevelPrice2']=$AllPrice['price_two'];
                        $val['MemberLevelPrice3']=$AllPrice['price_three'];
                    }
                    $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                    $val['CollectState']=empty($Media['CollectID'])?'0':'1';
                    return $val;
				
                });
				
				
        }
	
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


	/**
     * 获得自媒体列表，刷新页面，用于前端显示：home agency模块公用
     */
    function GetwemediaList($UrlParam,$AgencySiteInfo,$Key,$pricelevel=1){
		
        $Where=array();
        $Where['MediaState']=1;
        if(!empty($Key)) $Where['t1.MediaTitle']=['like','%'.$Key.'%'];
        if(!empty($UrlParam['MediaWebNameID'])) $Where['t1.MediaWebNameID']=$UrlParam['MediaWebNameID'];
        if(!empty($UrlParam['MediaIndustryID'])) $Where['t1.MediaIndustryID']=$UrlParam['MediaIndustryID'];
        if(!empty($UrlParam['MediaCityID'])) $Where['t1.MediaCityID']=$UrlParam['MediaCityID'];
		if(!empty($UrlParam['fennumid'])) $Where['t1.fans_num']=$UrlParam['fennumid'];
		if(!empty($UrlParam['MediaRedID'])) $Where['t1.read_num']=$UrlParam['MediaRedID'];
		if(!empty($UrlParam['auth'])) $Where['t1.account_auth']=$UrlParam['auth'];

        if(!empty($UrlParam['pricenum'])){
            if($UrlParam['pricenum']==1){
                $Where['t1.MediaMemberPrice'.$pricelevel]=['<=',50];
            }else if($UrlParam['pricenum']==2){
                $Where['t1.MediaMemberPrice'.$pricelevel]=[['>=',51],['<',200]];
            }else if($UrlParam['pricenum']==3){
                $Where['t1.MediaMemberPrice'.$pricelevel]=[['>=',201],['<',501]];
            }else if($UrlParam['pricenum']==4){
                $Where['t1.MediaMemberPrice'.$pricelevel]=[['>=',501],['<',1000]];
            }else if($UrlParam['pricenum']==5){
                $Where['t1.MediaMemberPrice'.$pricelevel]=[['>=',1001],['<=',2001]];
            }else if($UrlParam['pricenum']==6){
                $Where['t1.MediaMemberPrice'.$pricelevel]=[['>',2001],['<=',5000]];
            }else if($UrlParam['pricenum']==7){
                $Where['t1.MediaMemberPrice'.$pricelevel]=['>',5000];
            }
        }
		$OrderStr='t1.MediaId desc';

        $Collect=input('collect','','trim');
		
        if($Collect=='list')
        {
            if(!empty(session('MemberID'))) $Where['W6.CollectMemberID']=session('MemberID');

            if(!empty($AgencySiteInfo['MemberID'])) $Where['W6.CollectAgencyDomainID']=$AgencySiteInfo['MemberID'];
            $List=db('wemedia')->alias('t1')
                ->field('t1.*,t2.TypeName as TypeName2,t6.TypeName as TypeName6')
                ->join('__WHOLETYPE__ t2','t1.MediaWebNameID=t2.TypeID','left')
                ->join('__WHOLETYPE__ t6','t1.MediaUrlTypeID=t6.TypeID','left')
                ->join('__COLLECT__ W6', 'W6.CollectGoodsID=t1.MediaID', 'left')
                ->where($Where)->order($OrderStr)
                ->paginate(20,false,['query'  => $UrlParam])
                ->each(function($val, $key)use($AgencySiteInfo){
                    $WebUrl=0;     
					/*
                    if($val['MediaComputerWeightID']==98) $WebUrl=9;
                    $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                    $MobileUrl=0;
                    if($val['MediaMobileWeightID']==100) $MobileUrl=0;
                    $val['MobileUrl']=$MobileUrl;
					*/
                    if($val['UserType']<=2){
                        $Count1=db('agencyorder')->where('media_id',$val['MediaID'])->count();
                        $Count2=db('agencyorder')->where(['media_id'=>$val['MediaID'],'order_state'=>2])->count();
                        $val['ChuGaoLv']=empty($Count2)? '100' : round($Count2/$Count1*100,2);
                    }else $val['ChuGaoLv']=$val['MediaPlatformCGL'];
                    $val['MemberLevelPrice']=$val['MediaMemberPrice1'];
                    $val['MemberLevelPrice2']=$val['MediaMemberPrice2'];
                    $MInfo=Db::name('member')->where('MemberID',session('MemberID'))->find();
                    if(!empty($MInfo['MemberPriceType']) && ($MInfo['MemberPriceType']==118)){
                        $val['MemberLevelPrice3']=$val['MediaMemberPrice3'];
                    }
                    $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                    $Media=db('collect')
                        ->where('CollectMemberID',session('MemberID'))
                        ->where('CollectAgencyDomainID',$AgencySiteInfo['MemberID'])
                        ->where('CollectGoodsID',$val['MediaID'])
                        ->find();
                    $val['CollectState']=empty($Media['CollectID'])?'0':'1';
                    if($AgencySiteInfo['MemberID']!=-1){
                        $AllPrice=controller('common/Common')->weallprice($AgencySiteInfo['MemberID'],$val['MediaID']);
                        $val['MemberLevelPrice']=$AllPrice['price_one'];
                        $val['MemberLevelPrice2']=$AllPrice['price_two'];
                        $val['MemberLevelPrice3']=$AllPrice['price_three'];
                    }
                    return $val;
                });
        }else{

			
            $List=Db::name('wemedia')->alias('t1')
                ->field('t1.*,t2.TypeName as TypeName2,t3.TypeName as TypeName3,t4.TypeName as TypeName4')
                ->join('__WHOLETYPE__ t2','t1.MediaWebNameID=t2.TypeID','left')
                ->join('__WHOLETYPE__ t3','t1.MediaIndustryID=t3.TypeID','left')
				->join('__CITYTYPE__ t4','t1.MediaCityID=t4.TypeID','left')
                ->where($Where)->order($OrderStr)
                ->paginate(20,false,['query'  => $UrlParam])
                ->each(function($val, $key)use($AgencySiteInfo){
                    $WebUrl=0;
					if($val['TypeName4']==''){
                        $val['TypeName4']='综合全国';
                    }
                    $val['TypeName5']=ArrayCheck($val['fans_num'],'FanNum');
					$val['TypeName6']=ArrayCheck($val['read_num'],'ReadNum');
					/*
                    if($val['MediaComputerWeightID']==89) $WebUrl=0;
                    $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                    $MobileUrl=0;
                    if($val['MediaMobileWeightID']==100) $MobileUrl=0;
                    $val['MobileUrl']=$MobileUrl;*/
                    if($val['UserType']<=2){
                        $Count1=db('agencyorder')->where('media_id',$val['MediaID'])->count();
                        $Count2=db('agencyorder')->where(['media_id'=>$val['MediaID'],'order_state'=>2])->count();
                    }else $val['ChuGaoLv']=$val['MediaPlatformCGL'];

                    $val['MemberLevelPrice']=$val['MediaMemberPrice1'];
                    $val['MemberLevelPrice2']=$val['MediaMemberPrice2'];
					
                    $MInfo=Db::name('member')->where('MemberID',session('MemberID'))->find();
                    if(!empty($MInfo['MemberPriceType']) && ($MInfo['MemberPriceType']==118)){
                        $val['MemberLevelPrice3']=$val['MediaMemberPrice3'];
                    }else  $val['MemberLevelPrice3']=$val['MediaMemberPrice3'];
                    $Media=db('collect')
                        ->where('CollectMemberID',session('MemberID'))
                        ->where('CollectAgencyDomainID',$AgencySiteInfo['MemberID'])
                        ->where('CollectGoodsID',$val['MediaID'])
                        ->find();
                    if($AgencySiteInfo['MemberID']!=-1){
						//dump($val);
                        $AllPrice=controller('common/Common')->weallprice($AgencySiteInfo['MemberID'],$val['MediaID']);
                        $val['MemberLevelPrice']=$AllPrice['price_one'];
                        $val['MemberLevelPrice2']=$AllPrice['price_two'];
                        $val['MemberLevelPrice3']=$AllPrice['price_three'];

                    }
                    $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                    $val['CollectState']=empty($Media['CollectID'])?'0':'1';
                    return $val;
                });
				
        }
	
        return $List;
}
	// 媒体价格数数组
	function MpriceNum(){
		return array(1=>'0-50',2=>'51-100',3=>'101-200',4=>'200以上');
	}
	// 粉丝数数组
	function FanNum(){
		//“1”>0-1000 “5”>1001-5000 “10”>5001-1万 “50”>1万-5万 “100”>5万-10万 “1000”>10万-100万 “1001”>100万以上
		return array('1'=>'0-1000','5'=>'1001-5000','10'=>'5001-1万','50'=>'1万-5万','100'=>'5万-10万','1000'=>'10万-100万',			'1001'=>'100万以上');
	}
	// 阅读数数组
	function ReadNum(){
		return array(1=>'0-1000',5=>'1001-5000',10=>'5001-1万',50=>'1万-5万',100=>'5万-10万',101=>'10万-100万',102=>'100万以上');
	}
	// 价格数数组
	function PriceNum(){
		return array(1=>'0-50',2=>'51-200',3=>'201-500',4=>'501-1000',5=>'1001-2000',6=>'2001-5000',7=>'5000以上');
	}
	// 帐号认证数组
	function AuthNum(){
		return array(1=>'已认证',0=>'未认证');
	}
	// 发布类型数组
	function Release(){
		return array(1=>'直发',2=>'原创',3=>'直播');
	}
	// 视频数组
	function Can_video(){
		return array(1=>'可发',0=>'不可发');
	}
	// 周末可发数组
	function Weekend_publish(){
		return array(1=>'可发',0=>'不可发');
	}
	// 官方自媒体
	function authority_media(){
		return array(1=>'官方自媒体',0=>'非官方自媒体');
	}
	// 每日可发篇数
	function full_quota(){
		return array(1=>'1',2=>'2',3=>'3',4=>'5',5=>'10',6=>'不限量');
	}
	/*
	*视频自媒体自定义字段
	******************************************************************
	******************************************************************
	*/
	//视频自媒体性别

	function Gender(){
		return array(1=>'女',2=>'男');
	}
	//商品橱窗
	function Merchandise(){
		return array(0=>'无',1=>'有');
	}
	//是否探店
	function whether(){
		return array(0=>'否',1=>'是');
	}

	function refusewhy(){
		return array(0=>'内容不适合',1=>'无有效来源',2=>'已截稿',3=>'暂停收稿',4=>'重复提交',5=>'网站故障',6=>'标题不行',7=>'客户要求取消');
	}
	//自定义一维数组转二维数组
	function change_arry($arry){
		$data=array();
		foreach($arry as $k=>$vl){
			$data[]=array(
				'name'=>$vl,
				'id'=>$k
			);
		}
		return $data;
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
	/*
	  * 创建log记录
	  * $data String 记录内容
	  * $texname String text 名称
	*/
	function write_log($data,$texname,$type=1){ 
		$years = date('Y-m'); //设置路径目录信息 
		if($type==1){
			$url = 'txlog/'.$years.'/'.date('Ymd').$texname;
		}else{
			$url = 'mtlog/'.$years.'/'.date('Ymd').$texname;
		}
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
	//2019/11/21 星期四
	function Send_Smsjs($mibile,$mtext,$UserNamejs,$Passwordjs,$Signaturejs){
		if($mibile){
			$utility = new SendUtility();
			$RtnString = $utility->Sendjs($mibile,$mtext,$UserNamejs,$Passwordjs,$Signaturejs);
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
	function jsontt($code,$msg="",$count,$data=array()){  
            $result=array(
              'code'=>$code,
              'msg'=>$msg, 
			  'count'=>$count,
              'data'=>$data
            );
            //输出json  
            echo json_encode($result);  
            exit;  
	}