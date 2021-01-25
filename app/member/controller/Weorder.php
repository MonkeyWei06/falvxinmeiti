<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/20
 * Time: 10:19
 */
namespace app\member\controller;
use think\Db;
use think\Session;
use think\Config;
use think\Request;
use think\Loader;
use app\common\controller\simple_html_dom;
class Weorder extends Common
{
	public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
		parent::checktype();
    }
    /**
     * 自媒体订单列表
     */
    public function index()
    {
        session('MenuCookie','2');
        $UrlParam=input();
        $where=array();
        if(!empty($UrlParam['order'])) $where['A.order_number'] = ['like','%'.$UrlParam['order'].'%'];
        if(!empty($UrlParam['title'])) $where['W.article_title'] = ['like','%'.$UrlParam['title'].'%'];
		if(!empty($UrlParam['article_customer'])) $where['W.article_customer'] = ['like','%'.$UrlParam['article_customer'].'%'];
		
         if(isset($UrlParam['status']) && $UrlParam['status']>='0'){
			
			$where['A.order_state'] = $UrlParam['status'];
		}else{
			$UrlParam['status']=-1;
		}
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
            $where['A.order_time']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
        $where['W.member_id']=$this->MemberID;
        $where['A.RegDomain']=$this->AgencySiteInfo['Domain'];
		$where['A.media_type']=2;
        $List =  Db::name('agencyorder')
            ->alias('A')
            ->field('A.*,W.article_title,W.article_customer,M.MediaTitle,W1.TypeName as mtmc')
            ->join('wearticle W', 'W.article_id=A.article_id', 'left')
            ->join('wemedia M', 'M.MediaID=A.media_id', 'left')
			->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
            ->where($where)
            ->order('A.order_time desc')
            ->paginate(20,false,['query'  => $UrlParam]);
		//echo Db::name('agencyorder')->getLastsql();
		//die;
        $_SESSION['UrlParamOrder']=$UrlParam;
        $this->assign('UrlParam',$UrlParam);
        $this->assign('list',$List);
        return view();
    }
    /**
     * 取消稿件
     */
    public function cancel(){
        $ID=input('ID','','abs');
        $order_state = 4;
        $fabu_site = '';
        $fabu_content = '';
        $Contrller=controller('common/Common');
        $Contrller->Refund($ID,$order_state,$fabu_site,$fabu_content);
        $this->success('操作成功！');
    }
    //导出我的媒体订单
    public function exportorderexcel()
    {
        $name='我的订单';
        $Info=$this->GetOrderListFull($_SESSION['UrlParamOrder']);
        if(!empty($Info))
        {
            //获取标题
            if(sizeof($Info)>1000) $this->alert('导出数据不能超过1000条，请筛选后再导出','back');
            $TitleInfo=GetExportTitle('memberorder');
            excelExport($name,$TitleInfo,$Info);
        }else{
            $this->alert('导出的数据为空','back');
            exit;
        }
    }
    public function GetOrderListFull($UrlParamOrder)
    {
        $where=array();
        if(!empty($UrlParamOrder['order'])) $where['A.order_number'] = ['like','%'.$UrlParamOrder['order'].'%'];
        if(!empty($UrlParamOrder['title'])) $where['W.article_title'] = ['like','%'.$UrlParamOrder['title'].'%'];
        $StartDate =!empty($UrlParamOrder['startdate'])? $UrlParamOrder['startdate']:'';
        $EndDate =!empty($UrlParamOrder['enddate'])? $UrlParamOrder['enddate']:'';
        if(!empty($StartDate) || !empty($EndDate)){
            if(empty($StartDate)) $StartDate=date('Y-m-d');
            if(empty($EndDate)) $EndDate=date('Y-m-d');
        }
        if(!empty($StartDate) && !empty($EndDate)){
            $StartDate=strtotime($StartDate);$EndDate=strtotime($EndDate);
            $MinDate=min($StartDate,$EndDate);$MaxDate=max($StartDate,$EndDate);
            $MaxDate+=86399;
            $UrlParamOrder['startdate']=date('Y-m-d',$MinDate);
            $UrlParamOrder['enddate']=date('Y-m-d',$MaxDate);
            $UrlParamOrder['MinDate']=$MinDate;$UrlParamOrder['MaxDate']=$MaxDate;
        }
        if(!empty($UrlParamOrder['MinDate']) && !empty($UrlParamOrder['MaxDate'])){
            $where['A.order_time']=array('between',[$UrlParamOrder['MinDate'],$UrlParamOrder['MaxDate']]);
        }
        $where['W.member_id']=$this->MemberID;
        $where['A.RegDomain']=$this->AgencySiteInfo['Domain'];
		$where['A.media_type']=2;
        $List =  Db::name('agencyorder')
            ->alias('A')
            ->field('A.*,W.article_title,M.MediaTitle')
            ->join('wearticle W', 'W.article_id=A.article_id', 'left')
            ->join('wemedia M', 'M.MediaID=A.media_id', 'left')
            ->where($where)
            ->order('A.article_id desc')
            ->select();
        if(!empty($List)){
            foreach($List as $key=>$val) {
                if ($val['order_state']==0)
                {
                    $List[$key]['order_statename']='待审核';
                }elseif($val['order_state']==1)
                {
                    $List[$key]['order_statename']='发布中';
                }elseif($val['order_state']==2)
                {
                    $List[$key]['order_statename']='已发布';
                }elseif($val['order_state']==3)
                {
                    $List[$key]['order_statename']='已退稿';
                }elseif($val['order_state']==4)
                {
                    $List[$key]['order_statename']='已取消';
                }
                if(!empty($val['order_time']))
                {
                    $List[$key]['order_stateaffirmtime']=date("Y-m-d H:i:s",$val['order_time']);
                }
                if(!empty($val['release_time']))
                {
                    $List[$key]['order_statereleasetime']=date("Y-m-d H:i:s",$val['release_time']);
                }else $List[$key]['order_statereleasetime']='';
            }
        }
        return $List;
    }

	/**
     * 我的媒体订单
     */
    public function myorder()
    {
		parent::checkmedia_man();
        session('MenuCookie','2');
        $UrlParam=input();
        $where=array();
        if(!empty($UrlParam['order'])) $where['A.order_number'] = ['like','%'.$UrlParam['order'].'%'];
        if(!empty($UrlParam['title'])) $where['W.article_title'] = ['like','%'.$UrlParam['title'].'%'];
		if(!empty($UrlParam['article_customer'])) $where['W.article_customer'] = ['like','%'.$UrlParam['article_customer'].'%'];
		
        if(isset($UrlParam['status']) && $UrlParam['status']>='0'){
			
			$where['A.order_state'] = $UrlParam['status'];
		}else{
			$UrlParam['status']=-1;
		}
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
            $where['A.order_time']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
        $where['A.RegDomain']=$this->AgencySiteInfo['Domain'];
		$where['A.media_type']=2;
		$where['M.MediaMemberID']=$this->MemberID;
        $List =  Db::name('agencyorder')
            ->alias('A')
            ->field('A.*,W.article_title,W.article_customer,W.article_remarks,M.MediaTitle,M.MediaMemberID,W1.TypeName as mtmc')
            ->join('wearticle W', 'W.article_id=A.article_id', 'left')
            ->join('wemedia M', 'M.MediaID=A.media_id', 'left')
			->join('wholetype W1', 'W1.TypeID=M.MediaWebNameID', 'left')//频道类型
            ->where($where)
            ->order('A.order_time desc')
            ->paginate(20,false,['query'  => $UrlParam]);
			$_SESSION['UrlParamOrder']=$UrlParam;
			$this->assign('UrlParam',$UrlParam);
			$this->assign('list',$List);
			return view();
    }
	/**
     * 收稿
     */
    public function collect(){
		parent::checkmedia_man();
        $ordernum=input('ordernum');
        $data['order_state']= 1;
		$result=Db::name('agencyorder')->where('order_number',$ordernum)->update($data);
		if($result){
			return json(array('code'=>'200','msg'=>'收稿成功！'));
		}else{
			return json(array('code'=>'201','msg'=>'收稿失败！'));
		}
    }

	/**
     * 发布
    */
    public function publish(){
		parent::checkmedia_man();
        $ordernum=input('ordernum');
        $data['order_state']= 2;
		$data['fabu_site']= input('url');

		$preg = "/^http(s)?:\\/\\/.+/";
		if(!preg_match($preg,$data['fabu_site']))
		{
			return json(array('code'=>'201','msg'=>'网址必须带http:// 或 https://'));
		}
		$result=Db::name('agencyorder')->where('order_number',$ordernum)->update($data);
		if($result){
			$info=Db::name('agencyorder')->where('order_number',$ordernum)->find();
			Db::name('Member')->where('MemberID',$info['member_id'])->setInc('MemberProfit',$info['media_money']);
			return json(array('code'=>'200','msg'=>'发布成功！'));
		}else{
			return json(array('code'=>'201','msg'=>'发布失败！'));
		}
    }

	/**
     * 拒稿
    */
    public function refuse(){
		parent::checkmedia_man();
		$ID=input('orderid');
        $order_state= 3;
		$fabu_site='';
		$fabu_content= input('reason');
		$Contrller=controller('common/Common');
		$result=$Contrller->weRefund($ID,$order_state,$fabu_site,$fabu_content);
		if($result){
			return json(array('code'=>'200','msg'=>'拒稿成功！'));
		}else{
			return json(array('code'=>'201','msg'=>'拒稿失败！'));
		}
    }


	//文章修改
	public function edit(){
			$ID = input('id');
			if($ID){
				$ArticleInfo=db('wearticle')->where('article_id',$ID)->where('member_id',$this->MemberID)->find();
				$title = $ArticleInfo['article_title'];
				$beizhu = $ArticleInfo['article_remarks'];
				$editorValue = $ArticleInfo['article_content'];
			}else{
				$this->error('文章不存在');
			}
			$this->assign('editorValue',$editorValue);
			$this->assign('beizhu',$beizhu);
			$this->assign('title',$title);
			$this->assign('id',$ID);
  			return $this->fetch();
		}

		//保存修改
	public function editsave(){
			$data = input();
			$res='';
			if($data && $data['article_id']>0){
				$res=Db::name('wearticle')->where('article_id',$data['article_id'])->update($data);
 			}
  			if($res){
				$this->error('修改成功');
			}else{
				$this->error('修改失败');
			}
		}
}