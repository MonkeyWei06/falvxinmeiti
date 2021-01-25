<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/8/5
 * Time: 10:57
 */
namespace app\agency_admin\controller;
use think\Config;
use think\Db;
class Agencyfund extends Agency
{
    /**
     * 资金记录
     */
    public function topuplist(){
        $UrlParam=input();
        $this->assign('UrlParam',$UrlParam);
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
        $Where=array();
        if(empty($UrlParam['MemberID'])){
            $Where['BalanceMemberID']=$this->AgencyMemberID;
        }else{
            $Where['BalanceMemberRecommendID']=$this->AgencyMemberID;
            $Where['BalanceMemberID']=$UrlParam['MemberID'];
        }
        $Model=new \app\agency_admin\model\Balance();
        $List=$Model->GetMemberBalanceList($UrlParam,$Where,20);
		$this->assign('List',$List);
		 $WhereArr=array();
		 if(!empty($UrlParam['MinDate']) && !empty($UrlParam['MaxDate'])){
            $WhereArr['BalanceTime']=array('between',[$UrlParam['MinDate'],$UrlParam['MaxDate']]);
        }
		//支付宝充值统计
		$zfb_money =  $Model->where('BalanceMemberID',$this->AgencyMemberID)->where('BalanceType',1)->where('BalanceGroup',2)->where('BalancePayState',1)->where($WhereArr)->sum('BalanceCount');
		$this->assign('zfb_money',$zfb_money);
		//总充值
		//发布文章
		$order_money =$Model
            ->alias('b')
            ->field('b.*,o.order_state')
            ->join('agencyorder o', 'b.BalanceNumber=o.order_number', 'left')
            ->where('b.BalanceGroup',4)
			->where('o.order_state',2)
			->where('b.BalanceMemberID',$this->AgencyMemberID)
			->where($WhereArr)
            ->sum('BalanceCount');
		$this->assign('order_money',$order_money);
        return $this->fetch();
    }
    /**
     * 充值
     */
    public function recharge()
    {
        $fuji = Db::name('member')->where('MemberID',$this->AgencyMemberInfo['MemberRecommendID'])->find();
        if($fuji){
            $alipay = Db::name('alipay')->where('AliPayMemberID',$fuji['MemberID'])->where('AliPayState',1)->find();
            //$alipay = Db::name('alipay')->where('AliPayMemberID',39)->where('AliPayState',1)->find();
            if(!empty($alipay['AliPayPicture'])) $alipay['AliPayPicture']=config('MainDomain').'uploads/erwm/'.$alipay['AliPayPicture'];
            if(!empty($alipay['AliPayWXPicture'])) $alipay['AliPayWXPicture']=config('MainDomain').'uploads/erwm/'.$alipay['AliPayWXPicture'];
            if(!empty($alipay['AliPayBankName'])) $alipay['AliPayBankName']= db('wholetype')->where(['TypeID'=>$alipay['AliPayBankName']])->value('TypeName');
        }else{
            $alipay=array();
            $alipay['AliPayType'] = 1;
            $alipay['BankAccout'] = true;
            $System=Config::get('systemparam');
            $this->assign('System',$System);
        }
		$alipay['MemberRecommendID'] = $this->AgencyMemberInfo['MemberRecommendID'];
        if(!$alipay) $this->error('充值暂未开启');
        $this->assign('Info',$alipay);
        return view();
    }
    public function alipay()
    {
        $Money = input('money');
        $Money2 = input('custommoney');
        if($Money=='custom') $Money=$Money2;
        if(!$Money) $this->error('请填写或选择充值金额');
        $fuji = Db::name('member')->where('MemberID',$this->AgencyMemberInfo['MemberRecommendID'])->find();
        if($fuji){
            $alipay = Db::name('alipay')->where('AliPayMemberID',$fuji['MemberID'])->where('AliPayState',1)->find();
        }else{
            $System=Config::get('systemparam');
            $alipay=array();
            $alipay['AliPayAPPID']=$System['AliPayAPPID'];
            $alipay['AliPayPublicKey']=$System['AliPayPublicKey'];
            $alipay['AliPayPrivateKey']=$System['AliPayPrivateKey'];
        }
        if(!$alipay) $this->error('暂时不可支付');
        $order_num = 'cz'.date('Ymd') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT) ;
        $data = [];
        $data['BalanceMemberRecommendID'] = $this->AgencyMemberInfo['MemberRecommendID'];
        $data['BalanceMemberRecommendPath'] = $this->AgencyMemberInfo['MemberRecommendPath'];
        $data['BalanceMemberID'] = $this->AgencyMemberInfo['MemberID'];
        $data['BalanceNumber'] = $order_num;
        $data['BalanceType'] = 1;
        $data['BalanceGroup'] = 2;
        $data['BalanceCount'] = $Money;
        $data['BalanceState']='1';
        $data['BalanceTime'] = time();
        $data['BalanceTitle'] = '支付宝充值';
        $BID = Db::name('balance')->insertGetId($data);
        $config = array (
            //应用ID,您的APPID。
            'app_id' => $alipay['AliPayAPPID'],
            //商户私钥，您的原始格式RSA私钥
            'merchant_private_key' => $alipay['AliPayPrivateKey'],
            //异步通知地址,只有扫码支付预下单可用
            'notify_url' => "http://".$_SERVER['HTTP_HOST']."/admin.php/payback/alipay_notify.html",
            //同步跳转
            //'return_url' => "http://".$_SERVER['HTTP_HOST']."/payback/alipay_successhtml",
            'return_url' => "http://".$_SERVER['HTTP_HOST']."/admin.php/admin/index.html",
            //编码格式
            'charset' => "UTF-8",
            //签名方式
            'sign_type'=>"RSA2",
            //支付宝网关
            'gatewayUrl' => "https://openapi.alipay.com/gateway.do",
            //支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
            'alipay_public_key' =>  $alipay['AliPayPublicKey'],
        );
        //dump($config);exit;
        //$Money=0.01;
        $str = controller('common/Common')->alipay($order_num,$Money,$config);
    }
    //未支付账单的二次支付
    public function alipay2(){
        $ID = input('id');
        //$Money = input('money');
        //if(!$Money) $this->error('请填写或选择充值金额');
        $fuji = Db::name('member')->where('MemberID',$this->AgencyMemberInfo['MemberRecommendID'])->find();
        if($fuji){
            $alipay = Db::name('alipay')->where('AliPayMemberID',$fuji['MemberID'])->where('AliPayState',1)->find();
        }else{
            $System=Config::get('systemparam');
            $alipay=array();
            $alipay['AliPayAPPID']=$System['AliPayAPPID'];
            $alipay['AliPayPublicKey']=$System['AliPayPublicKey'];
            $alipay['AliPayPrivateKey']=$System['AliPayPrivateKey'];
        }
        if(!$alipay) $this->error('暂时不可支付');
        $order_num = db('balance')->where('BalanceID',$ID)->value('BalanceNumber');
		$Money = db('balance')->where('BalanceID',$ID)->value('BalanceCount');
        $config = array (
            //应用ID,您的APPID。
            'app_id' => $alipay['AliPayAPPID'],
            //商户私钥，您的原始格式RSA私钥
            'merchant_private_key' => $alipay['AliPayPrivateKey'],
            //异步通知地址,只有扫码支付预下单可用
            'notify_url' => "http://".$_SERVER['HTTP_HOST']."/admin.php/payback/alipay_notify.html",
            //同步跳转
            'return_url' => "http://".$_SERVER['HTTP_HOST']."/admin.php/payback/alipay_successhtml",
            //编码格式
            'charset' => "UTF-8",
            //签名方式
            'sign_type'=>"RSA2",
            //支付宝网关
            'gatewayUrl' => "https://openapi.alipay.com/gateway.do",
            //支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
            'alipay_public_key' =>  $alipay['AliPayPublicKey'],
        );
        $str = controller('common/Common')->alipay($order_num,$Money,$config);
    }
    /**
     * 账单
     */
    public function bill()
    {
        return view();
    }
     public function bill_agent()
    {
        return view();
    }
    public function getbilllist()
    {
        $UrlParam=input();
        $this->assign('UrlParam',$UrlParam);
        $Where=array();
        $Where['agency_id']=$this->AgencyMemberInfo['MemberID'];
        $Where['MemberTypeID']=$this->AgencyMemberInfo['MemberTypeID'];
        $Model=new \app\agency_admin\model\Agencyorder();
        $List=$Model->GetBillList($UrlParam,$Where,20);
        $Back=array();
        $Back['code']='0';
        $Back['count']=empty($List[0])?'0':$List[0]->total();
        $Back['msg']='充值列表';
        $Back['data']=empty($List[0])?array():$List[0]->items();
        $Back['TotalMoney']=$List[1]>0?$List[1]:'0.00';
        return json($Back);
    }
    public function getbilllist_agent()
    {
        $UrlParam=input();
        $this->assign('UrlParam',$UrlParam);
        $Where=array();
        $Where['agency_id']=$this->AgencyMemberInfo['MemberID'];
        $Where['MemberTypeID']=$this->AgencyMemberInfo['MemberTypeID'];
        $Model=new \app\agency_admin\model\Agencyorder();
        $List=$Model->GetBillList($UrlParam,$Where,20,'*','agent');
        $Back=array();
        $Back['code']='0';
        $Back['count']=empty($List[0])?'0':$List[0]->total();
        $Back['msg']='充值列表';
        $Back['data']=empty($List[0])?array():$List[0]->items();
        $Back['TotalMoney']=$List[1]>0?$List[1]:'0.00';
        return json($Back);
    }
}