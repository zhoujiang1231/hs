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
			 $(document).ready(function(){
				//验证用户姓名
				/*$("#admin_name").blur(function(){
					var admin_name = $("#admin_name").val();
					var regs = /^[\u4e00-\u9fa5A-Za-z]{2,12}$/; //长度为2-12以内的字母汉字组合
					if(admin_name!= null && admin_name!=""){
						if(regs.test(admin_name)){
							$("#name_span1").remove();
							$("#name_span").remove();
							$("#name_div1").remove();
							$("#name_div").remove();
						}else{
							$("#name_span1").remove();
							$("#name_span").remove();
							$("#name_div1").remove();
							$("#name_div").remove();
							$("#admin_name").after("<div id="+"'name_div'"+"class="+"'validate_msg_long error_msg'>"+"12长度以内的汉字、字母的组合"+"</div>");
						}
					}else{
						$("#name_span1").remove();
						$("#name_span").remove();
						$("#name_div1").remove();
						$("#name_div").remove();
						$("#admin_name").after("<div id="+"'name_div'"+"class="+"'validate_msg_long error_msg'>"+"姓名不能为空"+"</div>");
					}
				});
				//验证用户电话
				$("#admin_tel").blur(function(){
					var admin_tel = $("#admin_tel").val();
					var regs = /^0\d{2,3}-?\d{7,8}|1\d{10}$/;//验证手机和固话
					if(admin_tel!= null && admin_tel!=""){
						if(regs.test(admin_tel)){
							$("#tel_span1").remove();
							$("#tel_div1").remove();
							$("#tel_span").remove();
							$("#tel_div").remove();
						}else{
							$("#tel_span1").remove();
							$("#tel_div1").remove();
							$("#tel_span").remove();
							$("#tel_div").remove();
							$("#admin_tel").after("<div id="+"'tel_div'"+"class="+"'validate_msg_medium error_msg'>"+"手机或固话格式不符合规范"+"</div>");
						}
					}else{
						$("#tel_span1").remove();
						$("#tel_div1").remove();
						$("#tel_span").remove();
						$("#tel_div").remove();
						$("#admin_tel").after("<div id="+"'tel_div'"+"class="+"'validate_msg_medium error_msg'>"+"手机或固话不能为空"+"</div>");
					}
				});
				//验证用户email
				$("#admin_email").blur(function(){
					//alert("enter");
					var admin_email = $("#admin_email").val();
					var regs = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)$/;//验证邮箱
					if(admin_email!= null && admin_email!=""){
						if(regs.test(admin_email)){
							$("#email_span1").remove();
							$("#email_div1").remove();
							$("#email_span").remove();
							$("#email_div").remove();
						}else{
							$("#email_span1").remove();
							$("#email_div1").remove();
							$("#email_span").remove();
							$("#email_div").remove();
							$("#admin_email").after("<div id="+"'email_div'"+"class="+"'validate_msg_medium error_msg'>"+"email格式不符合规范"+"</div>");
						}
					}else{
						$("#email_span1").remove();
						$("#email_div1").remove();
						$("#email_span").remove();
						$("#email_div").remove();
						$("#admin_email").after("<div id="+"'email_div'"+"class="+"'validate_msg_medium error_msg'>"+"email不能为空"+"</div>");
					}
				});
				//按钮提交保存
				$("#button_save").click(function(){
					 save();
 				});
				//回车提交保存
				$(document).keydown(function(event){
 		        	if (event.keyCode ==13){
 		        		 save();
		        	}
				});
				//判断信息是否发被修改
				//可以像点击图标一样返回到该页面
// 				function change(){
// 					var admin_name = $("#admin_name").val();
// 					var admin_tel = $("#admin_tel").val();
// 	        		var admin_email = $("#admin_email").val();
// 	        		var name = '${admin.admin_name}';
// 	        		var tel = '${admin.admin_tel}';
// 	        		var email = '${admin.admin_email}';
// 	        		if(admin_name==name && admin_tel==tel && admin_email==email){
// 						$(".save_fail").show().delay(1000).fadeOut("slow");
// 					}else{
// 						save();
// 					}
// 				}
				//更新重置信息
				$("#cancel").click(function(){
					var admin_name = $("#admin_name").val();
					var admin_tel = $("#admin_tel").val();	
					var admin_email = $("#admin_email").val();
					alert(admin_name);
					$("#admin_name").val(admin_name);
					$("#admin_tel").val(admin_tel);	
					$("#admin_email").val(admin_email);
				})
				//提交保存修改
				function save(){
	        		var name_div = $("#name_div");
					var tel_div = $("#tel_div");
	        		var email_div = $("#email_div");
	        		if(name_div.length>0){
	        			$("#admin_name").shake(4,3,200);
	        		}else{
	        			if(tel_div.length>0){
		        			$("#admin_tel").shake(4,3,200);
		        		}else{
		        			if(email_div.length>0){
		        				$("#admin_email").shake(4,3,200);
		        			}else{
		        				$("#name_span").remove();
								$("#name_div").remove();
								$("#tel_span").remove();
								$("#tel_div").remove();
								$("#email_span").remove();
								$("#email_div").remove();
								//Ajax提交
								$.ajax({
					       			url: '${pageContext.request.contextPath}/admin/modifyAdminInfo.do',
					       			type: 'post',
					       			data:{
					       				admin_id:$("#admin_id").val(),
					       				admin_name:$("#admin_name").val(),
					       				admin_tel: $("#admin_tel").val(),
					       				admin_email:$("#admin_email").val()
					       			},
					       			success:function(data){
					       				var msg = data.msg;
					     				if(msg==1){
					     					var adminModi = data.adminModi;
					     					$(".save_success").show().delay(1000).fadeOut("slow");
					     					$("#admin_name").val(adminModi.admin_name);
					     					$("#admin_tel").val(adminModi.admin_tel);
					     					$("#admin_email").val(adminModi.admin_email);					
					     					$("#font").text(adminModi.admin_name);					
					     				}else{
					     					$(".save_fail").show().delay(1000).fadeOut("slow");
					     				}
					       			}
								})
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
				} */
				//菜单图标样式
				$(function(){
					$("#menu a").each(function(){
						if($(this).attr("class")==$("body").attr("name")){
							$(this).attr("class",$("body").attr("name").replace("off","on"));
						}
					});
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
				    	 admin_name: {
				             message: 'The username is not valid',
				             validators: {
				                 notEmpty: {
				                     message: '姓名不能为空'
				                 },
				                 stringLength: {
				                     min: 2,
				                     max: 16,
				                     message: '长度在2-12以内'
				                 },
				                 regexp: {
				                     regexp: /^[\u4e00-\u9fa5A-Za-z]{2,12}$/,
				                     message: '长度为2-12以内的字母汉字组合'
				                 }
				             }
				         },
				         admin_tel: {
				             message: 'The username is not valid',
				             validators: {
				                 notEmpty: {
				                     message: '电话不能为空'
				                 },
				                 regexp: {
				                     regexp: /^0\d{2,3}-?\d{7,8}|1\d{10}$/,
				                     message: '手机或固话格式不符合规范'
				                 }
				             }
				         },
				         admin_email: {
				             message: 'The username is not valid',
				             validators: {
				                 notEmpty: {
				                     message: 'Email不能为空'
				                 },
				                 regexp: {
				                     regexp: /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)$/,
				                     message: 'email格式不符合规范'
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
	                 
	                 $.post('${pageContext.request.contextPath}/admin/modifyAdminInfo.do', $form.serialize(),function(data) {
	                	 var msg = data.msg;
		     				if(msg==1){
		     					window.parent.parent.headmenu.location.reload();
		     					$(".save_success").show().delay(2000).fadeOut("slow");
		     					
		     				}else{
		     					$(".save_info").show().delay(2000).fadeOut("slow");
		     				}
	                 }, 'json');
				 });
				$('#resetBtn').click(function() {
					/* var t = $("#admin_name").val();
					$("#admin_name").val("t")
					document.getElementById("form1").reset(); */
					/* $("#admin_name").val("${admin.admin_name}");
					$("#admin_tel").val("${admin.admin_tel}");
					$("#admin_email").val("${admin.admin_email}"); */
					location.href='${pageContext.request.contextPath}/view/main.jsp';
        	    });
			})
        </script>
    </head>
    <body name="information_off">
        <!--主要区域开始-->
        <div>  
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success" >保存成功！</div>
            <div id="save_result_info" class="save_info" >保存失败，数据并发错误！</div>
            <br/>
            <div class="row">
            <section>
            <form id="form1" action="${pageContext.request.contextPath}/admin/modifyAdminInfo.do" method="post" class="main_form form-horizontal">
            <fieldset>
            <div class="form-group">
                <label class="col-sm-4 control-label" >管理员账号：</label>
                <div class="col-sm-5" style="width:300px"><input type="text" readonly="readonly" class="form-control" value="${admin.admin_account}"/></div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >角色：</label>
                <div class="col-sm-5" style="width:300px">
                    <input type="text" readonly="readonly" class="form-control" value="${admin.admin_role_string}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >姓名：</label>
                <div class="col-sm-5" style="width:300px">
                    <input id="admin_name" type="text" class="form-control" value="${admin.admin_name}" name="admin_name"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >电话：</label>
                <div class="col-sm-5" style="width:300px">
                    <input id="admin_tel" type="text" class="form-control" value="${admin.admin_tel}" name="admin_tel"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >Email：</label>
                <div class="col-sm-5" style="width:300px">
                    <input id="admin_email" type="text" class="form-control" value="${admin.admin_email}" name="admin_email"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >创建时间：</label>
                <div class="col-sm-5" style="width:300px"><input type="text" readonly="readonly" class="form-control" value="<fmt:formatDate value="${admin.admin_date}" pattern="yyyy/MM/dd HH:mm:ss"/>"/></div>
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
                <input id="admin_id" type="hidden" name="admin_id" value="${admin.admin_id}"/> 
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
