<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%-- <%@include file="../include/link.jsp" %> --%>
         <%@ include file ="../include/bootstrap.jsp"%>
         <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootcss/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/cbwcss/bootcss/global_color.css" />
       <style type="text/css">
       		#main1{
       			width:1000px;
       			algin:center;
       			margin-bottom:20px;
       			margin-top:20px;
       		}       
       </style>
       
        <script language="javascript" type="text/javascript">
        	
        	$(function(){
        		 /* alert("${showAccount.acc_state}");  */
        		if("${showAccount}"!=""){
        			$("#acc_idcard").val("${showAccount.acc_idcard}");
        			$("#acc_name").val("${showAccount.acc_name}");
        			$("#acc_login").val("${showAccount.acc_login}");
        			$(".select_search").val("${showAccount.acc_state}");	
        		}
        		
        	});
        
	      //搜索的功能
	        function seareach(){
        		var acc_idcard = $("#acc_idcard").val();
        		var acc_name = $("#acc_name").val();
        		var acc_login = $("#acc_login").val();
        		var acc_state = $(".select_search").val();	
        		
        		location.href="${pageContext.request.contextPath}/account/sereach.do?acc_idcard="+
        				acc_idcard+"&acc_name="+acc_name+"&acc_login="+acc_login+"&acc_state="+acc_state;
        		
	        }
        	
	      //翻页
	      function showPage(cur){
	    	  var acc_idcard = $("#acc_idcard").val();
      		var acc_name = $("#acc_name").val();
      		var acc_login = $("#acc_login").val();
      		var acc_state = $(".select_search").val();	
      		
      		location.href="${pageContext.request.contextPath}/account/sereach.do?acc_idcard="+
      				acc_idcard+"&acc_name="+acc_name+"&acc_login="+acc_login+"&acc_state="+acc_state+"&middle="+${pc.middle}+"&curPage="+cur;
        	}
        
            //删除
            function deleteAccount() {
                var r = window.confirm("确定要删除此账务账号吗？\r\n删除后将不能恢复，且会删除其下属的所有业务账号。");
                document.getElementById("operate_result_info").style.display = "block";
            }
            //开通或暂停
            function setState(id) {
               /*  var r = window.confirm("确定要开通此账务账号吗？"); */
                var state;
           
                if($("[name='"+id+"']").val()=="暂停" ){
                	state=0;
                }
                if($("[name='"+id+"']").val()=="开通" ){
                	state=1;
                }
              
                $.ajax({
                	
                	url:'${pageContext.request.contextPath }/account/setState.do',
                	type:'post',
            		data:{
            			id:id,
            			state:state,
            			},
            		success:function(data){
            			if(data==1){
            				 if($("[name='"+id+"']").val()=="开通" ){
                 	            $("[name='"+id+"']").val("暂停" );
                 	           $("[name='"+id+"']").attr("class","btn_pause");
                 	         	$("."+id).text("开通");
                 	         	window.location.reload();
                 	         	$(".operate_success").text("操作成功");
        						$(".operate_success").fadeIn(100);
        						$(".operate_success").fadeOut(2500);
            				 }else if($("[name='"+id+"']").val()=="暂停" ){
            	            $("[name='"+id+"']").val("开通" );
            	            $("[name='"+id+"']").attr("class","btn_start");
            	             $("."+id).text("暂停" );
            	             window.location.reload();}
            				 $(".operate_success").text("操作成功");
     						$(".operate_success").fadeIn(100);
     						$(".operate_success").fadeOut(2500);
            	        
            			}else if(data==0){
            				$(".operate_fail").text("未知的错误");
    						$(".operate_fail").fadeIn(100);
    						$(".operate_fail").fadeOut(2500);
            			}
            		}
                })
               
            }
          
            function modify(id){
            	$("#hidden").attr("value",id);
            	$("#hidden").attr("name","modify");
            	$("#form").submit();
            }
           
           function dele(id){
            if(window.confirm("确定要删除此账务账号吗?")){
            	$.ajax({
            		url:'${pageContext.request.contextPath }/account/deleteAccount.do',
            		type:'post',
            		data:{
            			dele:id},
            		success:function(data){
            			if(data==1){
            				$("."+id+"").text("删除");
            				$("#state"+id+"").text(" ");
            				window.location.reload();
            				$(".operate_success").text("删除成功");
    						$(".operate_success").fadeIn(100);
    						$(".operate_success").fadeOut(2500);
            			}else if(data==0){
            				$(".operate_fail").text("删除失败");
    						$(".operate_fail").fadeIn(100);
    						$(".operate_fail").fadeOut(2500);
            			}else if(data==2){
            				$(".operate_fail").text("该账务下有开通业务，不能删除");
    						$(".operate_fail").fadeIn(100);
    						$(".operate_fail").fadeOut(2500);
            			}else{
            				$(".operate_fail").text("未知的错误");
    						$(".operate_fail").fadeIn(100);
    						$(".operate_fail").fadeOut(2500);
            			}
            		}
            	})
            	}
            }
            function details(id){
            	$("#hidden").attr("value",id);
            	$("#hidden").attr("name","details");
            	$("#form").submit();
            }
            
            //调整bootstrap表格
            $(function(){
            	$("th").attr('class','text-center');
            	$("td").css('vertical-align','middle');
            	$("td,th").css('line-height','30px');
            	
            })
        </script>
    </head>
    <body name="account_off">
   
        <!--Logo区域开始-->
        <%-- <div id="header">
           <img src="${pageContext.request.contextPath }/images/logo.png" alt="logo" class="left" />
            <a href="#">[退出]</a>            
        </div> --%>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <!-- <div id="navi">  -->   
            <%-- <%@include file="../include/link.jsp" %>  --%>
        <!-- </div> -->
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main1">
            <!-- <form action="" method=""> -->
                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：<input name="acc_idcard" id="acc_idcard" type="text" value="" class="text_search" /></div>                            
                    <div>姓名：<input name="acc_name" id="acc_name" type="text" class="text_search" value="" /></div>
                    <div>登录名：<input name="acc_login" id="acc_login" type="text"  value="" class="text_search" /></div>
                    <div>
                        状态：
                        <select name="acc_state" class="select_search">
                            <option value="10">全部</option>
                            <option value="1">开通</option>
                            <option value="0">暂停</option>
                            <option value="2">删除</option>
                        </select>
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="seareach()" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='account_add.jsp';"/>
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success" style="margin-top:10%">
                    <img src="${pageContext.request.contextPath}/css/cbwcss/images/close.png" onclick="this.parentNode.style.display='none';" />
                    			删除成功！
                </div>  
                <div id="operate_result_info" class="operate_fail" style="margin-top:10%">
                    <img src="${pageContext.request.contextPath}/css/cbwcss/images/close.png" onclick="this.parentNode.style.display='none';" />
                    	删除失败！
                </div> 
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                     <form action="${pageContext.request.contextPath }/account/MiddleAccountAction.do" id="form" method="post">
                 <input type="hidden" name="" id="hidden" value=""/>
                               
                <div class="table-responsive">            
                    <table class="table table-striped table-bordered text-center table-condensed table-hover">
				<thead>
					<tr>
						<th width="6%" align="center">账号ID</th>
						<th width="12%" align="center">姓名</th>
						<th width="19%" align="center">身份证</th>
						<th width="8%" align="center">登录名</th>
						<th width="8%" align="center">状态</th>
						<th width="10%" align="center">创建日期</th>
						<th width="17%" align="center">上次登录时间</th>
						<th width="20%" align="center"></th>											
					</tr>
				</thead>
				<c:forEach items="${accounts }" var="cs" >
                 	<tr id="${cs.acc_id }">
                        <td>${cs.acc_id }</td>
                        <td><a href="javascript:details(${cs.acc_id })">${cs.acc_name }</a></td>
                        <td>${cs.acc_idcard }</td>
                        <td>${cs.acc_login }</td>
                        <td id="${cs.acc_id }" class="${cs.acc_id }"><c:choose>
                            	<c:when test="${cs.acc_state==2 }"><option>删除</option></c:when>
                            	<c:when test="${cs.acc_state==1 }"><option>开通</option></c:when>
                            	<c:when test="${cs.acc_state==0 }"><option>暂停</option></c:when>
                            </c:choose></td>
                        <td><fmt:formatDate value="${cs.acc_createtime }" pattern="yyyy/MM/dd "/></td>
                        <td><fmt:formatDate value="${cs.acc_logintime }" pattern="yyyy/MM/dd HH:mm:ss"/></td>                            
                        <td class="td_modi" id="state${cs.acc_id }">
                        <c:choose><c:when test="${cs.acc_state!=2 }">
                            <input name="${cs.acc_id }" type="button" 
                       value="<c:if test="${cs.acc_state==1 }">暂停</c:if><c:if test="${cs.acc_state==0 }">开通</c:if>"
                             class="<c:if test="${cs.acc_state==1 }">btn_pause</c:if><c:if test="${cs.acc_state==0 }">btn_start</c:if>" 
                             onclick="setState(${cs.acc_id });" />
                            <input type="button" value="修改" class="btn_modify" onclick="modify(${cs.acc_id });" />
                            <input type="button" value="删除" class="btn_delete" onclick="dele(${cs.acc_id });" />
                        	</c:when></c:choose>
   </td>
                    </tr>
                 </c:forEach>				
				</table>
				</div>
                 
                   <%--  <table id="datalist">
                    <tr>
                        <th>账号ID</th>
                        <th>姓名</th>
                        <th class="width150">身份证</th>
                        <th>登录名</th>
                        <th>状态</th>
                        <th class="width100">创建日期</th>
                        <th class="width150">上次登录时间</th>                                                        
                        <th class="width200"></th>
                    </tr>
                 <c:forEach items="${accounts }" var="cs" >
                 	<tr id="${cs.acc_id }">
                        <td>${cs.acc_id }</td>
                        <td><a href="javascript:details(${cs.acc_id })">${cs.acc_name }</a></td>
                        <td>${cs.acc_idcard }</td>
                        <td>${cs.acc_login }</td>
                        <td id="${cs.acc_id }" class="${cs.acc_id }"><c:choose>
                            	<c:when test="${cs.acc_state==2 }"><option>删除</option></c:when>
                            	<c:when test="${cs.acc_state==1 }"><option>开通</option></c:when>
                            	<c:when test="${cs.acc_state==0 }"><option>暂停</option></c:when>
                            </c:choose></td>
                        <td><fmt:formatDate value="${cs.acc_createtime }" pattern="yyyy/MM/dd "/></td>
                        <td><fmt:formatDate value="${cs.acc_logintime }" pattern="yyyy/MM/dd HH:mm:ss"/></td>                            
                        <td class="td_modi" id="state${cs.acc_id }">
                        <c:choose><c:when test="${cs.acc_state!=2 }">
                            <input name="${cs.acc_id }" type="button" 
                       value="<c:if test="${cs.acc_state==1 }">暂停</c:if><c:if test="${cs.acc_state==0 }">开通</c:if>"
                             class="<c:if test="${cs.acc_state==1 }">btn_pause</c:if><c:if test="${cs.acc_state==0 }">btn_start</c:if>" 
                             onclick="setState(${cs.acc_id });" />
                            <input type="button" value="修改" class="btn_modify" onclick="modify(${cs.acc_id });" />
                            <input type="button" value="删除" class="btn_delete" onclick="dele(${cs.acc_id });" />
                        	</c:when></c:choose>
                        </td>
                    </tr>
                 </c:forEach>
                   
                    <!-- </form>   -->         
                </table> --%>
                </form>
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
        <!--主要区域结束-->
        <div id="footer">
            
        </div>
    </body>
</html>
