<?php 
/**
 * User: Administrator、
 * Date: 2017/8/5
 * Time: 10:57
 */
namespace app\home\controller;
use think\Controller;
use think\Db;
use think\Session;
use think\Config;
use think\Request;
use think\Loader;
use app\admin\model\Media;
use app\admin\model\HomePrice;
use app\home\model\Freedbook;

class Index extends Controller
{
    private $AgencySiteInfo=array();
    private $Config=array();
    public function _initialize(){
        $Controller=controller('common/Common');
        $GetCurrentDomainInfo=$Controller->GetCurrentDomainInfo();
        $this->AgencySiteInfo=$GetCurrentDomainInfo['SiteInfo'];
        //$Config=Db::name('config')->where(['ID'=>'1','MemberID'=>'-1'])->find();
        $Config=$GetCurrentDomainInfo['Config'];
        $this->Config=$Config;
        $this->assign('Config',$Config);
        $Music  = Db::name('config')->where('MemberID','<',0)->find();
        $this->assign('WebSiteMusic',$Music['WebSiteMusic']);
        $this->assign('SessionMemberID',session('MemberID'));
        $this->assign('SessionMemberName',session('MemberName'));

		$links=Db::name('links')->where(['NewsState'=>'1'])->order('NewsSort asc,NewsID desc')->select();
		$this->assign('links',$links);
    }
    public function index()
    {	
	
	  $list = Db::name('news')->where('NewsState',1)->order('NewsSort desc,NewsID desc')->limit(3)->select();
	  $this->assign('list',$list);
      return $this->fetch();
    }
    /**
     * 媒介价格
     */
    public function price()
    {		
        $UrlParam=input();
        $UrlParam=array_filter($UrlParam);
        $Order=input('Order');
        $this->assign('Order',$Order);
        $Sort=input('Sort');
        if(!empty($Sort)) $Sort=$Sort==1?2:1; else $Sort=1;
        $this->assign('Sort',$Sort);
        $Key=input('key');

        /*$searchkey=input('searchkey');
        if($searchkey==1){//点击链接，同时输入框为空
             unset($UrlParam['key']);
             $Key='';
        }
        unset($UrlParam['searchkey']);*/
        /*var_dump($UrlParam);
        var_dump($Key);*/

        if(session('MemberID')){
            $member=Db::name('member')->where('MemberID','=',session('MemberID'))->find();
            $pricelevel=$member['MemberPriceType']-115;
        }else{
            $pricelevel=1;
        }
        $List=getJiageList($UrlParam,$this->AgencySiteInfo,$Key,$pricelevel);
        $this->assign('List',$List);
        $this->assign('Key',$Key);//查询关键字
        $this->assign('UrlParam',$UrlParam);

        $this->assign('MediaWebNameID',GetCurrentWholeType(18));//	频道类型
        $this->assign('MediaIndustryID',GetCurrentWholeType(35));//综合门户媒体
        $this->assign('MediaCityID',GetCityTypeList('0'));//覆盖区域
        $this->assign('MediaUrlTypeID',GetCurrentWholeType(59));//链接类型
        $this->assign('MediaSpeedID',GetCurrentWholeType(66));//发稿速度
        $this->assign('MediaNewsSourceID',GetCurrentWholeType(73));//新闻源
        $this->assign('MediaCanSendID',GetCurrentWholeType(76));//周末可发
        $this->assign('MediaSpecialIndustryID',GetCurrentWholeType(79));//特别行业
        $this->assign('MediaSituationID',GetCurrentWholeType(85));//收录情况
        $this->assign('MediaInLevelID',GetCurrentWholeType(110));//入口级别
 		 if(!empty($UrlParam['MediaWebNameID']))			 
		{
			$Where['TypeID']=$UrlParam['MediaWebNameID'];
			$info=db::name('wholetype')->where($Where)->find();
			$this->assign('MediaWebName',$info['TypeName']);//频道类型
		}else{
			$this->assign('MediaWebName','');//频道类型
		}
		if(!empty($UrlParam['MediaIndustryID']))			 
		{
			$Where['TypeID']=$UrlParam['MediaIndustryID'];
			$infos=db::name('wholetype')->where($Where)->find();
			$this->assign('MediaIndustry',$infos['TypeName']);//频道类型
		}else{
			$this->assign('MediaIndustry','');//频道类型
		}
        return view();
    }
    //加入收藏
    public function collect()
    {
        $ID=input('id','','intval');
        $MemberID=intval(session('MemberID'));
        if($MemberID<=0) $this->result('','0','请先登录，再加入收藏');
        $Where=[];
        $Where['CollectMemberID']=$MemberID;
        $Where['CollectGoodsID']=$ID;
        $Where['CollectAgencyDomainID']=$this->AgencySiteInfo['Domain'];
        $count=Db::name('collect')->where($Where)->count();
        if($count>0) {
            Db::name('collect')->where($Where)->delete();
            $this->result('','1','您已取消');
        }
        $Data=[];
        $Data['CollectMemberID']=$MemberID;
        $Data['CollectGoodsID']=$ID;
        $Data['CollectAgencyDomainID']=$this->AgencySiteInfo['Domain'];
        $Data['CollectTime']=time();
        Db::name('collect')->insert($Data);
        $this->result('','2','收藏成功');
    }

	 /**
     * 软文写手
     */
    public function writer()
    {
        return view();
    }
    /**
     * 联系我们
     */
    public function contact()
    {
        $WebSiteCoordinate=empty($this->Config['WebSiteCoordinate']) ? [] : $this->Config['WebSiteCoordinate'];
        $WebSiteCoordinateArr=empty($WebSiteCoordinate) ? [] : explode(',',$WebSiteCoordinate);
        $this->assign('WebSiteCoordinateArr',$WebSiteCoordinateArr);
        return view();
    }
    /**
     * 营销学院
     */
    public function newslist()
    {
        $list = Db::name('news')->where('NewsState',1)->order('NewsSort desc,NewsID desc')->paginate(10);
        $this->assign('list',$list);
        $this->assign('page',$list->render());
        return view();
    }
    /**
     * 营销学院查看
     */
    public function newsview()
    {
        $id = input('id');
        $Info = Db::name('news')->where('NewsID',$id)->where('NewsState',1)->find();
        if(!$Info) $this->error('新闻不存在');
        $this->assign('info',$Info);
        $shang = Db::name('news')->field('NewsID,NewsTitle')->where('NewsSort','<',$Info['NewsSort'])->where('NewsState',1)->order('NewsSort desc')->find();
        if(!$shang) $shang= Db::name('news')->field('NewsID,NewsTitle')->where('NewsID','<',$Info['NewsID'])->where('NewsState',1)->order('NewsSort')->find();
        $str = $shang?'<a href="'.url('newsview',['id'=>$shang['NewsID']]).'">'.$shang['NewsTitle'].'</a>':'无';
        $this->assign('shang',$str);
        $xia = Db::name('news')->field('NewsID,NewsTitle')->where('NewsSort','>',$Info['NewsSort'])->where('NewsState',1)->order('NewsSort')->find();
        if(!$xia) $xia=Db::name('news')->field('NewsID,NewsTitle')->where('NewsID','>',$Info['NewsID'])->where('NewsState',1)->order('NewsSort')->find();
        $str = $xia?'<a href="'.url('newsview',['id'=>$xia['NewsID']]).'">'.$xia['NewsTitle'].'</a>':'无';
        $this->assign('xia',$str);
        return view();
    }
    /**
     * 预览
     */
    public function look()
    {
        $id = input('id');
		$snid = input('snid');
        if($id){
            $Info = Db::name('article')->where('article_id',$id)->find();
            $this->assign('title',$Info['article_title']);
            $this->assign('html',$Info['article_content']);
            $this->assign('beizhu',$Info['article_remarks']);
            $order=Db::name('agencyorder')->where('agencyorder_id','eq',$snid)->find();
            if($order) $this->assign('meiti',$order['media_name']);
            else  $this->assign('meiti','');
            $this->assign('member',0);
		
        }else{
            $this->assign('member',1);
            $this->assign('title',input('opentitle'));
            $this->assign('html',input('opencontent'));
            $this->assign('beizhu',input('openbeizhu'));
        }
        return view();
    }
	 /**
     * 预览
     */
    public function welook()
    {
        $id = input('id');
		$snid = input('snid');
        if($id){
            $Info = Db::name('wearticle')->where('article_id',$id)->find();
            $this->assign('title',$Info['article_title']);
            $this->assign('html',$Info['article_content']);
            $this->assign('beizhu',$Info['article_remarks']);
            $order=Db::name('agencyorder')->where('agencyorder_id','eq',$snid)->find();
            if($order) $this->assign('meiti',$order['media_name']);
            else  $this->assign('meiti','');
            $this->assign('member',0);
		
        }else{
            $this->assign('member',1);
            $this->assign('title',input('opentitle'));
            $this->assign('html',input('opencontent'));
            $this->assign('beizhu',input('openbeizhu'));
        }
        return view();
    }
    //导出
    public function exportexcel(){
        if(empty(session('MemberID'))) return json('2');
        $UrlParam=input();
        $MemberInfo=db('member')->where('MemberID',session('MemberID'))->find();
        $name='媒体价格';
        $Where=array();
        $searchItems = array("MediaWebNameID", "MediaIndustryID", "MediaNewsSourceID", "MediaComputerWeightID","MediaMobileWeightID","MediaUrlTypeID","MediaInLevelID","MediaID","MediaCityID");
        foreach ($UrlParam as $key => $value) {
            if(in_array($key, $searchItems)){
                $Where[$key]=$value;
            }
        }
        $Model=new \app\member\model\Media();
        $Info=$Model->GetMediaListFull($UrlParam,$Where,session('MemberID'),$this->AgencySiteInfo['MemberID']);
        if(!empty($Info)){
            if(sizeof($Info)>1000){
                echo "<script>alert('导出的数据不能超过1000条');window.history.go(-1)</script>";
                exit;
            }
            //获取标题
            $TitleInfo=GetExportTitle('memmerdia');
            excelExport($name,$TitleInfo,$Info);
        }else{
            return json('1');
            exit;
        }
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

		 if(!empty($UrlParam['MediaWebNameID']))			 
		{
			$Where['TypeID']=$UrlParam['MediaWebNameID'];
			$info=db::name('wholetype')->where($Where)->find();
			$this->assign('MediaWebName',$info['TypeName']);//频道类型
		}else{
			$this->assign('MediaWebName','');//频道类型
		}
		if(!empty($UrlParam['MediaIndustryID']))			 
		{
			$Where['TypeID']=$UrlParam['MediaIndustryID'];
			$infos=db::name('wholetype')->where($Where)->find();
			$this->assign('MediaIndustry',$infos['TypeName']);//频道类型
		}else{
			$this->assign('MediaIndustry','');//频道类型
		}
        return view();
    }

/*底部留言*/
	public function freedbook(){
			
		$Request=Request::instance();
		if($Request->isPost())
		{
			$name=input('post.name');
			$phone=input('post.phone');
			$content=input('post.content');
			$_POST['addtime']=time();
			$Model=new \app\home\model\Freedbook();
			$Model->data($_POST)->save();
			$InsertID=$Model->id;
			if($InsertID){
				return $this->success('信息提交成功，请保持电话畅通，我们稍后将会跟您联系！');
			}else{
				return $this->error('失败，请联系管理员');
			}
		}
	}
	public function lookg()
    {
        $id = input('id');
        if($id){
			$where['A.id']=$id;
             $Info =  Db::name('changedoc')
            ->alias('A')
            ->field('A.*,W.article_id,W.media_name,W.fabu_site,W.fabu_content')            
			->join('agencyorder W', 'W.agencyorder_id=A.orderid', 'left')
            ->where($where)
            ->order('A.addtime desc')
			->find();
            $this->assign('Info',$Info);
        }
        return view();
    }
}