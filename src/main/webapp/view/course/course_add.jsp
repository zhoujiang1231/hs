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
			$(function () {
				$.ajax({
					url:'${pageContext.request.contextPath}/teacher/getAllTeacher',
					type:'post',
					dataType:'json',
					data:{
					    pageNum:"1",
						pageSize:"-1",
						tName:""
					},
					success:function (data) {
					    $.each(data.list,function (i,teacher) {
                            $("#cTeacher").append("<option value='"+teacher.tName+"'>"+teacher.tName+"</option>");
                        })
                    }
				})
            })
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
				    	 //课程名
				    	  cName: {
				             validators: {
				                 notEmpty: {
				                     message: '课程名不能为空'
				                 },
								 stringLength:{
				                     min:2,
									 max:20,
									 message:'长度在2-20之间'
								 }
				    		 }
				    	 },
				    	 //学时
                         cHour: {
				             validators: {
				                 notEmpty: {
				                     message: '学时不能为空'
				                 },
								 regexp:{
                                     regexp:/^([1-9]\d?|100)$/ ,
                                     message:"学时在1-100之间"
                                 }
				    		 }
				    	 },
                         //学分
                         cMark: {
                             validators: {
                                 notEmpty: {
                                     message: '学分不能为空'
                                 }/*,
								 regexp:{
                                     regexp:/^[1-9]?$/ ,
                                     message:"学时在1-10之间"
                                 }*/
                             }
                         },
                         //任课教师
                         cTeacher: {
                             validators: {
                                 notEmpty: {
                                     message: '任课教师不能为空'
                                 }
                             }
                         },
                         //类型
                         cType: {
                             validators: {
                                 notEmpty: {
                                     message: '课程类型不能为空'
                                 }
                             }
                         },
                         //课程人数
                         cTotal: {
                             validators: {
                                 notEmpty: {
                                     message: '课程最大人数不能为空'
                                 },
                                 regexp:{
                                     regexp:/^([1-9]\d?|100)$/ ,
                                     message:"人数在1-100之间"
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
            		$.ajax({
           				url  : '${pageContext.request.contextPath}/course/addCourse',
           				type : 'post',
           				data : $("#form").serialize(),
						dataType:'json',
           				success : function(data){
                            $(".save_success").text(data.msg);
                            $(".save_success").fadeIn(100);
                            $(".save_success").fadeOut(2500);
	           				if(data.result=="0"){
	    						setTimeout("window.location.href ='course_list.jsp'",2500);
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
	                     <label class="col-xs-4 col-xs-offset-1 control-label" >课程名：</label>
	                     <div class="col-xs-3">
	                         <input type="text" class="form-control" id="cName" name="cName" value=""/>
	                     </div>
	                 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >类型：</label>
						 <div class="col-xs-3">
							 <select id="cType" name="cType" style="width: 100%">
								 <option value="0">必修</option>
								 <option value="1">选修</option>
							 </select>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >学时：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="cHour" name="cHour" value=""/>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >学分：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="cMark" name="cMark" value=""/>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >任课教师：</label>
						 <div class="col-xs-3">
							 <select id="cTeacher" name="cTeacher" style="width: 100%">
							 </select>
						 </div>
					 </div>
					 <div class="form-group">
						 <label class="col-xs-4 col-xs-offset-1 control-label" >课程最大人数：</label>
						 <div class="col-xs-3">
							 <input type="text" class="form-control" id="cTotal" name="cTotal" value=""/>
						 </div>
					 </div>
                    <div class="form-group">
                    	<div class="col-xs-3 col-xs-offset-3" style="margin-left: 45%">
                        	<input type="submit" style="width:100px" value="保存" class="btn btn-primary" />
						<input type="button" style="width:100px" value="取消" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/view/course/course_list.jsp'"/>
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
