<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
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
	        	
	        	//选定套餐
	        	$("#selid option[value='${service1.fee.fee_id}']").attr("selected", "selected");
				$("#save").click(function(){
					$.ajax({
	        			url:'${pageContext.request.contextPath}/service/modify.do',
	        			type: 'post',
	        			data:$("#form1").serialize(),
	        			success : function(date){
	        				if(date=="0"){
	        					showSussessResult();
	        				}else if(date=="1"){
	        					$("#save_error_info").text("保存失败!");
	        					showErrorResult();
	        				}else if(date=="2"){
	        					$("#save_error_info").text("保存失败!2次密码不一致");
	        					showErrorResult();
	        				}else if(date=="3"){
	        					$("#save_error_info").text("保存失败!旧密码有误");
	        					showErrorResult();
	        				}
	        			}
	        		});
				});
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
	            window.setTimeout("showErrorDiv(false);", 3000);
	        }
	        function showErrorDiv(flag) {
	            var divResult = document.getElementById("save_error_info");
	            if (flag)
	            	$("#save_error_info").css("display","block");
	            else
	            	$("#save_error_info").css("display","none");
	        }   
        </script>
    </head>
    <body name="service_off">
    	<div id="container1">
        <div id="output1">
        </div></div>
        <!--Logo区域开始-->
        <!--导航区域开始-->
        <%-- <%@include file="../include/header.jsp" %> --%>
        <!--主要区域开始-->
        <!--导航区域结束-->
        <div>
            <!--保存操作的提示信息-->
            <div id="save_sussess_info" class="save_success" style="position: absolute;margin-left:20%">修改成功！且在月底统一触发</div>
            <div id="save_error_info" class="save_fail" style="position: absolute;margin-left:20%">保存失败！</div>
            <%-- <form id="form1" action="../../ServiceModiAction.do?bussid=${buss.bussid}" method="post" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>业务账号ID：</span></div>
                <div class="input_info">
                    <input type="text" name="ser_id" value="${service1.ser_id}" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>OS 账号：</span></div>
                <div class="input_info">
                    <input type="text" value="${service1.ser_os}" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info">
                    <input type="text" value="${service1.ser_ip}" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info">
                    <select id="selid" name="fee_id">
                    	<c:forEach items="${openFeeLs}" var="ls" varStatus="status">
                        	<option value="${ls.fee_id}">${ls.fee_name}</option>
                        </c:forEach>
                    </select>  
                    <div class="validate_msg_long">请修改资费类型，或者取消修改操作。</div>                      
                </div>
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input id="save" type="button" value="保存" class="btn_save" />
                    <input id="cancel" type="button" value="取消" class="btn_save" />
                </div>

                
                <p>业务说明：<br />
                1、修改资费后，点击保存，并未真正修改数据库中的数据；<br />
                2、提交操作到消息队列；<br />
                3、每月月底由程序自动完成业务所关联的资费；</p> 
                
            </form>   --%>
            <br/>
            <br/>
            <br/>
            <br/>
	        <div class="row">
	        <section>
	        <form id="form1" action="${pageContext.request.contextPath}/service/modi.do" method="post" class="main_form form-horizontal" >
	        	<fieldset>
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">业务账号ID：</label>
	                     <div class="col-xs-4">
                    		<input type="text" name="ser_id" value="${service1.ser_id}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">OS 账号：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.ser_os}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">服务器 IP：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.ser_ip}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
					
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费类型：</label>
	                     <div class="col-xs-4">
	                     	<select class="form-control" id="selid" name="fee_id">
                    			<c:forEach items="${openFeeLs}" var="ls" varStatus="status">
                        			<option value="${ls.fee_id}">${ls.fee_name}</option>
                        		</c:forEach>
                    		</select>  
	                     </div>
	                 </div>
	                 <div class="form-group">
	                     <div class="col-xs-2 col-xs-offset-4">
                         		<button id="save" type="button" class="btn btn-primary" >确定</button>	
                         </div>
                         <div class="col-xs-1">
                         		<button id="cancel" type="button" class="btn btn-primary" >返回</button>
                         </div>
	                 </div>  
	        	</fieldset>
	        </form>
	        </section>
	        </div>  
	        </div>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
