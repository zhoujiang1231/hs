<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
          <%@ include file ="../include/linking.jsp"%> 
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
            function chooseCourse(cId,cNum){
                if(cNum <=0){
                    alert("该课程人数已满");
                    $("#"+cId).prop("checked",false);
                    return;
                }
                if($("#"+cId).prop("checked")==true){
                    cnumStr=1;
                    //修改课程信息-插入选课记录;
                    $.ajax({
                        url:'${pageContext.request.contextPath}/course/choseCourse',
                        type:'post',
                        dataType:'json',
                        data:{
                            cId:cId
                        },
                        success:function (data) {
                            if(data.result=="0"){
                                alert("你已成功选择该课程");
                            }
                            else{
                                alert(data.msg);
                                $("#"+cId).prop("checked",false);
                            }
                        }
                    })
                }
                else{
                    cnumStr=-1;
                    //修改课程信息-删除选课记录;
                    $.ajax({
                        url:'${pageContext.request.contextPath}/course/choseCourse?cnum='+cnumStr,
                        type:'get',
                        dataType:'json',
                        success:function (data) {
                            if(data.result=="0"){
                                alert("你已成功取消该课程");
                            }
                            else{
                                alert(data.msg);
                                $("#"+cId).prop("checked",true);
                            }
                        }
                    })
                }
            }
            function initList(pageNum) {
                if(pageNum==""||pageNum==null){
                    pageNum=1;
                }
                $.ajax({
                    url:'${pageContext.request.contextPath}/course/getAllCourse',
                    dataType:'text',
                    type:'post',
                    data:{
                        pageNum:pageNum
                    },
                    success:function(data){
                        $("#pages").show();
                        $("#currentPage").text("第      ${course_page.pageNum} 页");
                        $("#indexPage").prop("href","javaScript:initList(${course_page.firstPage})");
                        $("#prePage").prop("href","javaScript:initList(${course_page.prePage})");
                        $("#nextPage").prop("href","javaScript:initList(${course_page.nextPage})");
                        $("#lastPage").prop("href","javaScript:initList(${course_page.lastPage})");
                        $("#totalPage").text("共       ${course_page.total} 条记录");
                        var responseData = jQuery.parseJSON(data);
                        var list = responseData.list;
                        $("#tbody").empty();
                        $.each(list,function (i,course) {
                            var cNum = course.cTotal-course.cChosed;
                            var htmlstr = "<tr ><td><input id='"+course.cId+"' type='checkbox' value='"+course.cId+"' id ='coursecheckbox' name='coursecheckbox' onclick='javascript:chooseCourse("+course.cId+","+cNum+")' /></td><td>"+course.cNo+"</td><td>"+course.cName+"</td>";
                            htmlstr = htmlstr +"<td>"+course.cMark+"</td><td>"+course.cHour+"</td><td>"+course.cTeacher+"</td>";
                            if(course.cType==0){
                                htmlstr = htmlstr+"<td>必修课</td>";
                            }
                            if(course.cType==1){
                                htmlstr = htmlstr+"<td>选修课</td>";
                            }
                            htmlstr = htmlstr+"<td>"+course.cChosed+"/"+course.cTotal+"</td></tr>"
                            $("#tbody").append(htmlstr);
                        })
                    }
                })
            }
            $(function () {
                initList(1);
                /*//全选
                $("#selectAllBtn").click(function () {
                    var check = $("#selectAllBtn").prop("checked");
                    $("input:checkbox").prop("checked",check);
                })*/
                //调整bootstrap表格
                $("th").attr('class','text-center');
                $("td").css('vertical-align','middle');
                $("td,th").css('line-height','30px');
            })
        </script>
    </head>
    <body>
     <div style="height:20px"></div>
        <!--主要区域开始-->
        <div id="main1">
            <form id="serachForm">
                 <div id="operate_result_info" class="operate_info">
                    <img src="../../images/close.png" onclick="this.parentNode.style.display='none';" />
                </div>
                <!--数据区域：用表格展示数据-->
               	  <div class="table-responsive">
                    <table class="table table-striped table-bordered text-center table-condensed table-hover" id="updatePsw">
                    <thead>
                        <tr>
                        	<div>
	                            <th class="th_select_all">
	                            </th>
                            </div>
                            <th>课程编号</th>
                            <th>课程名</th>
                            <th>学分</th>
                            <th>学时</th>
                            <th>任课教师</th>
                            <th>类型</th>
                            <th>已选人数/总人数</th>
                        </tr>
                     </thead> 
                     <tbody id="tbody">
                     </tbody>
                    </table>
                    </div>
                <div id="pages" hidden="hidden">
                    <span id="currentPage">第      ${course_page.pageNum} 页</span>
          	        	<a id="indexPage" href="javaScript:initList(${course_page.firstPage})">首页</a>
        	        	<a id="prePage" href="javaScript:initList(${course_page.prePage})">上一页</a>
                    	<%--<a id="currentPage" href="javaScript:initList(${course_page.pageNum})"  class="current_page" ></a>--%>
                    <a id="lastPage" href="javaScript:initList(${course_page.lastPage})">尾页</a>
        	        	<a id="nextPage" href="javaScript:initList(${course_page.nextPage})">下一页</a>
                    <span id="totalPage">共       ${course_page.total} 条记录</span>
            	</div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
        </div>
    </body>
</html>