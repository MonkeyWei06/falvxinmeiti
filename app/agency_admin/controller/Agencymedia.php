<?php
/**
 * Created by PhpStorm.
 * User: Memberistrator
 * Date: 2018/1/4
 * Time: 9:49
 */
namespace app\agency_admin\controller;
use app\agency_admin\model\Media as MediaModel;
use think\Db;
class Agencymedia extends Common
{
    private $PageCount=10;
    private $MenuName='媒体';//栏目名称
    protected $AgencyMemberInfo=array();
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->AgencyMemberInfo=Db::name('member')->where('MemberID',$this->AgencyMemberID)->find();
        $this->assign('AgencyMemberInfo',$this->AgencyMemberInfo);
        $this->assign('AgencyMemberID',$this->AgencyMemberID);
        $this->assign('AgencyMemberName',$this->AgencyMemberName);
    }
    /**
     * 搜索，也是index
     */
    public function search()
    {
        return view();
    }
    /**
     * 获得列表
     */
    public function getlist()
    {
        $UrlParam=input('get.');
        $this->assign('UrlParam',$UrlParam);
        $Where=array();
        $Where['agency_id']=$this->AgencyMemberInfo['MemberID'];
        $Model=new \app\member\model\Media();
        $List=$Model->GetMediaList2($UrlParam,$Where,20);
        $Back=array();
        $Back['code']='0';
        $Back['count']=$List->total();
        $Back['msg']='订单列表';
        $Back['data']=$List->items();
        return json($Back);
    }
     /**
     * 批量修改价格
     */
    public function priceadd(){
        if($this->request->isPost())
        {
            $Post=input('post.');
            $this->SaveBatchEdits($Post);
        }else {
            $models = Db::name('HomePrice')->where('member_id',session('AgencyMemberID'))->where('price_state',0)->order('price_id asc')->select();
            $this->assign('models',$models);
            $this->assign('MenuName',$this->MenuName);
            return $this->fetch();
        }
    }
    /**
     * 保存批量修改价格
     */
    private function SaveBatchEdits($Post)
    {
        if(empty($Post)) $this->error('您提交的数据不能为空');
        Db::name('home_price') ->where('member_id',session('AgencyMemberID'))->where('price_state',0)->delete();
        foreach ($Post['BeginPrice'] as $key=>$price){
            $data = [];
            $data['member_id'] = session('AgencyMemberID');
            $data['price_start'] = $price;
            $data['price_end'] = $Post['EndPrice'][$key];
            $data['price_one'] = $Post['MediaMemberPrice1'][$key];
            $data['price_two'] = $Post['MediaMemberPrice2'][$key];
            $data['price_three'] = $Post['MediaMemberPrice3'][$key];
            $data['price_four'] = $Post['MediaMemberPrice4'][$key];
            Db::name('home_price')->insert($data);
        }
        if($Post['gx'] == 1)
        {
            $list = Db::name('home_price')
                ->where('member_id',session('AgencyMemberID'))
                ->where('price_state',0)
                ->select();
            Db::name('home_price') ->where('member_id',session('AgencyMemberID'))->where('price_state',1)->delete();
            foreach ($list as $key=>$val)
            {
                unset($list[$key]['price_id']);
                $list[$key]['price_state'] = 1;
            }
            if($list) Db::name('home_price')->insertAll($list);
        }
        $this->alert('此记录批量修改成功','back');
    }
}