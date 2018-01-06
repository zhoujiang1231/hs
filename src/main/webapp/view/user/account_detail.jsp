<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/link.jsp" %>
         <%@ include file ="../include/easyui.jsp"%>
         <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootcss/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootcss/global_color.css" />
        <!-- <link type="text/css" rel="stylesheet" media="all" href="../../css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../../css/global_color.css" /> -->
        <style type="text/css">
       		#main1{
       			width:1000px;
       			algin:center;
       			margin-top:40px;
       		}       
       </style>
        <script type="text/javascript">
        $(function(){
        	if($("#idcard").val()!=null&&$("#idcard").val()!=""){
    		var idcr=$("#idcard").val();
    		var year=idcr.substring(6,10);
        	var m =idcr.substring(10,12);
        	var day=idcr.substring(12,14);
        	$("[name='birth']").val(year+"年"+m+"月"+day+"日");}
    	})
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <!-- <div id="header">
            <img src="../../images/logo.png" alt="logo" class="left" />
            <a href="#">[退出]</a>            
        </div> -->
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <!-- <div id="navi"> -->
        <!-- </div> -->
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main1">            
            <form action="" method="" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${cl.acc_id }" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info"><input type="text" value="${cl.acc_name }" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" id="idcard" value="${cl.acc_idcard }" readonly class="readonly" />
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <input type="text" value="${cl.acc_login} " readonly class="readonly" />
                </div>                   
                <div class="text_info clearfix"><span>手机号：</span></div>
                <div class="input_info">
                    <input type="text" class="readonly"  readonly value="${cl.acc_tel}" />
                </div>
                <div class="text_info clearfix"><span>推荐人账务账号ID：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="5" /></div>
                <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${cl.acc_recidcard}" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info">
                    <select disabled>
                        <c:choose>
                    		<c:when test="${cl.acc_state==2 }"><option>删除</option></c:when>
                    		<c:when test="${cl.acc_state==1 }"><option>开通</option></c:when>
                    		<c:when test="${cl.acc_state==0 }"><option>暂停</option></c:when>
                    	</c:choose>
                    </select>                        
                </div>                    
                <div class="text_info clearfix"><span>开通/暂停/删除时间：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="<fmt:formatDate value="${cl.acc_createtime }" pattern="yyyy/MM/dd HH:mm:ss"/>" /></div>

                <div class="text_info clearfix"><span>上次登录时间：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="<fmt:formatDate value="${cl.acc_logintime }" pattern="yyyy/MM/dd HH:mm:ss"/>" /></div>
                <div class="text_info clearfix"><span>上次登录IP：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="192.168.0.100" /></div>
                <!--可选项数据-->
                <div class="text_info clearfix"><span>生日：</span></div>
                <div class="input_info">
                    <input type="text" readonly class="readonly" name="birth" value="由身份证计算而来" />
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input type="text" class="readonly" readonly value="${cl.acc_email}" />
                </div> 
                <div class="text_info clearfix"><span>职业：</span></div>
                <div class="input_info">
                    <select disabled>
                         <c:choose>
                    		<c:when test="${cl.acc_job==1}"><option>学生</option></c:when></c:choose>
                    		<c:choose><c:when test="${cl.acc_job==2 }"><option>干部</option></c:when></c:choose>
                    		<c:choose><c:when test="${cl.acc_job==3 }"><option>技术人员</option></c:when></c:choose>
                    		<c:choose><c:when test="${cl.acc_job==4 }"><option>其他</option></c:when>
                    	</c:choose>
                    </select>                        
                </div>
                <div class="text_info clearfix"><span>性别：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="radSex" <c:choose><c:when test="${cl.acc_sex==0 }">checked="checked"</c:when></c:choose> id="female" disabled />
                    <label for="female">女</label>
                    <input type="radio" name="radSex" <c:choose><c:when test="${cl.acc_sex==1 }">checked="checked"</c:when></c:choose> id="male" disabled />
                    <label for="male">男</label>
                </div> 
                <div class="text_info clearfix"><span>通信地址：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="${cl.acc_address }" /></div> 
                <div class="text_info clearfix"><span>邮编：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="${cl.acc_zipcode}" /></div> 
                <div class="text_info clearfix"><span>QQ：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly value="${cl.acc_qq }" /></div>                
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath }/account/selectAllAccount.do';" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
