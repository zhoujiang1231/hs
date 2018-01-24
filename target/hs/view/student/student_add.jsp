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
				    	 //学号验证
				    	  stuNo: {
				             validators: {
				                 notEmpty: {
				                     message: '学号不能为空'
				                 },
								 regexp:{
				                     regexp:/\d{13}$/,
									 message:"请输入13位数字"
								 }
				    		 }
				    	 },
				    	 //姓名验证
                         stuName: {
				             validators: {
				                 notEmpty: {
				                     message: '姓名不能为空'
				                 },regexp:{
                                     regexp:/^[\u4E00-\u9FA5]{2,4}$/,
                                     message:"请输入正确的姓名"
                                 }
				    		 }
				    	 },
                         //性别验证
                         stuSex: {
                             validators: {
                                 notEmpty: {
                                     message: '性别不能为空'
                                 }
                             }
                         },
                         /*//院系验证
                         stuDepart: {
                             validators: {
                                 notEmpty: {
                                     message: '院系不能为空'
                                 }
                             }
                         },
                         //住址验证
                         stuAddress: {
                             validators: {
                                 notEmpty: {
                                     message: '住址不能为空'
                                 }
                             }
                         },
                         //电话验证
                         stuTel: {
                             validators: {
                                 notEmpty: {
                                     message: '电话不能为空'
                                 }
                             }
                         },
                         //邮件验证
                         stuEmail: {
                             validators: {
                                 notEmpty: {
                                     message: '邮件不能为空'
                                 }
                             }
                         },
                         //身份证验证
                         stuIdcard: {
                             validators: {
                                 notEmpty: {
                                     message: '身份证不能为空'
                                 }
                             }
                         }*/
				     }
	        	 }).on('success.form.bv', function(e) {
	        		// 终止重复提交
	        		e.preventDefault();
	        		// 得到form表单对象
	        		var $form = $(e.target);
	        		// 获得bootstrap验证对象
	        	    var bv = $form.data('bootstrapValidator');
	        		// 使用Ajax提交form表单数据
            		$.ajax({
           				url  : '${pageContext.request.contextPath}/student/addStudent',
           				type : 'post',
           				data : $("#form").serialize(),
						dataType:'json',
           				success : function(data){
                            $(".save_success").text(data.msg);
                            $(".save_success").fadeIn(100);
                            $(".save_success").fadeOut(2500);
	           				if(data.result=="0"){
	    						setTimeout("window.location.href ='student_list.jsp'",2500);
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
            <form id="form" class="form-horizontal">
                  <br/>
                 <fieldset>
					 <div class="form-group">
						 <div class="col-xs-3">
						 </div>
					 </div>
					 <div class="form-group">
						 <div class="col-xs-3">
						 </div>
					 </div>
					 <div class="form-group">
						 <div class="col-xs-3">
						 </div>
					 </div>
					 <div id="save_result_info" class="save_success">保存成功！</div>
					 <div class="form-group">
						 <div class="col-xs-3">
						 </div>
					 </div>
					 <div class="form-group">
						 <div class="col-xs-3">
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >学号：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="stuNo" name="stuNo" value=""/>
						 </div>
					 </div>
                    <div class="form-group">
	                     <label class="col-xs-4 col-xs-offset-1 control-label" >姓名：</label>
	                     <div class="col-xs-3">
	                         <input type="text" class="form-control" id="stuName" name="stuName" value=""/>
	                     </div>
	                 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >性别：</label>
						 <div class="col-xs-3">
							 <select id="stuSex" name="stuSex" style="width: 100%">
								 <option value="0">男</option>
								 <option value="1">女</option>
							 </select>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >院系：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="stuDepart" name="stuDepart" value=""/>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >住址：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="stuAddress" name="stuAddress" value=""/>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >电话：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="stuTel" name="stuTel" value=""/>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >Email：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="stuEmail" name="stuEmail" value=""/>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >身份证：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="stuIdcard" name="stuIdcard" value=""/>
						 </div>
					 </div>
                    <div class="form-group">
                    	<div class="col-xs-3 col-xs-offset-3" style="margin-left: 45%">
                        	<input type="submit" style="width:100px" value="保存" class="btn btn-primary" />
						<input type="button" style="width:100px" value="取消" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/view/student/student_list.jsp'"/>
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
