<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta stuAddress="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/cbw.jsp" %> 
        <style>
       		#container1 {
       		position: absolute;
			height: 145%;
			width: 100%;
			}
			#output1 {
			width: 100%;
			height: 100%;
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
        		
        		
        		$("#cancel").click(function(){
					location.href="${pageContext.request.contextPath}/view/service/service_list.jsp";
				});
        		$("#selstatus option[value='${service1.ser_state}']").attr("selected", "selected");
	        });
        </script>
    </head>
    <body stuAddress="service_off">
    	<div id="container1">
        <div id="output1">
        </div></div>
        <!--Logo区域开始-->
        <!--导航区域开始-->
        <%-- <%@include file="../include/header.jsp" %> --%>
        <!--主要区域开始-->
        <!--导航区域结束-->
                   
            <%-- <form action="" method="" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>业务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${service1.ser_id}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${service1.account.acc_id}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>客户姓名：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${service1.account.acc_name}" /></div>
                <div class="text_info clearfix"><span>身份证号码：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${service1.account.acc_idcard}" /></div>
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info"><input type="text" value="${service1.ser_ip}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>OS 账号：</span></div>
                <div class="input_info"><input type="text" value="${service1.ser_os}" readonly class="readonly" /></div>
                
                <div class="text_info clearfix"><span>开通时间：</span></div>
                <div class="input_info"><input value="${service1.ser_createtime}" type="text" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info">
                    <select id="selstatus" disabled>
                        <option value="1">开通</option>
                        <option value="0">暂停</option>
                        <option value="2">删除</option>
                    </select>                        
                </div>      
                <div class="text_info clearfix"><span>暂停/删除时间：</span></div>
                <div class="input_info"><input value="${service1.ser_recordtime}" type="text" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>资费 ID：</span></div>
                <div class="input_info"><input value="${service1.fee.fee_id}" type="text" class="readonly" readonly /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info"><input value="${service1.fee.fee_name}" type="text" readonly class="width200 readonly" /></div>
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70 readonly" readonly>${service1.fee.fee_comment}</textarea>
                </div>  
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input id="cancel" type="button" value="返回" class="btn_save" />
                </div>
            </form> --%>
            <br/>
	        <div class="row">
	        <form id="form1" class="main_form form-horizontal" >
	        	<fieldset>
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">业务账号ID：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.ser_id}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">账务账号ID：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.account.acc_id}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                  <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">客户姓名：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.account.acc_name}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                  <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">身份证号码：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.account.acc_idcard}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                  <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">服务器 IP：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.ser_ip}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                  <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">OS 账号：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.ser_os}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                  <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">开通时间：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="<fmt:formatDate value="${service1.ser_createtime}" pattern="yyyy/MM/dd hh:mm:ss"/>" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
					
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">状态：</label>
	                     <div class="col-xs-4">
	                     	<select class="form-control" id="selstatus" disabled>
                       	 		<option value="1">开通</option>
                        		<option value="0">暂停</option>
                        		<option value="2">删除</option>
                    		</select>
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">暂停/删除时间：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="<fmt:formatDate value="${service1.ser_recordtime}" pattern="yyyy/MM/dd HH:mm:ss"/>" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费 ID：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.fee.fee_id}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费名称：</label>
	                     <div class="col-xs-4">
	                     	<input type="text" value="${service1.fee.fee_name}" readonly class="readonly form-control" />
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费说明：</label>
	                     <div class="col-xs-4">
	                     	<textarea class="readonly form-control" readonly>${service1.fee.fee_comment}</textarea>
	                     	<%-- <input type="text" value="${service1.account.acc_id}" readonly class="readonly form-control" /> --%>
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
                         <div class="col-xs-3 col-xs-offset-4">
                         		<button id="cancel" type="button" class="btn btn-primary btn-block" >返回</button>
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
