<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
         <style>
         	body{
       			overflow:-Scroll;
       			overflow-x:hidden;
       		}
         </style>
        <%@include file="../include/cbw.jsp" %>
        <script language="javascript" type="text/javascript">
            //保存成功的提示消息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
            
             $(function(){
	        	//表单验证
	        	 $('#form').bootstrapValidator({
				     message: 'This value is not valid', 
				     container: 'tooltip',
				     feedbackIcons: {
				         valid: 'glyphicon',
				         invalid: 'glyphicon',
				         validating: 'glyphicon'
				     }, 
				     fields: {
				    	 //名字验证
				    	  name: {
				             validators: {
				                 notEmpty: {
				                     message: '名字不能为空'
				                 },
				                 stringLength: {
				                     min: 2,
				                     max: 20,
				                     message: '长度应在2-20之间'
				                 },
				                 regexp: {
				                     regexp: /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/,
				                     message: '应以汉字、字母、数字的组合'
				                 },
				    		 }
				    	 },
				     //管理员账号验证
				     username: {
				             validators: {
				                 notEmpty: {
				                     message: '登录名不能为空'
				                 },
				                 stringLength: {
				                     min: 2,
				                     max: 30,
				                     message: '长度应在2-30之间'
				                 },
				                 regexp: {
				                     regexp: /^[A-Za-z0-9_]{2,30}$/,
				                     message: '应以字母数字下划线组合'
				                 },
				    		 }
				    	 },
				    	 //密码验证
				    	 psw: {
				             validators: {
				                 notEmpty: {
				                     message: '密码不能为空'
				                 },
				                 stringLength: {
				                     min: 2,
				                     max: 30,
				                     message: '长度应在2-30之间'
				                 },
				                 regexp: {
				                     regexp: /^[A-Za-z0-9_]{2,30}$/,
				                     message: '应以字母数字下划线组合'
				                 },
				    		 }
				    	 },
				    	 //重复密码验证
				    	 psw1: {
				             validators: {
				                 notEmpty: {
				                     message: '密码不能为空'
				                 },
				                 identical: {
				                     field: 'psw',
				                     message: '两次密码输入不一致'
				                 }
				             }
				         },
				    	 //上传图片验证
				    	 file: {
                			validators: {
                    			file: {
	                        		extension: 'gif,jpg,jpeg,png',  
	                        		type:'image/gif,image/jpeg,image/png',
	                        		maxSize: 10*1024*1024,
	                        		message: '图片大小不超过10M'
                    			}
               				 }
           				 },
				    	 //电话验证
				    	  tel: {
			                    validators: {
			                        notEmpty: {
			                            message: '电话号码不能为空'
			                        },
			                        regexp: {
					                     regexp: /^1[34578]\d{9}$/,
					                     message: '电话格式错误'
					                 },
			                    }
			                },
				    	 //email验证
				    	 email: {
			                    validators: {
			                        notEmpty: {
			                            message: '邮箱不能为空'
			                        },
			                        regexp: {
					                     regexp: /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)$/,
					                     message: '邮箱格式错误'
					                 },
			                    }
			                },
			             //角色验证
			              rol:  {
			                   validators: {
			                      notEmpty: {
			                          message: '角色不能为空'
			                 	   }
			                   	}
			              }
				     }
	        	 }).on('success.form.bv', function(e) {
	        			  
	        		// 终止重复提交
	        		e.preventDefault();
	        		// 得到form表单对象
	        		var $form = $(e.target);
	        		// 获得bootstrap验证对象
	        	    var bv = $form.data('bootstrapValidator');
	        		// 使用Ajax提交form表单数据
	        		var formData = new FormData(document.getElementById("form"));
            		$.ajax({
           				url  : '${pageContext.request.contextPath}/admin/adminAdd.do',
           				type : 'post',
           				data : formData, 
           				async: false,
   						cache: false,
   						contentType: false,
   						processData: false,
           				success : function(date){
	           				if(date=="1"){
	       						$(".save_success").text("添加成功！2秒后跳转！");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500);
	    						setTimeout("window.location.href ='${pageContext.request.contextPath}/admin/adminList.do?cur=1'",2500);
	       					}
	           				if(date=="0"){
 	           					$(".save_success").text("添加失败!");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500); 
	           				}
	           				if(date=="2"){
 	           					$(".save_success").text("当前登录账号已存在，请重新输入!");
 	           				 	$("#username").val("");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500); 
	           				}
           				}
            		})
	        	 }) 
            }) 
	        	 
           
        </script>
    </head>
    <body>
        <!--主要区域开始-->
        <div class="row">             
            <form action="" method="post" id="form" enctype="multipart/form-data" class="form-horizontal">
             <div id="save_result_info" class="save_success">保存成功！</div>
                   
                  <br/>
                 <fieldset>
                    <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label" >姓名：</label>
	                     <div class="col-xs-3">
	                         <input type="text" class="form-control" id="name" name="name" value=""/>
	                     </div>
	                 </div>
                    <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label">管理员账号：</label>
	                     <div class="col-xs-3">
	                         <input type="text" class="form-control" id="username" name="username" value=""/>
	                     </div>
	                 </div>
                    <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label">密码：</label>
	                     <div class="col-xs-3">
	                         <input type="password" class="form-control" id="psw" name="psw" value=""/>
	                     </div>
	                 </div>
                    <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label">重复密码：</label>
	                     <div class="col-xs-3">
	                         <input type="password" class="form-control" id="psw1" name="psw1" value=""/>
	                     </div>
	                 </div>
	                 <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label">上传头像：</label>
	                     <div class="col-xs-3">
	                         <input type="file" class="form-control" id="file" name="file" value=""/>
	                     </div>
	                 </div>
                    <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label">电话：</label>
	                     <div class="col-xs-3">
	                         <input type="text" class="form-control" id="tel" name="tel" value=""/>
	                     </div>
	                 </div>
                    <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label">email：</label>
	                     <div class="col-xs-3">
	                         <input type="text" class="form-control" id="email" name="email" value=""/>
	                     </div>
	                 </div>
                    <%-- <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label">角色：</label>
	                     <div class="input_info_scroll">
                            <ul>
                            	<c:forEach items="${requestScope.role}" var="role">
                               		 <li><input type="checkbox" value="${role.role_id}" name="rol"/>${role.role_name}</li>
                  				</c:forEach>
                            </ul>
                        </div>
	                 </div>  --%>  
	                 <div class="form-group">
                     		<label  class="col-sm-4 col-xs-offset-1 control-label">设置权限：</label>
                     		<div class="col-sm-4" style="margin-left:15px;border: 1px solid gray" >
	           					<div > 
	                  				<div >  
	                  					<div style="line-height:25px"  class="checkbox">
	                       					<c:forEach items="${requestScope.role}" var="role" varStatus="status">
	                                   		 	<label class="col-sm-4" >
	                                   		 	  <c:if test="${role.role_id!=1}">
	                                        		<input style="margin-top:-1px"  type="checkbox" name="rol" value="${role.role_id}" />${role.role_name}
	                                    		  </c:if>	
	                                    		</label>
	                            			</c:forEach>
	                            		</div>
	                       			</div>
                       			</div>
                       		</div>
                 		</div>
	                 
                    <div class="form-group">
                    	<div class="col-xs-2 col-xs-offset-5">
                        	<input type="submit" value="保存" class="btn btn-primary" />
                        </div>
                        <div class="col-xs-2">
                        <input type="button" value="取消" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/adminList.do?cur=1'"/>
                    	</div>
                    </div>
                    </fieldset>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
