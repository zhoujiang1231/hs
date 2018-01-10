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
 				/* //提示修改密码失败
 				var u = '${msg}';
 				if(u==-1){
 					$("#save_result_info").show().delay(1000).fadeOut("slow");
 				}
				//验证输入的旧密码是否规范
				$("#oldpsw").blur(function(){
					var oldpsw = $("#oldpsw").val();
					var regs = /^[a-zA-Z0-9_]{1,10}$/;
					if(oldpsw!= null && oldpsw!=""){
						if(regs.test(oldpsw)){
							$("#oldpsw_span").remove();
							$("#oldpsw_div").remove();
						}else{
							$("#oldpsw_span").remove();
							$("#oldpsw_div").remove();
							$("#oldpsw").after("<div id="+"'oldpsw_div'"+"class="+"'validate_msg_medium error_msg'>"+"12长度以内的字母、数字和下划线的组合"+"</div>");
						}
					}else{
						$("#oldpsw_span").remove();
						$("#oldpsw_div").remove();
						$("#oldpsw").after("<div id="+"'oldpsw_div'"+"class="+"'validate_msg_medium error_msg'>"+"旧密码不能为空"+"</div>");
					}
				})
				//验证第一次输入的新密码是否符合规范
				$("#newpsw1").blur(function(){
					var newpsw1 = $("#newpsw1").val();
					//alert(newpsw1);
					var regs = /^[a-zA-Z0-9_]{1,10}$/;
					if(newpsw1!= null && newpsw1!=""){
						if(regs.test(newpsw1)){
							$("#newpsw1_span").remove();
							$("#newpsw1_div").remove();
						}else{
							$("#newpsw1_span").remove();
							$("#newpsw1_div").remove();
							$("#newpsw1").after("<div id="+"'newpsw1_div'"+"class="+"'validate_msg_medium error_msg'>"+"12长度以内的字母、数字和下划线的组合"+"</div>");
						}
					}else{
						$("#newpsw1_span").remove();
						$("#newpsw1_div").remove();
						$("#newpsw1").after("<div id="+"'newpsw1_div'"+"class="+"'validate_msg_medium error_msg'>"+"新密码不能为空"+"</div>");
					}
				});
				//验证重新输入的新密码是否和第一次一致
				$("#newpsw2").blur(function(){
					var newpsw2 = $("#newpsw2").val();
					var newpsw1 = $("#newpsw1").val();
					//alert(newpsw2);
					var regs = /^[a-zA-Z0-9_]{1,10}$/;
					if(newpsw2!= null && newpsw2!=""){
						if(regs.test(newpsw2)){
							if(newpsw1 == newpsw2){
								$("#newpsw2_span").remove();
								$("#newpsw2_div").remove();
							}else{
								$("#newpsw2_span").remove();
								$("#newpsw2_div").remove();
								$("#newpsw2").after("<div id="+"'newpsw2_div'"+"class="+"'validate_msg_medium error_msg'>"+"两次输入的密码不一致"+"</div>");
							}
						}else{
							$("#newpsw2_span").remove();
							$("#newpsw2_div").remove();
							$("#newpsw2").after("<div id="+"'newpsw2_div'"+"class="+"'validate_msg_medium error_msg'>"+"12长度以内的字母、数字和下划线的组合"+"</div>");
						}
					}else{
						$("#newpsw2_span").remove();
						$("#newpsw2_div").remove();
						$("#newpsw2").after("<div id="+"'newpsw2_div'"+"class="+"'validate_msg_medium error_msg'>"+"重复密码不能为空"+"</div>");
					}
				});
				//按钮提交保存
				$("#submit_save").click(function(){
					save();
 				});
				//回车提交保存
				$(document).keydown(function(event){
 		        	if (event.keyCode ==13){
 		        		save();
		        	}
				});
				//提交保存
				function save(){
	        		var oldpsw_div = $("#oldpsw_div");
					var newpsw1_div = $("#newpsw1_div");
	        		var newpsw2_div = $("#newpsw2_div");
	        		if(oldpsw_div.length>0){
	        			$("#oldpsw").shake(4,3,200);
	        		}else{
	        			if(newpsw1_div.length>0){
		        			$("#newpsw1").shake(4,3,200);
		        		}else{
		        			if(newpsw2_div.length>0){
		        				$("#newpsw2").shake(4,3,200);
		        			}else{
		        				$("#oldpsw_span").remove();
								$("#oldpsw_div").remove();
								$("#newpsw1_span").remove();
								$("#newpsw1_div").remove();
								$("#newpsw2_span").remove();
								$("#newpsw2_div").remove();
			        			$("#save_button").submit();
		        			}
		        		}
	        		}
				}
				//抖动效果
	 			jQuery.fn.shake = function(intShakes , intDistance , intDuration ) {
	     			this.each(function() {
		 		        var jqNode = $(this);
		 		        jqNode.css({position: 'relative'});
		 		        for (var x=1; x<=intShakes; x++){
		 		            jqNode.animate({ left: (intDistance * -1) },(((intDuration / intShakes) / 4)))
		 		            .animate({ left: intDistance },((intDuration/intShakes)/2))
		 		            .animate({ left: 0 },((intDuration/intShakes)/4));
		 		        }
	 	    		});
	 	    		return this;
				}
				//重置处理
				$("#reset").click(function(){
					$("#oldpsw_span").remove();
					$("#oldpsw_div").remove();
					$("#newpsw1_span").remove();
					$("#newpsw1_div").remove();
					$("#newpsw2_span").remove();
					$("#newpsw2_div").remove();
					$("#oldpsw").after("<span id="+"'oldpsw_span'"+"class="+"'required'>"+"*"+"</span>"
							+"<div id="+"'oldpsw_div'"+"class="+"'validate_msg_medium'>"+"12长度以内的字母、数字和下划线的组合"+"</div>");
					$("#newpsw1").after("<span id="+"'newpsw1_span'"+"class="+"'required'>"+"*"+"</span>"
							+"<div id="+"'newpsw1_div'"+"class="+"'validate_msg_medium'>"+"12长度以内的字母、数字和下划线的组合"+"</div>");
					$("#newpsw2").after("<span id="+"'newpsw2_span'"+"class="+"'required'>"+"*"+"</span>"
							+"<div id="+"'newpsw2_div'"+"class="+"'validate_msg_medium'>"+"与新密码必须相同"+"</div>");
				}) */
				 $('#form1').bootstrapValidator({
					 /* message: 'This value is not valid', */
				     container: 'tooltip',
				     feedbackIcons: {
				         valid: 'glyphicon glyphicon-ok',
				         invalid: 'glyphicon glyphicon-remove',
				         validating: 'glyphicon glyphicon-refresh'
				     }, 
				     fields: {
				    	 oldpsw: {
				             message: 'The username is not valid',
				             validators: {
				                 notEmpty: {
				                     message: '旧密码不能为空'
				                 },
				                 regexp: {
				                     regexp: /^[a-zA-Z0-9_]{1,10}$/,
				                     message: '12长度以内的字母、数字和下划线的组合'
				                 }
				             }
				         },
				         newpsw1: {
				             message: 'The username is not valid',
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
				         newpsw2: {
				             message: 'The username is not valid',
				             validators: {
				                 notEmpty: {
				                     message: '重复不能为空'
				                 },
				                 regexp: {
				                     regexp: /^[a-zA-Z0-9_]{1,10}$/,
				                     message: '12长度以内的字母、数字和下划线的组合'
				                 },
				                 identical: {
				                     field: 'newpsw1',
				                     message: '两次密码输入不一致'
				                 }
				             }
				         },
				     }
				 })
				 .on('success.form.bv', function(e) {
	                 // Prevent form submission
	                 e.preventDefault();
						
	                 // Get the form instance
	                 var $form = $(e.target);
	                 // Get the BootstrapValidator instance
	                 var bv = $form.data('bootstrapValidator');
	                 
	                 $.post('${pageContext.request.contextPath}/admin/modifyAdminPsw.do', $form.serialize(),function(data) {
	                	
	                	 if(data==-1){
	      					$(".save_fail").show().delay(2000).fadeOut("slow");
	      				}else{
	      					$(".save_success").show().delay(3000).fadeOut("slow");
	      					setTimeout(function(){
	      						window.top.location="${pageContext.request.contextPath}/admin/adminExit.do";
	      					},3000);
	      				}
	                 }, 'json');
				 });
				 $('#resetBtn').click(function() {
					 	location.href='${pageContext.request.contextPath}/view/main.jsp';
	        	    });
			})
			function succ(){
				
			}
		</script>
    </head>
    <body name="information_off">
<%--     	<%@include file="../include/header.jsp" %> --%>
        <div>      
            <!--保存操作后的提示信息：成功（页面跳转）或者失败--> 
            <br/>
            <br/>
            <div id="save_result_info" class="save_fail">保存失败，输入的旧密码错误！</div>
            <div id="save_result_info" class="save_success" >修改成功！需重新登陆！</div>

            <br/>
            <br/>
            <br/>
            <br/>
            <div class="row">
            <form id="form1" action="${pageContext.request.contextPath}/admin/modifyAdminPsw.do" method="post" class="main_form form-horizontal">
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
                    <input id="newpsw1" type="password"  class="form-control" name="newpsw1" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >重复新密码：</label>
                <div class="col-sm-4">
                    <input id="newpsw2" type="password" class="form-control" name="newpsw2" />
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
             	<input type="hidden" name = "admin_id" value="${admin.admin_id}" /> 
             	<input id="admin_psw" type="hidden" name = "admin_psw" value="${admin.admin_psw}" />
            </fieldset>
            </form>  
            </div>
        </div>
        <!--主要区域结束-->
        <div id="footer">       
        </div>
    </body>
</html>
