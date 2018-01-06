<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
       <%@ include file ="../include/linking.jsp"%>
       <style>
       	.form-horizontal .checkbox-inline {
			    padding-top: 8px;
			    margin-top: 1px;
			    margin-bottom: -14px;
			    margin-left: 9px;
			}
		div.input_info_scroll {
			    width: 360px;
			    text-align: left;
			    float: left;
			    height: 87px;
			    overflow-y: scroll;
			    overflow-x: auto;
			    border: 1px solid silver;
			    margin-left: 16px;
		}
		input.btn_save {
		    width: 100px;
		    height: 36px;
		    line-height: 38px;
		    font-size: 23px;
		    font-family: "黑体";
		    text-align: center;
		    margin-right: 57px;
		}
       </style>
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
				    	  per_name: {
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
	           				url :'${pageContext.request.contextPath}/role/roleAdd.do',
	           				type : 'post',
	           				data :$("#form").serialize(),
	           				success : function(date){
		           				if(date=="1"){
		       						$(".save_success").text("添加成功！2秒后跳转！");
		       						$(".save_success").fadeIn(100);
		    						$(".save_success").fadeOut(2500);
		    						setTimeout("window.location.href ='${pageContext.request.contextPath}/role/roleList.do?cur=1'",2500);
		       					}
		           				if(date=="0"){
	 	           					$(".save_success").text("添加失败!");
		       						$(".save_success").fadeIn(100);
		    						$(".save_success").fadeOut(2500); 
		           				}
		           				if(date=="2"){
	 	           					$(".save_success").text("当前角色名已存在，请重新输入!");
	 	           					$("#per_name").val("");
	 	           					$(".save_success").fadeIn(100);
		    						$(".save_success").fadeOut(2500); 
		           				}
	           				}
	            		})
		        	 }) 
	            }) 
           /*  //添加时表单验证
            function checkAddRole(){

            	var name = $("#per_name").val();
            	
            	//正则表达式
            	var resName = /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/;//名字
            	
            	var a = 0;
            	if(!resName.test(name) ||name==""){
            		a = 1;
            		$(".save_success").text("请填写正确的名字！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            
            	else if($(":checkbox[name=per]:checked").size() == 0){
            		a = 1;
            		$(".save_success").text("请至少选择一种权限！")
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	if(a=='0'){
            		$.ajax({
           				url :'${pageContext.request.contextPath}/role/roleAdd.do',
           				type : 'post',
           				data :$("#form").serialize(),
           				success : function(date){
	           				if(date=="1"){
	       						$(".save_success").text("添加成功！2秒后跳转！");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500);
	    						setTimeout("window.location.href ='${pageContext.request.contextPath}/role/roleList.do?cur=1'",2500);
	       					}
	           				if(date=="0"){
 	           					$(".save_success").text("添加失败!");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500); 
	           				}
           				}
            		})
            	}
            } */
        </script>
    </head>
    <body name="role_off">
        <!--主要区域开始-->
        <div >
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，角色名称重复！-->
            <form  class=" form-horizontal" role="form" id="form">
             <br/><br/><br/><br/>
              <fieldset>
               	<div class="form-group">
	               <label class="col-xs-4 col-xs-offset-1 control-label">角色名称：</label>
	                 <div class="col-xs-3">
	                   <input type="text" class="form-control" id="per_name" name="per_name" value=""  placeholder="长度为20的字母、数字和汉字的组合" />
	                 </div>
	             </div>     
	             
	             <div class="form-group" style="margin-bottom: 10px">
	             	<label class="col-sm-4 col-xs-offset-1 control-label">设置权限：</label>	
                	<div class="col-xs-3" style="margin-left:15px;border: 1px solid gray;line-height:15px" >
                	<div class="form-group" >
                          <div class="checkbox col-xs-6" >
                              <label>
                                  <input style="margin-top:-6px" type="checkbox" value="1" name="per"/> 角色管理
                              </label>
                          </div>

                          <div class="checkbox col-xs-6">
                              <label>
                                  <input style="margin-top:-6px" type="checkbox" value="2" name="per"/> 管理员管理
                              </label>
                          </div>
                    </div>
                    <div class="form-group" style="margin-top:-50px"> 
                          <div class="checkbox col-xs-6">
                              <label>
                                  <input style="margin-top:-6px" type="checkbox" value="3" name="per"/> 资费管理
                              </label>
                          </div>

                          <div class="checkbox col-xs-6">
                              <label>
                                  <input style="margin-top:-6px" type="checkbox" value="4" name="per"/> 账务账号
                              </label>
                          </div>
                    </div>
                     <div class="form-group" style="margin-top:-50px"> 
                          <div class="checkbox col-xs-6">
                              <label>
                                  <input style="margin-top:-6px" type="checkbox" value="5" name="per"/> 业务账号
                              </label>
                          </div>

                          <div class="checkbox col-xs-6">
                              <label>
                                  <input style="margin-top:-6px" type="checkbox" value="6" name="per"/> 账单
                              </label>
                          </div>
                    </div> 
                    <div class="form-group" style="margin-top:-25px" > 
                          <div class="checkbox col-xs-6">
                              <label>
                                  <input style="margin-top:-6px" type="checkbox" value="7" name="per"/> 报表
                              </label>
                          </div>
                          
                           
                    </div>    
                </div> 	
                </div>
              	<!-- <div class="form-group" style="margin-bottom: 40px">
	               <label class="col-sm-4 col-xs-offset-1 control-label">设置权限：</label>	
                	<div class="col-xs-3" style="margin-left:15px;border: 1px solid gray;line-height:40px">
                		<div class="form-group">
	                		<div class="col-sm-6" >
								<label ><input type="checkbox" value=1 name="per"/>角色管理</label>
							</div>
	                		<div class="col-sm-6" >
								<label><input type="checkbox" value=2 name="per"/>管理员管理</label>
							</div>
						</div>
						<div class="col-sm-4" >
								<label><input type="checkbox" value=3 name="per"/>资费管理</label>
							</div>
                		<div class="checkbox-inline" >
							<label><input type="checkbox" value=4 name="per"/>账务账号</label>
						</div>
                		<div class="checkbox-inline" >
							<label><input type="checkbox" value=5 name="per"/>业务账号</label>
						</div>
                		<div class="checkbox-inline">
							<label><input type="checkbox" value=6 name="per"/>账单</label>
						</div>
                		<div class="checkbox-inline" >
							<label><input type="checkbox" value=7 name="per"/>报表</label>
						</div>
                	</div>
                </div>  -->
                 <div class="form-group">
                    	<div class="col-xs-2 col-xs-offset-5">
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
