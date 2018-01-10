<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file ="/view/include/link.jsp"%>
        <%@include file ="/view/include/bootstrap.jsp"%>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global_color.css" />
        <style type="text/css">
        	div.search_text{
        		margin-top:10px;
        		margin-bottom:10px;
        		float: left;
			    margin-right: 23px;
			    line-height: 23px;
        	}
        	#main1{
       			width:1000px;
       			algin:center;
       		}
        </style>
        <script language="javascript" type="text/javascript">
	        //翻页
	        function showPage(cur){
	        	location.href='${pageContext.request.contextPath }/billItem/BillItemListController.do?bill_id=${item.bill.bill_id}&curPage='+cur
	        }
        </script>
    </head>
    <body stuAddress="bill_off" onload="initialYearAndMonth();">
        <!--主要区域开始-->
        <div id="main1">
            <form action="" method="">
                <!--查询-->
                <div style="padding: 8px;width:1000px">                        
                    <div class="search_text">账务账号：<span style="border: 1px solid silver;width:80px" class="readonly">${item.ser.account.acc_login }</span></div>                            
                    <div class="search_text">身份证：<span style="border: 1px solid silver;width:180px" class="readonly">${item.ser.account.acc_idcard }</span></div>
                    <div class="search_text">姓名：<span style="border: 1px solid silver;width:50px" class="readonly">${item.ser.account.acc_name }</span></div>
                    <div class="search_text">计费时间：<span style="border: 1px solid silver;width:100px" class="readonly"><fmt:formatDate value="${item.bill.bill_month}" pattern="yyyy年MM月"/></span></div>
                    <div class="search_text">总费用：<span style="border: 1px solid silver;width:50px" class="readonly">${item.bill.bill_cost }</span></div>
                    <%-- <input type="button" value="返回" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/bill/BillListAction.do';" /> --%>
                	<div style="margin-top:0.1em;margin-bottom:0.5em;padding: 5px;"><button type="button" class="btn btn-primary btn-sm" style="width:80px" onclick="location.href='${pageContext.request.contextPath}/bill/BillListAction.do';" >返回</button></div>
                </div>  
                <!--数据区域：用表格展示数据-->     
               <div id="data" style="height:450px;width:1000px">            
                    <table class="table table-striped table-bordered text-center table-hover" >
                    	<thead>
	                        <tr>
	                            <th class="width100 text-center">账单明细ID</th>
	                            <th class="width150 text-center">OS 账号</th>
	                            <th class="width150 text-center">服务器 IP</th>
	                            <th class="width100 text-center">账务账号ID</th>
	                            <th class="width150 text-center">时长</th>
	                            <th class="text-center">费用</th>
	                            <th class="width150 text-center">资费</th>
	                            <th class="width50 text-center"></th>
	                        </tr>
	                    </thead>
	                    <tbody>
                        <c:forEach items="${litem }" var="it">
	                        <tr>
	                            <td>${it.item_id }</td>
	                            <td>${it.ser.ser_os }</td>
	                            <td>${it.ser.ser_ip }</td>
	                            <td>${item.ser.account.acc_id }</td>
	                            <td>${it.sumtime }</td>
	                            <td>${it.item_cost}</td>
	                            <td>${it.ser.fee.fee_name }</td>                 
	                            <td><a href="${pageContext.request.contextPath }/billDetail/BillDetailListController.do?item_id=${it.item_id }&bill_id=${item.bill.bill_id }" title="业务详单">详单</a></td>
	                        </tr>
	                    </c:forEach>
	                    </tbody>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
        	        <c:choose>
                		<c:when test="${pc.curPage==1 }">
                			 <span style="display:inline;color:gray;">首页&nbsp;&nbsp;&nbsp;</span>
        	      			 <span style="display:inline;color:gray;">上一页&nbsp;&nbsp;&nbsp;</span>
                		</c:when>
                		<c:when test="${pc.curPage!=1 }">
                			 <a href="javaScript:showPage(1)">首页</a>
        	      			 <a href="javaScript:showPage(${pc.curPage-1 })">上一页</a>
                		</c:when>
                	</c:choose>
                    <c:forEach var="i" begin="${pc.middle-pc.width>0?(pc.middle-pc.width):1}" end="${pc.middle+pc.width}">
                    	<c:choose>
                    	 <c:when test="${pc.totlePage>=i&&i>0 }">
                    	 <c:choose>
	                    	<c:when test="${pc.curPage==i }">
	                    		<a class="current_page">${i}</a>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="javaScript:showPage(${i })" >${i}</a>
	                    	</c:otherwise>
	                     </c:choose>
	                   	 </c:when>
                    	</c:choose>
                    </c:forEach>
                    <c:choose>
                		<c:when test="${pc.curPage==pc.totlePage }">
                			 <span style="color:gray;">&nbsp;&nbsp;&nbsp;下一页&nbsp;&nbsp;&nbsp;</span>
        	      			 <span style="color:gray;">末页&nbsp;&nbsp;&nbsp;</span>共${pc.totlePage }页/${pc.totleNumber}条记录
                		</c:when>
                		<c:when test="${pc.curPage!=pc.totlePage }">
                			 <a href="javaScript:showPage(${pc.curPage+1 })">下一页</a>
                    		 <a href="javaScript:showPage(${pc.totlePage })">末页</a>共${pc.totlePage }页/${pc.totleNumber}条记录
                		</c:when>
                	</c:choose>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
