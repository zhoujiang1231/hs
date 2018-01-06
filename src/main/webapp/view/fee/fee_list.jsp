<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
       	<%@ include file ="../include/bootstrap.jsp"%>
       	<link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootcss/global_color.css" />
        <style type="text/css">
        	#main1{
       			width:1000px;
       			algin:center;
       		}
       		 
		</style>

        <script language="javascript" type="text/javascript">
            //排序按钮的点击事件           
            /*
            bootstrap图标型
            function sort(btnObj) {
            	if (btnObj.className == "glyphicon glyphicon-arrow-down"){
                    btnObj.className = "glyphicon glyphicon-arrow-up";
                    location.href = "${pageContext.request.contextPath}/fee/FeeRankAction.do?rank="+$(btnObj).attr("cy")+"&order=asc";
                }else{
                	btnObj.className = "glyphicon glyphicon-arrow-down";
                	location.href = "${pageContext.request.contextPath}/fee/FeeRankAction.do?rank="+$(btnObj).attr("cy")+"&order=desc";
                }
            } */
            //原图标型排序
            function sort(btnObj){
            	if (btnObj.className == "sort_desc"){
                    btnObj.className = "sort_asc";
                    location.href = "${pageContext.request.contextPath}/fee/FeeRankAction.do?rank="+btnObj.name+"&order=asc";
                }else{
                	btnObj.className = "sort_desc";
                	location.href = "${pageContext.request.contextPath}/fee/FeeRankAction.do?rank="+btnObj.name+"&order=desc";
                }
            }
			
           /*  $(function(){
            	$("#fee_unitcost").click(function(){
            		$("#fee_basecost").attr('class','sort_none');
            		$("#fee_time").attr('class','sort_none');
            	})
            	$("#fee_basecost").click(function(){
            		$("#fee_unitcost").attr('class','sort_none');
            		$("#fee_time").attr('class','sort_none');
            	})
            	$("#fee_time").click(function(){
            		$("#fee_basecost").attr('class','sort_none');
            		$("#fee_unitcost").attr('class','sort_none');
            	})
            })
             */
            //启用
            function startFee(fee_id) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                if(r){
                	/* $.ajax({
        				url : '${pageContext.request.contextPath}/fee/feeStart.do?fee_id='+fee_id,
        				type : 'post',
        				success : function(date){
        					if(date==1){
        						$("#fee_state").text("暂停");
        						$("#fee_change").text("");
        						$("#fee_date").text("");
        						
        					}else{
        						
        					}
        					
        				}
        			}) */
                	
                	location.href="${pageContext.request.contextPath}/fee/feeStart.do?fee_id="+fee_id;
                	$(".operate_success").text("启用成功！");
					$(".operate_success").fadeIn(100);
					$(".operate_success").fadeOut(2500);
                }
            }
            
            //删除
            function deleteFee(fee_id) {
                var r = window.confirm("确定要删除此资费吗？");
                if(r){               	
                	$.ajax({
	        			url:'${pageContext.request.contextPath}/fee/feeDel.do?fee_id='+fee_id,
	        			type:'post',
	        			success:function(result){
	        				if(result==1){
	        					$("tr[id="+fee_id+"]").remove();	        					
	        					$(".operate_success").fadeIn(100);
        						$(".operate_success").fadeOut(2500);
        						location.href="${pageContext.request.contextPath}/fee/feeList.do";
	        				}else{
	        					$(".operate_fail").fadeIn(100);
        						$(".operate_fail").fadeOut(2500);
	        				}
	        			},
	        			error:function(){
	        				$(".operate_fail").fadeIn(100);
    						$(".operate_fail").fadeOut(2500);
	        			}
	        		})
	        		//超链接刷新页面式删除
	        		//location.href="${pageContext.request.contextPath}/fee/feeDel.do?fee_id="+fee_id; 
                }
                
            }
            //翻页
            function showPage(cur){
            	location.href='${pageContext.request.contextPath }/fee/TurnPage.do?middle=${pc.middle}&curPage='+cur
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
   		<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

        <div style="height:20px"></div>
        
        <!--删除的操作提示-->
        <div id="operate_result_info" class="operate_success" style="margin-top:10%">
            <img src="${pageContext.request.contextPath}/css/cbwcss/images/close.png" onclick="this.parentNode.style.display='none';" />
            			删除成功！
        </div>  
        <div id="operate_result_info" class="operate_fail" style="margin-top:10%">
            <img src="${pageContext.request.contextPath}/css/cbwcss/images/close.png" onclick="this.parentNode.style.display='none';" />
            	删除失败！
        </div>
		
	<div id="main1">
            <form action="" method="get">
                <!--排序-->
                <div class="search_add">
                    <div> 
                        <input type="button" name="fee_unitcost" value="单价" class="${classfee_unitcost }" onclick="sort(this);" id="fee_unitcost"/>
                        <input type="button" name="fee_basecost" value="基费" class="${classfee_basecost }" onclick="sort(this);" id="fee_basecost"/>
                        <input type="button" name="fee_time" value="时长" class="${classfee_time }" onclick="sort(this);" id="fee_time"/>
					
						<%-- <a href="javascript:void(0)" class="btn btn-primary btn-lg" style="text-align:center" > 
						 	<span id="test" class="${classfee_unitcost}" onclick="sort(this);" cy="fee_unitcost"> 单价</span>
						</a> 
						<a href="javascript:void(0)" class="btn btn-primary btn-lg"> 
							<span class="${classfee_basecost}" onclick="sort(this);" cy="fee_basecost"> 基费 </span>
						</a> 
						<a href="javascript:void(0)" class="btn btn-primary btn-lg" name="fee_time"> 
							<span class="${classfee_time}" onclick="sort(this);" cy="fee_time"> 时长</span>
						</a> --%>					
					</div>
                    <a href="${path}/view/fee/fee_add.jsp" class="btn btn-info btn-sm">
                		<span class="glyphicon glyphicon-plus" style="font-size:15px">增加</span>
                	</a>
                </div> 
                <!--数据区域：用表格展示数据-->     
                <div style="height:390px">
                	<div class="table-responsive">            
                    <table class="table table-striped table-bordered text-center table-condensed table-hover" style="margin-top:10px">
                        <tr>
                            <th style="width:8%">资费ID</th>
                            <th style="width:8%">资费名称</th>
                            <th style="width:8%">基本时长</th>
                            <th style="width:8%">基本费用</th>
                            <th style="width:12%">单位费用</th>
                            <th style="width:15%">创建时间</th>
                            <th style="width:15%">开通时间</th>
                            <th style="width:5%">状态</th>
                            <th style="width:21%"></th>
                        </tr> 
                        
                        <c:forEach items="${lf}" var="fee">
                        	<tr id="${fee.fee_id}">
                            <td>${fee.fee_id}</td>
                            <td><a href="${path}/fee/feeDetail.do?fee_id=${fee.fee_id}">${fee.fee_name}</a></td>
                            <td>
                            	<c:choose>
                       		 		<c:when test="${fee.fee_time==0}"><span style="color:gray;">——</span></c:when>
                       		 		<c:otherwise>${fee.fee_time} 小时</c:otherwise>
                   				</c:choose>
                            </td>
                            <td>
                            	<c:choose>
                       		 		<c:when test="${fee.fee_basecost==0.0}"><span style="color:gray;">——</span></c:when>
                       		 		<c:otherwise>${fee.fee_basecost} 元</c:otherwise>
                   				</c:choose>
                            </td>
                            <td>
                            	<c:choose>
                       		 		<c:when test="${fee.fee_unitcost==0.0}"><span style="color:gray;">——</span></c:when>
                       		 		<c:otherwise> ${fee.fee_unitcost} 元/小时</c:otherwise>
                   				</c:choose>
                           </td>
                            <td><fmt:formatDate value="${fee.fee_startdate}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                            <td id="fee_date"><fmt:formatDate value="${fee.fee_date}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                            
                            <td id="fee_state">
                       		 <c:choose>
                       		 	<c:when test="${fee.fee_state==0}">暂停</c:when>
                       		 	<c:when test="${fee.fee_state==1}">开通</c:when>
                   			</c:choose>
                         	</td>
                            <td id="fee_change">
                            <c:choose>
                            	<c:when test="${fee.fee_state==0}">
                            		 <a href="javascript:void(0)" onclick="startFee(${fee.fee_id});">
                            		 	<span class="glyphicon glyphicon-eye-open " style="font-size: 20px; vertical-align:middle;color: rgb(137, 188, 100);"></span>
       								 </a> &nbsp;&nbsp;&nbsp;&nbsp;      							
        							<a href="${path}/fee/feeMessage.do?fee_id=${fee.fee_id}"><img class="operation" src="${path}/img/update.png"/></a>&nbsp;&nbsp;&nbsp;&nbsp;  
        							<a href="javascript:void(0)" onclick="deleteFee(${fee.fee_id});"><img class="operation delban" src="${path}/img/delete.png"/></a> 										
                            	</c:when>
                            
                            	<c:otherwise></c:otherwise>
                            </c:choose>                                
                                
                            </td>
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
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
