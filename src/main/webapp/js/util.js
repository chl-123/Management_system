var getSingle = function(fn) {
    var result;
    return function() {
        return (result || (result = fn.apply(this,arguments)));
    }
}

function getMyDate(str){
    var oDate = new Date(str),
        oYear = oDate.getFullYear(),
        oMonth = oDate.getMonth()+1,
        oDay = oDate.getDate(),
        oHour = oDate.getHours(),
        oMin = oDate.getMinutes(),
        oSen = oDate.getSeconds(),
        oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+
            getzf(oMin) +':'+getzf(oSen);//最后拼接时间
    return oTime;
};
//补0操作
function getzf(num){
    if(parseInt(num) < 10){
        num = '0'+num;
    }
    return num;
}

function check(){
    //得到name输入框对象
    var name = document.getElementById("loginAccount");
    //判断输入框是否有内容
    if(name.value.length==0){

        layer.msg("用户名不能为空")
        //提交停止
        return false;
    }
    var pass = document.getElementById("loginPassword");
    if(pass.value.length==0){
        layer.msg("密码不能为空")
        return false;
    }
    return true;
}


// 远程访问服务器端程序获取pageInfo数据
function getPageInfoRemote(url) {

    // 调用$.ajax()函数发送请求并接受$.ajax()函数的返回值
    var ajaxResult = $.ajax({
        "url": url,
        "type":"post",
        "data": {
            "pageNum": window.pageNum,
            "pageSize": window.pageSize,
            "keyword": window.keyword
        },
        "async":false,
        "dataType":"json"
    });

    console.log(ajaxResult);

    // 判断当前响应状态码是否为200
    var statusCode = ajaxResult.status;

    // 如果当前响应状态码不是200，说明发生了错误或其他意外情况，显示提示消息，让当前函数停止执行
    if(statusCode != 200) {
        layer.msg("失败！响应状态码="+statusCode+" 说明信息="+ajaxResult.statusText);
        return null;
    }

    var resultEntity = ajaxResult.responseJSON;

    // 从resultEntity中获取result属性
    var result = resultEntity.result;

    // 判断result是否成功
    if(result == "FAILED") {
        layer.msg(resultEntity.message);
        return null;
    }

    // 确认result为成功后获取pageInfo
    var pageInfo = resultEntity.data;

    return pageInfo;
}


// 填充表格
function fillTableBody(pageInfo,fn) {

    getSingle(fn);

    // 生成分页导航条
    generateNavigator(pageInfo);
}


// 生成分页页码导航条
function generateNavigator(pageInfo) {

    // 获取总记录数
    var totalRecord = pageInfo.total;
    var pre="上一页"
    var next="下一页"
    // 声明相关属性
    var properties = {
        "num_edge_entries": 1,
        "num_display_entries": 3,
        "callback": paginationCallBack,
        "items_per_page": pageInfo.pageSize,
        "current_page": pageInfo.pageNum - 1,
        "prev_text": pre,
        "next_text": next
    }

    // 调用pagination()函数
    $("#Pagination").pagination(totalRecord, properties);
}

// 翻页时的回调函数
function paginationCallBack(pageIndex) {

    // 修改window对象的pageNum属性
    window.pageNum = pageIndex + 1;

    // 调用分页函数
    generatePage();

    // 取消页码超链接的默认行为
    return false;

}
function User_listTable(pageInfo) {
    for(var i = 0; i < pageInfo.list.length; i++) {

        var member = pageInfo.list[i];
        var id=member.id;
        var memberID = member.memberAccount;
        var memberPassword=member.memberPassword;
        var memberName = member.memberName;
        var memberGender=member.memberGender;
        var memberPhonenum=member.memberPhonenum;
        var memberEmail=member.memberEmail;
        var memberAddress=member.memberAddress;
        var state=member.state;
        var creatTime=getMyDate(member.createTime);
        var numberTd = "<td  style='text-align: center' >"+(i+1)+"</td>";
        var checkboxTd = "<td style='text-align: center' class='itemCheckbox'><label class='lyear-checkbox checkbox-primary checkbox-inline'><input type='checkbox'  class='itemCheckbox' name='itemCheckbox'id='"+id+"'><span></span></label></td>";
        var memberIDTd = "<td style='text-align: center' class='memberIDTd'>"+memberID+"</td>";
        var memberNameTd = "<td style='text-align: center' class='memberNameTd'><a class='userInfo'>"+memberName+"</a></td>";
        var creatTimeTd = "<td style='text-align: center' class='creatTimeTd' >"+creatTime+"</td>";
        var memberPasswordTd = "<td style='text-align: center' hidden class='memberPasswordTd'>"+memberPassword+"</td>";
        var memberGenderTd = "<td style='text-align: center' hidden class='memberGenderTd'>"+memberGender+"</td>";
        var memberPhonenumTd = "<td style='text-align: center' hidden class='memberPhonenumTd'>"+memberPhonenum+"</td>";
        var memberEmailTd = "<td style='text-align: center' hidden class='memberEmailTd'>"+memberEmail+"</td>";
        var memberAddressTd = "<td style='text-align: center' hidden id='memberAddressTd'>"+memberAddress+"</td>";
        if(state==1){
            var switchTd="<td style='text-align: center'><label class='lyear-switch switch-solid switch-success'><input type='checkbox' class='switchItemBox' name='switchItemBox' id='"+id+"' checked><span></span></label></td>";
        }else {
            var switchTd="<td style='text-align: center'><label class='lyear-switch switch-solid switch-success'><input type='checkbox' class='switchItemBox' name='switchItemBox' id='"+id+"' ><span></span></label></td>";        }
        var pencil="<a id='"+id+"' class='pencilBtn btn btn-xs btn-default'  title='编辑' data-toggle='tooltip'><i class='mdi mdi-pencil'></i></a>"
        var close="<a id='"+id+"' class='deleteBtn btn btn-xs btn-default' title='删除' data-toggle='tooltip'><i class='mdi mdi-window-close'></i></a>"
        var btn_group="<td style='text-align: center'><div class='btn-group'>"+pencil+close+ "</div></td>";
        var tr = "<tr>"+numberTd+checkboxTd+memberIDTd+memberPasswordTd+memberNameTd+memberGenderTd+memberPhonenumTd+memberEmailTd+memberAddressTd+creatTimeTd+switchTd+btn_group+"</tr>";
        $("#userListTableBody").append(tr);
    }
}
function showUser_listTable(pageInfo) {
    //清除tbody中的旧的内容
    $("#userListTableBody").empty();

    // 这里清空是为了让没有搜索结果时不显示页码导航条
    $("#Pagination").empty();

    // 判断pageInfo对象是否有效
    if(pageInfo == null || pageInfo == undefined || pageInfo.list == null || pageInfo.list.length == 0) {
        // $("#userListTableBody").append("<tr><td colspan='7' align='center'></td>抱歉！没有查询到您搜索的数据！</tr>");
        $("#Pagination").append("<p align='center'>抱歉！没有查询到您搜索的数据！</p>")
        return ;
    }
    User_listTable(pageInfo);
}
function showAdmin_listTable(pageInfo) {
    //清除tbody中的旧的内容
    $("#adminListTableBody").empty();

    // 这里清空是为了让没有搜索结果时不显示页码导航条
    $("#Pagination").empty();

    // 判断pageInfo对象是否有效
    if(pageInfo == null || pageInfo == undefined || pageInfo.list == null || pageInfo.list.length == 0) {
        // $("#userListTableBody").append("<tr><td colspan='7' align='center'></td>抱歉！没有查询到您搜索的数据！</tr>");
        $("#Pagination").append("<p align='center'>抱歉！没有查询到您搜索的数据！</p>")
        return ;
    }
    admin_listTable(pageInfo);
}
function admin_listTable(pageInfo) {
    for(var i = 0; i < pageInfo.list.length; i++) {
        var admin = pageInfo.list[i];
        var id=admin.id;
        var Account     =admin.loginAccount;
        var Password=admin.loginPassword;
        var Name    =admin.userName;
        var Email  =admin.email;
        var Phonenum=admin.phoneNumber;
        var CreateTime   =getMyDate(admin.createTime);
        var State         =admin.status;
        var RoleList      =admin.roleList;

        var numberTd = "<td  style='text-align: center' >"+(i+1)+"</td>";
        var checkboxTd = "<td style='text-align: center' ><label class='lyear-checkbox checkbox-primary checkbox-inline'><input type='checkbox'  class='itemCheckbox' name='itemCheckbox'id='"+id+"'><span></span></label></td>";
        var AccountTd = "<td style='text-align: center' >"+Account+"</td>";
        var PasswordTd = "<td style='text-align: center' hidden><a class='userInfo'>"+Password+"</a></td>";
        var NameTd = "<td style='text-align: center'  >"+Name+"</td>";
        var EmailTd = "<td style='text-align: center'  >"+Email+"</td>";
        var PhonenumTd = "<td style='text-align: center'  >"+Phonenum+"</td>";
        if(RoleList==null||RoleList.length==0){

            var RoleListTd = "<td style='text-align: center'  >未分配角色</td>";
        }else {
            var roles='';
            for (var j = 0; j < RoleList.length; j++) {
                roles=roles+RoleList[j].name+" ";
            }
            var RoleListTd = "<td style='text-align: center' >"+roles+"</td>";
        }
        var CreateTimeTd = "<td style='text-align: center'  >"+CreateTime+"</td>";
        if(State==1){

            var stateTd="<td style='text-align: center'> <span class='label label-success'>启用</span></td>";

            var open_stop="<a id='"+id+"' class='deleteBtn btn btn-xs btn-default' title='停用' data-toggle='tooltip'><i class='mdi mdi-minus'></i></a>";
        }else {
            var stateTd="<td style='text-align: center'> <span class='label label-default'>停用</span></td>";
            var open_stop="<a id='"+id+"' class='deleteBtn btn btn-xs btn-default' title='启用' data-toggle='tooltip'><i class='mdi mdi-check'></i></a>";
        }
        var pencil="<a id='"+id+"' class='pencilBtn btn btn-xs btn-default'  title='编辑' data-toggle='tooltip'><i class='mdi mdi-pencil'></i></a>";
        var close="<a id='"+id+"' class='deleteBtn btn btn-xs btn-default' title='删除' data-toggle='tooltip'><i class='mdi mdi-window-close'></i></a>";

        var btn_group="<td style='text-align: center'><div class='btn-group'>"+open_stop+pencil+close+ "</div></td>";
        var tr = "<tr>"+numberTd+checkboxTd+AccountTd+NameTd+PhonenumTd+EmailTd+RoleListTd+CreateTimeTd+stateTd+btn_group+"</tr>";
        $("#adminListTableBody").append(tr);
    }
}
