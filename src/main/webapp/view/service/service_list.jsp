<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta stuAddress="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
       	<%@include file="../include/cbw.jsp" %> 
        	
		<style>
			.table tbody tr td{
				text-align:center;
            	vertical-align: middle;
            	height:43px;
        	}
			th{
				text-align:center;
				vertical-align: middle;
			} 
			#main1{
       			width:1000px;
       			algin:center;
       		} 
			
		</style>
		
        <script language="javascript" type="text/javascript">
        	
	        $(function(){
        		var a= 1;
	        	//初始化显示数据
	        	show("","","","10");
	        	
	        	//搜索功能
	        	$("#search").click(function(){
	        		var ser_os = $("#os_account").val();
	        		var ser_ip = $("#ip").val();
	        		var acc_idcard= $("#identify").val();
	        		var ser_state = $("#sel").val();
	        		show(ser_os,ser_ip,acc_idcard,ser_state);
	        	});
	        	
	        	//添加时跳转到添加界面动作
	        	$("#add").click(function(){
	        		location.href="${pageContext.request.contextPath}/service/showOpenFee.do";
	        	});
	        	
	        	//初始化显示动作
	        	function show(ser_os,ser_ip,acc_idcard,ser_state){
	        		$.ajax({
		       			url: '${pageContext.request.contextPath}/service/seareach.do',
		       			type: 'post',
		       			data:{
		       				ser_os:ser_os,
		       				ser_ip:ser_ip,
		       				acc_idcard:acc_idcard,
		       				ser_state:ser_state,
		       			},
		       			success:function(data){
		       				$('tr:gt(0)').remove();
		       			 	var container = $("#pagination");
		       				var options = {
		    		                dataSource: data,
		    		                locator: 'items',
		    		                totalNumber: 20,
		    		                className: 'paginationjs-theme-blue',
		    		                pageSize: 9,
		    		                pageRange: 1,
		    		                /* showGoInput: true,
		    		                showGoButton: true, */
		    		                showNavigator: true, 
		    		               <%--  formatNavigator: "<span style='color: #f00'><%= currentPage %></span> st/rd/th, <%= totalPage %> pages, <%= totalNumber %> entries", --%>
		    		                ajax: {
		    		                    beforeSend: function(){
		    		                        dataContainer.html('Loading data from flickr.com ...');
		    		                    }
		    		                }, 
		    		                callback: function (data, pagination) {
		    		                	$('tr:gt(0)').remove();
		    		                	$.each(data, function (index, item) {
		    		                		$("#datalist1").append("<tr id='"+item.ser_os+"'>"+
				    	       							"<td><a href='${pageContext.request.contextPath}/service/showDetail.do?ser_id="+item.ser_id+"' title='查看明细' >"+item.ser_id+"</a></td>"+
				    	       							"<td>"+item.account.acc_id+"</td>"+
				    	       							"<td>"+item.account.acc_idcard+"</td>"+
				    	       							"<td>"+item.account.acc_name+"</td>"+
				    	       							"<td>"+item.ser_os+"</td>"+
				    	       				"</tr>");
		    	       						if(item.ser_state==1){
		    	       							$("#"+item.ser_os).append("<td class='"+item.ser_id+"'>开通</td>")
		    	       						}else if(item.ser_state==0){
		    	       							$("#"+item.ser_os).append("<td class='"+item.ser_id+"'>暂停</td>");
		    	       						}else{
		    	       							$("#"+item.ser_os).append("<td class='"+item.ser_id+"'>删除</td>");
		    	       						}
		    	       						$("#"+item.ser_os).append("<td>"+item.ser_ip+"</td>"+
		    	       							"<td>"+
		    	                                	"<a class='summary'  onmouseover='showDetail(true,this);' onmouseout='showDetail(false,this);'> "+item.fee.fee_name+"</a>"+
		    	                                	"<div  class='detail_info'>"+item.fee.fee_comment+"</div>"+
		                            			"</td>");
		    	       						if(item.ser_state!=2){
		    	       							$("#"+item.ser_os).append("<td id='"+item.ser_id+"'>"+
		    	       							"</td>");
		    	       							$("#"+item.ser_id).append("<input stuAddress='"+item.ser_id+"' type='button' value='开通' class='btn_start' />");
		    	       							$("#"+item.ser_id).append("<input stuAddress='"+item.ser_id+"' type='button' value='暂停' class='btn_pause' />");
		    	       							if(item.ser_state==0){
		    	       								$("#"+item.ser_id+" input").eq(1).hide();
		    	       							}
		    	       							if(item.ser_state==1){
		    	       								$("#"+item.ser_id+" input").eq(0).hide();
		    	       							}
		    	       							$("#"+item.ser_id).append("<input stuAddress='"+item.ser_id+"' type='button' value='修改' class='btn_modify' />");
		    	       							$("#"+item.ser_id).append("<input stuAddress='"+item.ser_id+"' type='button' value='删除' class='btn_delete' />");
		    	       						}else{
		    	       							$("#"+item.ser_os).append("<td ></td>");
		    	       						}
		    	       						
		    	       							
		    	       						//启用的动作
		    	       						$(".btn_start").off("click");
		    			    	        	$(".btn_start").click(function(){
		    			    	        		if(window.confirm("确定要开通此业务账号吗？")){
		    			    	        			var ser_id=$(this).attr("stuAddress");
		    			    	        			$.ajax({
		    			    	        				url : '${pageContext.request.contextPath}/service/open.do',
		    			    	        				type : 'post',
		    			    	        				data : {
		    			    	        					ser_id : ser_id
		    			    	        				},
		    			    	        				success : function(date){
		    			    	        					if(date=="0"){
		    			    	        						$("."+ser_id).text("开通");
		    			    	        						$("#"+ser_id+" input").eq(0).hide();
		    			    	        						$("#"+ser_id+" input").eq(1).show();
		    			    	        						/* $("#"+ser_id).find('input:first').remove();
		    			    	        						$("#"+ser_id).prepend("<input stuAddress='"+ser_id+"' type='button' value='暂停' class='btn_pause' />"); */
		    			    	        						$(".operate_success").text("启用成功");
		    			    	        						$(".operate_success").fadeIn(100);
		    			    	        						$(".operate_success").fadeOut(2500);
		    			    	        					}
		    			    	        					if(date=="1"){
		    			    	        						$(".operate_fail").text("开通失败!此账务账号未开启");
		    			    	        						$(".operate_fail").fadeIn(100);
		    			    	        						$(".operate_fail").fadeOut(2500);
		    			    	        					}
		    			    	        				}
		    			    	        			})
		    			    	               }
		    			    	        	});
		    			    	        	//暂停的动作
		    			    	        	$(".btn_pause").off("click");
		    			    	        	$(".btn_pause").click(function(){
		    			    	        		if(window.confirm("确定要暂停此业务账号吗？")){
		    			    	        			var ser_id=$(this).attr("stuAddress");
		    			    
		    			    	        			$.ajax({
		    			    	        				url : '${pageContext.request.contextPath}/service/pause.do',
		    			    	        				type : 'post',
		    			    	        				data : {
		    			    	        					ser_id : ser_id
		    			    	        				},
		    			    	        				success : function(date){
		    			    	        					if(date=="0"){
		    			    	        						$("."+ser_id).text("暂停");
		    			    	        						$("#"+ser_id+" input").eq(1).hide();
		    			    	        						$("#"+ser_id+" input").eq(0).show();
		    			    	        						/* $("#"+ser_id).find('input:first').remove();
		    			    	        						$("#"+ser_id).prepend("<input stuAddress='"+ser_id+"' type='button' value='开通' class='btn_start' />"); */
		    			    	        						$(".operate_success").text("暂停成功");
		    			    	        						$(".operate_success").fadeIn(100);
		    			    	        						$(".operate_success").fadeOut(2500);
		    			    	        					}
		    			    	        					if(date=="1"){
		    			    	        						$(".operate_fail").text("暂停失败");
		    			    	        						$(".operate_fail").fadeIn(100);
		    			    	        						$(".operate_fail").fadeOut(2500);
		    			    	        					}
		    			    	        				}
		    			    	        			})
		    			    	               }
		    			    	        	});
		    			    	        	
		    			    	        	//修改的动作
		    			    	        	$(".btn_modify").off("click");
		    			    	        	$(".btn_modify").click(function(){
		    			    					location.href="${pageContext.request.contextPath}/service/modiShow.do?ser_id="+$(this).attr("stuAddress");
		    			    				});
		    			    	        	
		    			    	        	
		    			    	        	//删除的动作
		    			    	        	$(".btn_delete").off("click");
		    			    	        	$(".btn_delete").click(function(){
		    			    	        		if(window.confirm("确定要删除此业务账号吗？")){
		    			    	        			var ser_id=$(this).attr("stuAddress");
		    			    	        			//onclick="location.href='../../ServiceDeleteAction.do?bussid=${ls.bussid}';"
		    			    	        			$.ajax({
		    			    	        				url : '${pageContext.request.contextPath}/service/delete.do',
		    			    	        				type : 'post',
		    			    	        				data : {
		    			    	        					ser_id : ser_id
		    			    	        				},
		    			    	        				success : function(date){
		    			    	        					if(date=="0"){
		    			    	        						$("."+ser_id).text("删除");
		    			    	        						$("#"+ser_id).empty();
		    			    	        						$(".operate_success").text("删除成功");
		    			    	        						$(".operate_success").fadeIn(100);
		    			    	        						$(".operate_success").fadeOut(2500);
		    			    	        					}
		    			    	        					if(date=="1"){
		    			    	        						$(".operate_fail").text("删除失败");
		    			    	        						$(".operate_fail").fadeIn(100);
		    			    	        						$(".operate_fail").fadeOut(2500);
		    			    	        					}
		    			    	        				}
		    			    	        			})
		    			    	               }
		    			    	        	});
	    			                    	
	    			             		});
		    		                }
		    		            };
		       				container.pagination(options);
		       			}//成功方法结束
	        		});
	        	}
	        });
	      //显示资费详细信息
            function showDetail(flag, a) {
                var detailDiv = $(a).next();
                if (flag) {
                	detailDiv.css("display","block");
                }
                else
                	detailDiv.css("display","none");
            }
            //调整bootstrap表格
            $(function(){
            	$("th").attr('class','text-center');
            	$("td").css('vertical-align','middle');
            	$("td,th").css('line-height','30px');
            	
            })
        </script>
    </head>
    <body>
     <div style="height:20px"></div>
        <div id="main1" style="height:490px"> 
            <form class="form-horizontal" role="form">
                <!--查询-->
                <div class="search_add">                        
                    <div>OS 账号：<input id="os_account" type="text" value="" class="width100 text_search" /></div>                            
                    <div>服务器 IP：<input id="ip" type="text" value="" class="width100 text_search" /></div>
                    <div>身份证：<input id="identify" type="text"  value="" class="text_search" /></div>
                    <div>状态：
                        <select id="sel" class="select_search">
                            <option value="10">全部</option>
                            <option value="1">开通</option>
                            <option value="0">暂停</option>
                            <option value="2">删除</option>
                        </select>
                    </div>
                    <div><input id="search" type="button" value="搜索" class="btn_search" /></div>
                    <input id="add" type="button" value="增加" class="btn_add" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success" style="margin-top:10%">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                    			删除成功！
                </div>  
                <div id="operate_result_info" class="operate_fail" style="margin-top:10%">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                    	删除失败！
                </div> 
                <!--数据区域：用表格展示数据-->     
                <div class="table-responsive" >            
                    <table id="datalist1" class="table table-striped table-bordered text-center table-condensed">
                    	<thead>
		                    <tr >
		                        <th style="width:8%">业务ID</th>
		                        <th style="width:8%">账务ID</th>
		                        <th style="width:15%">身份证</th>
		                        <th style="width:10%">姓名</th>
		                        <th style="width:10%">OS 账号</th>
		                        <th style="width:8%">状态</th>
		                        <th style="width:13%">服务器 IP</th>
		                        <th style="width:8%">资费</th>                                                        
		                        <th style="width:20%"></th>
		                    </tr>    
	                    </thead>                             
               		</table>  
               		           
               <!--   <p>业务说明：<br />
                1、创建即开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、业务账号不设计修改密码功能，由用户自服务功能实现；<br />
                6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p>
                -->
                </div>      
                
                            
                <!--分页-->
                <!-- <div id="datacontainer">
				</div>  -->
				
				 <!-- <div>
               		<div  style="margin-top:5px;width:50%;text-align:center" id="pagination" >
					</div>   
				 </div> --> 
                
               <%--  <div style="text-align: center; width: 940px;">
	                <ul class="pagination" >
	                	
	                    <li><a href="#">首页</a></li>
	        	        <li><a href="#">上一页</a></li>
	        	        <c:forEach var="i" begin="1" end="5" >   
                        	<li><a id="${i}">${i}</a></li>
                        </c:forEach>
	                
	                    <li><a href="#">下一页</a></li>
	                   	<li> <a href="#">末页</a></li>
	                </ul>  
                </div>    --%>                
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
             <div >
            	 <!-- style="margin-top:-5px;width:400px;text-align:center;" -->
             	<div id="pagination" style="text-align:center;width:450px" > 
				</div>   
				</div>
        </div>
    </body>
</html>
