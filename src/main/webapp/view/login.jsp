<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录-黄冈师范学院选课程管理系统</title>
<%@ include file ="include/link.jsp"%>    
<%@ include file ="include/cy.jsp"%>
<script>
	$(function(){
	  	$('#form1').bootstrapValidator({
		     container: 'tooltip',
		     feedbackIcons: {
		         valid: 'glyphicon',
		         invalid: 'glyphicon',
		         validating: 'glyphicon' 
		     },  
		     fields: {
		    	 admin_account:{
		    		 validators: {
		    			 notEmpty: {
		                     message: '账号不能为空'
		                 },
		                 stringLength: {
		                     min: 2,
		                     max: 16,
		                     message: '长度应在3-16之间'
		                 },
		                 regexp: {
		                     regexp: /^[a-zA-Z0-9_\.]+$/,
		                     message: '应以字母数字下划线组合'
		                 }		                 				                 
		    		 }
		    	 },
		    	 admin_psw: {
		             validators: {
		            	 notEmpty: {
		                     message: '密码不能为空'
		                 },
		                 stringLength: {
		                     min: 3,
		                     max: 16,
		                     message: '长度应在3-16之间'
		                 },
		                 regexp: {
		                     regexp: /^[a-zA-Z0-9_\.]+$/,
		                     message: '应以字母数字下划线组合'
		                 }		  
		             }
		         },	 	
		         code: {
		             validators: {
		            	 notEmpty: {
		                     message: '验证码不能为空'
		                 },	  
		             }
		         },	 	
	     	}
	 	})
	 	.on('success.form.bv', function(e) {
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator');
            login();
	 	})
		//提交登录
		function login(){
			var user_name = $("#user_name").val();
			var user_password = $("#user_password").val();
			var code = $("#code").val();
			$.ajax({
				url:'${pageContext.request.contextPath}/user/login',
				type: 'post',
				data:$("#form1").serialize(),
                dataType:"json",
                success : function(date){
					if(date.result=="0"){
						location.href="${pageContext.request.contextPath}/view/index.jsp";
					}else if(date.result=="1"){
					    $("#span1").text(date.msg);
						$("#span1").show();
						var src = $("#vcode_img").attr("src");
						$("#vcode_img").attr("src",src+'?');
					}
				}
			});
		}
	})

</script>
</head>
<body>

	<!-- 登录页面头部 -->
	<div class="logHead">
		<img src="../img/logLOGO.png" />
	</div>
	<!-- 登录页面头部结束 -->

	<!-- 登录body -->
	<div class="logDiv">
		<img class="logBanner" src="../img/logBanner.png" />
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
			</div>
			<br/>
			<div class="row">
             	<div class="col-sm-8 col-sm-offset-2"> 
            		<form id="form1" class="form-horizontal">
                 		<div class="form-group">
                     		<div class="input-group col-sm-12">
                     			<span class="input-group-addon">账号</span>
                         		<input id="user_name" name="user_name" class="form-control" type="text" placeholder="输入用户名" />
                     		</div>
                 		</div>

                 		<div class="form-group">
                     		<div class="input-group col-sm-12">
                     			<span class="input-group-addon">密码</span>
                         		<input id="user_password" name="user_password" class="form-control" type="password" placeholder="输入用户密码" />
                     		</div>
                 		</div>
                 		 <div class="form-group" style="margin-left:-30px">
	                 		 <div class="col-sm-6"> 
		                         <input type="text" name="code" class="form-control" id="code"  />
		                     </div>
		                     <div class="col-sm-5" style="margin-left:-10px">  
                     			<img id="vcode_img" src="${pageContext.request.contextPath }/user/vcode_img" alt="验证码" class="img-rounded"  onclick="this.src=this.src+'?'"/>
                     		</div> 
                 		</div>  
                 		<!-- <br/>  -->
                 		<div class="form-group">
                     		<div class="col-sm-9 col-sm-offset-2"> 
                          		<button id="img" type="submit" class="btn btn-primary btn-block" >登录</button>	
                     		</div>
                 		</div>
                 		
                 		<div id="span1" style="display:none;color:red" class="form-group">
                     		<span class="input-group-addon"></span>
                 		</div>
        			</form>
            	</div>
            </div>
		</div>
	</div>
</body>
</html>