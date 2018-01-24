<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页左侧导航</title>
<link rel="stylesheet" type="text/css" href="../../css/public.css" />
<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/public.js"></script>
<head></head>

<body id="bg">
	<!-- 左边节点 -->
	<div class="container">
	
		<div class="leftsidebar_box">
			<a href="../main.jsp" target="main"><div class="line">
					<img src="../../img/coin01.png" />&nbsp;&nbsp;首页
				</div></a>
			<c:if test="${user_type==0}">
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coin07.png" /><img class="icon2"
						src="../../img/coin08.png" />帐号管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a class="cks" href="${pageContext.request.contextPath}/view/teacher/teacher_list.jsp"
						target="main">教师管理</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a class="cks" href="${pageContext.request.contextPath}/view/student/student_list.jsp"
						target="main">学生管理</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
			</dl>
			</c:if>
			<%--学生选课界面--%>
			<c:if test="${user_type==2}">
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coin03_1.png" /><img class="icon2"
						src="../../img/coin04_1.png" />选课管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/student/course_list.jsp" target="main"
						class="cks">选课管理</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/student/student_course.jsp" target="main"
						class="cks">选课结果</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
			</dl>
			</c:if>
			<%--教师界面--%>
			<c:if test="${user_type==1}">
				<dl class="system_log">
					<dt>
						<img class="icon1" src="../../img/coin03_1.png" /><img class="icon2"
						src="../../img/coin04_1.png" />选课管理<img class="icon3" src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
					</dt>
					<dd>
						<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/teacher/course_list.jsp" target="main"
						class="cks">课程管理</a><img class="icon5" src="../../img/coin21.png" />
					</dd>
				</dl>
			</c:if>
			<%--管理员界面--%>
			<c:if test="${user_type==0}">
				<dl class="system_log">
					<dt>
						<img class="icon1" src="../../img/coin03_1.png" /><img class="icon2"
						src="../../img/coin04_1.png" />课程管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
					</dt>
					<dd>
						<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/course/course_list.jsp" target="main"
						class="cks">课程管理</a><img class="icon5" src="../../img/coin21.png" />
					</dd>
				</dl>
			</c:if>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coinL1.png" /><img class="icon2"
						src="../../img/coinL2.png" />系统管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
				<c:if test="${user_type==2}">
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/student/student_info.jsp"
						target="main" class="cks">修改信息</a><img class="icon5"
						src="../../img/coin21.png" />
				</dd>
				</c:if>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/user/user_modi_pwd.jsp"
						target="main" class="cks">修改密码</a><img
						class="icon5" src="../../img/coin21.png" />
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>
