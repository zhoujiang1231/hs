<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<!-- 引用头部 -->
<frameset rows="100,*" cols="*" scrolling="No" framespacing="0"	frameborder="no" border="0"> 
	<frame src="include/head.jsp" name="headmenu" id="mainFrame" title="mainFrame"/>
	<!-- 引用左边和主体部分 -->
	 <frameset rows="100*" cols="220,*" scrolling="No"framespacing="0" frameborder="no" border="0">
		 <frame src="include/left.jsp" name="leftmenu" id="mainFrame" title="mainFrame"/>
		<frame src="main.jsp" name="main" scrolling="yes" noresize="noresize" id="rightFrame" title="rightFrame"/>
	</frameset>
</frameset>
</html>