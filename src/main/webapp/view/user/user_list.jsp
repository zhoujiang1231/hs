<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
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
        		if("${showAccount}"!=""){
        			$("#acc_idcard").val("${showAccount.acc_idcard}");
        			$("#acc_name").val("${showAccount.acc_name}");
        			$("#acc_login").val("${showAccount.acc_login}");
        			$(".select_search").val("${showAccount.acc_state}");	
        		}
        		
        	});
        
	      //搜索的功能
	        function seareach(){
        		var college = $("#college").val();
        		var professional = $("#professional").val();
        		var s_class = $("#s_class").val();
        		var sex = $("sex").val();

        		$.ajax({
                    url:'${pageContext.request.contextPath}/user/getUserByCondition',
                    data:{
                        college:college,
                        professional:professional,
                        s_class:s_class,
                        sex:sex
                    },
                    dataType:'json',
                    type:'post',
                    success:function (data) {
                        $.each(data.list,function (user) {
                            $("#table_tr").append("<tr><td>"+user.sno+"</td><td>"+user.name+"</td><td>"+user.sex+"</td>" +
                                "<td>"+user.college.college+"</td><td>"+user.college.professional+"</td><td>"+user.college.s_class+"</td><td>"+user.idcard+"</td><td>"+user.email+"</td><td>"+user.tel+"</td><td>"+user.sno+"</td></tr>");
                        })
                    }
                })
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
        

            function modify(id){
            	$("#hidden").attr("value",id);
            	$("#hidden").attr("name","modify");
            	$("#form").submit();
            }
           
           function dele(id){
            if(window.confirm("确定要删除此账务账号吗(删除操作不可撤销)?")){
            	$.ajax({
            		url:'${pageContext.request.contextPath }/user/deleteUser',
            		type:'post',
            		data:user_id=id,
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
        <!--主要区域开始-->
        <div id="main1">
                <div class="search_add">
                    <div>
                        学院：
                        <select id="college" name="college" class="select_search">
                            <option value="10">全部</option>
                        </select>
                    </div>
                    <div>
                        专业：
                        <select id="professional" name="professional" class="select_search">
                            <option value="10">全部</option>
                        </select>
                    </div>
                    <div>
                        班级：
                        <select id="s_class" name="s_class" class="select_search">
                            <option value="10">全部</option>
                            <option value="201201">201201</option>
                            <option value="201202">201202</option>
                            <option value="201301">201301</option>
                            <option value="201302">201302</option>
                            <option value="201401">201401</option>
                            <option value="201402">201402</option>
                        </select>
                    </div>
                    <div>
                        性别：
                        <select id="sex" name="sex" class="select_search">
                            <option value="10">全部</option>
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="seareach()" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='user_add.jsp';"/>
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_info" style="margin-top:10%">
                    <img src="${pageContext.request.contextPath}/css/cbwcss/images/close.png" onclick="this.parentNode.style.display='none';" />
                    			删除成功！
                </div>  
                <!--数据区域：用表格展示数据-->
                <div id="data">            
                     <form action="${pageContext.request.contextPath }/account/MiddleAccountAction.do" id="form" method="post">
                 <input type="hidden" name="" id="hidden" value=""/>
                               
                <div class="table-responsive">
                    <table class="table table-striped table-bordered text-center table-condensed table-hover">
				<thead>
					<tr id="table_tr">
						<th width="10%" align="center">学号</th>
						<th width="9%" align="center">姓名</th>
                        <th width="9%" align="center">性别</th>
                        <th width="9%" align="center">学院</th>
                        <th width="9%" align="center">专业</th>
                        <th width="9%" align="center">班级</th>
                        <th width="9%" align="center">身份证</th>
                        <th width="9%" align="center">邮箱</th>
                        <th width="9%" align="center">电话</th>
                        <th width="9%" align="center">登录名</th>
						<th width="9%" align="center">创建日期</th>
					</tr>
				</thead>
				</table>
				</div>
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
