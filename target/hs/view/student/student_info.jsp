﻿<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
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
                         stuAddress: {
                             message: 'The username is not valid',
                             validators: {
                                 notEmpty: {
                                     message: '住址不能为空'
                                 }
                             }
                         },
				         stuTel: {
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
				         stuEmail: {
				             message: 'The username is not valid',
				             validators: {
				                 notEmpty: {
				                     message: 'Email不能为空'
				                 },
				                 regexp: {
				                     regexp: /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)$/,
				                     message: 'Email格式不符合规范'
				                 }
				             }
				         },
				     }
				 })
				 .on('success.form.bv', function(e) {
	                 e.preventDefault();
	                 var $form = $(e.target);
	                 var bv = $form.data('bootstrapValidator');
	                 $.post('${pageContext.request.contextPath}/student/updateStudent', $form.serialize(),function(data) {
	                	 var msg = data.msg;
                         $(".save_info").text(msg);
                         $(".save_info").show().delay(2000).fadeOut("slow");
		     				if(msg==1){
		     					window.parent.parent.headmenu.location.reload();
		     				}
	                 }, 'json');
				 });
				$('#resetBtn').click(function() {
					location.href='${pageContext.request.contextPath}/view/main.jsp';
        	    });
			})
        </script>
    </head>
    <body name="information_off">
        <!--主要区域开始-->
        <div>  
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_info" >保存成功！</div>
            <br/>
            <div class="row">
            <section>
            <form id="form1"  class="main_form form-horizontal">
            <fieldset>
            <div class="form-group">
                <label class="col-sm-4 control-label" >学号：</label>
                <div class="col-sm-5" style="width:300px"><input type="text" readonly="readonly" class="form-control" value="${stuNo}"/></div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >姓名：</label>
                <div class="col-sm-5" style="width:300px">
                    <input id="stuName" type="text" readonly="readonly" class="form-control" value="${stuName}" name="stuName"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >性别：</label>
                <div class="col-sm-5" style="width:300px">
                    <select id="stuSex" class="form-control"  name="stuSex">
                        <option value="0"
                                <c:if test="${stuSex==0}"> selected = selected</c:if>
                        >男</option>
                        <option value="1"
                                <c:if test="${stuSex==1}"> selected = selected</c:if>
                        >女</option>
                    </select>
                </div>
            </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" >院系：</label>
                    <div class="col-sm-5" style="width:300px">
                        <input id="stuDepart" type="text" readonly="readonly" class="form-control" value="${stuDepart}" name="stuDepart"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" >住址：</label>
                    <div class="col-sm-5" style="width:300px">
                        <input id="stuAddress" type="text" class="form-control" value="${stuAddress}" name="stuAddress"/>
                    </div>
                </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >电话：</label>
                <div class="col-sm-5" style="width:300px">
                    <input id="stuTel" type="text" class="form-control" value="${stuTel}" name="stuTel"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >Email：</label>
                <div class="col-sm-5" style="width:300px">
                    <input id="stuEmail" type="text" class="form-control" value="${stuEmail}" name="stuEmail"/>
                </div>
            </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label" >身份证：</label>
                    <div class="col-sm-5" style="width:300px">
                        <input id="stuIdcard" type="text" readonly="readonly" class="form-control" value="${stuIdcard}" name="stuIdcard"/>
                    </div>
                </div>
            <div class="form-group">
                <label class="col-sm-4 control-label" >创建时间：</label>
                <div class="col-sm-5" style="width:300px"><input type="text" readonly="readonly" class="form-control" value="${creatTime}"/></div>
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
                <input id="stuId" type="hidden" name="stuId" value="${stuId}"/>
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