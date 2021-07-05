
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<style>
    .pl-10{
        padding-left: 10px;
    }
    .f-12{
        font-size: 12px;
    }
    .active.size-XL{
        width: 64px;
        height: 64px;
    }
    .pt-10{
        padding-top: 10px;
    }
    .userTh{
        text-align: right!important;
    }

</style>
<div class="modal fade bs-example-modal-sm" id="UserInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">用户信息</h4>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <div style=" background-color:#5bacb6">
<%--                        <img class="avatar size-XL l" src="images/gallery/1.jpg">--%>
                        <dl style="margin-left:80px; color:#fff">
                            <dt><span class="f-18">张三</span> <span class="pl-10 f-12">男</span></dt>
                            <dd class="pt-10 f-12" style="margin-left:0">这家伙很懒，什么也没有留下</dd>
                        </dl>
                    </div>
                    <div style="padding: 30px 5px 5px 5px">
                        <table class="table-borderless">
                            <tbody>
                            <tr>
                                <th class="userTh">账号：</th>
                                <td>男</td>
                            </tr>
<%--                            <tr>--%>
<%--                                <th style="text-align: left!important; ">性别：</th>--%>
<%--                                <td>男</td>--%>
<%--                            </tr>--%>
                            <tr>
                                <th class="userTh">手机：</th>
                                <td>13000000000</td>
                            </tr>
                            <tr>
                                <th class="userTh">邮箱：</th>
                                <td >admin@mail.com</td>
                            </tr>
                            <tr>
                                <th class="userTh">地址：</th>
                                <td>北京市 海淀区</td>
                            </tr>
                            <tr>
                                <th class="userTh">注册时间：</th>
                                <td>2014.12.20</td>
                            </tr>
                            <tr>
                                <th class="userTh">积分：</th>
                                <td>330</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
