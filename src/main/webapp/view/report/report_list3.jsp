<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	    <!-- 引入 ECharts 文件 -->
	    <script src="${pageContext.request.contextPath}/js/echarts.js"></script>
	</head>
	    <script type="text/javascript"> 
			//资费类型使用率
    		$(function(){
    			var fname = [];
                var ftype = [];
    			//获取数据
	            $.ajax({
					url:'${pageContext.request.contextPath}/report/ReportListAction3.do',
					type:'post',
					async : false, //同步执行
					date:{},
					//dataType : "json",  
					success:function(result){
						var lr = result.reports;
// 						alert(lr);
						if(result.reports){
			                for(var i=0;i<lr.length;i++){
			                	fname.push(lr[i].fname);
			                }
			                for( var j = 0; j < lr.length; j++) {
			                	ftype.push({
			                		stuAddress : lr[j].fname,
			                		value : lr[j].ftype_use_count
			                	});
			                }
						}
					}
				});
    			var myChart = echarts.init(document.getElementById('report_main')); 
				option = {
					    title: {
					        text: '资费使用率',
					        left: 'center'
					    },
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    legend: {
					        // orient: 'vertical',
					        // top: 'middle',
					        bottom: 10,
					        left: 'center',
					        data: fname
					    },
					    series : [
					        {	
					        	stuAddress: '资费类型',
					            type: 'pie',
					            radius : '65%',
					            center: ['50%', '50%'],
					            selectedMode: 'single',
					            data:ftype,
					            itemStyle: {
					                emphasis: {
					                    shadowBlur: 10,
					                    shadowOffsetX: 0,
					                    shadowColor: 'rgba(0, 0, 0, 0.5)'
					                }
					            }
					        }
					    ]
					};
	            // 为echarts对象加载数据 
	            myChart.setOption(option);
    		});
	    </script>
    
    <body>
    	<div style="height:40px"></div>
		<!--（3）每种资费标准的使用次数 -->
    	<div id="report_main" >
        </div>
        <div style="margin-left:460px">
        <span><span style="color:red;">*</span>共有三种资费类型：套餐，计时，包月</span> 
        </div>
    </body>
</html>
