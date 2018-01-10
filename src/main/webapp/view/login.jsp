<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录-电信资费系统</title>
<%@ include file ="include/link.jsp"%>    
<%@ include file ="include/cy.jsp"%>
<script>
	$(function(){
		
	
	  	$('#form1').bootstrapValidator({
	     /* message: 'This value is not valid', */
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
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);
            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            login();
           /*  $.post({
           	 	url:"${pageContext.request.contextPath}/fee/feeAdd.do",
           	 	data:$("#form1").serialize(),
           	 	success:function(data){
           		 	if(data==1){
    					//showSussessResult();
    					$(location).attr('href','${pageContext.request.contextPath}/fee/feeList.do');
    				}else if(data==-1){
    					showErrorResult();
    				}
           	 	}
            }) */
	 	})
		
/* 		$("#img").click(function(){
			login();
		}); */
		//提交登录
		function login(){
			var admin_account = $("#account").val();
			var admin_psw = $("#psw").val();
			var code = $("#code").val();
			$.ajax({
				url:'${pageContext.request.contextPath}/admin/login.do',
				type: 'post',
				data:{
					admin_account:admin_account,
					admin_psw:admin_psw,
					code:code
				},
				success : function(date){
					if(date=="0"){
						location.href="${pageContext.request.contextPath}/view/index.jsp";
					}else if(date=="1"){
						$("#span2").hide();
						$("#span1").show();
						var src = $("#vcode_img").attr("src");
						$("#vcode_img").attr("src",src+'?');
						/* $("#vcode_img").src=$("#vcode_img").src+'?'; */
					}
				}
			});
		}
	})
	/* //回车登录
	$(document).keydown(function(event){
	 	if (event.keyCode ==13){
	 		$("img").click();
		}
	}); */
	
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
            		<form id="form1" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/user/login">
						<div class="form-group">
							<div class="input-group col-sm-12">
								<span class="input-group-addon">用户名</span>
								<select name="user_type" id="user_type" class="form-control">
									<option value="0">管理员</option>
									<option value="1">教师</option>
									<option value="2">学生</option>
								</select>
								
							</div>
						</div>
                 		<div class="form-group">
                     		<div class="input-group col-sm-12">
                     			<span class="input-group-addon">用户名</span>
                         		<input id="user_name" name="user_name" class="form-control" type="text" placeholder="请输入用户名" />
                     		</div>
                 		</div>

                 		<div class="form-group">
                     		<div class="input-group col-sm-12">
                     			<span class="input-group-addon">密码</span>
                         		<input id="user_password" name="user_password" class="form-control" type="password" placeholder="请输入用户密码" />
                     		</div>
                 		</div>
                 		 <div class="form-group" style="margin-left:-30px">
	                 		 <div class="col-sm-6"> 
		                         <input type="text" name="code" class="form-control" id="code"  />
		                     </div>
		                     <div class="col-sm-5" style="margin-left:-10px">  
                     			<img id="vcode_img" src="${pageContext.request.contextPath }/open/getJPGCode.do" alt="验证码" class="img-rounded"  onclick="this.src=this.src+'?'"/>
                     		</div> 
                 		</div>  
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
	<!-- 登录body  end -->

	<!-- 登录页面底部 -->
	<!-- <div class="logFoot">
		<p class="p1">版权所有：蓝桥开发部第7组全体成员</p>
		<p class="p2">开发 :  肖睿，徐翔，曹博文，杨荭铃，陈杨，雷鸣</p>
		<p class="p2">测试 :  王雪韦</p>
	</div> -->
	<!-- 登录页面底部end -->
</body>
</html>