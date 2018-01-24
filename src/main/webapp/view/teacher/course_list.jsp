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

        //删除
        function deleteCourse(cId) {
            var b = window.confirm("确定要删除该课程吗？");
            if(b){
                $.ajax({
                    url:'${pageContext.request.contextPath}/course/deleteCourse',
                    type:'post',
                    dataType:'json',
                    data:{
                        cId:cId
                    },
                    success:function (data) {
                        $(".operate_info").text(data.msg);
                        $(".operate_info").show();
                        if(data.result=="0"){
                            $("#"+cId).remove();
                        }
                    }
                })
            }
        }

        //初始化数据
        function initList(pageNum) {
            var cName = $("#cName").val();
            var cType = $("#cType").val();
            if(pageNum==""||pageNum==null){
                pageNum=1;
            }
            $.ajax({
                url:'${pageContext.request.contextPath}/course/getAllTeacherCourse',
                dataType:'text',
                type:'post',
                data:{
                    pageNum:pageNum,
                    cName:cName,
                    cType:cType
                },
                success:function(data){
                    var responseData = jQuery.parseJSON(data);
                    var list = responseData.list;
                    var page = responseData.page;
                    $("#pages").show();
                    $("#currentPage").text("第      "+page.pageNum+" 页");
                    $("#indexPage").prop("href","javaScript:initList("+page.firstPage+")");
                    $("#prePage").prop("href","javaScript:initList("+page.prePage+")");
                    $("#nextPage").prop("href","javaScript:initList("+page.nextPage+")");
                    $("#lastPage").prop("href","javaScript:initList("+page.lastPage+")");
                    $("#totalPage").text("共       "+page.total+" 条记录");
                    $("#tbody").empty();
                    $.each(list,function (i,course) {
                        var htmlstr = "<tr id='"+course.cId+"' ><td>"+course.cId+"</td><td>"+course.cName+"</td>";
                        htmlstr = htmlstr +"<td>"+course.cMark+"</td><td>"+course.cHour+"</td><td>"+course.cTeacher+"</td>";
                        if(course.cType==0){
                            htmlstr = htmlstr+"<td>必修课</td>";
                        }
                        if(course.cType==1){
                            htmlstr = htmlstr+"<td>选修课</td>";
                        }
                        htmlstr = htmlstr+"<td>"+course.cChosed+"/"+course.cTotal+"</td>"
                        if(course.cChosed<=0){
                            htmlstr = htmlstr+"<td><a href='javascript:void(0);' onclick='deleteCourse("+course.cId+")'><span style='color: blue'>删除</span></a></td></tr>"
                        }
                        else{
                            htmlstr = htmlstr+"<td>删除</td></tr>";
                        }
                        $("#tbody").append(htmlstr);
                    })
                }
            })
        }
        $(function () {
            initList(1);
            //全选
             $("#selectAllBtn").click(function () {
             var check = $("#selectAllBtn").prop("checked");
             $("input:checkbox").prop("checked",check);
             })
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
        <!--查询-->
        <div class="search_add">
            <div>课程名：<input type="text" value="" class="text_search width100" name="cName" id="cName"/></div>
            <div>类型：<select id="cType" name="cType" class="text_search width70">
                <option value="10">全部</option>
                <option value="0">必修</option>
                <option value="1">选修</option>
            </select>
            </div>
            <div><input type="button" value="搜索" class="btn_search" id="btn_search" onclick="initList(1);"/></div>
            <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/course/course_add.jsp'" />
        </div>
        <!--删除和密码重置的操作提示-->
        <div id="operate_result_info" class="operate_info">
            <img src="../../images/close.png" onclick="this.parentNode.style.display='none';" />
        </div>
        <!--数据区域：用表格展示数据-->
        <div class="table-responsive">
            <table class="table table-striped table-bordered text-center table-condensed table-hover" id="updatePsw">
                <thead>
                <tr>
                    <th>课程编号</th>
                    <th>课程名</th>
                    <th>学分</th>
                    <th>学时</th>
                    <th>任课教师</th>
                    <th>类型</th>
                    <th>已选人数/总人数</th>
                    <th style="width:160px">操作</th>
                </tr>
                </thead>
                <tbody id="tbody">
                </tbody>
            </table>
        </div>
        <div id="pages" hidden="hidden">
            <span id="currentPage">第      ${page.pageNum} 页</span>
            <a id="indexPage" href="javaScript:initList(${page.firstPage})">首页</a>
            <a id="prePage" href="javaScript:initList(${page.prePage})">上一页</a>
            <%--<a id="currentPage" href="javaScript:initList(${page.pageNum})"  class="current_page" ></a>--%>
            <a id="lastPage" href="javaScript:initList(${page.lastPage})">尾页</a>
            <a id="nextPage" href="javaScript:initList(${page.nextPage})">下一页</a>
            <span id="totalPage">共       ${page.total} 条记录</span>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
</div>
</body>
</html>