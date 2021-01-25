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
function FileDown($file_path,$file_name){
    //检查文件是否存在
    if (!file_exists ( $file_path )) {
        header('HTTP/1.1 404 NOT FOUND');
        echo '<script>alert("当前文件不存在");history.back();</script>';
        exit;
    } else {
        //以只读和二进制模式打开文件
        $file = fopen ( $file_path, "rb" );
        $filesize=filesize($file_path);//文件大小
        //告诉浏览器这是一个文件流格式的文件
        header ( "Content-type: application/octet-stream" );
        //请求范围的度量单位
        header ( "Accept-Ranges: bytes" );
        //Content-Length是指定包含于请求或响应中数据的字节长度
        header ( "Accept-Length: " . filesize ( $file_path ) );
        //用来告诉浏览器，文件是可以当做附件被下载，下载后的文件名称为$file_name该变量的值。
        header ( "Content-Disposition: attachment; filename=" . $file_name );
        //================重点====================
        ob_clean();
        flush();
        //=================重点===================
        //设置分流
        $buffer=1024;
        //来个文件字节计数器
        $count=0;
        while(!feof($file)&&($filesize-$count>0)){
            $data=fread($file,$buffer);
            $count+=$data;//计数
            echo $data;//传数据给浏览器端
        }
        fclose($file);
        exit ();
    }
}