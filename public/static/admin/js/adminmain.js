/**
 * Created by Administrator on 2017/7/6.
 */
/* LayUI 事件绑定 Begin */
layui.use(['form'], function(){
    var form = layui.form,$ = layui.jquery;
    form.on('checkbox(AllSelectBox)', function(data){
//        console.log(data.elem); //得到checkbox原始DOM对象
//        console.log(data.elem.checked); //是否被选中，true或者false
//        console.log(data.value); //复选框value值，也可以通过data.elem.value得到
//        console.log(data.othis); //得到美化后的DOM对象
        var child = $(data.elem).parents('table').find('tbody input[name="Del[]"]');
        child.each(function(index, item){
            item.checked = data.elem.checked;
        });
        form.render('checkbox');
    });
    //form.on('select(EdusystemTypeID)',function(data){
    //    layer.msg(data.value);
    //})

    form.on('select(OtherCall)',function(data){
        if(data.value=='43')
        {
            $('#EduSystemOtherType').show();
        }else{
            $('#EduSystemOtherType').hide();
            //$('#EduSystemOtherType').attr('disabled',true);
        }
    });

    //监听指定开关
    form.on('switch(State)', function(data){
        var State=this.checked ? '1' : '0';
        var Url=$(this).attr('Url');
        var TableName=$(this).attr('TableName');
        var MainFieldID=$(this).attr('MainFieldID');
        var ChangeField=$(this).attr('ChangeField');
        var ID=$(this).attr('ID');
        $.ajax({
            url:Url,
            type:'POST',
            data:{State:State,TableName:TableName,MainFieldID:MainFieldID,ChangeField:ChangeField,ID:ID},
            dataType:'json',
            cache:false,
            success:function(Result){}
        });
    });
});
/* LayUI 事件绑定 End */

//全选
function AllSelectCheck(Obj)
{
    if(Obj.checked)
    {
        //layer.msg(1);
        $('input[name="Del[]"]').prop('checked',true);
    }else{
        //layer.msg(2);
        $('input[name="Del[]"]').prop('checked',false);
    }
}
//执行检查方法
function ExecuteCheck() {
    //获取当前要执行的类型
    var OperationType=$('#OperationType').val();
    if(OperationType=='0')
    {
        layer.msg("请选择您要执行的操作");
        return false;
    }

    var Url=$('#OperationType option:selected').attr('url');
    //删除选择操作
    if(OperationType=='Del')
    {
        var SelectObjCount=$('input[name="Del[]"]:checked').length;
        if(SelectObjCount<1)
        {
            layer.msg("请选择您要删除的记录");
            return false;
        }
        if(confirm('您确认要删除此记录吗？'))
        {
            $('#MyForm').attr('action',Url);
            $('#MyForm').submit();
            return true;
        }else{
            return false;
        }
    }

    //排序操作
    if(OperationType=='Sort')
    {
        if(confirm('您确认要对此记录进行排序吗？'))
        {
            $('#MyForm').attr('action',Url);
            $('#MyForm').submit();
            return true;
        }else{
            return false;
        }
    }

    //商品绑定
    if(OperationType=='Binding')
    {
        if(confirm('您确认要绑定所选择的商品吗？'))
        {
            $('#MyForm').attr('action',Url);
            $('#MyForm').submit();
            return true;
        }else{
            return false;
        }
    }

    //优惠券发放操作
    if(OperationType=='Grant')
    {
        var SelectObjCount=$('input[name="Del[]"]:checked').length;
        if(SelectObjCount<1)
        {
            layer.msg("请选择您要发放的优惠券");
            return false;
        }

        if(confirm('您确认要发放此优惠券吗？'))
        {
            $('#MyForm').attr('action',Url);
            $('#MyForm').attr('method','get');
            $('#MyForm').submit();
            return true;
        }else{
            return false;
        }
    }
}
//角色全部选择
function GroupAllSelectCheck(Obj)
{
    if(Obj.checked)
    {
        $('#GroupRuleDiv input').prop('checked',true)
    }else{
        $('#GroupRuleDiv input').prop('checked',false);
    }
}
//角色一级全部选择
function  OneAllSelect(Obj,Mark) {
    if(Obj.checked)
    {
        $('.CheckBox'+Mark).prop('checked',true);
        var State=$('.CheckBox'+Mark).is(':checked');
        if(State==true)
        {
            $('.CheckBox'+Mark).is(function () {
                var Val=$(this).val();
                $('.CheckBox'+Val).prop('checked',true);

                $('.CheckBox'+Val).is(function () {
                    var Val2=$(this).val();
                    $('.CheckBox'+Val2).prop('checked',true);
                });
            });

        }
    }else{
        $('.CheckBox'+Mark).prop('checked',false);
        var State=$('.CheckBox'+Mark).is(':checked');
        if(State==false)
        {
            $('.CheckBox'+Mark).is(function () {
                var Val=$(this).val();
                $('.CheckBox'+Val).prop('checked',false);

                $('.CheckBox'+Val).is(function () {
                    var Val2=$(this).val();
                    $('.CheckBox'+Val2).prop('checked',false);
                });
            });

        }
    }
}
//角色二级全部选择
function TwoAllSelect(Obj,Mark) {
    if(Obj.checked) {
        $('.CheckBox' + Mark).prop('checked', true);
    }else {
        $('.CheckBox' + Mark).prop('checked', false);
    }
}
//管理员名称是否被占用验证
function CheckAdminInfo(Obj,Url) {
    var AdminName=Obj.value;
    //layer.msg(AdminName);
    if(AdminName!="")
    {
        //layer.msg(Url);
        $.ajax({
            url:Url,
            type:'POST',
            dataType:'json',
            data:{'AdminName':AdminName},
            cache:false,
            success:function(Result)
            {
                //layer.msg(Result.code+'---'+Result.msg+'---'+Result.data.Int);
                $('#Msg1').html(Result.msg);
            }
        });
    }
}

//管理员表单信息验证
function AdminInfoFormCheck()
{
    var AdminName=$('#AdminName').val();
    var AdminPwd=$('input[name="AdminPwd"]').val();
    var AdminAffirmPwd=$('input[name="AdminAffirmPwd"]').val();
    if(AdminName=="")
    {
        layer.msg("您的昵称不能为空");
        return false;
    }
    if(AdminPwd=="")
    {
        layer.msg("您的密码不能为空");
        return false;
    }
    if(AdminPwd!=AdminAffirmPwd)
    {
        layer.msg("您所输入的密码不一致请确认");
        return false;
    }
}

//会员信息验证
function MemberInfoCheck(Obj,Url,FieldName,Seat,ID)
{
    if(ID==undefined) ID='0';
    if(Obj.value!="" && Obj.value!=undefined)
    {
        if(FieldName=='MemberMobile'){
            var MobileMod=/^1[3456789]\d{9}$/;
            if(!MobileMod.test(Obj.value)) {
                layer.msg("您的手机号格式有误");
                return false;
            }
        }else if(FieldName=='MemberEmail'){
            var EmailMod=/^\w+@[\w\.]+\.[a-z]{2,9}$/i;
            if(!EmailMod.test(Obj.value))
            {
                layer.msg("您的邮箱格式有误");
                return false;
            }
        }else if(FieldName=='Domain'){
            var EmailMod=/^[0-9a-zA-Z-]+$/i;
            if(!EmailMod.test(Obj.value))
            {
                layer.msg("域名设置有误");
                return false;
            }
        }

        $.ajax({
            type:'POST',
            url:Url,
            data:{'Val':Obj.value,'Field':FieldName,'ID':ID},
            dataType:'json',
            cache:false,
            success:function(Result)
            {
                //console.log(Result);
                if(Result.data.InfoState=='-1'){
                    $('#Msg'+Seat+'State').text(0);
                    return false;
                }
                if(Result.data.InfoState=='0')
                {
                    //layer.msg("可以使用");
                    $('#Msg'+Seat+'State').text(0);
                    return false;
                }else{
                    layer.msg("已被占用");
                    $('#Msg'+Seat+'State').text(1);
                    return false;
                }
            }
        })
    }
}

//会员信息验证
function MemberInfoCheck2(Obj,Url,FieldName,Seat)
{
    if(Obj.value!="" && Obj.value!=undefined)
    {
        $.ajax({
            type:'POST',
            url:Url,
            data:{'Val':Obj.value,'Field':FieldName},
            dataType:'json',
            cache:false,
            success:function(Result)
            {
                if(Result.data.InfoState=='0')
                {
                    //layer.msg("可以使用");
                    $('#Msg'+Seat+'State').text(0);
                    return false;
                }else{
                    layer.msg("您所填写的一级代理商不存在");
                    $('#Msg'+Seat+'State').text(1);
                    return false;
                }
            }
        })
    }
}

function MemberInfoCheck3(Obj,Url,Seat) {
    if(Obj.value!="" && Obj.value!=undefined)
    {
        $.ajax({
            type:'POST',
            url:Url,
            data:{'Val':Obj.value},
            dataType:'json',
            cache:false,
            success:function(Result)
            {
                if(Result.data.InfoState=='0')
                {
                    $('#Msg'+Seat+'State').text(0);
                    return false;
                }else{
                    layer.msg("此邀请码不存在");
                    $('#Msg'+Seat+'State').text(1);
                    return false;
                }
            }
        })
    }
}

//会员保存信息验证
function MemberAddSaveInfoCheck()
{
    var MemberName=$('input[name="MemberName"]').val();
    var MemberTrueName=$('input[name="MemberTrueName"]').val();
    var Domain=$('input[name="Domain"]').val();
    var MemberPwd=$('input[name="MemberPwd"]').val();
    var MemberAffirmPwd=$('input[name="MemberAffirmPwd"]').val();
    var MemberMobile=$('input[name="MemberMobile"]').val();
    var MemberEmail=$('input[name="MemberEmail"]').val();
    var MemberQQ=$('input[name="MemberQQ"]').val();
    var Msg1State=$('#Msg1State').text();
    var Msg2State=$('#Msg2State').text();
    var Msg3State=$('#Msg3State').text();
    var MobileMod=/^1[3456789]\d{9}$/;
    var EmailMod=/^\w+@[\w\.]+\.[a-z]{2,9}$/i;

    if(MemberName=="")
    {
        layer.msg("您的会员名称不能为空");
        return false;
    }

    if(Msg1State==1)
    {
        layer.msg("您填写的会员名称已被注册");
        return false;
    }

    if(MemberTrueName=='')
    {
        layer.msg("公司名称不能为空");
        return false;
    }

    if(Domain=='')
    {
        layer.msg("平台域名不能为空");
        return false;
    }

    // if(Msg2State==1)
    // {
    //     layer.msg("您填写的手机号已被注册");
    //     return false;
    // }

    if(MemberPwd=='')
    {
        layer.msg("当前会员密码不能为空");
        return false;
    }

    if(MemberPwd!=MemberAffirmPwd)
    {
        layer.msg("您输入的两次密码不一致");
        return false;
    }

    if(MemberMobile=="")
    {
        layer.msg("您的手机号不能为空");
        return false;
    }else if(!MobileMod.test(MemberMobile))
    {
        layer.msg("您的手机号格式有误");
        return false;
    }

    // if(Msg2State==1)
    // {
    //     layer.msg("您填写的手机号已被注册");
    //     return false;
    // }

    // if(MemberEmail=="")
    // {
    //     layer.msg("您的邮箱不能为空");
    //     return false;
    // }else if(!EmailMod.test(MemberEmail))
    // {
    //     layer.msg("您的邮箱格式有误");
    //     return false;
    // }
    //
    // if(Msg3State==1)
    // {
    //     layer.msg("您填写的电子邮箱已被注册");
    //     return false;
    // }

    if(MemberQQ=='')
    {
        layer.msg("在线QQ不能为空");
        return false;
    }
}


//会员数据修改验证
function MemberEditSaveInfoCheck()
{
    var MemberTrueName=$('input[name="MemberTrueName"]').val();
    var Domain=$('input[name="Domain"]').val();
    var MemberPwd=$('input[name="MemberPwd"]').val();
    var MemberAffirmPwd=$('input[name="MemberAffirmPwd"]').val();
    var MemberMobile=$('input[name="MemberMobile"]').val();
    var MemberEmail=$('input[name="MemberEmail"]').val();
    var MemberQQ=$('input[name="MemberQQ"]').val();
    var Msg2State=$('#Msg2State').text();
    var Msg3State=$('#Msg3State').text();
    var Msg4State=$('#Msg4State').text();
    var Msg5State=$('#Msg5State').text();
    var MobileMod=/^1[3456789]\d{9}$/;
    var EmailMod=/^\w+@[\w\.]+\.[a-z]{2,9}$/i;


    if(Msg5State==1)
    {
        layer.msg("您填写的域名已被注册");
        return false;
    }

    if(MemberPwd!='')
    {
        if(MemberPwd!=MemberAffirmPwd)
        {
            layer.msg("您输入的两次密码不一致");
            return false;
        }
    }

    if(MemberMobile=="")
    {
        layer.msg("您的手机号不能为空");
        return false;
    }else if(!MobileMod.test(MemberMobile))
    {
        layer.msg("您的手机号格式有误");
        return false;
    }

    // if(Msg2State==1)
    // {
    //     layer.msg("您填写的手机号已被注册");
    //     return false;
    // }

    // if(MemberEmail=="")
    // {
    //     layer.msg("您的邮箱不能为空");
    //     return false;
    // }else if(!EmailMod.test(MemberEmail))
    // {
    //     layer.msg("您的邮箱格式有误");
    //     return false;
    // }
    //
    // if(Msg3State==1)
    // {
    //     layer.msg("您填写的电子邮箱已被注册");
    //     return false;
    // }

}

//获取会员列表
function GetMemberList(Url) {
    var IntegralName=$('#IntegralName').val();
    if(IntegralName!='')
    {
        $.ajax({
            url:Url,
            type:'POST',
            data:{'Name':IntegralName},
            dataType:'json',
            cache:false,
            success:function (Result)
            {
                if(Result.data!=undefined)
                {
                    var Str='';
                    for(var i=0;i<Result.data.length;i++)
                    {
                        Str+='<label>';
                        Str+='<input type="checkbox" name="MemberID[]" value="'+Result.data[i].MemberID+'">&nbsp;';
                        Str+=Result.data[i].MemberName+'&nbsp;&nbsp;';
                        Str+='</label>';
                    }
                    $('#MemberList').html(Str);
                }
            }
        });
    }else{
        layer.msg("请选择您要搜索的会员");
        return false;
    }
}

//获取会员列表
function GetMemberBalanceList(Url) {
    var BalanceName=$('#BalanceName').val();
    if(BalanceName!='')
    {
        $.ajax({
            url:Url,
            type:'POST',
            data:{'Name':BalanceName},
            dataType:'json',
            cache:false,
            success:function (Result)
            {
                if(Result.data!=undefined)
                {
                    var Str='';
                    for(var i=0;i<Result.data.length;i++)
                    {
                        Str+='<label>';
                        Str+='<input type="checkbox" name="MemberID[]" value="'+Result.data[i].MemberID+'">&nbsp;';
                        Str+=Result.data[i].MemberName+'&nbsp;&nbsp;';
                        Str+='</label>';
                    }
                    $('#MemberList').html(Str);
                }
            }
        });
    }else{
        layer.msg("请选择您要搜索的会员");
        return false;
    }
}


function GetCurrentCouponsValue(Obj,SeatID) {
    $('#CouponsValue'+SeatID).val(Obj.value);
}

//获取联级菜单子分类
function GetTypeList(Obj,TableName,Url)
{
    var JQObj=$(Obj);//把JS对象转换为JQ对象
    var TypeID=parseInt(JQObj.val());//获取当前对象的值
    var ObjName=JQObj.attr('name');//获取当前对象的名字
    JQObj.nextAll().remove();//移除当前下拉菜单后面的 select
    if(TypeID>0){
        $.ajax({
            type: 'post',
            url: Url,
            data: {"TableName":TableName,"TypeID": TypeID},
            dataType: 'json',
            cache: false,
            success: function (Result) {
                var Data=Result.data;
                if(Data!="" || Data!=undefined)
                {
                    var Str='';
                    if(Data.length>0)
                    {
                        var Count=$('select[name="'+ObjName+'"]').length;
                        Str='<select name="'+ObjName+'" onchange="GetTypeList(this,\''+TableName+'\',\''+Url+'\');">';
                        Str+='<option value="0">'+(Count+1)+'级分类</option>';

                        $.each(Data,function(key,val){
                            Str+='<option value="'+val.TypeID+'_'+val.TypePath+'">'+val.TypeName+'</option>';
                        })

                        Str+='</select>';
                    }
                    JQObj.after(Str);
                }
            }
        });
    }
}

//快递单号查询
function ExpressNumberSearch(Url)
{
    var ExpressName=$('#ExpressName').val();
    var ExpressNumber=$('#ExpressNumber').val();
    if(ExpressName=="" || ExpressNumber =="")
    {
        layer.msg("请选择您的快递方式和填写订单编号");
        return false;
    }
    $.ajax({
        url:Url,
        type:'post',
        data:{'ExpressName':ExpressName,'ExpressNumber':ExpressNumber},
        dataType:'json',
        cache:false,
        success:function(Result)
        {
            $('#ExpressResult').html(Result.data);
        }
    });
}

//城市是否推荐状态
function ListStateChange(Obj,ID,State,Url,TableName,MainFieldID,ChangeField,ShowName) {
    var jqObj=$(Obj);
    State=State=='1'? 0 : 1;
    $.ajax({
        url:Url,
        type:'post',
        data:{'TableName':TableName,'MainFieldID':MainFieldID,'ChangeField':ChangeField,'State':State,'ID':ID},
        dataType:'json',
        cache:false,
        success:function(Result)
        {
            if(Result.code='0'){
                var NewShowName1='已'+ShowName;
                var NewShowName2='未'+ShowName;
                if(jqObj.text().trim()==NewShowName1){
                    jqObj.text(NewShowName2);
                }else{
                    jqObj.text(NewShowName1);
                }
            }
        }
    });
}

$(".imgScaleStyle").on('click',function(){
    var Src=$(this).attr('src');
    //页面层-佟丽娅
    layer.open({
        type: 1,
        title: false,
        closeBtn: 1,
        area: ['600px', 'auto'],
        skin: 'layui-layer-nobg', //没有背景色
        shadeClose: true,
        content: '<img src="'+Src+'" style="width: 600px;">'
    });
});

//邀请推荐
function OpenNextLevel(Obj,Url) {
    var JQObj=$(Obj);
    JQObj.parent('div').next().empty();
    JQObj.next('span').text('显示');
    $.ajax({
        url:Url,
        type:'post',
        data:{},
        dataType:'html',
        cache:false,
        success:function(Result){
            JQObj.parent('div').after(Result);
        }
    });
}

function ShowHideNextLevel(Obj) {
    var JQObj=$(Obj);
    JQObj.parent('div').next().toggle();
    if(JQObj.text()=='显示'){
        JQObj.text('隐藏');
    }else{
        JQObj.text('显示');
    }
}

//邀请码验证
function InviteCodeCheck(Obj,Url)
{
    if(Obj.value!="" && Obj.value!=undefined)
    {
        var InviteMemberID='-1';//$('select[name="InviteMemberID"]').val();
        if(InviteMemberID=='0'){
            layer.msg("请选择会员名称");
            return false;
        }
        $.ajax({
            type:'POST',
            url:Url,
            data:{'InviteMemberID':InviteMemberID,'Val':Obj.value},
            dataType:'json',
            cache:false,
            success:function(Result)
            {
                if(Result.code!='0')
                {
                    layer.msg(Result.msg);
                    $('#MsgState').text(1);
                    return false;
                }else{
                    //layer.msg("可以使用");
                    $('#MsgState').text(0);
                    return false;
                }
            }
        })
    }
}

//代理商会员类型选择
function MemberTypeSelect(Obj) {
    if(Obj.value=='2'){
        $('#OneAgencyShow').show();
    }else{
        $('#OneAgencyShow').hide();
    }
}

//代理商信息保存验证
function AgencyAddSaveInfoCheck()
{
    var MemberInviteCode=$('input[name="MemberInviteCode"]').val();
    var MemberName=$('input[name="MemberName"]').val();
    var MemberTrueName=$('input[name="MemberTrueName"]').val();
    var Domain=$('input[name="Domain"]').val();
    var MemberOneName=$('input[name="MemberOneName"]').val();
    var MemberTypeID=$('select[name="MemberTypeID"]').val();
    var MemberPwd=$('input[name="MemberPwd"]').val();
    var MemberAffirmPwd=$('input[name="MemberAffirmPwd"]').val();
    var MemberMobile=$('input[name="MemberMobile"]').val();
    var MemberEmail=$('input[name="MemberEmail"]').val();
    var MemberQQ=$('input[name="MemberQQ"]').val();
    var Msg1State=$('#Msg1State').text();
    var Msg2State=$('#Msg2State').text();
    var Msg3State=$('#Msg3State').text();
    var Msg5State=$('#Msg5State').text();
    var Msg6State=$('#Msg6State').text();
    var Msg7State=$('#Msg7State').text();
    var MobileMod=/^1[3456789]\d{9}$/;
    var EmailMod=/^\w+@[\w\.]+\.[a-z]{2,9}$/i;

    if(MemberInviteCode!=""){
        if(Msg7State=='1'){
            layer.msg("此邀请码不存在");
            return false;
        }
    }

    if(MemberName=="")
    {
        layer.msg("您的会员名称不能为空");
        return false;
    }

    if(Msg1State==1)
    {
        layer.msg("您填写的会员名称已被注册");
        return false;
    }

    if(MemberTrueName=='')
    {
        layer.msg("公司名称不能为空");
        return false;
    }
    if(Domain=='')
    {
        layer.msg("平台域名不能为空");
        return false;
    }
    if(Msg5State=='1'){
        layer.msg("此域名已被占用");
        return false;
    }

    if(MemberTypeID=='2'){
        if(MemberOneName==""){
            layer.msg("请填写您的一级代理商");
            return false;
        }
        if(Msg6State=='1'){
            layer.msg("您所填写的一级代理商不存在");
            return false;
        }
    }


    // if(Msg2State==1)
    // {
    //     layer.msg("您填写的手机号已被注册");
    //     return false;
    // }

    if(MemberPwd=='')
    {
        layer.msg("当前会员密码不能为空");
        return false;
    }

    if(MemberPwd!=MemberAffirmPwd)
    {
        layer.msg("您输入的两次密码不一致");
        return false;
    }

    if(MemberMobile=="")
    {
        layer.msg("您的手机号不能为空");
        return false;
    }else if(!MobileMod.test(MemberMobile))
    {
        layer.msg("您的手机号格式有误");
        return false;
    }

    // if(Msg2State==1)
    // {
    //     layer.msg("您填写的手机号已被注册");
    //     return false;
    // }

    // if(MemberEmail=="")
    // {
    //     layer.msg("您的邮箱不能为空");
    //     return false;
    // }else if(!EmailMod.test(MemberEmail))
    // {
    //     layer.msg("您的邮箱格式有误");
    //     return false;
    // }
    //
    // if(Msg3State==1)
    // {
    //     layer.msg("您填写的电子邮箱已被注册");
    //     return false;
    // }

    if(MemberQQ=='')
    {
        layer.msg("在线QQ不能为空");
        return false;
    }
}


//代理商信息修改保存验证
function AgencyEditSaveInfoCheck()
{
    var MemberTrueName=$('input[name="MemberTrueName"]').val();
    var Domain=$('input[name="Domain"]').val();
    var DomainState=$('input[name="DomainState"]').val();
    var MemberPwd=$('input[name="MemberPwd"]').val();
    var MemberAffirmPwd=$('input[name="MemberAffirmPwd"]').val();
    var MemberMobile=$('input[name="MemberMobile"]').val();
    var MemberEmail=$('input[name="MemberEmail"]').val();
    var MemberQQ=$('input[name="MemberQQ"]').val();
    var Msg2State=$('#Msg2State').text();
    var Msg3State=$('#Msg3State').text();
    var Msg4State=$('#Msg4State').text();
    var Msg5State=$('#Msg5State').text();
    var MobileMod=/^1[3456789]\d{9}$/;
    var EmailMod=/^\w+@[\w\.]+\.[a-z]{2,9}$/i;


    if(DomainState!='Yes')
    {
        if(Domain=="")
        {
            layer.msg("平台域名不能为空");
            return false;
        }
        if(Msg5State==1)
        {
            layer.msg("您填写的域名已被注册");
            return false;
        }
    }


    if(MemberPwd!='')
    {
        if(MemberPwd!=MemberAffirmPwd)
        {
            layer.msg("您输入的两次密码不一致");
            return false;
        }
    }

    if(MemberMobile=="")
    {
        layer.msg("您的手机号不能为空");
        return false;
    }else if(!MobileMod.test(MemberMobile))
    {
        layer.msg("您的手机号格式有误");
        return false;
    }

    // if(Msg2State==1)
    // {
    //     layer.msg("您填写的手机号已被注册");
    //     return false;
    // }

    // if(MemberEmail=="")
    // {
    //     layer.msg("您的邮箱不能为空");
    //     return false;
    // }else if(!EmailMod.test(MemberEmail))
    // {
    //     layer.msg("您的邮箱格式有误");
    //     return false;
    // }
    //
    // if(Msg3State==1)
    // {
    //     layer.msg("您填写的电子邮箱已被注册");
    //     return false;
    // }

}