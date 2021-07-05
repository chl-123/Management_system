<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
<%--  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />--%>
  <title>后台管理系统模板</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/Management_System"/>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/materialdesignicons.min.css" rel="stylesheet">
  <link href="css/style.min.css" rel="stylesheet">
  <link href="css/pagination.css" rel="stylesheet">
  <link rel="stylesheet" href="layui/css/layui.css">
  <link rel="stylesheet" href="js/jconfirm/jquery-confirm.min.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
<%--  <script type="text/javascript" src="js/DataTables/DataTables-1.10.25/js/jquery.dataTables.js"></script>--%>
  <script type="text/javascript" src="js/jquery-ui.js"></script>
  <script type="text/javascript" src="js/jquery.pagination.js" ></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
  <script type="text/javascript" src="js/main.min.js"></script>
  <script src="js/jconfirm/jquery-confirm.min.js" type="text/javascript"></script>

  <%--  <script type="text/javascript" src="layer/layer.js"></script>--%>
  <script type="text/javascript" src="layui/layui.js"></script>
  <script type="text/javascript" src="js/util.js" ></script>
  <script type="text/javascript" src="js/generateTable_PageInfo.js"></script>
<%--  <link rel="stylesheet" type="text/css" href="js/DataTables/DataTables-1.10.25/css/jquery.dataTables.css"/>--%>
  <script type="text/javascript">
    $(document).on("show.bs.modal", ".modal", function(){
      $(this).draggable();
      // $('#myModal').css("overflow-y", "scroll");
      // 防止出现滚动条，出现的话，你会把滚动条一起拖着走的
    });
    function btnClick() {
          $('#resetBtn').trigger('click');
    };
    $(function(){

      $('.search-bar .dropdown-menu a').click(function() {
        var field = $(this).data('field') || '';
        $('#search-field').val(field);
        $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
      });
      $("#addUser").click(function () {
        $('#fm')[0].reset()
        $("#UserFromModal").modal("show");
        $("#myModalLabel").text("添加用户信息")
      });
      window.pageNum=1;
      window.pageSize= 5;
      window.keyword="";
      window.url="http://localhost:8081/Management_System/admin/get/member/info.json";
      generatePage();
      $("#userListTableBody").on("click",".pencilBtn" ,function () {
        window.id=this.id
        var mind=$(this).parent().parent().prev().prev().prev().prev().prev().prev()
        var memberAccount =mind.prev().prev().prev().text();
        window.memberPassword=mind.prev().prev().text();
        var memberName    =mind.prev().text();
        var memberGender  =mind.text();
        var memberPhonenum=mind.next().text();
        var memberEmail   =mind.next().next().text();
        var memberAddress =mind.next().next().next().text();
        window.createTime     =$(this).parent().parent().prev().prev().text();
        $("#UserFromModal").modal("show");
        $("#myModalLabel").text("修改用户信息")
        $("#UserFromModal [name=Account]").val(memberAccount);
        $("#UserFromModal [name=Name]").val(memberName);
        if(memberGender=='1'){
          $("input[type=radio][name='Gender'][value='1']").prop("checked",true)
        }else {
          $("input[type=radio][name='Gender'][value='0']").prop("checked",true);
        }
        $("#UserFromModal [name=Phonenum]").val(memberPhonenum);
        $("#UserFromModal [name=Email]").val(memberEmail);
        $("#UserFromModal [name=Address]").val(memberAddress);
      });
      $("#userListTableBody").on("click",".userInfo" ,function () {



      });

      $('#btn_save').click(function () {
        var memberAccount =$("#UserFromModal [name=Account]").val();
        var memberName    =  $("#UserFromModal [name=Name]").val();
        var memberGender  =$("input[type=radio][name=Gender]:checked").val()
        var memberPhonenum=$("#UserFromModal [name=Phonenum]").val();
        var memberEmail   =$("#UserFromModal [name=Email]").val();
        var memberAddress =$("#UserFromModal [name=Address]").val();
        var datas=[memberAccount,memberName,memberGender,memberPhonenum,memberEmail,memberAddress];
        var name=$("#myModalLabel").text();
        if(name=='添加用户信息'){
          var url="http://localhost:8081/Management_System/admin/do/add_user/page.json";
          UpdateOrAddUser_ajax(url,datas);
        }else {
          var url="http://localhost:8081/Management_System/admin/do/update_user/page.json";
          UpdateOrAddUser_ajax(url,datas);
        }

      });
      $("#userListTableBody").on("click",".deleteBtn",function () {
         var id=this.id;
         var url="http://localhost:8081/Management_System/admin/do/remove_users/page.json";
         var idArray=[];
         idArray.push(id);
         del_confirm_msg(url,idArray);
      });
      $("#removeArrayBtn").click(function () {
          var idArray=[];
          $(".itemCheckbox:checked").each(function () {
              var id=this.id;
              idArray.push(id);
          });
          // var requestBody=JSON.stringify(idArray);
          if(idArray.length==0){
            layer.msg("请至少选择一个执行删除");
            return ;
          }
          var url="http://localhost:8081/Management_System/admin/do/remove_users/page.json";
          del_confirm_msg(url,idArray);
      });
      $("#userListTableBody").on("click",".itemCheckbox",function () {
          // layer.msg("a");
          var checkedBoxCount=$(".itemCheckbox:checked").length;
          var totalBoxCount=$("input[type=checkbox][name='itemCheckbox']").length;

          $("#checkAllItem").prop("checked",checkedBoxCount==totalBoxCount);

      });
      $("#checkAllItem").click(function () {
          var currentStatus=this.checked;
        $("input[type=checkbox][name='itemCheckbox']").prop("checked",currentStatus);

      });
      function UpdateOrAddUser_ajax(url,datas) {
        $.ajax({
          "url":url,
          "type":"post",
          "data":{
            "id":window.id,
            "memberAccount":  datas[0],
            "memberName":     datas[1]   ,
            "memberGender":   datas[2]  ,
            "memberPhonenum": datas[3],
            "memberEmail":    datas[4]   ,
            "memberAddress":  datas[5]
          },
          "dataType":"json",
          "success":function (response) {
            var result = response.result;
            if (result == "SUCCESS") {
              layer.msg("保存成功");
              generatePage();
              $("#UserFromModal").modal("hide");
            }
            if (result == "FAILED") {
              layer.msg("操作失败！ " + response.message);
            }
          },
          "error":function (response) {
            layer.msg(response.status+""+response.statusText);

          }
        });
      }
      function del_confirm_msg(url,dataArray) {
        var requestBody=JSON.stringify(dataArray);
        layer.msg('确定删除该信息？', {
          time: 20000, //20s后自动关闭
          btn: ['删除', '取消'],
          btn1:function () {
            $.ajax({
              "url":url,
              "dataType":"json",
              "type":"post",
              "contentType":"application/json;charset=UTF-8",
              "data":requestBody,
              "success":function (response) {
                var result = response.result;
                if (result == "SUCCESS") {
                  layer.msg("删除成功");
                  $("#checkAllItem").prop("checked",false);
                  generatePage();
                }
                if (result == "FAILED") {
                  layer.msg("操作失败！" + response.message);

                }
              },
              "error":function (response) {
                layer.msg(response.status+""+response.statusText);

              }
            })
          },area: ['200px', '120px'],
          btnAlign: 'c'
        });
      }
      $("#searchBtn1").click(function () {
        var keyword=$("#search_keyword").val();

        if(keyword.length==0||keyword==''){
          layer.msg("请输入要搜索的关键字")
        }else {

          window.keyword=keyword;
          generatePage();
          $("#search_keyword").val('');
        }

      });
      $("#userListTableBody").on("click",".switchItemBox",function () {
        var currentStatus=this.checked;
        var id=this.id;
        var state=1
        if(currentStatus){
          state=1;
        }
        else {
          state=0;
        }
        layer.msg(state+id);
        $.ajax({
          "url":"http://localhost:8081/Management_System/admin/do/update_user/page.json",
          "type":"post",
          "data":{
            "id":id,
            "state":state
          },
          "dataType":"json",
          "success":function (response) {
            var result = response.result;
            if (result == "SUCCESS") {
              layer.msg("保存成功");
              // generatePage();
              }
            if (result == "FAILED") {
              layer.msg("操作失败！ " + response.message);
            }
          },
          "error":function (response) {
            layer.msg(response.status+""+response.statusText);
          }
        });

      });


    });
  </script>
</head>

<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">

      <!-- logo -->
      <div id="logo" class="sidebar-header" style="width: auto;height: 68px">
        <a style="text-align: center;font-size:25px;margin-top: 15px"><span style="padding: 0px 0px 5px 10px ;text-align: center;">管理系统</span></a>
      </div>
      <div class="lyear-layout-sidebar-scroll">

        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <li class="nav-item"> <a href="index.html"><i class="mdi mdi-home"></i> 后台首页</a> </li>
            <li class="nav-item nav-item-has-subnav active open">
              <a href="javascript:void(0)"><i class="mdi mdi-account-multiple"></i>用户管理</a>
              <ul class="nav nav-subnav">
                <li class="active"> <a href="http://localhost:8081/Management_System/admin/to/user_list/page.html">用户列表</a> </li>
                <li> <a href="lyear_ui_cards.html">卡片</a> </li>
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav ">
              <a href="javascript:void(0)"><i class="mdi mdi-account-settings-variant"></i>权限管理</a>
              <ul class="nav nav-subnav">
                <li > <a href="http://localhost:8081/Management_System/admin/to/admin_list/page.html">管理员列表</a> </li>
                <li> <a href="http://localhost:8081/Management_System/admin/to/authorize/page.html">角色管理</a> </li>
                <li> <a href="http://localhost:8081/Management_System/admin/to/permission/page.html">权限</a> </li>
              </ul>
            </li>

          </ul>
        </nav>

      </div>

    </aside>
    <!--End 左侧导航-->

    <!--头部信息-->
    <header class="lyear-layout-header">
      <nav class="navbar navbar-default">
        <div class="topbar">
          <div class="topbar-left">
            <div class="lyear-aside-toggler">
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
            </div>
            <span class="navbar-page-title"> 示例页面 - 文档列表 </span>
          </div>

          <ul class="topbar-right">
            <li class="dropdown dropdown-profile">
              <a href="javascript:void(0)" data-toggle="dropdown">
                <!--                <img class="img-avatar img-avatar-48 m-r-10" src="images/users/avatar.jpg" alt="笔下光年" />-->
                <span>笔下光年 <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li> <a href="lyear_pages_profile.html"><i class="mdi mdi-account"></i> 个人信息</a> </li>
                <li> <a href="lyear_pages_edit_pwd.html"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
                <li> <a href="javascript:void(0)"><i class="mdi mdi-delete"></i> 清空缓存</a></li>
                <li class="divider"></li>
                <li> <a href="lyear_pages_login.html"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
              </ul>
            </li>
            <!--切换主题配色-->
            <li class="dropdown dropdown-skin">
              <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
              <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                <li class="drop-title"><p>主题</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                </li>
                <li class="drop-title"><p>LOGO</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" >
                    <label for="logo_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8" checked>
                    <label for="logo_bg_8"></label>
                  </span>
                </li>
                <li class="drop-title"><p>头部</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
                </li>
                <li class="drop-title"><p>侧边栏</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8" checked>
                    <label for="sidebar_bg_8"></label>
                  </span>
                </li>
              </ul>
            </li>
            <!--切换主题配色-->
          </ul>

        </div>
      </nav>

    </header>
    <!--End 头部信息-->

    <!--页面主要内容-->
    <main class="lyear-layout-content">

      <div class="container-fluid">

        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-toolbar clearfix">
                <div class="pull-right search-bar"   >
                  <div class="input-group">
<%--                    <div class="input-group-btn">--%>
<%--                      <input type="hidden" name="search_field" id="search-field" value="title">--%>
<%--                      <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">--%>
<%--                        标题 <span class="caret"></span>--%>
<%--                      </button>--%>
<%--                      <ul class="dropdown-menu">--%>
<%--                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">标题</a> </li>--%>
<%--                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="cat_name">栏目</a> </li>--%>
<%--                      </ul>--%>
<%--                    </div>--%>
                    <input type="text" class="form-control"  id="search_keyword" placeholder="请输入名称" style="width: 300px">
                    <button class=" btn btn-w-xs  btn-success" style="position:absolute;float: right;margin-left: 2px" id="searchBtn1" >搜索</button>
                  </div>
                </div>
                <div class="toolbar-btn-action">
                  <a class="btn btn-primary m-r-5" id="addUser"><i class="mdi mdi-plus"></i> 新增</a>
                  <!--                  <button type="button" class="btn btn-primary m-r-5" data-toggle="modal" data-target=".bs-example-modal-sm">新增</button>-->
                  <!--                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">小模态框</button>-->
                  <!--                  <a class="btn btn-success m-r-5" href="#!"><i class="mdi mdi-check"></i> 启用</a>-->
                  <!--                  <a class="btn btn-warning m-r-5" href="#!"><i class="mdi mdi-block-helper"></i> 禁用</a>-->
                  <a class="btn btn-danger" id="removeArrayBtn"><i class="mdi mdi-window-close"></i> 删除</a>
                </div>
              </div>
              <div class="card-body">

                <div class="table-responsive">
                  <table class="table table-bordered table-sort">
                    <thead>
                    <tr>
                        <th width="10" style="text-align: center">#</th>
                        <th width="25" style="text-align: center">
                          <label class="lyear-checkbox checkbox-primary checkbox-inline" style="text-align: center">
                            <input type="checkbox" id="checkAllItem"><span></span>
                          </label>
                        </th>
                        <th width="300" style="text-align: center">用户账号</th>
                        <th style="text-align: center">用户名</th>
                        <th  width="300" style="text-align: center">创建时间</th>
                        <th width="80" style="text-align: center">状态</th>
                        <th width="100" style="text-align: center">操作</th>
                      </tr>
                    </thead>
                    <tbody id="userListTableBody">

                    </tbody>
                  </table>
                </div>
                <div align="center" id="page_foot">
                  <div id="Pagination" class="pagination" ><!-- 这里显示分页 --></div>
                </div>

              </div>
            </div>
          </div>

        </div>

      </div>

    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<!--模态框-->
<%@include file="/WEB-INF/userFrom_model.jsp" %>
<%@include file="/WEB-INF/userInfo_model.jsp" %>



</body>
</html>