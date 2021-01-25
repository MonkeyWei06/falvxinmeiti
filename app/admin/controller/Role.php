<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/7/11
 * Time: 9:42
 */
namespace app\admin\controller;
use think\Request;
use app\admin\model\Role as RoleModel;
class Role extends Common
{
    private $MenuName='角色';
    public function _initialize()
    {
        parent::_initialize();
        $this->assign('MenuName',$this->MenuName);
    }
    //数据列表
    public function index()
    {
        $UrlParam=input('get.');
        $this->assign('UrlParam',$UrlParam);
        $Keyword=input('keyword','');
        $Model=new RoleModel();
        $List=$Model->GetList($Keyword);
        $this->assign('List',$List);
        return $this->fetch();
    }
    //数据添加
    public function add()
    {
        $Request=request::instance();
        if($Request->isPost())
        {
            $Rules=input('post.Rules/a');
            if(empty($Rules)){
//                $this->error('请选择当前角色的权限');
                $this->alert('请选择当前角色的权限','back');
                exit;
            }
            unset($_POST['Rules']);
            $_POST['rules']=implode(',',$Rules);
            $Model=new RoleModel();
            $Model->data($_POST)->save();
            $ID=$Model->id;
            AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'数据添加成功','LogOperateContent'=>'ID:'.$ID]);
//            $this->success($this->MenuName.'数据添加成功');
            $this->alert($this->MenuName.'数据添加成功','back');
            exit;
        }else{
            $AuthRuleList=controller('Rule');
            $AuthRuleList=$AuthRuleList->ThisParentTypeList2();
            //dump($AuthRuleList);
            $this->assign('AuthRuleList',$AuthRuleList);
            return $this->fetch();
        }
    }
    //编辑数据
    public function edit()
    {
        $ID=input('param.id');
        //var_dump(strpos(159,'5'));
        $Model=new RoleModel();
        $Request=Request::instance();
        if($Request->isPost())
        {
            $Rules=input('post.Rules/a');
            if(!empty($Rules))
            {
                $Rules=implode(',',$Rules);
                $_POST['rules']=','.$Rules.',';
            }
            unset($_POST['Rules']);
            $Model->update($_POST);
            AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'数据修改成功','LogOperateContent'=>'ID:'.$ID]);
//            $this->success('数据修改成功');
            $this->alert('数据添加成功','back');
            exit;
        }else{
            $Info=$Model->GetInfo($ID);
            //dump($Info['id']);
            $AuthRuleList=controller('Rule');
            $AuthRuleList=$AuthRuleList->ThisParentTypeList2();
            //dump($AuthRuleList);
            $this->assign('AuthRuleList',$AuthRuleList);
            $this->assign('Info',$Info);
            return $this->fetch();
        }
    }
    //删除数据
    public function del()
    {
        if($this->request->isPost())
        {
            $this->delmore();
        }elseif($this->request->isGet()) {
            $ID = input('param.id');
            if (!empty($ID)) {
                $Model = new RoleModel();
                $Model->where('id', $ID)->delete();
            }
            AdminLogDetail(['LogOperateTitle' => $this->MenuName . '记录删除成功', 'LogOperateContent' => 'ID:' . $ID]);
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
            $DelIDStr=implode(',',$DelID);
            $Model=new RoleModel();
            $Model->where('id','in',$DelIDStr)->delete();
            AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'批量删除成功','LogOperateContent'=>'ID:'.$DelIDStr]);
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
            $Model=new RoleModel();
            $Model->saveAll($TempArr);
            AdminLogDetail(['LogOperateTitle'=>$this->MenuName.'批量排序成功','LogOperateContent'=>'ID:'.$SortIDStr]);
        }
//        $this->success('排序更新成功');
        $this->alert('排序更新成功','back');
        exit;
    }
}