<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/4
 * Time: 11:14
 */
namespace app\admin\controller;
use think\Db;
use think\Request;
class Rule extends Common
{
    private $MenuName='栏目分类';
    //列表数据
    public function index()
    {
        $UrlParam=input('get.');
        $this->assign('UrlParam',$UrlParam);
        $Keyword=input('keyword','');
        $List=$this->ThisParentTypeList($Keyword);
        $this->assign('List',$List);
        return $this->fetch();
    }
    //添加数据
    public function add()
    {
        //$request = request();
        $request=Request::instance();
        //dump($request->isPost());
        if($request->isPost())
        {
            //dump(input('post.'));
            $Data=input('post.');
            $this->AddSave($Data);
//            $this->success('添加成功');
            $this->alert('添加成功','back');
            exit;
        }else{
            //获取父级分类列表
            $this->assign('ParentTypeList',$this->ThisParentTypeList());
            //获取当前项目组的名称
            $this->assign('Model',$request->module());
            return $this->fetch();
        }
    }
    //保存数据
    private function AddSave($Data)
    {
        //处理 id node path 的相关参数
        $ParentID=$Data['parentid'];
        $Node='0';$Path='';
        if($ParentID=='0')
        {
            $ParentID='0';
            $Node='1';
            $Path='';
        }else{
            $ParentIDArr=explode('_',$ParentID);
            $ParentID=abs($ParentIDArr[0]);
            $Node=abs($ParentIDArr[1])+1;
            $Path=trim($ParentIDArr[2]);
        }
        $Data['parentid']=$ParentID;
        $Data['node']=$Node;
        $Data['time']=time();
        //保存添加的数据
        Db::name('auth_rule')->data($Data)->insert();
        $InsertID=Db::getLastInsID();
        //更新 path 路径
        $Where=[];
        $Where['id']=$InsertID;
        $SaveData=[];
        $SaveData['path']=$Path.$InsertID.',';
        Db::name('auth_rule')->where($Where)->update($SaveData);
        //保存日志
        AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'数据添加','LogOperateContent'=>'ID:'.$InsertID]);
    }
    //编辑数据
    public function edit()
    {
        $ID=input('param.id','','intval');
        $Request=Request::instance();
        if($Request->isPost())
        {
            $Data=input('post.');
            $this->EditSave($ID,$Data);
        }else{
            $Info=Db::name('auth_rule')->where(['id'=>$ID])->find();
            //dump($Info);
            $this->assign('ParentTypeList',$this->ThisParentTypeList('','Edit',$Info['id']));
            //$this->assign('Model',$request->module());
            $this->assign('Info',$Info);
            return $this->fetch();
        }
    }
    //修改保存数据
    private function EditSave($ID,$Data)
    {
        //dump($ID);
        //dump($Data);
        $OldPath=$Data['path'];
        //更新当前层级
        $ParentID=$Data['parentid'];
        if($ParentID=='0')
        {
            $NewPath=$ID.',';
            $Data['parentid']='0';
            $Data['node']='1';
            $Data['path']=$NewPath;
        }else{
            $TempArr=explode('_',$ParentID);
            $NewPath=$TempArr[2].$ID.',';
            $Data['parentid']=$TempArr[0];
            $Data['node']=$TempArr[1]+1;
            $Data['path']=$NewPath;
            //if($Data['parentid']==$Data['id'])
            //{
                //$this->error('您的当前级别不可挪到当前级别');
            //}
            //dump($NewPath);
            //dump($Data['id']);
            if(stristr($TempArr[2],$Data['id'].',')!==false)
            {
//                $this->error('您的当前级别不可挪到小于您的当前级别之下');
                $this->alert('您的当前级别不可挪到小于您的当前级别之下','back');
                exit;
            }
        }
        //exit();
        Db::name('auth_rule')->data($Data)->where('id',$ID)->update();
        //更新当前层级的所有子集
        $List=Db::name('auth_rule')->field('id,path')->where('path','like',$OldPath.'%')->select();
        //dump($List);
        if(!empty($List))
        {
            $UpdateData=array();
            foreach ($List as $key=>$val)
            {
                $TempPath=str_replace($OldPath,$NewPath,$val['path']);
                $UpdateData[]=['id'=>$val['id'],'path'=>$TempPath,'node'=>substr_count($TempPath,',')];
            }
            $Model=new \app\admin\model\AuthRule();
            $Model->saveAll($UpdateData);
        }
        AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'数据修改成功','LogOperateContent'=>'ID:'.$ID]);
//        $this->success('更新成功',url('rule/index'));
        $this->alert('更新成功','jump',url('rule/index'));
        exit;
    }
    //删除数据
    public function del()
    {
        if($this->request->isPost())
        {
            $this->delmore();
        }elseif($this->request->isGet()) {
            $ID = input('param.id');
            //dump($ID);
            if (!empty($ID)) {
                $Info = Db::name('auth_rule')->field('path')->where('id', $ID)->find();
               // dump($Info);
                if (empty($Info)) {
//                    $this->error('此记录已删除，请不要重复操作');
                    $this->alert('此记录已删除，请不要重复操作','back');
                    exit;
                }
                $TypePath = $Info['path'];
                if (empty($TypePath)) {
                    $TypePath = '-1';
                } else {
                    $TypePath .= '%';
                }
                //获取批量删除的ID值
                $DelIDList = Db::name('auth_rule')
                    ->field('id')
                    ->where(['id' => $ID])
                    ->whereOr('path', 'like', $TypePath)//''.%   %
                    ->order('sort asc,id asc')
                    ->select();
                $DelIDTemp = [];
                $DelIDTempStr = '';
                if (!empty($DelIDList)) {
                    foreach ($DelIDList as $key => $val) {
                        $DelIDTemp[] = $val['id'];
                    }
                    $DelIDTempStr = implode(',', $DelIDTemp);
                }
                Db::name('auth_rule')
                    ->where(['id' => $ID])
                    ->whereOr('path', 'like', $TypePath)
                    ->delete();
            }
            AdminLogDetail(['LogOperateTitle' => $this->MenuName . '此记录已删除成功', 'LogOperateContent' => 'ID:' . $DelIDTempStr]);
//            $this->success('此记录已删除成功');
            $this->alert('此记录已删除成功','back');
            exit;
        }
    }
    //批量删除记录
    private function delmore()
    {
        $DelID=input('post.Del/a');
        if(!empty($DelID))
        {
            $TempArrID=[];
            $TempArrPath=[];
            foreach ($DelID as $key=>$val)
            {
                $Arr=explode('_',$val);
                $TempArrID[]=$Arr[0];
                if(empty($Arr[1])){
                    $TempArrPath[]='-1';
                }else{
                    $TempArrPath[]=$Arr[1].'%';
                }
            }
            $Where=[];
            $DelIDStr=implode(',',$TempArrID);//52,53
            //$Where['id']=['in',$DelIDStr];
            //$Where['path']=['like',$val[1].'%'];
            //获取批量删除的ID值
            $DelIDList=Db::name('auth_rule')
                ->field('id')
                ->where('id','in',$DelIDStr)
                ->whereOr('path','like',$TempArrPath,'or')
                ->order('sort asc,id asc')
                ->select();
            //dump($DelIDList);
            if(empty($DelIDList)){
//                $this->error('此记录已删除，请不要重复操作');
                $this->alert('此记录已删除，请不要重复操作','back');
                exit;
            }
            $DelIDTemp=[];$DelIDTempStr='';
            if(!empty($DelIDList)) {
                foreach ($DelIDList as $key => $val)
                {
                    $DelIDTemp[]=$val['id'];
                }
                $DelIDTempStr=implode(',',$DelIDTemp);
            }
//            dump($DelIDTempStr);
            //'id','in',$DelIDStr
            Db::name('auth_rule')
                ->where('id','in',$DelIDStr)
                ->whereOr('path','like',$TempArrPath,'or')
                ->delete();
//            dump($DelIDList);
//            echo db('auth_rule')->getLastSql();
            AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'批量删除成功','LogOperateContent'=>'ID:'.$DelIDTempStr]);
        }
//        $this->success('此记录批量删除成功');
        $this->alert('此记录批量删除成功','back');
        exit;
    }
    //批量排序
    public function sort()
    {
        $SortArr=input('post.Sort/a');
        //dump($SortArr);
        if(!empty($SortArr))
        {
            $TempArr=[];$SortID=[];$SortIDStr='';
            foreach ($SortArr as $key=>$val)
            {
                $SortID[]=$key;
                $TempArr[]=['id'=>$key,'sort'=>$val];
            }
            if(!empty($SortID)){$SortIDStr=implode(',',$SortID);}
            $Model=new \app\admin\model\AuthRule();
            $Model->saveAll($TempArr);
            AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'批量排序成功','LogOperateContent'=>'ID:'.$SortIDStr]);
        }
//        $this->success('排序更新成功');
        $this->alert('排序更新成功','back');
        exit;
    }
    //获取父分分类 $State 修改时当前级别之下的 子集则不显示
    protected function ThisParentTypeList($Keyword='',$State='',$CurrentID='',$PID='0',$TempArr=array(),$Seat='')
    {
        $Where=[];
        if(empty($Keyword))
        {
            $Where['parentid']=$PID;
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
            $Where['title']=['like','%'.$Keyword.'%'];
        }
        //->field('id,title,node,path')
        $List=Db::name('auth_rule')->where($Where)->order('sort asc,id asc')->select();
        if(empty($List))
        {
            return $TempArr;
        }else{
            if(empty($Keyword))
            {
                foreach ($List as $key=>$val)
                {
                    $val['oldtitle']=$val['title'];
                    $val['title']=$Seat.$val['title'];
                    $TempArr[$val['id']]=$val;
                    $TempArr=$this->ThisParentTypeList($Keyword,$State,$CurrentID,$val['id'],$TempArr,$Seat.'　　');
                }
            }else{
                $TempArr=$List;
            }
            return $TempArr;
        }
    }
    public function ThisParentTypeList2($PID='0',$TempArr=array(),$Seat='')
    {
        $Where=[];
        $Where['parentid']=$PID;
        $Where['status']=1;
        //->field('id,title,node,path')
        $List=Db::name('auth_rule')->where($Where)->order('sort asc,id asc')->select();
        if(empty($List))
        {
            return $TempArr;
        }else{
            foreach ($List as $key=>$val)
            {
                $val['oldtitle']=$val['title'];
                $val['title']=$Seat.$val['title'];
                $TempArr['List'][]=$this->ThisParentTypeList2($val['id'],$val,$Seat.'　　');
            }
            return $TempArr;
        }
        return $TempArr;
    }
}