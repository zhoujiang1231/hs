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
        <%@ include file ="../include/linking.jsp"%>
         <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global.css" />
        <link type="text/css" rel="stylesheet" media="all"
              href="${pageContext.request.contextPath}/css/global_color.css"/>
        <style type="text/css">
            #main1 {
                width: 1000px;
                algin: center;
                margin-bottom: 20px;
                margin-top: 20px;
            }
        </style>
        <script language="javascript" type="text/javascript">
            $(function () {
                //搜索的功能
                $("#searchBtn").click(function () {
                    var stuDepart = $("#stuDepart").val();
                    var stuName = $("#stuName").val();
                    var stuAddress = $("#stuDepart").val();
                    var stuSex = $("#stuSex").val();
                    $.ajax({
                        url: '${pageContext.request.contextPath}/student/getUserByCondition',
                        data: {
                            stuDepart: stuDepart,
                            stuSex: stuSex,
                            stuName: stuName,
                            stuAddress: stuAddress
                        },
                        dataType: 'json',
                        type: 'post',
                        success: function (data) {
                            var responseData = jQuery.parseJSON(data);
                            var list = responseData.list;
                            alert(list);
                            /*$.each(list, function (student) {
                                $("#table_tr").append("<tr><td width='13%' align='center'>" + student.stuNo + "</td><td width='13%' align='center'>" + student.stuName + "</td><td width='13%' align='center'>" + student.stuSex + "</td>" +
                                    "<td width='13%' align='center'>" + student.stuDepart + "</td><td width='13%' align='center'>" + student.stuAddress + "</td><td width='13%' align='center'>" + student.stuTel + "</td><td width='13%' align='center'>" + student.stuEmail + "</td><td width='13%' align='center'>" + student.stuIdcard + "</td></tr>");
                            })*/
                        }
                    })
                })
            });
	      //翻页
	      /*function showPage(cur){
	            var acc_idcard = $("#acc_idcard").val();
      		var acc_name = $("#acc_name").val();
      		var acc_login = $("#acc_login").val();
      		var acc_state = $(".select_search").val();	
      		
      		location.href="${pageContext.request.contextPath}/account/sereach.do?acc_idcard="+
      				acc_idcard+"&acc_name="+acc_name+"&acc_login="+acc_login+"&acc_state="+acc_state+"&middle="+${pc.middle}+"&curPage="+cur;
        	}



            //调整bootstrap表格
            $(function(){
            	$("th").attr('class','text-center');
            	$("td").css('vertical-align','middle');
            	$("td,th").css('line-height','30px');
            	
            })*/
        </script>
    </head>
    <body name="account_off">
        <!--主要区域开始-->
        <div id="main1">
                <div class="search_add">
                    <div>
                        学院：
                        <input type="text" id="stuDepart" name="stuDepart" class="select_search">
                        </input>
                    </div>
                    <div>
                        姓名：
                        <input type="text" id="stuName" name="stuName" class="select_search">
                        </input>
                    </div>
                    <div>
                        籍贯：
                        <input type="text" id="stuAddress" name="stuAddress" class="select_search">
                        </input>
                    </div>
                    <div>
                        性别：
                        <select id="stuSex" name="stuSex" class="select_search">
                            <option value="10">全部</option>
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select>
                    </div>
                    <div><input id="searchBtn" type="button" value="搜索" class="btn_search" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='../student/student_add.jsp';"/>
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_info" style="margin-top:10%">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                    			删除成功！
                </div>  
                <!--数据区域：用表格展示数据-->
                <div id="data">            
                     <form action="${pageContext.request.contextPath }/account/MiddleAccountAction.do" id="form" method="post">
                 <input type="hidden" name="" id="hidden" value=""/>
                               
                <div class="table-responsive" id="table_tr">
                    <table class="table table-striped table-bordered text-center table-condensed table-hover">
				<thead>
					<tr >
						<th width="13%" align="center">学号</th>
						<th width="12%" align="center">姓名</th>
                        <th width="12%" align="center">性别</th>
                        <th width="12%" align="center">学院</th>
                        <th width="12%" align="center">籍贯</th>
                        <th width="13%" align="center">电话</th>
                        <th width="13%" align="center">邮箱</th>
                        <th width="13%" align="center">身份证</th>
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