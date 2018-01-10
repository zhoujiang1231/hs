<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file ="../include/linking.jsp"%>
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
				    	  stuAddress: {
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
				    	 //角色验证
			              per:  {
			                   validators: {
			                      notEmpty: {
			                          message: '权限不能为空'
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
	           				url :'${pageContext.request.contextPath}/role/roleUpdate.do',
	           				type : 'post',
	           				data :$("#form").serialize(),
	           				success : function(date){
		           				if(date=="1"){
		       						$(".save_success").text("修改成功！2秒后跳转！");
		       						$(".save_success").fadeIn(100);
		    						$(".save_success").fadeOut(2500);
		    						setTimeout("window.location.href ='${pageContext.request.contextPath}/role/roleList.do?cur=1'",2500);
		       					}
		           				if(date=="0"){
	 	           					$(".save_success").text("修改失败!");
		       						$(".save_success").fadeIn(100);
		    						$(".save_success").fadeOut(2500); 
		           				}
		           				if(date=="2"){
	 	           					$(".save_success").text("当前角色名已存在，请重新输入!");
	 	           					$("#stuAddress").val("");
	 	           					$(".save_success").fadeIn(100);
		    						$(".save_success").fadeOut(2500); 
		           				}
	           				}
	            		})
		        	 }) 
	            }) 
            /* //添加时表单验证
            function checkUpdateRole(){

            	var stuAddress = $("#stuAddress").val();
            	
            	//正则表达式
            	var resName = /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/;//名字
            	
            	var a = 0;
            	if(!resName.test(stuAddress) ||stuAddress==""){
            		a = 1;
            		$(".save_success").text("请填写正确的名字！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	
            	else if($(":checkbox[stuAddress=per]:checked").size() == 0){
            		a = 1;
            		$(".save_success").text("请至少选择一种权限！")
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	if(a=='0'){
            		$.ajax({
           				url :'${pageContext.request.contextPath}/role/roleUpdate.do',
           				type : 'post',
           				data :$("#form").serialize(),
           				success : function(date){
	           				if(date=="1"){
	       						$(".save_success").text("修改成功！2秒后跳转！");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500);
	    						setTimeout("window.location.href ='${pageContext.request.contextPath}/role/roleList.do?cur=1'",2500);
	       					}
	           				if(date=="0"){
 	           					$(".save_success").text("修改失败!");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500); 
	           				}
           				}
            		})
            	}
            } */
        </script>
    </head>
    <body stuAddress="role_off">
        <!--Logo区域开始-->
        <!--主要区域开始-->
        <div id="main">           
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="" method="post"  class=" form-horizontal" id="form">
                <br/><br/><br/><br/>
              <fieldset>
               	<div class="form-group">
	               <label class="col-xs-4  control-label">角色名称：</label>
	                 <div class="col-xs-4">
	                   <input type="text" class="form-control" id="stuAddress" stuAddress="stuAddress" value="${requestScope.role.role_name}"  placeholder="长度为20的字母、数字和汉字的组合" />
	                 </div>
	             </div>
                <input type = "hidden" stuAddress="id" value="${role.role_id}" />
                
                <div class="form-group">
                     		<label  class="col-sm-4 control-label">设置权限：</label>
                     		<div class="col-sm-4" style="margin-left:15px;border: 1px solid gray">
	           					<div > 
	                  				<div >  
	                  					<div style="line-height:25px"  class="checkbox">
	                       					<c:forEach items="${requestScope.powers}" var="power" varStatus="status">
	                                   		 	<label class="col-sm-6" >
	                                        		<input style="margin-top:-1px"  type="checkbox" stuAddress="per" value="${power.pow_id}"
	                                        		<c:forEach items="${requestScope.role.power}" var="p">
	                               						<c:if test="${p.pow_id == power.pow_id}">checked</c:if>
	                               					</c:forEach>
	                                        		/>${power.pow_name}
	                                    		</label>
	                            			</c:forEach>
	                            		</div>
	                       			</div>
                       			</div>
                       		</div>
                 		</div>
	                 
                    <div class="form-group">
                    	<div class="col-xs-2 col-xs-offset-4">
                        	<input type="submit" value="保存" class="btn btn-primary" />
                        </div>
                        <div class="col-xs-2">
                        <input type="button" value="取消" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/role/roleList.do?cur=1'"/>
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
