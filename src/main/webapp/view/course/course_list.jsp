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
        //批量删除
        function deleteBatch() {
            if($(":checkbox[name=coursecheckbox]:checked").size()==0) {
                alert("请至少选择一条数据！");
            }else{
                var b = window.confirm("确定批量删除吗？");
                if(b){
                    var cId =[];
                    $('input[name="coursecheckbox"]:checked').each(function(){
                        cId.push($(this).val());
                    });
                    $.ajax({
                        url:'${pageContext.request.contextPath}/course/deleteCourseBatch',
                        type:'post',
                        dataType:'json',
                        data:{
                            cId:cId
                        },
                        traditional: true,
                        success:function (data) {
                            $(".operate_info").text(data.msg);
                            $(".operate_info").show();
                            if(data.result=="0"){
                                $.each(cId,function (i,item) {
                                    $("#"+item).remove();
                                })
                            }
                        }
                    })
                }
                else{
                    $("input:checkbox").removeAttr("checked");
                }
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
                url:'${pageContext.request.contextPath}/course/getAllCourse',
                dataType:'text',
                type:'post',
                data:{
                    pageNum:pageNum,
                    cName:cName,
                    cType:cType
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
                        var htmlstr = "<tr id='"+course.cId+"' ><td><input type='checkbox' value='"+course.cId+"' id ='coursecheckbox' name='coursecheckbox' /></td><td>"+course.cId+"</td><td>"+course.cName+"</td>";
                        htmlstr = htmlstr +"<td>"+course.cMark+"</td><td>"+course.cHour+"</td><td>"+course.cTeacher+"</td>";
                        if(course.cType==0){
                            htmlstr = htmlstr+"<td>必修课</td>";
                        }
                        if(course.cType==1){
                            htmlstr = htmlstr+"<td>选修课</td>";
                        }
                        htmlstr = htmlstr+"<td>"+course.cChosed+"/"+course.cTotal+"</td><td><input type='button' value='删除' class='btn_delete' onclick='deleteCourse("+course.cId+")'/></td></tr>"
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
            <input type="button" value="批量删除" class="btn_add" onclick="deleteBatch();" />
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
                    <div>
                        <th class="th_select_all">
                            <input style="margin-top:-5px;height:12px" type="checkbox" id="selectAllBtn" />全选
                        </th>
                    </div>
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