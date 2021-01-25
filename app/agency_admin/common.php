<?php
//管理员操作日志记录明细表
function AdminLogDetail($Data=array())
{
    $request = request();
    $Node= $request->module().'/'.$request->controller().'/'. $request->action();
    $Model=db('admin_log');
    $Data['LogAdminID']=session('AdminID');
    $Data['LogOperateNode']=$Node;
    $Data['LogOperateIP']=$request->ip();
    $Data['LogOperateTime']=time();
    $Model->insert($Data);
}