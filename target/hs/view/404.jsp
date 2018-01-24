<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0" />
		<title>404</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cycss/404.css" />
		<!--[if IE 6]>
		<script src="js/png.js"></script>
		<script>DD_belatedPNG.fix('*')</script>
		<![endif]-->
	</head>
	<body>
		<div id="wrap">
			<div>
				<img src="${pageContext.request.contextPath}/img/404/404.png" alt="404" />
			</div>
			<div id="text">
				<strong>
					<span></span>
					<a href="${pageContext.request.contextPath}/view/login.jsp">返回登录</a>
					<a href="javascript:history.back()">返回上一页</a>
				</strong>
			</div>
		</div>
		
		<div class="animate below"></div>
		<div class="animate above"></div>
	</body>
</html>
