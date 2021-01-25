<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/25
 * Time: 15:03
 */
namespace  app\admin\controller;
use think\Controller;
use think\Db;
class Jurisdiction extends Controller
{
    protected $AdminID='';
    protected $AdminName='';
    private $AdminRoleState='';//是否为超级管理员状态
    private $AuthList='';//所有有效的栏目ID
    private $AuthListInfo;//所有栏目ID对应的数据
    private $AuthOneID='';//获取当前URL连接的一级栏目ID
    public function _initialize()
    {
        $this->LoginCheck();
        //基于当前Url连接中的 项目组 控制器和方法，获取其一级ID
        $this->GetCurrentUrl();
        $Rules=$this->GetJurisdictionList();//获取权限列表
        //print_r($Rules);
        $this->assign('RulesList',$Rules);
    }
    //登录时时验证
    private function LoginCheck()
    {
        $AdminID=session('AdminID');
        $AdminName=session('AdminName');
        $AdminPwd=session('AdminPwd');
        //$AdminRandPwd=session('AdminRandPwd');
        $AdminLoginTime=session('AdminLoginTime');
        $this->AdminID=$AdminID;
        $this->AdminName=$AdminName;
        //dump($AdminID);
        if(empty($AdminID) || empty($AdminName) || empty($AdminPwd) || empty($AdminLoginTime))
        {
            $this->redirect('login/index');
        }
        if(time()-$AdminLoginTime>43200)
        {
//            $this->error('您当前账户已连接超时，请重新登录',url('home/index'));
            $this->alert('您当前账户已连接超时，请重新登录','jump',url('login/index'));
            exit;
        }else{
            session('AdminLoginTime',time());
        }
        $Where=array();
        $Where['AdminID']=$AdminID;
        $Where['AdminName']=$AdminName;
        $Where['AdminPwd']=$AdminPwd;
        //$Where['AdminRandPwd']=$AdminRandPwd;
        $Where['AdminState']='1';
        $Info=Db::name('admin')->field('AdminID,AdminRoleState')->where($Where)->find();
        //dump($Info);
        if(empty($Info)){
//            $this->error('您的账户登录异常或在其他地方有所登录，请重新登录',url('home/index'));
            $this->alert('您的账户登录异常或在其他地方有所登录，请重新登录','jump',url('login/index'));
            exit;
        }
        $this->AdminRoleState=$Info['AdminRoleState'];
    }
    //获取权限列表
    private function GetJurisdictionList()
    {
        $Result=array();
        if($this->AdminRoleState=='All')
        {
            //一超级管理员栏目设置
            $this->GetAdminAllAuth();
            //整理当前管理员栏目所对应的一二三级
            $Result=$this->ClearUpAdminAllAuthLevel();
        }else{
            //当前管理员不是超级管理员时
            $this->CurrentNotAdmin();
            //整理当前管理员角色对应的所有的栏目
            $this->ClearUpAdminAllAuth();
            //整理当前管理员栏目所对应的一二三级
            $Result=$this->ClearUpAdminAllAuthLevel();
            //二非法请求时的验证
            $this->CheckCurrentUrlIsValid();
        }
        return $Result;
    }
    private function CheckCurrentUrlIsValid()
    {
        $Url =$this->request->module().'/'.$this->request->controller().'/'.$this->request->action();
        //dump($activeRouter);
        $auth = new \common\Auth();
        //var_dump($auth);
        if(!$auth->check($Url,$this->AdminID,'admin')){
            //echo 'error';
//            $this->error('当前管理员，暂无管理此栏目权限');
            $this->alert('当前管理员，暂无管理此栏目权限','back');
            exit;
        }
    }
    //当前管理员不是超级管理员时
    private function CurrentNotAdmin()
    {
        $List=Db::name('AuthGroupAccess')
            ->alias('aga')
            ->join('__ROLE__ r','aga.group_id=r.id','left')
            ->where(['uid'=>$this->AdminID])->column('r.rules');
        if(empty($List))
        {
            //$this->error('该管理员无权限，暂时不能登录');
            $this->alert('该管理员无权限，暂时不能登录','back');
            exit;
        }
        $this->AuthList=implode(',',$List);
    }
    //整理当前管理员角色对应的所有的栏目
    private function ClearUpAdminAllAuth()
    {
        if(empty($this->AuthList)) return false;
        //dump($this->AuthList);
        $AuthListArr=explode(',',$this->AuthList);//拆分当前管理员角色所有的栏目ID 数组
        $AuthListArr=array_unique($AuthListArr);//对重复的栏目ID进行过滤 去重 数组
        //dump($AuthListArr);
        if(empty($AuthListArr)) return false;
        //补断层
        $AuthListStr=implode(',',$AuthListArr);//把整理的栏目ID数组合并为字符串
        //dump($AuthListStr);
        //防止当前栏目只是一个三级时，去弥补其一级和二级；这里获取其当前栏目的一级和二级 通过TypePath
        $AuthListTypePath=Db::name('AuthRule')->where('id','in',$AuthListStr)->column('path');
        //dump($AuthListTypePath);  //1,2,3,1,2,
        $AuthListTypePath=implode(',',$AuthListTypePath);//把所有的TypePath合并为一个字符串
        $AuthListTypePathArr=explode(',',$AuthListTypePath);//拆分数组
        $AuthListTypePathArr=array_unique($AuthListTypePathArr);//去重
        $AuthListTypePathArr=array_filter($AuthListTypePathArr);//去空
        //dump($AuthListTypePathArr);
        if(empty($AuthListTypePathArr)) return false;
        $this->AuthList=$AuthListTypePathArr;
        $Where=array();
        $Where['id']=['in',$AuthListTypePathArr];
        $Where['isshow']='1';
        $List=Db::name('AuthRule')->field('id,parentid,node,name,title')->where($Where)->order('sort asc,id asc')->select();
        $this->AuthListInfo=$List;
    }
    //获取超级管理员的具体栏目
    private function GetAdminAllAuth()
    {
        $List=Db::name('AuthRule')->where(['isshow'=>'1'])->order('sort asc,id asc')->select();
        $this->AuthListInfo=$List;
    }
    private function ClearUpAdminAllAuthLevel()
    {
        if(empty($this->AuthListInfo)) return false;
        $AuthList=$this->AuthListInfo;
        //dump($AuthList);
        $Result=array();
        foreach ($AuthList as $key=>$val)
        {
            if($val['node']=='1')
            {
                if($val['id']!=702){
                    $Result['One'][]=$val;
                }
            }
            if($val['node']==2){
                $Result['Two'][$val['parentid']][$val['id']]=$val;
            }
            if($val['node']==3){
                $Result['Three'][$val['parentid']][]=$val;
            }
        }
        //dump($Result);
        //$OneUrl=array();
        $AuthOneID='';
        if(!empty($Result['One']))
        {
            foreach ($Result['One'] as $key=>$val)
            {
                $Temp=array();
                if(!empty($Result['Two'][$val['id']]))
                {
                    $TwoNode=$Result['Two'][$val['id']];
                    $TwoNode=reset($TwoNode);
                    if(empty($Result['Three'][$TwoNode['id']])){
                        $Temp=array();
                    }else{
                        $ThreeNode=$Result['Three'][$TwoNode['id']];
                        $Temp=reset($ThreeNode);
                    }
                    //$OneUrl[]=$Temp['name'];
                }
                if(!empty($val['name'])) $Temp['name']=$val['name'];
                if($key=='0') $AuthOneID=$val['id'];
                $Result['One'][$key]['name']=empty($Temp['name'])?'/'.$this->request->module():$Temp['name'];
            }
        }
        //dump($Result);
        //dump($this->AuthOneID);
/*        if(empty($Result['Two'][$this->AuthOneID]))
        {
            $Result['Two']=$Result['Two'][$AuthOneID];
        }else{
            $Result['Two']=$Result['Two'][$this->AuthOneID];
        }*/
        //dump($Result);
        //dump($OneUrl);
        return $Result;
    }
    //基于当前Url连接中的 项目组 控制器和方法，获取其一级ID
    private function GetCurrentUrl()
    {
        $Url=$this->request->module().'/'.$this->request->controller().'/'.$this->request->action();
        $TypePath=Db::name('AuthRule')->where(['name'=>$Url])->value('path');
        //dump($TypePath);
        $TypePath=explode(',',$TypePath);
        if(empty($TypePath[0])) return false;
        $this->AuthOneID=$TypePath[0];
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
        if($type)exit();
    }
}