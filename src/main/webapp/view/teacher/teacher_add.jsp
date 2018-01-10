<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global.css" />
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global_color.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/bootstrapValidator.min.css" />
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrapValidator.js"></script>
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
                    $("#stuNo").val("");
                    $(".name_div").show();
                    $(".psw_div").show();
                }
                else{
                    $(".sno_div").show();
                    $(".name_div").hide();
                    $(".psw_div").hide();
                    $("#stuName").val("");
                    $("#stuPassword").val("");
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
                    userName: {
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
                    userPassword: {
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
                    $.post('${pageContext.request.contextPath}/system/addUser?user_type=1', $form.serialize(),function(data) {
                        var result = data.result;
                        if(result==0){
                            $("#save_result_info").text(data.msg);
                            $("#save_result_info").show().delay(1000).fadeOut("slow");
                            setTimeout(function () {
                                window.location.href="../user/user_list.jsp";
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
                        <div class="col-sm-5" style="width:300px"><input id="userName" name="userName" type="text" class="form-control" value=""/></div>
                    </div>
                    <div class="form-group psw_div">
                        <label class="col-sm-4 control-label" >密码：</label>
                        <div class="col-sm-5" style="width:300px">
                            <input id="userPassword" type="text" class="form-control" value="" name="userPassword"/>
                        </div>
                    </div>
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
