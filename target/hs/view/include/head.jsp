<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>头部—netctoss</title>
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
			window.location="${pageContext.request.contextPath}/user/logut";
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
		<div id="pic" class = "container" style="margin-left:60px;margin-top:15px">
<%--
			<img src="${pageContext.request.contextPath}${user.user_photo}" class="img-circle" />
--%>
		</div>
			<p class="p1">
			&nbsp;欢迎，${user.name}
			</p>
			<p class="p2">
			<a href="javascript:void(0)" class="goOut" id="exit" >[退出]</a>
			</p>
		</div>
	</div>
</body>
</html>