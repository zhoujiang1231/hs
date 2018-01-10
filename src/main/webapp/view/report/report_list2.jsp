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
    			//每台服务器上累计时长最高的前三名客户
    			//加载数据
    			$(function(){
    				var ips = [];
    				var top1s = [];
    				var top2s = [];
    				var top3s = [];
    				$.ajax({
 	 					url:'${pageContext.request.contextPath}/report/ReportListAction2.do',
 	 					type:'post',
 	 					async : false, //同步执行
 	 					date:{},
 	 					dataType : "json",  
 	 					success:function(result){
 	 						if(result){
 	 							var lt = result.lt;
//  	 							alert(lt);
 	 	 						//初始化option.xAxis[0]中的data
                                for(var i=0;i<lt.length;i++){
                                	ips.push(lt[i].ip);
                                	top1s.push((lt[i].first).toFixed(2));
                                	top2s.push((lt[i].second).toFixed(2));
                                	top3s.push((lt[i].third).toFixed(2));
                                }
 	 						}
 	 					}
 	 				});
    			
    				
	 	 			var myChart = echarts.init(document.getElementById('main')); 
	 	 			option = {
	 	 				    backgroundColor: "#FFFFFF",
	 	 				    color: ["#f9882c", "#24c5fb", "#24c000"],
	 	 				  	title: [{
		 	 			        text: '时长排行榜',
		 	 			      	left:'center' ,
		 	 			      	//textAlign:'center',
		 	 			    }],
	 	 				    textStyle: {
	 	 				        color: "#000000",
	 	 				    },
	 	 				    legend: {
	 	 				        right: 100,
	 	 				        width: 500,
	 	 				        itemWidth: 40,
	 	 				        textStyle: {
	 	 				            color: "#d7d7d7"
	 	 				        },
	 	 				        data: ['Top1', 'Top2', 'Top3']
	 	 				    },
	 	 				    xAxis: [{
	 	 				        type: 'category',
	 	 				      	stuAddress: "服务器IP",
	 	 				        axisTick: {
	 	 				            show: false
	 	 				        },
	 	 				        data: ips
	 	 				    }],
	 	 				    yAxis: [{
	 	 				        type: 'value',
	 	 				        stuAddress: "单位：小时",
	 	 				        axisTick: {
	 	 				            show: false
	 	 				        },
	 	 				        axisLine: {
	 	 				            show: false
	 	 				        },
	 	 				        splitLine: {
	 	 				            lineStyle: {
	 	 				                color: "#333333"
	 	 				            }
	 	 				        },
	 	 				    }],
	 	 				    tooltip: {
	 	 				        trigger: 'axis',
	 	 				        axisPointer: { // 坐标轴指示器，坐标轴触发有效
	 	 				            type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
	 	 				        }
	 	 				    },
	 	 				    series: [{
	 	 				        stuAddress: 'Top2',
	 	 				        type: 'bar',
	 	 				        barWidth: 10,
	 	 				        itemStyle: {
	 	 				            normal: {
	 	 				                barBorderRadius: 5
	 	 				            }
	 	 				        },
	 	 				        data: top2s
	 	 				    }, {
	 	 				        stuAddress: 'Top1',
	 	 				        type: 'bar',
	 	 				        barWidth: 10,
	 	 				        itemStyle: {
	 	 				            normal: {
	 	 				                barBorderRadius: 5
	 	 				            }
	 	 				        },
	 	 				        data: top1s
	 	 				    }, {
	 	 				        stuAddress: 'Top3',
	 	 				        type: 'bar',
	 	 				        barWidth: 10,
	 	 				        itemStyle: {
	 	 				            normal: {
	 	 				                barBorderRadius: 5
	 	 				            }
	 	 				        },
	 	 				        data: top3s
	 	 				    }]
	 	 				};
		                // 为echarts对象加载数据 
		                myChart.setOption(option); 
					});

			</script>
    <body>
    	<div style="height:40px"></div>
		<!--（2）每台服务器上累计时长最高的前三名客户 -->
    	<div class="report_box2" id="main" >
    	
        </div>
        <div style="margin-left:350px">
        	<span><span style="color:red;">*</span>top1表示最高时长，top2表示排名第二的时长，top3表示排名第三的时长<br/></span> 
        	<span><span style="color:red;">*</span>X轴表示Unix服务器IP<br/></span> 
        	<span><span style="color:red;">*</span>Y轴表示用户使用总时长（单位：小时）<br/></span> 
        </div>
    </body>
</html>
