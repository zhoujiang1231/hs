<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootcss/global.css" />
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootcss/global_color.css" />
    <script src="${pageContext.request.contextPath}/js/cbwjs/jquery-2.1.1.min.js"></script>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootstrapValidator.min.css" />
    <script src="${pageContext.request.contextPath}/js/cbwjs/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/cbwjs/bootstrapValidator.js"></script>
    <style type="text/css">
        body{
            overflow:scroll;
            overflow-x:hidden;
        }
    </style>
    <script language="javascript" type="text/javascript">
        $(document).ready(function(){
            //菜单图标样式
            $(function(){
                $("#menu a").each(function(){
                    if($(this).attr("class")==$("body").attr("name")){
                        $(this).attr("class",$("body").attr("name").replace("off","on"));
                    }
                });
            })

            $("#resetBtn").click(function () {
                window.location.href="${pageContext.request.contextPath}/view.main.jsp"
            })
            $("#user_type").change(function () {
                if($("#user_type").val()==1||$("#user_type").val()==0){
                    $(".sno_div").hide();
                    $("#sno").val("");
                    $(".name_div").show();
                    $(".psw_div").show();
                }
                else{
                    $(".sno_div").show();
                    $(".name_div").hide();
                    $(".psw_div").hide();
                    $("#user_name").val("");
                    $("#user_password").val("");
                }
            })
            //表单验证
            $('#form1').bootstrapValidator({
                /* message: 'This value is not valid', */
                container: 'tooltip',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    name: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty:{
                                message:'姓名不能为空'
                            },
                            regexp: {
                                regexp: /^[\u4e00-\u9fa5]{2,5}$/,
                                message: '请输入正确的姓名'
                            }
                        }
                    },
                    tel: {
                        message: 'The username is not valid',
                        validators: {
                            regexp: {
                                regexp: /^0\d{2,3}-?\d{7,8}|1\d{10}$/,
                                message: '手机或固话格式不符合规范'
                            }
                        }
                    },
                    email: {
                        message: 'The username is not valid',
                        validators: {
                            regexp: {
                                regexp: /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)$/,
                                message: 'email格式不符合规范'
                            }
                        }
                    },
                    sno: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty:{
                                message:'学号不能为空'
                            },
                            regexp: {
                                regexp: /^\d{16}$/,
                                message:'请输入16位数字格式的学号'
                            }
                        }
                    },
                    user_name: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            }
                        }
                    },
                    user_password: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            }
                        }
                    }
                }
            })
                .on('success.form.bv', function(e) {
                    e.preventDefault();
                    var $form = $(e.target);
                    var bv = $form.data('bootstrapValidator');
                    $.post('${pageContext.request.contextPath}/user/addUser', $form.serialize(),function(data) {
                        var result = data.result;
                        if(result==0){
                            $("#save_result_info").text(data.msg);
                            $("#save_result_info").show().delay(1000).fadeOut("slow");
                            setTimeout(function () {
                                window.location.href="${pageContext.request.contextPath}/view/user/user_list.jsp";
                            },1000);
                        }
                        $("#save_result_info").text(data.msg);
                        $("#save_result_info").show().delay(2000).fadeOut("slow");

                    }, 'json');
                });
            $('#resetBtn').click(function() {
                location.href='${pageContext.request.contextPath}/view/main.jsp';
            });
        })
    </script>
</head>
<body name="information_off">
<!--主要区域开始-->
<div>
    <!--保存操作后的提示信息：成功或者失败-->
    <div id="save_result_info" class="save_result_info" ></div>
    <br/>
    <div class="row">
        <section>
            <form id="form1" class="main_form form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" >姓名：</label>
                        <div class="col-sm-5" style="width:300px"><input id="name" name="name" type="text" class="form-control" value=""/></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" >类型：</label>
                        <div class="col-sm-5" style="width:300px">
                            <select id="user_type" name="user_type" class="form-control" >
                                <option value="0">管理员</option>
                                <option value="1">老师</option>
                                <option value="2">学生</option>
                            </select>
                        </div>
                    </div>
                        <div class="form-group sno_div" hidden>
                            <label class="col-sm-4 control-label" >学号：</label>
                            <div class="col-sm-5" style="width:300px">
                                <input id="sno" type="text" class="form-control" value="" name="sno"/>
                            </div>
                        </div>
                    <div class="form-group name_div">
                        <label class="col-sm-4 control-label" >登录名：</label>
                        <div class="col-sm-5" style="width:300px">
                            <input id="user_name" type="text" class="form-control" value="" name="user_name"/>
                        </div>
                    </div>
                    <div class="form-group psw_div">
                        <label class="col-sm-4 control-label" >密码：</label>
                        <div class="col-sm-5" style="width:300px">
                            <input id="user_password" type="text" class="form-control" value="" name="user_password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" >性别：</label>
                        <div class="col-sm-5" style="width:300px">
                            <select id="sex" name="sex" class="form-control" >
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" >电话：</label>
                        <div class="col-sm-5" style="width:300px">
                            <input id="tel" type="text" class="form-control" value="" name="tel"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" >Email：</label>
                        <div class="col-sm-5" style="width:300px">
                            <input id="email" type="text" class="form-control" value="" name="email"/>
                        </div>
                    </div>
                    <br/>
                    <div class="form-group">
                        <div class="col-xs-3 col-xs-offset-3" >
                            <button type="submit" style="width:100px" class="btn btn-primary" >保存</button>
                        </div>
                        <div class="col-xs-2">
                            <button type="button" style="width:100px" class="btn btn-primary" id="resetBtn">取消</button>
                        </div>
                    </div>
                </fieldset>
            </form>
        </section>
    </div>
</div>
<!--主要区域结束-->
<div id="footer">

</div>
</body>
</html>