<?php
namespace app\agency\controller;
use think\Controller;
use think\Db;
use think\Session;
use think\Config;
use think\Request;
use think\Loader;
use app\admin\model\Media;
use app\admin\model\HomePrice;
class Index extends Controller
{
    private $AgencySiteInfo=array();
    private $Config=array();
    public function _initialize(){
        $Controller=controller('common/Common');
        $GetCurrentDomainInfo=$Controller->GetCurrentDomainInfo();
        $this->AgencySiteInfo=$GetCurrentDomainInfo['SiteInfo'];
        $this->Config=$GetCurrentDomainInfo['Config'];
        $this->assign('Config',$this->Config);
        $this->assign('SessionMemberID',session('MemberID'));
        $this->assign('SessionMemberName',session('MemberName'));
		$this->assign('path',config("MainDomain").'uploads/');
		 //获取当前方法名
		$this->assign('act',request()->action());
    }
    public function index()
    {
		
        $Where=array();
        $Where['picmember_id']=$this->AgencySiteInfo['MemberID'];
        $Where['pictures_state']=1;
        $list = Db::name('pictures')->where($Where)->order('pictures_sort asc,pictures_id asc')->select();
        if(!empty($list)){
            foreach($list as $key=>$val){
                $list[$key]['pictures_path']=config('MainDomain').'uploads/lbt/'.$val['pictures_path'];
            }
        }
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function jiage()
    {
        $UrlParam=input();
        $UrlParam=array_filter($UrlParam);
        $this->assign('UrlParam',$UrlParam);
        $Order=input('Order');
        $this->assign('Order',$Order);
        $Sort=input('Sort');
        if(!empty($Sort)) $Sort=$Sort==1?2:1; else $Sort=1;
        $this->assign('Sort',$Sort);
        $Key=input('key');
        $this->assign('Key',$Key);//查询关键字
        $List=getJiageList($UrlParam,$this->AgencySiteInfo,$Key);
        $this->assign('List',$List);
        $this->assign('MediaWebNameID',GetCurrentWholeType(18));//	频道类型
        $this->assign('MediaIndustryID',GetCurrentWholeType(35));//综合门户媒体
        $this->assign('MediaCityID',GetCityTypeList('0'));//覆盖区域
        $this->assign('MediaUrlTypeID',GetCurrentWholeType(59));//链接类型
        $this->assign('MediaSpeedID',GetCurrentWholeType(66));//发稿速度
        $this->assign('MediaNewsSourceID',GetCurrentWholeType(73));//新闻源
        $this->assign('MediaCanSendID',GetCurrentWholeType(76));//周末可发
        $this->assign('MediaSpecialIndustryID',GetCurrentWholeType(79));//特别行业
        $this->assign('MediaSituationID',GetCurrentWholeType(85));//收录情况
        //$this->assign('MediaComputerWeightID',GetCurrentWholeType(88));//电脑权重
       // $this->assign('MediaMobileWeightID',GetCurrentWholeType(99));//移动权重
        $this->assign('MediaInLevelID',GetCurrentWholeType(110));//入口级别
//        $Array=array();
//        $Array['1']='0~50';$Array['2']='51~100';$Array['3']='101~200';$Array['4']='200以上';
//        $this->assign('MediaPrice',$Array);//价格分类
        return $this->fetch();
    }
    //加入收藏
    public function collect()
    {
        $ID=input('id','','intval');
        $MemberID=intval(session('MemberID'));
        if($MemberID<=0) $this->result('','0','请先登录，再加入收藏');
        $Where=array();
        $Where['CollectMemberID']=$MemberID;
        $Where['CollectGoodsID']=$ID;
        $Where['CollectAgencyDomainID']=$this->AgencySiteInfo['MemberID'];
        $count=Db::name('collect')->where($Where)->count();
        if($count>0) {
            Db::name('collect')->where($Where)->delete();
            $this->result('','1','您已取消');
        }
        $Data=array();
        $Data['CollectMemberID']=$MemberID;
        $Data['CollectGoodsID']=$ID;
        $Data['CollectAgencyDomainID']=$this->AgencySiteInfo['MemberID'];
        $Data['CollectTime']=time();
        Db::name('collect')->insert($Data);
        $this->result('','2','收藏成功');
    }
    public function about()
    {
		
        return $this->fetch();
    }

	//自媒体价格
	 public function wemedia()
    {
		 //dump($this->AgencySiteInfo);
		//die;
		
		$Request=Request::instance();
		$UrlParam=input();
        $UrlParam=$UrlParam;
		$Key=input("key");

        if(session('MemberID')){
            $member=Db::name('member')->where('MemberID','=',session('MemberID'))->find();
            $pricelevel=$member['MemberPriceType']-115;
        }else{
            $pricelevel=1;
        }
        $List=GetwemediaList($UrlParam,$this->AgencySiteInfo,$Key,$pricelevel); 	
		//ar_dump($List);
        $this->assign('List',$List);
        $this->assign('UrlParam',$UrlParam);
        $this->assign('MediaWebNameID',GetCurrentWholeType(157));//	平台
        $this->assign('MediaIndustryID',GetCurrentWholeType(160));//行业类型
        $this->assign('MediaCityID',GetCityTypeList('0'));//区域
		//粉丝数 
        $this->assign('fennumid',FanNum());//粉丝数
        $this->assign('MediaRedID',ReadNum());//阅读数

		$this->assign('pricenum',PriceNum());//价格
		$this->assign('auth',AuthNum());//帐号认证
        return view();
    }

    public function auto_query_cron(){
        set_time_limit(0);
        controller('common/Hezi')->autoquery();
    }
	 /**
     * 合作加盟
     */
    public function join()
    {
        return view();
    }

	 /**
     * 软文写手
     */
    public function writer()
    {
		if(!$this->Config['WebSiteWXWBContent']) $this->Config['WebSiteWXWBContent']='100,150,200,249,300';
		$wprice=explode(',',rtrim($this->Config['WebSiteWXWBContent'],','));	
		$this->assign('wprice',$wprice);//设置写稿价格
        return view();
    }
}