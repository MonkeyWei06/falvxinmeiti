<?php
namespace app\member\controller;
use think\Db;
class Index extends  Common
{
    public function index()
    {
        $this->assign('info',$this->MemberInfo);
        $List= Db::name('newsdynamics')
            ->where('NewsState',1)
            ->order('NewsSort desc,NewsID Desc')
            ->limit(4)
			->select();
        $this->assign('list',$List);

		 $Membertype= Db::name('member')
            ->where('MemberID',$this->MemberID)
             ->find();
		 if($Membertype['MemberTypeID']==1){
			$Membertype['type_row']='V1';
		 }if($Membertype['MemberTypeID']==2){
			$Membertype['type_row']='V2';
		 }if($Membertype['MemberTypeID']==3){
			$Membertype['type_row']='V3';
		 }
        $this->assign('Membertype',$Membertype['type_row']);
		$this->assign('type',$Membertype['type']);
         return $this->fetch();
    }
}