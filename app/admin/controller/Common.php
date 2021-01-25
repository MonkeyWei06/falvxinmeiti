<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/3
 * Time: 10:27
 */
namespace app\admin\controller;
use think\console\command\optimize\Config;
use think\Controller;
use think\Session;
use think\Db;
use think\Request;
use think\Loader;
class Common extends Jurisdiction
{
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        //define('PUBLIC_PATH',ROOT_PATH.'public'.DS);
        $this->assign('AdminInfo',input('session.'));
        $this->UpLoadSeat=config('config.UpLoadSeat');
        $this->assign('UpLoadSeat',$this->UpLoadSeat);
    }
    //调用栏目列表数据
    private function CallRuleList($PID='0',$BackData=array())
    {
        $Where=[];
        $Where['parentid']=$PID;
        $Where['isshow']='1';
        $Where['status']='1';
        $List=Db::name('auth_rule')->field('id,parentid,title,node,name,path')->where($Where)->order('sort asc,id asc')->select();
        if(empty($List))
        {
            return $BackData;
        }else{
            foreach ($List as $key=>$val)
            {
                $BackData[]=$val;
                $BackData=$this->CallRuleList($val['id'],$BackData);
            }
            return $BackData;
        }
    }
    //获取栏目
    private function GetMenu($List)
    {
        if(empty($List)){ return false;}
        $Back=[];$Data=[];$Seat=0;$OneMenuLink=[];$DefaultOneID=0;
        foreach ($List as $key=>$val)
        {
            if($val['node']=='1')
            {
                $Seat=1;//获取三级连接时当前要循环的位置
                $Data['One'][$val['id']]=$val;//获取所有的一级栏目的具体数据
                if($key==0)
                {
                    $DefaultOneID=$val['id'];
                }
            }
            if($val['node']=='2')
            {
                $Data['Two'][$val['parentid']][$val['id']]=$val;//获取所有二级栏目的具体数据，并和一级栏目进行绑定
            }
            if($val['node']=='3')
            {
                $PathArr=explode(',',$val['path']);//基于路径拆分出一级栏目的ID
                if($Seat==1)//验证当前三级分类的位置是否是第一个
                {
                    $OneMenuLink[$PathArr[0]]='/'.$val['name'];//获取第一个一级栏目所对应的连接
                }
                $Data['Three'][$PathArr[0]][$PathArr[1]][$val['id']]=$val;//获取所有一级栏目的具体数据，并和一级栏目进行绑定
                $Seat++;
            }
        }
        //dump($IDMark);
        //echo '------------------------';
        //dump($OneMenuLink);
        //exit();
        //echo '------------------------';
        $Back['Data']=$Data;
        $Back['OneMenuLink']=$OneMenuLink;
        $Back['DefaultOneID']=$DefaultOneID;
        return $Back;
    }
    //管理登录自定验证
    /*private function AdminLoginAutoCheck()
    {
        $AdminID=Session::get('AdminID');
        $AdminName=Session::get('AdminName');
        //$AdminRandPwd=Session::get('AdminRandPwd');
        $AdminPwd=Session::get('AdminPwd');
        $AdminLoginTime=Session::get('AdminLoginTime');
        if(empty($AdminID) || empty($AdminName))
        {
            $this->redirect('home/index');
        }
exit;
        if(time()-$AdminLoginTime>config('AdmiNovertime'))
        {
           // $this->error('您已连接超时请重新登录',url('home/index'));
            $this->alert('您已连接超时请重新登录','jump',url('home/index'));
            exit;
        }
        Session::set('AdminLoginTime',time());
        $Where=[];
        $Where['AdminID']=$AdminID;
        $Where['AdminName']=$AdminName;
        //$Where['AdminRandPwd']=$AdminRandPwd;
        $Where['AdminPwd']=$AdminPwd;
        $Where['AdminState']='1';
        $Info=Db::name('admin')->field('count(*) as c')->where($Where)->find();
        if($Info['c']!=1)
        {
            //$this->error('系统异常请重新登录',url('home/index'));
            $this->alert('系统异常请重新登录','jump',url('home/index'));
            exit;
        }
    }*/
    //单文件上传
    protected function OneUpload($FileName=''){
        if(empty($FileName)) return false;
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file($FileName);
        if(empty($file)){ return false;}
        // 移动到框架应用根目录/public/uploads/ 目录下
        $FileSize=config('config.FileSize');
        $FileSeat=config('config.FileSeat');
        $FileExt=config('config.FileExt');
        $info = $file->validate(['size'=>$FileSize,'ext'=>$FileExt])->move(PUBLIC_PATH . $FileSeat);
        if($info){
            $getSaveName=$info->getSaveName();
            $getSaveName=str_replace('\\','/',$getSaveName);
            return $getSaveName;
        }else{
            return false;
        }
    }
    //单文件上传
    protected function OneUpload2($FileName=''){
        if(empty($FileName)) return false;
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file($FileName);
        if(empty($file)){ return false;}
        // 移动到框架应用根目录/public/uploads/ 目录下
        $FileSize=config('config.FileSize');
        $FileSeat=config('config.FileSeat');
        $FileExt=config('config.MusicExt');
        $info = $file->validate(['size'=>$FileSize*100,'ext'=>$FileExt])->move(PUBLIC_PATH . $FileSeat);
        if($info){
            $getSaveName=$info->getSaveName();
            $getSaveName=str_replace('\\','/',$getSaveName);
            return $getSaveName;
        }else{
            return false;
        }
    }
    //多文件上传
    public function MoreUpload($FileName){
        if(empty($FileName)) return false;
        // 获取表单上传文件
        $files = request()->file($FileName);
        $FileSize=config('config.FileSize');
        $FileSeat=config('config.FileSeat');
        $FileExt=config('config.FileExt');
        $Back=[];
        //dump($files);
        foreach($files as $key => $file){
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->validate(['size'=>$FileSize,'ext'=>$FileExt])->move(ROOT_PATH . 'public' . DS . $FileSeat);
            if($info){
                $getSaveName=$info->getSaveName();
                $getSaveName=str_replace('\\','/',$getSaveName);
                $Back[$key]=$getSaveName;
            }
        }
        return $Back;
    }
    protected function base64_image_content($base64_image_content,$new_file){
        //匹配出图片的格式
        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $base64_image_content, $result)){
            $type = $result[2];
            if(!file_exists($new_file)){
                //检查是否有该文件夹，如果没有就创建，并给予最高权限
                mkdir($new_file, 0700);
            }
            $new_file = $new_file.time().'_'.mt_rand(10000,99999).".{$type}";
            if (file_put_contents($new_file, base64_decode(str_replace($result[1], '', $base64_image_content)))){
                return '/'.$new_file;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    //获取会员类型信息
    protected function GetMemberTypeList($ParentID='0')
    {
        $Where=array();
        $Where['TypePID']=['in',$ParentID];
        $Where['TypeState']='1';
        return Db::name('membertype')->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
    }
    //获取会员类型信息
    protected function GetAgentTypeList($TypeID='0')
    {
        $Where=array();
        $Where['TypeID']=['not in',$TypeID];
        $Where['TypeState']='1';
        return Db::name('membertype')->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
    }
    //创建编号
    protected function CreateNumber($CouponMarkNumber,$Mark,$Length,$CurrentSeat)
    {
        $GetInt=str_replace($Mark,'',$CouponMarkNumber);
        $GetInt+=$CurrentSeat;
        $GetIntLength=strlen($GetInt);
        //dump($GetInt); 13  6 - 2 = 4 个 0
        $Str='';
        for($i=0;$i<$Length-$GetIntLength;$i++){
            $Str.='0';
        }
        $Number=$Mark.$Str.$GetInt;
        return $Number;
    }
    //获取全局分类
    protected function GetCurrentWholeType($TypeID){
        $Where=array();
        $Where['TypePID']=$TypeID;
        $Where['TypeState']=1;
        $List=db::name('wholetype')->field('TypeID,TypeName')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        return $List;
    }
    //获取全局分类名称
    protected function GetWholeTypeName($TypeID){
        $Where=array();
        $Where['TypeID']=$TypeID;
        $Where['TypeState']=1;
        $Info=db::name('wholetype')->field('TypeName')->where($Where)->find();
        return $Info;
    }
    //获取全局分类的id
    protected  function GetWholeTypeId($Value)
    {
        $Where=array();
        $Where['TypeName']=array('like','%'.$Value.'%');
        $Info=db::name('wholetype')->where($Where)->value('TypeID');
        return $Info;
    }
    //获取省市县id
    protected  function GetCityTypeId($Value)
    {
        $Where=array();
        $Where['TypeName']=array('like','%'.$Value.'%');
        $TypeID=db::name('citytype')->where($Where)->value('TypeID');
        return $TypeID;
    }
    protected  function GetCityTypeList($PID)
    {
        $Where=array();
        $Where['TypePID']=$PID;
        $Where['TypeState']=1;
        $List=db::name('citytype')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
        return $List;
    }
    //获取局部位置的分类数据
    protected function GetSeatTypeList($TableName,$ParentID=0)
    {
        $Where=array();
        $Where['TypePID']=$ParentID;
        $Where['TypeState']='1';
        return Db::name($TableName)->field('TypeID,TypeName,TypePath,TypeNode')->where($Where)->order('TypeSort Asc,TypeID Asc')->select();
    }
    //获取联级菜单数据
    protected function GetTypeCascadeList($SelectMarkName,$TypePathData,$TableName)
    {
        $Str='';
        if(empty($TypePathData) || empty($TableName)){
            $Str.='<select name="'.$SelectMarkName.'Type[]" onchange="GetTypeList(this,\''.$TableName.'\',\''.url('ajax/GetSeatListData').'\');">
            <option value="0">1级分类</option>';
            $List=$this->GetSeatTypeList($TableName,'0');
            if(!empty($List))
            {
                foreach ($List as $key2=>$val2)
                {
                    $Str.='<option value="'.$val2['TypeID'].'_'.$val2['TypePath'].'">'.$val2['TypeName'].'</option>';
                }
            }
            $Str.='</select>';
        }else{
            $TypePathData=explode(',',$TypePathData);
            $TypePathDataArr=$TypePathData;
            $TypePathDataArr=array_filter($TypePathDataArr);
            array_unshift($TypePathDataArr,'0');
            array_pop($TypePathDataArr);
            if(empty($TypePathDataArr)) return false;
            //dump($TypePathDataArr);
            foreach ($TypePathDataArr as $key=>$val)
            {
                $Str.='<select name="'.$SelectMarkName.'Type[]" onchange="GetTypeList(this,\''.$TableName.'\',\''.url('ajax/GetSeatListData').'\');">
                <option value="0">'.($key+1).'级分类</option>';
                $List=$this->GetSeatTypeList($TableName,$val);
                if(!empty($List))
                {
                    foreach ($List as $key2=>$val2)
                    {
                        $Selected=$val2['TypeID']==$TypePathData[$key]?'selected':'';
                        $Str.='<option value="'.$val2['TypeID'].'_'.$val2['TypePath'].'" '.$Selected.'>'.$val2['TypeName'].'</option>';
                    }
                }
                $Str.='</select>';
            }
        }
        return $Str;
    }
    //获取父分分类 $State 修改时当前级别之下的 子集则不显示
    protected function ParentTypeList($TableName,$Keyword='',$State='',$CurrentID='',$PID='0',$TempArr=array(),$Seat='')
    {
        $Where=[];
        if(empty($Keyword))
        {
            $Where['TypePID']=$PID;
            if($State=='Edit')
            {
                //dump($CurrentID);
                //dump($PID);
                if($CurrentID==$PID)
                {
                    unset($TempArr[$CurrentID]);
                    //dump($TempArr);
                    return $TempArr;
                }
            }
        }else{
            $Where['TypeName']=['like','%'.$Keyword.'%'];
        }
        //->field('id,title,node,path')
        $List=Db::name($TableName)->where($Where)->order('TypeSort asc,TypeID asc')->select();
        if(empty($List))
        {
            return $TempArr;
        }else{
            if(empty($Keyword))
            {
                foreach ($List as $key=>$val)
                {
                    $val['OldTypeName']=$val['TypeName'];
                    $val['TypeName']=$Seat.$val['TypeName'];
                    $TempArr[$val['TypeID']]=$val;
                    $TempArr=$this->ParentTypeList($TableName,$Keyword,$State,$CurrentID,$val['TypeID'],$TempArr,$Seat.'　　');
                }
            }else{
                $TempArr=$List;
            }
            return $TempArr;
        }
    }
    //删除图片
    protected function DelUpLoad($MainFieldID,$ID,$TableName,$Fields,$AdditionalParam=array())
    {
        if(empty($ID)) return false;
        $Where=array();
        $Where[$MainFieldID]=['in',$ID];
        if(!empty($AdditionalParam)) $Where=array_merge($Where,$AdditionalParam);
        $List=Db::name($TableName)->field($Fields)->where($Where)->select();
        if(!empty($List))
        {
            foreach ($List as $key=>$value)
            {
                if(!empty($value))
                {
                    foreach ($value as $key2=>$val2)
                    {
                        @unlink($this->UpLoadSeat.$val2);
                    }
                }
            }
        }
    }
    //删除单个旧图片
    protected function DelOneOldPic($ID,$TableName,$MainKeyID,$Fields)
    {
        if(empty($ID) || empty($TableName) || empty($MainKeyID) || empty($Fields)) return false;
        $Where=[];
        $Where[$MainKeyID]=['in',$ID];//10  20   30,40,50,60
        $List=Db::name($TableName)->where($Where)->column($Fields);//->fetchSql(true)
        if(!empty($List))
        {
            foreach ($List as $key =>$val)
            {
                if(!empty($val))
                {
                    $Path=config('config.FileSeat').'/'.$val;
                    @unlink($Path);
                }
            }
        }
    }
    //删除多个旧图片
    protected function DelMoreOldPic($ID,$TableName,$MainKeyID,$Fields,$ParamWhere=[])
    {
        if(empty($ID) || empty($TableName) || empty($MainKeyID) || empty($Fields)) return false;
        $Where=[];
        $Where[$MainKeyID]=['in',$ID];//10  20   30,40,50,60
        if(!empty($ParamWhere)){$Where=array_merge($Where,$ParamWhere);}
        //dump($Where);exit();
        $List=Db::name($TableName)->field($Fields)->where($Where)->select();//->fetchSql(true)
        if(!empty($List))
        {
            $FileSeat=config('config.FileSeat');
            foreach ($List as $key =>$val)
            {
                if(!empty($val))
                {
                    foreach ($val as $k=>$v)
                    {
                        $Path=$FileSeat.'/'.$v;
                        @unlink($Path);
                    }
                }
            }
        }
    }
}