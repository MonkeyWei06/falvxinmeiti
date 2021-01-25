<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/19
 * Time: 11:48
 */
namespace app\member\controller;
use app\member\Validate\ChangePwd;
use think\Config;
use think\Session;
use think\Db;
use think\Log;
class Member extends Common
{
    protected  $model;
    public function  _initialize()
    {
        parent::_initialize();
        $this->model = model('member');
    }
    public function recharge()
    {
        session('MenuCookie','1');
        $fuji = Db::name('member')->where('MemberID',$this->MemberInfo['MemberRecommendID'])->find();
		$alipay=array();
        if($fuji){
            $alipay = Db::name('alipay')->where('AliPayMemberID',$fuji['MemberID'])->where('AliPayState',1)->find();
            if(!empty($alipay['AliPayPicture'])) $alipay['AliPayPicture']=config('MainDomain').'uploads/erwm/'.$alipay['AliPayPicture'];
            if(!empty($alipay['AliPayWXPicture'])) $alipay['AliPayWXPicture']=config('MainDomain').'uploads/erwm/'.$alipay['AliPayWXPicture'];
            if(!empty($alipay['AliPayBankName'])) $alipay['AliPayBankName']= db('wholetype')->where(['TypeID'=>$alipay['AliPayBankName']])->value('TypeName');
        }else{
            $alipay['AliPayType'] = 1;
            $alipay['BankAccout'] = true;
            $System=Config::get('systemparam');
            $this->assign('System',$System);
        }
		if(!$alipay||$alipay=='null') $this->error('充值暂未开启，请联系管理员');
		$alipay['RegDomain'] =$this->MemberInfo['RegDomain'];		
        $this->assign('Info',$alipay);
        return view();
    }
    public function alipay()
    {
		
        $fuji = Db::name('member')->where('MemberID',$this->MemberInfo['MemberRecommendID'])->find();
        if($fuji)
        {
            $alipay = Db::name('alipay')->where('AliPayMemberID',$fuji['MemberID'])->where('AliPayState',1)->find();
        }else{
            //$alipay = Db::name('alipay')->where('AliPayMemberID',0)->where('AliPayState',1)->find();
            $alipay=array();
            $System=Config::get('systemparam');
			if(!$System['AliPayPrivateKey']) $this->error('请配置支付接口');
            $alipay['AliPayPrivateKey'] = $System['AliPayPrivateKey'];
            $alipay['AliPayPublicKey'] = $System['AliPayPublicKey'];
            $alipay['AliPayAPPID'] = $System['AliPayAPPID'];
        }
        if(!$alipay) $this->error('支付暂未开启');
        $id = input('id');
		
        if($id)
        {
            $info = Db::name('balance')
                ->where('BalanceMemberID',$this->MemberInfo['MemberID'])
                ->where('BalanceID',$id)
                ->where('BalancePayState','0')
                ->where('BalanceState',1)
                ->find();
            if(!$info) $this->error('订单不存在或已失效');
            $Money = $info['BalanceCount'];
            $order_num = $info['BalanceNumber'];
        }else{
            $order_num = 'cz'.order_num();
            $Money = input('money');
            $Money2 = input('custommoney');
            if($Money=='custom') $Money=$Money2;
            if(!$Money)   $this->error('请填写或选择充值金额');
			if(Session::get('MemberID')!=807 && $Money<100){
				$this->error('最小充值金额100');
			}
            $data = [];
            $data['BalanceMemberRecommendID'] = $this->MemberInfo['MemberRecommendID'];
            $data['BalanceMemberRecommendPath'] = $this->MemberInfo['MemberRecommendPath'];
            $data['BalanceMemberID'] = $this->MemberInfo['MemberID'];
            $data['BalanceNumber'] = $order_num;
            $data['BalanceType'] = 1;
            $data['BalanceGroup'] = 2;
            $data['BalanceCount'] = $Money;
            $data['BalanceState']='1';
            $data['BalanceTime'] = time();
            $data['BalanceTitle'] = '支付宝充值';
            Db::name('balance')->insertGetId($data);
        }
        if($this->AgencySiteInfo['MemberID']=='-1'){
            $notify_url="http://".$_SERVER['HTTP_HOST']."/payback/alipay_notify.html";
            //$return_url="http://".$_SERVER['HTTP_HOST']."/home/payback/alipay_successhtml";
            $return_url="http://".$_SERVER['HTTP_HOST']."/member.php/index/index.html";
        }else{
            $notify_url="http://".$_SERVER['HTTP_HOST']."/payback/alipay_notify.html";
            //$return_url="http://".$_SERVER['HTTP_HOST']."/payback/alipay_successhtml";
            $return_url="http://".$_SERVER['HTTP_HOST']."/member.php/index/index.html";
        }
		//PayOperationDispose($order_num);
		//die;
        Log::record($notify_url,'error');
        $config = array (
            //应用ID,您的APPID。
            'app_id' => $alipay['AliPayAPPID'],
            //商户私钥，您的原始格式RSA私钥
            'merchant_private_key' => $alipay['AliPayPrivateKey'],            //异步通知地址,只有扫码支付预下单可用
            //异步通知地址,只有扫码支付预下单可用
            'notify_url' => $notify_url,
            //同步跳转
            'return_url' => $return_url,
            //编码格式
            'charset' => "UTF-8",
            //签名方式
            'sign_type'=>"RSA2",
            //支付宝网关
            'gatewayUrl' => "https://openapi.alipay.com/gateway.do",
            //支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
            'alipay_public_key' =>  $alipay['AliPayPublicKey'],
        );
		//var_dump($config);
        //$Money=0.01;
        file_put_contents('1.txt', var_export($config,true));
        //controller('common/Common')->alipay($order_num,$Money,$config);
		$str = controller('common/Common')->alipay($order_num,$Money,$config);
    }
    /**
     * @个人信息
     */
    public function  index()
    {
        session('MenuCookie','1');
        if (request()->isGet()){
        $MemberID =  Session::get('MemberID');
        $MemberInfo =  $this->model->where('MemberID',$MemberID)->find();
        $this->assign('MemberInfo',$MemberInfo);
        return $this->fetch();
        }else {
            $data = input('post.');
			if(empty($data['MemberTrueName'])){
				return ['code'=>'1','msg'=>'请填写联系人姓名'];
			}
            //自动验证
            $validate = new \app\member\Validate\Member();
            $scene = 'updateUser';
            $result = $validate->goCheck($data,$scene);
            if (!$result) {
                $error = $validate->getError();
                return ['code'=>'1','msg'=>$error];
            }
			

            $data['MemberID'] = $MemberID =  Session::get('MemberID');
           $result =  $this->model->update($data);
           if ($result) {
               return ['code'=>'0','msg'=>'修改成功'];
           } else {
               return ['code'=>'1','msg'=>'修改失败'];
           }
        }
    }
    /**
     * 修改密码
     */
    public function  changepassword()
    {
        session('MenuCookie','1');
        if (request()->isGet()){
            return $this->fetch();
        } else {
            $data = input('post.');
            $validate = new ChangePwd();
            $result = $validate->goCheck($data);
            if (!$result) {
                $error =  $validate->getError();
                return ['code'=>'1','msg'=>$error];
            }
            //判断原密码是否正确
            $MemberID =  Session::get('MemberID');
            $MemberName = Session::get('MemberName');
           $MemberPwd =  $this->model->where('MemberID',$MemberID)->value('MemberPwd');
            $checkPassword = md5(config('config.MemberPwdKey').md5($data['MemberPwd'].$MemberName).md5($data['MemberPwd']));
            if ($checkPassword != $MemberPwd) {
                return ['code'=>'1','msg'=>'当前密码错误，不能修改'];
            }
            //修改密码
            $NewPassword = md5(config('config.MemberPwdKey').md5($data['NewMemberPwd'].$MemberName).md5($data['NewMemberPwd']));
            $result =  $this->model->where('MemberID',$MemberID)->setField('MemberPwd',$NewPassword);
            if (!$result) {
                return ['code'=>'1','msg'=>'修改失败'];
            }
            return ['code'=>'0','msg'=>'修改成功'];
        }
    }
    //我的收藏
    function mycollect()
    {
        $MemberID =  Session::get('MemberID');
        $Where=[];
        $Where['c.CollectMemberID']=$MemberID;
        $List=db('collect')->alias('c')
            ->field('c.*,t1.*,t2.TypeName as TypeName2,t4.TypeName as TypeName4,t5.TypeName as TypeName5,t6.TypeName as TypeName6')
            ->join('__MEDIA__ t1','t1.MediaID=c.CollectGoodsID','left')
            ->join('__WHOLETYPE__ t2','t1.MediaWebNameID=t2.TypeID','left')
            //->join('__WHOLETYPE__ t3','t1.MediaIndustryID=t3.TypeID','left')t3.TypeName as TypeName3,
            ->join('__WHOLETYPE__ t4','t1.MediaNewsSourceID=t4.TypeID','left')
            ->join('__WHOLETYPE__ t5','t1.MediaNewsSourceID=t5.TypeID','left')
            ->join('__WHOLETYPE__ t6','t1.MediaUrlTypeID=t6.TypeID','left')
            ->where($Where)->order('CollectID desc')
            ->paginate(20,false)
            ->each(function($val, $key){
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
                $Count1=db('agencyorder')->where('media_id',$val['MediaID'])->count();
                $Count2=db('agencyorder')->where(['media_id'=>$val['MediaID'],'order_state'=>2])->count();
                $val['ChuGaoLv']=empty($Count2)? '100' : round($Count2/$Count1*100,2);
              //  $val['WebUrl'] = $WebUrl; //给数据集追加字段num并赋值
                return $val;
            });
//        echo '<pre>';
//        print_r($List);
        $this->assign('List',$List);
        return $this->fetch();
    }
}