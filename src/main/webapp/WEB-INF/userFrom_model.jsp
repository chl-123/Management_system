
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<div class="modal fade" id="UserFromModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel" >用户信息</h4>
            </div>
            <div class="modal-body">
                <div class="card-body">
                    <form id="fm" class="form-horizontal"  >
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="Account" style="font-family: 宋体 ">账号:</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="Account" name="Account" placeholder="请输入账号..">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="Name" style="font-family: 宋体">用户姓名:</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="Name" name="Name" placeholder="请输入用户姓名..">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"  style="font-family: 宋体">性别:</label>
                            <div class="col-md-9">
                                <label class="lyear-radio radio-inline radio-primary">
                                    <input type="radio" name="Gender" value="1"><span>男</span>
                                </label>
                                <label class="lyear-radio radio-inline radio-primary">
                                    <input type="radio" name="Gender" value="0"><span>女</span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="Phonenum" style="font-family: 宋体">手机号码:</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="Phonenum" name="Phonenum" placeholder="请输手机号码..">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="Email" style="font-family: 宋体">邮箱:</label>
                            <div class="col-md-9">
                                <input class="form-control" type="email" id="Email" name="Email" placeholder="请输入邮箱..">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="Address" style="font-family: 宋体">地址:</label>
                            <div class="col-md-9">
                                <input class="form-control" type="text" id="Address" name="Address" placeholder="请输入地址..">
                            </div>
                        </div>

                    </form>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" id="btn_save">点击保存</button>
                <button type="reset" hidden id="resetBtn"></button>
            </div>
        </div>
    </div>
</div>
