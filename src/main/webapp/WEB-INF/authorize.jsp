<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
<!--    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>-->
    <title>后台管理系统模板</title>
<!--    <link rel="icon" href="favicon.ico" type="image/ico">-->
    <base href="http://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }/Management_System"/>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <link href="css/mycss.css" rel="stylesheet">
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
                        <li class="nav-item"><a href="index.html"><i class="mdi mdi-home"></i> 后台首页</a></li>
                        <li class="nav-item nav-item-has-subnav">
                            <a href="javascript:void(0)"><i class="mdi mdi-account-multiple"></i>用户管理</a>
                            <ul class="nav nav-subnav">
                                <li> <a href="http://localhost:8081/Management_System/admin/to/user_list/page.html">用户列表</a> </li>
                                <li> <a href="lyear_ui_cards.html">卡片</a> </li>

                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-account-settings-variant"></i>权限管理</a>
                            <ul class="nav nav-subnav">
                                <li > <a href="http://localhost:8081/Management_System/admin/to/admin_list/page.html">管理员列表</a> </li>
                                <li class="active"> <a href="http://localhost:8081/Management_System/admin/to/authorize/page.html">角色管理</a> </li>
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

                                <span>笔下光年 <span class="caret"></span></span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-right">
                                <li><a href="lyear_pages_profile.html"><i class="mdi mdi-account"></i> 个人信息</a></li>
                                <li><a href="lyear_pages_edit_pwd.html"><i class="mdi mdi-lock-outline"></i> 修改密码</a>
                                </li>
                                <li><a href="javascript:void(0)"><i class="mdi mdi-delete"></i> 清空缓存</a></li>
                                <li class="divider"></li>
                                <li><a href="lyear_pages_login.html"><i class="mdi mdi-logout-variant"></i> 退出登录</a>
                                </li>
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
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
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
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
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
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
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
                                <form class="pull-right search-bar" method="get" action="#!" role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <input type="hidden" name="search_field" id="search-field" value="title">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn"
                                                    data-toggle="dropdown" type="button" aria-haspopup="true"
                                                    aria-expanded="false">
                                                标题 <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a tabindex="-1" href="javascript:void(0)" data-field="title">标题</a>
                                                </li>
                                                <li><a tabindex="-1" href="javascript:void(0)"
                                                       data-field="cat_name">栏目</a></li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" value="" name="keyword"
                                               placeholder="请输入名称" style="width: 300px">
                                        <button class="btn_search btn btn-w-xs  btn-success"
                                                style="position:absolute;float: right;margin-left: 2px">绿色按钮
                                        </button>
                                    </div>
                                </form>
                                <div class="toolbar-btn-action">
                                    <a class="btn btn-primary m-r-5" data-toggle="modal" data-target="#myModal"><i
                                            class="mdi mdi-plus"></i> 新增</a>
                                    <!--                  <button type="button" class="btn btn-primary m-r-5" data-toggle="modal" data-target=".bs-example-modal-sm">新增</button>-->
                                    <!--                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">小模态框</button>-->
                                    <!--                  <a class="btn btn-success m-r-5" href="#!"><i class="mdi mdi-check"></i> 启用</a>-->
                                    <!--                  <a class="btn btn-warning m-r-5" href="#!"><i class="mdi mdi-block-helper"></i> 禁用</a>-->
                                    <a class="btn btn-danger" href="#!"><i class="mdi mdi-window-close"></i> 删除</a>
                                </div>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th width="25">
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>
                                            <th width="80" style="text-align: center">序号</th>
                                            <th width="200" style="text-align: center">角色名</th>
                                            <th style="text-align: center">用户列表</th>
                                            <th width="300" style="text-align: center">描述</th>
                                            <th width="100" style="text-align: center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" name="ids[]" value="1"><span></span>
                                                </label>
                                            </td>
                                            <td style="text-align: center">1</td>
                                            <td style="text-align: center">超级管理员</td>
                                            <td style="text-align: center">admin</td>
                                            <td style="text-align: center">拥有最高权力</td>
                                            <td style="text-align: center">
                                                <div class="btn-group">
                                                    <a class="btn btn-xs btn-default" href="#!" title="编辑"
                                                       data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                                    <a class="btn btn-xs btn-default" href="#!" title="删除"
                                                       data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
                                                </div>
                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <ul class="pagination">
                                    <li class="disabled"><span>«</span></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#1">2</a></li>
                                    <li><a href="#1">3</a></li>
                                    <li><a href="#1">4</a></li>
                                    <li><a href="#1">5</a></li>
                                    <li><a href="#1">6</a></li>
                                    <li><a href="#1">7</a></li>
                                    <li><a href="#1">8</a></li>
                                    <li class="disabled"><span>...</span></li>
                                    <li><a href="#!">14452</a></li>
                                    <li><a href="#!">14453</a></li>
                                    <li><a href="#!">»</a></li>
                                </ul>

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


<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">标题</h4>
            </div>
            <div class="modal-body">
                <div class="card-body">

                    <form action="" method="post" >
                        <div class="row cl">
                            <label class="form-label"><span class="c-red">*</span>角色名称：</label>
                            <div class="formControls">
                                <input type="text" class="input-text" value="" placeholder="" id="roleName" name="roleName" datatype="*4-16" nullmsg="用户账户不能为空">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label">备注：</label>
                            <div class="formControls">
                                <input type="text" class="input-text" value="" placeholder="" id="" name="">
                            </div>
                        </div>
                        <div class="row cl">
                            <label class="form-label">网站角色：</label>
                            <div class="formControls">
                                <dl class="permission-list">
                                    <dt>
                                        <label>
                                            <input type="checkbox" value="" name="user-Character-0" id="user-Character-0">
                                            资讯管理</label>
                                    </dt>
                                    <dd>
                                        <dl class="cl permission-list2">
                                            <dt>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-0" id="user-Character-0-0">
                                                    栏目管理</label>
                                            </dt>
                                            <dd>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-0">
                                                    添加</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-1">
                                                    修改</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-2">
                                                    删除</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-3">
                                                    查看</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-4">
                                                    审核</label>
                                                <label class="c-orange"><input type="checkbox" value="" name="user-Character-0-0-0" id="user-Character-0-0-5"> 只能操作自己发布的</label>
                                            </dd>
                                        </dl>
                                        <dl class="cl permission-list2">
                                            <dt>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-1" id="user-Character-0-1">
                                                    文章管理</label>
                                            </dt>
                                            <dd>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-0">
                                                    添加</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-1">
                                                    修改</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-2">
                                                    删除</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-3">
                                                    查看</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-0-1-0" id="user-Character-0-1-4">
                                                    审核</label>
                                                <label class="c-orange"><input type="checkbox" value="" name="user-Character-0-2-0" id="user-Character-0-2-5"> 只能操作自己发布的</label>
                                            </dd>
                                        </dl>
                                    </dd>
                                </dl>
                                <dl class="permission-list">
                                    <dt>
                                        <label>
                                            <input type="checkbox" value="" name="user-Character-0" id="user-Character-1">
                                            用户中心</label>
                                    </dt>
                                    <dd>
                                        <dl class="cl permission-list2">
                                            <dt>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-1-0" id="user-Character-1-0">
                                                    用户管理</label>
                                            </dt>
                                            <dd>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-0">
                                                    添加</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-1">
                                                    修改</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-2">
                                                    删除</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-3">
                                                    查看</label>
                                                <label class="">
                                                    <input type="checkbox" value="" name="user-Character-1-0-0" id="user-Character-1-0-4">
                                                    审核</label>
                                            </dd>
                                        </dl>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">点击保存</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="js/main.min.js"></script>
<script type="text/javascript">
    $(document).on("show.bs.modal", ".modal", function(){
        $(this).draggable();
        // $('#myModal').css("overflow-y", "scroll");
        // 防止出现滚动条，出现的话，你会把滚动条一起拖着走的
    });
    $(function () {
        $('.search-bar .dropdown-menu a').click(function () {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
        });


    });



</script>
</body>
</html>