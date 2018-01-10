<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
       	<%@include file="../include/cbw.jsp" %> 
       	<style>
       		#container1 {
       		position: absolute;
			height: 100%;
			width: 100%;
			}
			#output1 {
			width: 100%;
			height: 100%;
			}
			body{
       			overflow:-Scroll;
       			overflow-x:hidden;
       		}
       	</style>
        <script language="javascript" type="text/javascript">
        	$(function(){
        		//背景图
        		var victor = new Victor("container1", "output1");
				var theme = [
				["#002c4a", "#005584"],
				["#35ac03", "#3f4303"],
				["#ac0908", "#cd5726"],
				["#5fcfff", "#30486b"]
				]
				victor(theme[3]).set();
        		
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
				    	 acc_idcard:{
				    		 validators: {
				    			 /* creditCard :{
				                	 message: '请输入合法的身份证'
				                 } */
				    			 notEmpty: {
				                     message: '身份证号不能为空'
				                 }, 
				                 numeric: {
				                	 message: '只能是数字'
				                 }, 
				                 stringLength: {
		                            min: 15,
		                            max: 18,
		                            message: '身份证不少于15位,不高于18位'
			                     },
				                 
				               /*   callback: {
			                        callback: function(value, validator) {
			                            // Check the password strength
										if(typeof($("#useraccount").attr("disabled"))!="undefined"){
			                            	$("#useraccount").removeAttr("disabled");
										}
			                            return true;
			                        }
			                    }    */ 
				    		 }
				    	 },
				    	 acc_login: {
				             message: 'The username is not valid',
				             validators: {
				                 notEmpty: {
				                     message: '账务账号不能为空'
				                 },
				                 stringLength: {
				                     min: 1,
				                     max: 16,
				                     message: '长度应在1-16之间'
				                 },
				                 regexp: {
				                     regexp: /^[a-zA-Z0-9_\.]+$/,
				                     message: '应以字母数字下划线组合'
				                 },
				             }
				         }, 
				         ser_os: {
				             message: 'The username is not valid',
				             validators: {
				                 notEmpty: {
				                     message: 'OS账号不能为空'
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
				         fee_id: {
				             validators: {
				                 notEmpty: {
				                     message: '资费类型不能为空'
				                 }
				             }
				         },
				         ser_ip: {
				        	 validators: {
				                 notEmpty: {
				                     message: 'ip地址不能为空'
				                 },
				                 ip:{
				                	 message: 'ip地址输入有误'
				                 }
				             }
				         },
				         ser_psw: {
				             validators: {
				                 notEmpty: {
				                     message: '密码不能为空'
				                 },
				                /*  identical: {
				                     field: 'rbusspsw',
				                     message: 'The password and its confirm are not the same'
				                 } */
				             }
				         },
				         rbusspsw: {
				             validators: {
				                 notEmpty: {
				                     message: '密码不能为空'
				                 },
				                 identical: {
				                     field: 'ser_psw',
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
	                 
	                 //提交前的验证
	                 var i = 0;
	                 var acc_idcard = $("#useridentify").val();
		        		$.ajax({
		        			url:'${pageContext.request.contextPath}/service/selectAcc.do',
		        			type: 'post',
		        			data:{
		        				acc_idcard:acc_idcard
		        			},
		        			success : function(data){
		        				if(data!=""){
		        					$("#useraccount").val(data.acc_login);
		        					$("#useraccount").attr("disabled","disabled");
		        					$("#accountid").val(data.acc_id); 
		        					$.post('${pageContext.request.contextPath}/service/add.do', $form.serialize(),function(data) {
		        	                	 if(data=="0"){
		        	                		 	$("#save_sussess_info").text("添加成功");
		        	        					showSussessResult();
		        	        				}else if(data=="1"){
		        	        					$("#save_error_info").text("此os账号在改服务器上已存在！");
		        	        					showErrorResult();
		        	        				}else if(data=="2"){
		        	        					showErrorResult();
		        	        				}else if(data=="3"){
		        	        					$("#save_error_info").text("保存失败,请至少选择一个权限!");
		        	        					showErrorResult();
		        	        				}
		        	                 }, 'json');
		        				}else{
		        					$("#save_error_info").text("此身份证未被注册或已被删除");
		        					showErrorResult();
		        					$("#useraccount").val("");
		        					$("#form1").data("bootstrapValidator").updateStatus("acc_login",  "NOT_VALIDATED",  null );
		        					$("#form1").data("bootstrapValidator").validateField('acc_login');
		        				}
		        				
		        			}
		        		});
	                 // Use Ajax to submit form data
	                /*  $.post('${pageContext.request.contextPath}/service/add.do', $form.serialize(),function(data) {
	                	 if(data=="0"){
	                		 	$("#save_sussess_info").text("添加成功");
	        					showSussessResult();
	        				}else if(data=="1"){
	        					$("#save_error_info").text("此os账号在改服务器上已存在！");
	        					showErrorResult();
	        				}else if(data=="2"){
	        					showErrorResult();
	        				}else if(data=="3"){
	        					$("#save_error_info").text("保存失败,请至少选择一个权限!");
	        					showErrorResult();
	        				}
	                 }, 'json'); */
	             });
	        	 $('#resetBtn').click(function() {
	        	        $('#form1').data('bootstrapValidator').resetForm(true);
	        	       /*  $("#useraccount").removeAttr("disabled"); */
	        	    });
	        	
	        	//查询账务账号
	        	$("#selectaccount").click(function(){
	        		var acc_idcard = $("#useridentify").val();
	        		if(acc_idcard==''||acc_idcard==null)
	        			return;
	        		$.ajax({
	        			url:'${pageContext.request.contextPath}/service/selectAcc.do',
	        			type: 'post',
	        			data:{
	        				acc_idcard:acc_idcard
	        			},
	        			success : function(data){
	        				if(data!=""){
	        					$("#form1").data("bootstrapValidator").updateStatus("acc_login",  "NOT_VALIDATED",  null );
	        					$("#useraccount").val(data.acc_login);
	        					/* $("#useraccount").attr("disabled","disabled"); */
	        					$("#accountid").val(data.acc_id);
	        					$("#form1").data("bootstrapValidator").validateField('acc_login');
	        				}else{
	        					$("#save_error_info").text("此身份证未被注册或已被删除");
	        					showErrorResult();
	        					$("#useraccount").val("");
	        				}
	        				
	        			}
	        		});
	        	});
	        	
	        	//
	        	/* $("#save").click(function(){
					$.ajax({
	        			url:'${pageContext.request.contextPath}/service/add.do',
	        			type: 'post',
	        			data:$("#form1").serialize(),
	        			success : function(data){
	        				if(data=="0"){
	        					showSussessResult();
	        				}else if(data=="1"){
	        					showErrorResult();
	        				}else if(data=="2"){
	        					$("#save_error_info").text("保存失败,两次密码输入不一致!");
	        					showErrorResult();
	        				}else if(data=="3"){
	        					$("#save_error_info").text("保存失败,请至少选择一个权限!");
	        					showErrorResult();
	        				}
	        			}
	        		});
					
				}); */
				
				$("#cancel").click(function(){
					location.href="${pageContext.request.contextPath}/view/service/service_list.jsp";
				});	
	        });
	      //保存成功的提示消息
	        function showSussessResult() {
	            showSussessDiv(true);
	            window.setTimeout("showSussessDiv(false);", 2000);
	        }
	        function showSussessDiv(flag) {
	            if (flag)
	            	$("#save_sussess_info").css("display","block");
	            else
	            	$("#save_sussess_info").css("display","none");
	        }
	        //保存失败后的信息
	        function showErrorResult() {
	            showErrorDiv(true);
	            window.setTimeout("showErrorDiv(false);", 2000);
	        }
	        function showErrorDiv(flag) {
	            var divResult = document.getElementById("save_error_info");
	            if (flag)
	            	$("#save_error_info").css("display","block");
	            else
	            	$("#save_error_info").css("display","none");
	        }
    

            //显示选填的信息项
            function showOptionalInfo(imgObj) {
                var div = document.getElementById("optionalInfo");
                if (div.className == "hide") {
                    div.className = "show";
                    imgObj.src = "../../images/hide.png";
                }
                else {
                    div.className = "hide";
                    imgObj.src = "../../images/show.png";
                }
            }
	        
            //自动查询账务账号
            function searchAccounts(txtObj) {
            	//alert(txtObj.value);
                document.getElementById("a1").innerHTML = txtObj.value;
            }
        </script>
    </head>
    <body name="service_off">
        <!--Logo区域开始-->
        <!--导航区域开始-->
        <%-- <%@include file="../include/header.jsp" %> --%>
        <!--主要区域开始-->
        <!--导航区域结束-->
        <div id="container1">
        <div id="output1">
        </div></div>
            <!--保存操作的提示信息-->
            <div id="save_sussess_info" class="save_success" style="position: absolute;margin-left:20%;text-align:center">添加成功</div>     
            <div id="save_error_info" class="save_fail" style="position: absolute;margin-left:20%;text-align:center">保存失败！<span id=""></span>服务器上已经开通过当前 OS 账号 。</div>
            <%-- <form id="form1" action="../../ServiceAddAction.do" method="post" class="main_form">
                <!--内容项-->
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" id="useridentify" name="acc_idcard" value="" class="width180"  />
                    <input type="button" id="selectaccount"  value="查询账务账号" class="btn_search_large" />
                    <span class="required">*</span>
                    <div id="identifyerror" class="validate_msg_short">没有此身份证号，请重新录入。</div>
                </div>
                <div class="text_info clearfix"><span>账务账号：</span></div>
                <div class="input_info">
                    <input type="text" id="useraccount"  name="acc_login" value="" onkeyup="searchAccounts(this);" />
                    <span class="required">*</span>
                    <div class="validate_msg_long">没有此账务账号，请重新录入。</div>
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info">
                    <select name="fee_id">
                    	<c:forEach items="${openFeeLs}" var="ls" varStatus="status">
                        	<option value="${ls.fee_id}">${ls.fee_name}</option>
                        </c:forEach>
                    </select>                        
                </div> 
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                    <input type="text" name="ser_ip" value="192.168.0.23"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">15 长度，符合IP的地址规范</div>
                </div>                   
                <div class="text_info clearfix"><span>登录 OS 账号：</span></div>
                <div class="input_info">
                    <input type="text" name="ser_os" value=""  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">8长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input type="password" name="ser_psw"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password" name="rbusspsw"  />
                    <span class="required">*</span>
                    <div class="validate_msg_long">两次密码必须相同</div>
                </div>     
                <!--操作按钮-->
                <div class="button_info clearfix">
                	<input type="hidden" name="acc_id" value=""  id="accountid" >
                    <input  id="save" type="button" value="保存" class="btn_save" />
                    <input id="cancel" type="button" value="取消" class="btn_save" />
                </div>
            </form>--%>
        	<br/>
	      	<br/>
	      	<br/>
	        <div class="row">
	        <section>
	        <form id="form1" action="${pageContext.request.contextPath}/service/add.do" method="post" class="main_form form-horizontal" >
	        	<fieldset>
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">身份证：</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" id="useridentify" name="acc_idcard" value="" />
	                     </div>
	                     <div class="col-xs-2">
                                <button type="button" id="selectaccount" class="btn btn-primary btn-sm" >查询账务账号</button>
                         </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">账务账号:</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" id="useraccount" readonly="readonly" class="readonly"  name="acc_login" value="" />
	                     </div>
	                 </div>
					
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费类型：</label>
	                     <div class="col-xs-4">
	                   		<select class="form-control" name="fee_id">
	                            <option value="">-- 请选择 --</option>
	                      		<c:forEach items="${openFeeLs}" var="ls" varStatus="status">
                        			<option value="${ls.fee_id}">${ls.fee_name}</option>
                        		</c:forEach>
	                         </select>
	                     </div>
	                 </div>
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">服务器 IP：</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" name="ser_ip" value="" />
	                     </div>
	                 </div>
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">登录 OS 账号：</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" name="ser_os" value="" />
	                     </div>
	                 </div>
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">密码：</label>
	                     <div class="col-xs-4">
	                         <input type="password" class="form-control" name="ser_psw" />
	                     </div>
	                 </div>
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">重复密码：</label>
	                     <div class="col-xs-4">
	                         <input type="password" class="form-control" name="rbusspsw" />
	                     </div>
	                 </div>
	                 <div class="form-group">
	                     <div class="col-xs-1 col-xs-offset-4">
                         		<button type="submit" class="btn btn-primary" >确定</button>	
                         </div>
                         <div class="col-xs-1">
                         		<button type="button" class="btn btn-primary" id="resetBtn">重置</button>
                         </div>
                         <div class="col-xs-1">
                         		<button id="cancel" type="button" class="btn btn-primary" >返回</button>
                         </div>
                         <input type="hidden" name="acc_id" value=""  id="accountid" />
	                 </div>  
	        	</fieldset>
	        </form>
	        </section>
	        </div>  
	        
	        
	        <!--主要区域结束-->
	        <div id="footer">
	          
	        </div>
	      
    </body>
</html>
