<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
	    <%@ include file ="../include/bootstrap.jsp"%>
       	<link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global_color.css" />
	    <style type="text/css">
        	#main1{
       			width:1020px;
       			algin:center;
       		}
       		 .table tr:hover{
			    background-color:#99FF66;
			    color:#0000CC;
			    cursor:pointer;
		    }
		    .table th:hover{
		    	cursor:default;
		    }
		    
		</style>
	    <!-- 引入 ECharts 文件 -->
	    <script src="${pageContext.request.contextPath}/js/echarts.js"></script>
        <script language="javascript" type="text/javascript">
//           	$(function(){
          		var data1 = [];
          		var month = [];
          		//接受点击事件传回的id，并调用ajax向数据库取出该账户的消费详情（月和时间）
          		function showChart(aid){
          			var id = aid;
          			$.ajax({
 	 					url:'${pageContext.request.contextPath}/report/ReportListAction1.do',
 	 					type:'post',
 	 					async : false, //同步执行
 	 					data:{ 
 	 						id:aid,
 	 						},
 	 					//dataType : "json",  
 	 					success:function(result){
 	 						if(result){
 	 							var datas = result.datas;
 	 							var months = result.months;
//   	 							alert(datas);
 	 	 						//初始化option.xAxis[0]中的data
                                for(var i=0;i<datas.length;i++){
                                	data1.push(datas[i].toFixed(2));
                                	month.push(months[i].toString());
                                }
 	 						}
 	 					}
 	 				});
          		//隐藏表格
          		$("#table").hide();
          		$("#pages").hide();
          		var myChart = echarts.init(document.getElementById('hiddenChart')); 
          		option = {
          			    title: {
          			        text: '账号消费时长详情',
          			      	subtext: '近三年',
          			        left: 'center'
          			    },
          			    tooltip: {
          			        trigger: 'axis'
          			    },
          			    grid: {
          			        left: '3%',
          			        right: '4%',
          			        bottom: '3%',
          			        containLabel: true
          			    },
          			    toolbox: {
          			        feature: {
          			            saveAsImage: {}
          			        }
          			    },
          			    xAxis: {
          			        type: 'category',
          			        boundaryGap: false,
          			      	stuAddress:'月份',
          			        data: month,
          			      	
          			    },
          			    yAxis: {
          			        type: 'value',
          			      	stuAddress:'小时',
          			    },
          			    series: [
          			        {
          			            stuAddress:'用户使用时长',
          			            type:'line',
//           			            stack: '总量',
          			            data: data1
          			        }
          			    ]
          			};
          			$("#charts").show();
          			// 为echarts对象加载数据 
                	myChart.setOption(option);
          		}
          		//调整bootstrap表格
                $(function(){
                	$("th").attr('class','text-center');
                	$("td").css('vertical-align','middle');
                	$("caption").css('align','middle');
                	$("td,th").css('line-height','30px');
                })
                //翻页
                function showPage(cur){
                	location.href='${pageContext.request.contextPath }/report/TurnPage?middle=${pc.middle}&curPage='+cur
                }
//           	})

        </script>
    </head>
    <body>
		<div id="main1">
			<div id="charts" style="display: none;">
				<div style="height:60px"></div>
		    	<div id="hiddenChart" style="height:350px;width:900px;">
		   		</div>
		   	</div>
	   		<div id="table" style="height:460px">
	        	<div class="table-responsive">            
		        	<table id ="table" class="table table-striped table-bordered text-center table-condensed table-hover" style="margin-top:10px">
			        	<caption class="text-center"><h4><font color="black">用户时长统计表</font></h4></caption>
			        	<tr style="color:black;">                            
			            	<th style="width:12%">账号 ID</th>
			                <th style="width:12%">账务帐号</th>
			                <th style="width:12%">客户名称</th>
			                <th style="width:22%">身份证号码</th>
			                <th style="width:21%">电话</th>
			                <th style="width:21%">累积时长</th>
			            </tr> 
			            <c:forEach items="${allReports}" var="report">
			            	<tr id ="tr" onclick="showChart(${report.account.acc_id})" >
					            <td >${report.account.acc_id}</td>
					            <td >${report.account.acc_login}</td>
					            <td>${report.account.acc_name}</td>
					            <td>${report.account.acc_idcard}</td>
					            <c:choose>
					            	<c:when test="${report.account.acc_tel==null}">
					            		<td>--</td>
					            	</c:when>
					            	<c:when test="${report.account.acc_tel!=null}">
					            		<td>${report.account.acc_tel}</td>
					            	</c:when>
					            </c:choose>
					            <c:choose>
					            	<c:when test="${report.accountSumTimeString==null}">
					            		<td>--</td>
					            	</c:when>
					            	<c:when test="${report.accountSumTimeString!=null}">
					            		<td>${report.accountSumTimeString}</td>
					            	</c:when>
					            </c:choose>
			                </tr>                 
			            </c:forEach>
			      	</table>
			    </div>
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
			</div>
    </body>
</html>
