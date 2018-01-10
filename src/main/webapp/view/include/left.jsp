<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧导航</title>
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
						src="../../img/coin08.png" />账户管理<img class="icon3"
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
			<%--<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coin10.png" /><img class="icon2"
						src="../../img/coin09.png" />权限管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a class="cks" href="${pageContext.request.contextPath}${admin_power.pow_class }?cur=1"
						target="main">权限管理</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
			</dl>--%>
            <c:if test="${user_type!=0}">
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coin03_1.png" /><img class="icon2"
						src="../../img/coin04_1.png" />选课管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
                <c:if test="${user_type==2}">
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/course/course_stu.jsp" target="main"
						class="cks">课程列表</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/course/course_stu_result" target="main"
						class="cks">选课结果</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
                </c:if>
                <c:if test="${user_type==1}">
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
                         src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/course/course_tea.jsp" target="main"
						 class="cks">课程列表</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						 src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/course/course_tea_result" target="main"
						 class="cks">选课结果</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
                </c:if>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coin17.png" /><img class="icon2"
						src="../../img/coin18.png" />成绩管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
                <c:if test="${user_type==2}">
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/grade/grade_stu.jsp"
						target="main" class="cks">查看成绩</a><img class="icon5"
						src="../../img/coin21.png" />
				</dd>
                </c:if>
                <c:if test="${user_type==1}">
                <dd>
                    <img class="coin11" src="../../img/coin111.png" /><img class="coin22"
                        src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/grade/grade_tea.jsp"
                        target="main" class="cks">发布成绩</a><img class="icon5"
                        src="../../img/coin21.png" />
                </dd>
                </c:if>
			</dl>
			<%--<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coin11_1.png" /><img class="icon2"
						src="../../img/coin12_1.png" />业务管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}${admin_power.pow_class }" target="main"
						class="cks">业务管理</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coin14_1.png" /><img class="icon2"
						src="../../img/coin13_1.png" />账单管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}${admin_power.pow_class }" target="main"
						class="cks">账单管理</a><img class="icon5" src="../../img/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coin15_1.png" /><img class="icon2"
						src="../../img/coin16_1.png" />报表<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/report/ReportListAction.do"
						target="main" class="cks">时长统计表</a><img class="icon5"
						src="../../img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/report/report_list2.jsp"
						target="main" class="cks">时长排行榜</a><img class="icon5"
						src="../../img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/report/report_list3.jsp"
						target="main" class="cks">资费使用率</a><img class="icon5"
						src="../../img/coin21.png" />
				</dd>
			</dl>--%>
            </c:if>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../../img/coinL1.png" /><img class="icon2"
						src="../../img/coinL2.png" />系统管理<img class="icon3"
						src="../../img/coin19.png" /><img class="icon4"
						src="../../img/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/student/user_info.jsp"
						target="main" class="cks">修改信息</a><img class="icon5"
						src="../../img/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../../img/coin111.png" /><img class="coin22"
						src="../../img/coin222.png" /><a href="${pageContext.request.contextPath}/view/student/user_modi_pwd.jsp"
						target="main" class="cks">修改密码</a><img
						class="icon5" src="../../img/coin21.png" />
				</dd>
			</dl>

		</div>

	</div>
</body>
</html>
