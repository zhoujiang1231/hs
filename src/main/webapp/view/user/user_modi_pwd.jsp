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
       			overflow:-Scroll;
       			overflow-x:hidden;
       		}
		
		</style>
        <script language="javascript" type="text/javascript">
			$(function(){
				 $('#form').bootstrapValidator({
				     container: 'tooltip',
				     feedbackIcons: {
				         valid: 'glyphicon glyphicon-ok',
				         invalid: 'glyphicon glyphicon-remove',
				         validating: 'glyphicon glyphicon-refresh'
				     }, 
				     fields: {
                         oldpsw: {
				             validators: {
				                 notEmpty: {
				                     message: '旧密码不能为空'
				                 }
				             }
				         },
				         user_password: {
				             validators: {
				                 notEmpty: {
				                     message: '新密码不能为空'
				                 },
				                 regexp: {
				                     regexp: /^[a-zA-Z0-9_]{1,10}$/,
				                     message: '12长度以内的字母、数字和下划线的组合'
				                 }
				             }
				         },
                         newpsw: {
				             validators: {
				                 notEmpty: {
				                     message: '重复密码不能为空'
				                 },
				                 identical: {
				                     field: 'user_password',
				                     message: '两次密码输入不一致'
				                 }
				             }
				         },
				     }
				 })
				 .on('success.form.bv', function(e) {
	                 e.preventDefault();
	                 var $form = $(e.target);
	                 var bv = $form.data('bootstrapValidator');
	                 $.post('${pageContext.request.contextPath}/user/updateUserPsw', $form.serialize(),function(data) {
	                	 if(data.result==1){
	                	     $(".save_result_info").text(data.msg);
                             $(".save_result_info").show().delay(2000).fadeOut("slow");
	      				}else{
                             $(".save_result_info").text(data.msg);
                             $(".save_result_info").show().delay(3000).fadeOut("slow");
	      					setTimeout(function(){
	      						window.top.location="${pageContext.request.contextPath}/user/logout";
	      					},3000);
	      				}
	                 }, 'json');
				 });
				 $('#resetBtn').click(function() {
					 	location.href='${pageContext.request.contextPath}/view/main.jsp';
	        	    });
			})
		</script>
    </head>
    <body name="information_off">
        <div>
            <br/>
            <br/>
            <div id="save_result_info" class="save_result_info"></div>
            <br/>
            <br/>
            <br/>
            <br/>
            <div class="row">
            <form id="form"  class="main_form form-horizontal" name="form">
             <fieldset>
             <div class="form-group">
                <label class="col-sm-4 control-label" >旧密码：</label>
                <div class="col-sm-4">
                    <input id="oldpsw" type="password" class="form-control" name="oldpsw"  />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >新密码：</label>
                <div class="col-sm-4">
                    <input id="user_password" type="password"  class="form-control" name="user_password" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >重复新密码：</label>
                <div class="col-sm-4">
                    <input id="newpsw" type="password" class="form-control" name="newpsw" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-3 col-xs-offset-3" >
                	<button type="submit" style="width:100px" class="btn btn-primary" id="submit" name="submit">保存</button>
                </div>
                <div class="col-xs-2">
                   	<button type="button" style="width:100px" class="btn btn-primary" id="resetBtn" name="resetBtn">取消</button>
                </div>
            </div>
             	<input type="hidden" name = "user_id" id="user_id" value="${user_id}" />
            </fieldset>
            </form>  
            </div>
        </div>
        <!--主要区域结束-->
        <div id="footer">       
        </div>
    </body>
</html>
