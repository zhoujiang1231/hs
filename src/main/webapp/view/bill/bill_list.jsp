<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file ="/view/include/link.jsp"%>
        <%@include file ="/view/include/bootstrap.jsp"%>
			<link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootcss/global_color.css" />
        <style type="text/css">
        	div.search_text{
        		margin-top:10px;
        		margin-bottom:10px;
        		float: left;
			    margin-right: 18px;
			    line-height: 23px;
        	}
        	#main1{
       			width:1000px;
       			algin:center;
       		}
        </style>
        <script language="javascript" type="text/javascript">
        //写入下拉框中的年份和月份
        function initialYearAndMonth() {
            //写入最近3年
            var yearObj = document.getElementById("selYears");
            var year = (new Date()).getFullYear();
            for (var i = 0; i <= 2; i++) {
                var opObj = new Option(year - i, year - i);
                yearObj.options[i] = opObj;
                if(yearObj.options[i].value=='${year}'){
                	yearObj.options[i].selected=true;
                }
            }
            //写入 12 月
            var monthObj = document.getElementById("selMonths");
            var opObj = new Option("全部", "-1");
            monthObj.options[0] = opObj;
            for (var i = 1; i <= 12; i++) {
                var opObj = new Option(i, i);
                monthObj.options[i] = opObj;
                if(monthObj.options[i].value=='${month}'){
                	monthObj.options[i].selected=true;
                }
            }
        }
        
        /* 跳转明细页面 */
        function getitem(acc_id,bill_id){
        	location.href='${pageContext.request.contextPath }/billItem/BillItemListController.do?bill_id='+bill_id
        }
        //翻页
        function showPage(cur){
        	location.href='${pageContext.request.contextPath }/bill/BillListAction.do?acc_idcard=${ac.acc_idcard }&acc_login=${ac.acc_login }&acc_name=${ac.acc_name }&month=${month}&year=${year}&middle=${pc.middle}&curPage='+cur
        }
      //调整bootstrap表格
        $(function(){
        	$("th").attr('class','text-center');
        	$("td").css('vertical-align','middle');
        	$("td,th").css('line-height','30px');
        	
        })
        </script>
    </head>
    <body name="bill_off" onload="initialYearAndMonth();">
        <!--主要区域开始-->
        <div class="main1">
            <form id="myform" action="${pageContext.request.contextPath }/bill/BillListAction.do" method="post">
                <!--查询-->
                <div style="padding: 8px;width:1000px">
                	<div class="search_text">身份证：<input type="text"  name="acc_idcard" value="${ac.acc_idcard }" class="width150 text_search" /></div>
                    <div class="search_text">账务账号：<input type="text"  name="acc_login" value="${ac.acc_login }" class="width150 text_search" /></div>                            
                    <div class="search_text">姓名：<input type="text" name="acc_name" value="${ac.acc_name }" class="width70 text_search" /></div>
                    <div class="search_text">
                        <select name="year" class="select_search" id="selYears" style="border: 1px solid silver">
                        </select>
                        年
                        <select name="month" class="select_search" id="selMonths" style="border: 1px solid silver">
                        </select>
                        月
                    </div>
                    <div style="margin-top:0.1em;margin-bottom:0.5em;padding: 5px;"><button type="button" class="btn btn-primary btn-sm" style="width:80px" onclick="javascript:document:myform.submit()" >搜索</button><!-- <input type="submit" value="搜索" style="height:23px;width:80px;padding-left:0px;background-color: #47a4e1" /> --></div>
                </div> 
               </form>
                <!--数据区域：用表格展示数据-->  
              <form action="" method="">   
                <div id="data" style="height:450px;width:1000px">            
                    <table class="table table-striped table-bordered text-center table-hover" >
	                <thead>
	                    <tr >
	                        <th class="width80 text-center">账单ID</th>
	                        <th class="width100 text-center">姓名</th>
	                        <th class="width150 text-center">身份证</th>
	                        <th class="width180 text-center">账务账号</th>
	                        <th class="text-center">费用</th>
	                        <th class="width100 text-center">月份</th>
	                        <th class="width100 text-center">支付方式</th>
	                        <th class="width100 text-center">支付状态</th>                                                        
	                        <th class="width50 text-center"></th>
	                    </tr>
	                 </thead>
	                 <tbody>
                    <c:forEach items="${lb}" var="bill">
	                    <tr id="${bill.bill_id }item">
	                        <td>${bill.bill_id }</td>
	                        <td>${bill.acc.acc_name }</td>
	                        <td>${bill.acc.acc_idcard }</td>
	                        <td>${bill.acc.acc_login }</td>
	                        <td>${bill.bill_cost }</td>
	                        <td><fmt:formatDate value="${bill.bill_month}" pattern="yyyy年MM月"/></td>
	                        <c:choose>
	                        <c:when test="${bill.pstate=='已支付' }">
	                        	<td>${bill.payway }</td>
	                       	</c:when>
	                       	<c:otherwise>
	                       		<td></td>
	                       	</c:otherwise>
	                        </c:choose>
	                        <td>${bill.pstate }</td>                            
	                        <td><a href="javascript:getitem(${bill.acc.acc_id },${bill.bill_id })" title="账单明细">明细</a></td>
	                    </tr>
	                 </c:forEach>
	                 </tbody>
                </table>
                </div>
                <!-- <p>业务说明：<br />
                1、设计支付方式和支付状态，为用户自服务中的支付功能预留；<br />
                2、只查询近 3 年的账单，即当前年和前两年，如2013/2012/2011；<br />
                3、年和月的数据由 js 代码自动生成；<br />
                4、由数据库中的ｊｏｂ每月的月底定时计算账单数据。</p>
                </div>  -->                   
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
