<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
	<style>
			#pic img{width:43.26%;height:70%;}
			 
         	body{
       			overflow:-Scroll;
       			overflow-y:hidden;
       		}
         	
	</style>
 <%@ include file ="../include/linking.jsp"%> 
<link rel="stylesheet" type="text/css" href="../../css/public.css" />
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/public.js"></script>
<script type="text/javascript">
	$(function(){
		$("#exit").click(function(){
		    $.ajax({
				url:'${pageContext.request.contextPath}/user/logout',
				type:'get',
				dataType:'json',
				success:function (data) {
					if(data.result==0){
                        window.top.location="${pageContext.request.contextPath}/view/login.jsp";
					}
                }
			})
		})
	})
</script>
</head>
<body>
	<!-- 头部 -->
	<div class="head">
		<div class="headL">
			<img class="headLogo" src="../../img/headLogo.png" /> 
		</div>
		<div class="headR">
		<%--<div id="pic" class = "container" style="margin-left:60px;margin-top:15px">
			<img src="${pageContext.request.contextPath}${admin.admin_photo}" class="img-circle" />
		</div>--%>
			<c:choose>
				<c:when test="${user_type==0}">
					<p class="p1">
						&nbsp;你好，管理员
					</p>
				</c:when>
				<c:when test="${user_type==1}">
					<p class="p1">
						&nbsp;你好，${tName}
					</p>
				</c:when>
				<c:otherwise>
					<p class="p1">
						&nbsp;你好，${stuName}
					</p>
				</c:otherwise>
			</c:choose>
			<p class="p2">
			<a href="javascript:void(0)" class="goOut" id="exit" >[退出]</a>
			</p>
		</div>
		
	</div>
</body>
</html>