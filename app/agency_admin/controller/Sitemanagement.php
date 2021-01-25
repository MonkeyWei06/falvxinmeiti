<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/31
 * Time: 9:19
 */
namespace app\agency_admin\controller;
use think\Db;
class Sitemanagement extends Agency
{
    /**
     * 图片设置
     */
    public function pictureadvertisement()
    {
        return view();
    }
    public function getlist(){
        $UrlParam=input();
        $this->assign('UrlParam',$UrlParam);
        $Where=array();
        $Where['picmember_id']=$this->AgencyMemberInfo['MemberID'];
        $Model=new \app\agency_admin\model\Pictures();
        $List=$Model->GetList($UrlParam,$Where,20);
        $Back=array();
        $Back['code']='0';
        $Back['count']=$List->total();
        $Back['msg']='图片列表';
        $Back['data']=$List->items();
        return json($Back);
    }
    public function add()
    {
        if($this->request->isPost())
        {
            $data = [];
            $data['pictures_name'] = input('pictures_name');
            $data['pictures_sort'] = input('pictures_sort');
            $data['pictures_state'] = input('pictures_state');
            $file = request()->file('image');
            if($file){
                $info = $file->move(PUBLIC_PATH . 'uploads' . DS . 'lbt');
                if($info){
                    $data['pictures_path'] = str_replace('\\','/',$info->getSaveName());
                }else{
                    echo $file->getError();
                }
            }
            $data['picmember_id'] = $this->AgencyMemberID;
            if(!$data['pictures_name'] || !$data['pictures_path']) $this->error('请完善图片信息');
            Db::name('pictures')->insert($data);
            $this->success('新增成功');
        }
        return view();
    }
    public function delete()
    {
        $id = input('id');
        $lsInfo = Db::name('pictures')->where('pictures_id',$id)->where('picmember_id',$this->AgencyMemberID)->find();
        @unlink(PUBLIC_PATH . 'uploads' . DS . 'lbt/'.$lsInfo['pictures_path']);
        $r = Db::name('pictures')->where('pictures_id',$id)->where('picmember_id',$this->AgencyMemberID)->delete();
        if($r) return 0;
        return 1;
    }
    public function qiyong()
    {
        $id = input('id');
        $r = Db::name('pictures')->where('pictures_id',$id)->where('picmember_id',$this->AgencyMemberID)->update(['pictures_state'=>1]);
        if($r) return 0;
        return 1;
    }
    public function jinyong()
    {
        $id = input('id');
        $r = Db::name('pictures')->where('pictures_id',$id)->where('picmember_id',$this->AgencyMemberID)->update(['pictures_state'=>0]);
        if($r) return 0;
        return 1;
    }
    public function edit()
    {
        $id = input('id');
        if($this->request->isPost())
        {
            $data = [];
            $data['pictures_name'] = input('pictures_name');
            $data['pictures_sort'] = input('pictures_sort');
            $data['pictures_state'] = input('pictures_state');
            $file = request()->file('image');
            if($file){
                $info = $file->move(PUBLIC_PATH . 'uploads' . DS . 'lbt');
                if($info){
                    $lsInfo = Db::name('pictures')->where('pictures_id',$id)->where('picmember_id',$this->AgencyMemberID)->find();
                    @unlink(PUBLIC_PATH . 'uploads' . DS . 'lbt/'.$lsInfo['pictures_path']);
                    $data['pictures_path'] = str_replace('\\','/',$info->getSaveName());
                }else{
                    echo $file->getError();
                }
            }
            if(!$data['pictures_name'] ) $this->error('请完善图片信息');
            Db::name('pictures')->where('pictures_id',$id)->where('picmember_id',$this->AgencyMemberID)->update($data);
            $this->success('修改成功');
        }
        $Info = Db::name('pictures')->where('pictures_id',$id)->where('picmember_id',$this->AgencyMemberID)->find();
        $Info['pictures_path']=config('MainDomain').'uploads/lbt/'.$Info['pictures_path'];
        $this->assign('info',$Info);
        return view();
    }
    /**
     * 站点配置
     */
    public function infoset()
    {
        if($this->request->isPost()){
            $PicPath=$this->OneUpload('WebSiteLogo');
            $Post=input();
            $Data=array();
            $Data['WebSiteName']=$Post['WebSiteName'];
            $Data['WebSiteTitle']=$Post['WebSiteTitle'];
            $Data['WebSiteKeyword']=$Post['WebSiteKeyword'];
            $Data['WebSiteDescription']=$Post['WebSiteDescription'];
            if(!empty($PicPath)) $Data['WebSiteLogo']=$PicPath;
            $Data['WebSiteCompanyName']=$Post['WebSiteCompanyName'];
            $Data['WebSitePhone']=$Post['WebSitePhone'];
            $Data['WebSiteAfterSalePhone']=$Post['WebSiteAfterSalePhone'];
            $Data['WebSiteAddress']=$Post['WebSiteAddress'];
            $Data['WebSiteQQ']=$Post['WebSiteQQ'];
            $Data['WebSiteWXWBContent']=$Post['WebSiteWXWBContent'];
            $Data['WebSiteEmail']=$Post['WebSiteEmail'];
            $Data['WebSiteCopyright']=$Post['WebSiteCopyright'];
            $Data['WebSiteAbout']=$Post['WebSiteAbout'];
            $info = Db::name('config')->where('MemberID',$this->AgencyMemberID)->find();
            if($info){
                Db::name('config')->where('MemberID',$this->AgencyMemberID)->update($Data);
            }else{
                $Data['MemberID'] = $this->AgencyMemberID;
                Db::name('config')->insert($Data);
            }
            //return json(1);
            $this->success('更新成功');
        }
        $info = Db::name('config')->where('MemberID',$this->AgencyMemberID)->find();
        if(!empty($info['WebSiteLogo'])) $info['WebSiteLogo']=config('MainDomain').'uploads/'.$info['WebSiteLogo'];
        $this->assign('info',$info);
        return view();
    }
    //密码修改
    public function password(){
        if($this->request->isPost()){
            $Post=input('post.');
            $OldPassword=$Post['OldPassword'];
            $MemberPwd=$Post['MemberPwd'];
            $Model=new \app\agency_admin\model\Member();
            $MemberInfo=$Model->field('MemberName,MemberPwd')->where('MemberID',$this->AgencyMemberID)->find();
            $OldPwd=md5(config('config.MemberPwdKey').md5($OldPassword.$MemberInfo['MemberName']).md5($OldPassword));
            if($MemberInfo['MemberPwd']!=$OldPwd) return json('1');
            $MemberPwd=md5(config('config.MemberPwdKey').md5($MemberPwd.$MemberInfo['MemberName']).md5($MemberPwd));
            $Model->where('MemberID',$this->AgencyMemberID)->update(['MemberPwd'=>$MemberPwd]);
            return json('0');
        }else {
            return $this->fetch();
        }
    }
   //支付设置
    public function pay()
    {
        $info = Db::name('alipay')->where('AliPayMemberID',$this->AgencyMemberID)->find();
	
        if(!empty($info['AliPayPicture'])) $info['AliPayPicture']=config('MainDomain').'uploads/erwm/'.$info['AliPayPicture'];
        if(!empty($info['AliPayWXPicture'])) $info['AliPayWXPicture']=config('MainDomain').'uploads/erwm/'.$info['AliPayWXPicture'];
        $this->assign('info',$info);
        $this->assign('AliPayBankName',$this->GetCurrentWholeType(120));//      开户银行
        return view();
    }
    public function paysave()
    {
        $AliPayType=input('AliPayType','','abs');
        $data = array();
        $data['AliPayAPPID'] = input('AliPayAPPID');
        $data['AliPayPublicKey'] = input('AliPayPublicKey');
        $data['AliPayPrivateKey'] = input('AliPayPrivateKey');
        $data['AliPayType'] = input('AliPayType');
        $data['AliPayBankName'] = input('AliPayBankName');
        if(empty($data['AliPayBankName'])){
            $data['AliPayBankWD'] = '';
            $data['AliPayBankNum'] = '';
            $data['AliPayBankPeople'] = '';
        }else{
            $data['AliPayBankWD'] = input('AliPayBankWD');
            $data['AliPayBankNum'] = input('AliPayBankNum');
            $data['AliPayBankPeople'] = input('AliPayBankPeople');
        }
        $info = Db::name('alipay')->where('AliPayMemberID',$this->AgencyMemberID)->find();
        if(!$info)
        {
            $data['AliPayTime'] = time();
            $data['AliPayMemberID'] = $this->AgencyMemberID;
            Db::name('alipay')->insert($data);
        }else{
            Db::name('alipay')->where('AliPayMemberID',$this->AgencyMemberID)->update($data);
        }
        $this->upimage();
        $this->upimage2();
        $this->success('更新成功');
    }
    //支付宝收款码
    public function upimage(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('image1');
        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(PUBLIC_PATH . 'uploads' . DS . 'erwm');
            if($info) {
                $info2 = Db::name('alipay')->where('AliPayMemberID', $this->AgencyMemberID)->find();
                $data = [];
                $data['AliPayPicture'] = str_replace('\\', '/', $info->getSaveName());
                if ($info2) {
                    @unlink('uploads/erwm/' . $info2['AliPayPicture']);
                    Db::name('alipay')->where('AliPayMemberID', $this->AgencyMemberID)->update($data);
                } else {
                    $data['AliPayTime'] = time();
                    $data['AliPayMemberID'] = $this->AgencyMemberID;
                    Db::name('alipay')->insert($data);
                }
            }
        }
    }
    //微信收款码
    public function upimage2(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('image2');
        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(PUBLIC_PATH . 'uploads' . DS . 'erwm');
            if($info){
                $info2 = Db::name('alipay')->where('AliPayMemberID',$this->AgencyMemberID)->find();
                $data = [];
                $data['AliPayWXPicture'] = str_replace('\\','/',$info->getSaveName());
                if($info2)
                {
                    @unlink('uploads/erwm/'.$info2['AliPayPicture']);
                    Db::name('alipay')->where('AliPayMemberID',$this->AgencyMemberID)->update($data);
                }else{
                    $data['AliPayTime'] = time();
                    $data['AliPayMemberID'] = $this->AgencyMemberID;
                    Db::name('alipay')->insert($data);
                }
            }
        }
    }
    //点击删除收款码
    public function paypicdel(){
        $type=input('type','','abs');
        $info = Db::name('alipay')->where('AliPayMemberID',$this->AgencyMemberID)->find();
        $data=array();
        if($type==1){
            $data['AliPayPicture']='';
            @unlink('../uploads/erwm/'.$info['AliPayPicture']);
        }elseif($type==2){
            $data['AliPayWXPicture']='';
            @unlink('../uploads/erwm/'.$info['AliPayWXPicture']);
        }
        Db::name('alipay')->where('AliPayMemberID',$this->AgencyMemberID)->update($data);
        $this->success('删除成功');
    }
	//短信接口
    public function setmsg()
    {
        $info = Db::name('msg')->where('msgMemberID',$this->AgencyMemberID)->find();
        $this->assign('info',$info);
        return view();
    }
    public function msgsave()
    {
        $data = array();
        $data['msgname'] = input('msgname');
        $data['msgpass'] = input('msgpass');
        $data['msgSignature'] = input('msgSignature');
        $info = Db::name('msg')->where('msgMemberID',$this->AgencyMemberID)->find();
        if(!$info)
        {
            $data['msgTime'] = time();
            $data['msgMemberID'] = $this->AgencyMemberID;
            Db::name('msg')->insert($data);
        }else{
            Db::name('msg')->where('msgMemberID',$this->AgencyMemberID)->update($data);
        }
        $this->success('更新成功');
    }
}
