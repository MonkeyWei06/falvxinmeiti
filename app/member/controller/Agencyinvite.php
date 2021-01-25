<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/5
 * Time: 10:57
 */
namespace app\member\controller;
use app\member\model\Invite;
use think\Request;

class Agencyinvite extends Common
{
	 public function _initialize()
    {
        parent::_initialize();		
       parent::checktype();
    }
    //邀请码列表
    public function index(){
        return $this->fetch();
    }
    public function getinvitelist(){
        $UrlParam=input('get.');
        $this->assign('UrlParam',$UrlParam);
        $Where=array();
        $Where['InviteMemberID']=$this->MemberID;
		$Model=new Invite();
        $List=$Model->GetList($UrlParam,$Where,20);
        $Back=array();
        $Back['code']='0';
        $Back['count']=$List->total();
        $Back['msg']='邀请码列表';
        $Back['data']=$List->items();
        return json($Back);
    }
    //启用
    public function enable(){
        $InviteID=input('InviteID','','abs');
        if(empty($InviteID)) return json('1');
         $Where=array();
        $Where['InviteMemberID']=$this->MemberID;
        $Where['InviteID']=$InviteID;
		$Model=new Invite();
        $Model->where($Where)->update(['InviteState'=>'1']);
        return json('0');
    }
    //禁用
    public function forbidden(){
        $InviteID=input('InviteID','','abs');
        if(empty($InviteID)) return json('1');
         $Where=array();
        $Where['InviteMemberID']=$this->MemberID;
        $Where['InviteID']=$InviteID;
		$Model=new Invite();
        $Model->where($Where)->update(['InviteState'=>'0']);
        return json('0');
    }
    //删除
    public function del(){
        $InviteID=input('InviteID','','abs');
        if(empty($InviteID)) return json('1');
        $Where=array();
        $Where['InviteMemberID']=$this->MemberID;
        $Where['InviteID']=$InviteID;
		$Model=new Invite();
        $Model->where($Where)->delete();
        return json('0');
    }
    public function add(){
        if($this->request->isPost()){
            $Post=input('post.');
            $Where=array();
            //$Where['InviteMemberID']=$this->MemberID;
            $Where['InviteCode']=$Post['InviteCode'];
            $Count=db('Invite')->where($Where)->count();
            if(!empty($Count)) return json('1');

            $Post['InviteMemberID']=$this->MemberID;
            $Post['InviteState']=1;
            $Post['InviteTime']=time();
			$Url='http://'.$_SERVER['HTTP_HOST'].'/member.php/login/index?act=reg&invite='.$Post['InviteCode'];
			$Post['Invitehost']=$Url;
            db('Invite')->insert($Post);
            return json('0');
        }else {
            return $this->fetch();
        }
    }
	//查看推广业绩
    public function achievement()
    {
        $code = input('code');
 		$UrlParam=input('get.');
		$this->assign('UrlParam',$UrlParam);
        $Where=array();
		$UrlParam["MemberID"]=$this->MemberID;
		$memberinvite=db("invite")->where('InviteMemberID','eq',$this->MemberID)->where('InviteCode','eq',$code)->find();
		if(!$memberinvite)$this->error('暂无信息');
		$Where['MemberInviteCode']=$code;
		$StartDate = input('startdate', '');
        $EndDate = input('enddate', '');
        if(!empty($StartDate) || !empty($EndDate)){
            if(empty($StartDate)) $StartDate=date('Y-m-d');
            if(empty($EndDate)) $EndDate=date('Y-m-d');
        }
        if(!empty($StartDate) && !empty($EndDate)){
            $StartDate=strtotime($StartDate);$EndDate=strtotime($EndDate);
            $MinDate=min($StartDate,$EndDate);$MaxDate=max($StartDate,$EndDate);
            $MaxDate+=86399;
            $UrlParam['startdate']=date('Y-m-d',$MinDate);
            $UrlParam['enddate']=date('Y-m-d',$MaxDate);
            $UrlParam['MinDate']=$MinDate;$UrlParam['MaxDate']=$MaxDate;
        }
        if(!empty($UrlParam['MinDate']) && !empty($UrlParam['MaxDate'])){
             $wherebalance['BalanceTime']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }else{
			 $wherebalance['BalanceTime']=array('between',[220896000,time()]);
		}
		$Where['B.BalanceType']=1;
		$Where['B.BalanceGroup']=2;
		$Where['B.BalancePayState']=1;
		$List=db("Balance")
            ->alias('B')
			->field('B.*,M.MemberInviteCode,M.MemberMobile,M.MemberID')
			 ->join('member M', 'M.MemberID=B.BalanceMemberID', 'left')//频道类型
			->where($Where)
			->where($wherebalance)
			->paginate(20,false,['query'  => $UrlParam]);
		$page = $List->render();
		$data = $List->all();

		$Whered['BalanceType']=1;
		$Whered['BalanceGroup']=2;
		$Whered['BalancePayState']=1;

		$idarr =db('member')->where('MemberInviteCode',$code)->column('MemberID');
		if (!$idarr){
			$idarr='-1';
		}
		$whereArr['BalanceMemberID'] = array('in',$idarr);
		$Whered['BalanceType']=1;
		$Whered['BalanceGroup']=2;
		$Whered['BalancePayState']=1;
		foreach ($data as $key => $val) {
			$Wheremid['BalanceMemberID']=$val['MemberID'];
			//支付宝充值统计
			$zfb_money=db("Balance")->where($Whered)->where($Wheremid)->where($wherebalance)->sum('BalanceCount');
			//总充值
			$data[$key]['zczmoney']=$zfb_money;

			//发布文章
			/*$fabu_money =  db("Balance")->where('BalanceMemberID',$val['MemberID'])->where($Wherex)->where($wherebalance)->sum('BalanceCount');
			//退稿返回
			$tuigao_money = db("Balance")->where('BalanceMemberID',$val['MemberID'])->where($Wheret)->where($wherebalance)->sum('BalanceCount');
			$data[$key]['xfmoney']=$fabu_money;
			$data[$key]['tgmoney']=$tuigao_money;
			*/
        }
		//支付宝充值统计			
		$zfb_money1 = db("Balance")->where($Whered)->where($whereArr)->where($wherebalance)->sum('BalanceCount');
		//总充值
		$countmoney=$zfb_money1;
		//发布文章
		/*$fabu_money1 =  db("Balance")->where($whereArr)->where('BalanceGroup',4)->where('BalanceType',2)->where($wherebalance)->sum('BalanceCount');
		//退稿返回
		$tuigao_money1 = db("Balance")->where($whereArr)->where('BalanceGroup',3)->where('BalanceType',1)->where($wherebalance)->sum('BalanceCount');
		$this->assign('yxfmoney', $fabu_money1);
		$this->assign('tuigao_money', $tuigao_money1);
		*/
		$this->assign('countmoney', $countmoney);
		$this->assign('data', $data);
		$this->assign('page', $page); 
        return view();
     }
	function ewmhb(){

		$code=input('code');

		$data = "http://www.zxal.cn/member.php/reg.html?invite=$code"; //生成二维码的内容

		$logo = "static/img/logo.png";//你的logo地址
		$rootPath = 'Temp/qrcode/';
		//$path = $saveDir.'/'.$shop_id.'/';
		if (!is_dir($rootPath))
		{
			mkdir($rootPath,0777,true);
		}		
		$imageSrc = $rootPath.$code.'.png';
		require_once '../extend/phpqrcode/phpqrcode.php';
		$object = new \QRcode();
		
		$errorCorrectionLevel = 'L'; //容错级别
		$matrixPointSize = 4;        //生成图片大小（这个值可以根据你的实际情况来判断，但是必须是整数）
		
		$object::png($data,$imageSrc,$errorCorrectionLevel, $matrixPointSize, 2);

		if(file_exists($logo))
		{
			$QR = imagecreatefromstring(file_get_contents($imageSrc));        //目标图象连接资源。
			$logo = imagecreatefromstring(file_get_contents($logo));    //源图象连接资源。
			$QR_width = imagesx($QR);            //二维码图片宽度
			$QR_height = imagesy($QR);            //二维码图片高度
			$logo_width = imagesx($logo);        //logo图片宽度
			$logo_height = imagesy($logo);        //logo图片高度
			$logo_qr_width = $QR_width / 5;       //组合之后logo的宽度(占二维码的1/5)
			$scale = $logo_width/$logo_qr_width;       //logo的宽度缩放比(本身宽度/组合后的宽度)
			$logo_qr_height = $logo_height/$scale;  //组合之后logo的高度
			$from_width = ($QR_width - $logo_qr_width) / 2;   //组合之后logo左上角所在坐标点

			//重新组合图片并调整大小
			//imagecopyresampled() 将一幅图像(源图象)中的一块正方形区域拷贝到另一个图像中
			imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width,$logo_qr_height, $logo_width, $logo_height);
			//输出图片
			imagepng($QR, $imageSrc);
			imagedestroy($QR);
			imagedestroy($logo);
		}
		//背景图片区域 start
		$dst_path = 'static/img/hb.png';//背景图片路径
		$src_path = $imageSrc;//覆盖图
		//创建图片的实例
		$dst = imagecreatefromstring(file_get_contents($dst_path));
		$src = imagecreatefromstring(file_get_contents($src_path));
		//获取覆盖图图片的宽高
		list($src_w, $src_h) = getimagesize($src_path);

		//将覆盖图复制到目标图片上，最后个参数100是设置透明度（100是不透明）这里实现不透明效果
		imagecopymerge($dst, $src, 311, 701, 0, 0, $src_w, $src_h, 100);
		@unlink($imageSrc); //删除二维码与logo的合成图片
		$tmpbg = 'Temp/qrcode/'.$code.'.png';
		imagepng($dst, $tmpbg);//根据需要生成相应的图片
		imagedestroy($dst);
		imagedestroy($src);
		$this->assign('tmpbg', '/'.$tmpbg);
		$this->assign('code', $code); 
		return view();
		//背景图片区域 end
	 }
}