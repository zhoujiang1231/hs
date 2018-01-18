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
            //重置密码
            function resetPwd() {
                if($(":checkbox[name=pswcheckbox]:checked").size()==0){
                    alert("请至少选择一条数据！");
                }else{
                    var b = window.confirm("确定重置密码吗？");
                    if(b){
                        var tId =[];
                        $('input[name="pswcheckbox"]:checked').each(function(){
                            tId.push($(this).val());
                        })
                        $.ajax({
                            url :'${pageContext.request.contextPath}/teacher/updateTeacherPswAll',
                            type : 'post',
                            dataType:'json',
                            data : {tId:tId},
                            traditional: true,
                            success : function(data){
                                $(".operate_info").text(data.msg);
                                $(".operate_info").fadeIn(100);
                                $(".operate_info").fadeOut(2500);
                            }
                        })
                    }
                    else{
                        $("input:checkbox").removeAttr("checked");
                    }
                }
            }
            //删除
            function deleteTeacher(tId){
                var r = window.confirm("确定要删除该教师吗？");
                if(r){
                    $.ajax({
                        url :'${pageContext.request.contextPath}/teacher/deleteTeacher',
                        type : 'post',
                        data :{tId :tId},
                        dataType:'json',
                        success : function(data){
                            $(".operate_info").text(data.msg)
                            $(".operate_info").fadeIn(100);
                            $(".operate_info").fadeOut(3500);
                            if(data.result=="0"){
                                $("#"+tId).remove();
                                initList(${teacher_page.pageNum});
                            }
                        }
                    })
                }else{
                    $(".operate_info").text("已取消！")
                    $(".operate_info").fadeIn(100);
                    $(".operate_info").fadeOut(2500);
                }
            }
            function initList(pageNum) {
                var tName = $("#tName").val();
                if(pageNum==""||pageNum==0||pageNum==null){
                    pageNum=1;
                }
                $.ajax({
                    url:'${pageContext.request.contextPath}/teacher/getAllTeacher',
                    dataType:'text',
                    type:'post',
                    data:{pageNum:pageNum,
                        tName:tName,
                        pageSize:"10"},
                    success:function(data){
                        $("#pages").show();
                        $("#currentPage").text("第      ${teacher_page.pageNum} 页");
                        $("#indexPage").prop("href","javaScript:initList(${teacher_page.firstPage})");
                        $("#prePage").prop("href","javaScript:initList(${teacher_page.prePage})");
                        $("#nextPage").prop("href","javaScript:initList(${teacher_page.nextPage})");
                        $("#lastPage").prop("href","javaScript:initList(${teacher_page.lastPage})");
                        $("#totalPage").text("共       ${teacher_page.total} 条记录");
                        var responseData = jQuery.parseJSON(data);
                        var list = responseData.list;
                        $("#tbody").empty();
                        $.each(list,function (i,teacher) {
                            $("#tbody").append("<tr id='"+teacher.tId+"'><td><input type='checkbox' value='"+teacher.tId+"' id ='pswcheckbox' name='pswcheckbox' /></td><td>"+teacher.tId+"</td><td>"+teacher.tName+"</td><td>"+teacher.creatTime+"</td><td><input type='button' value='删除' class='btn_delete' onclick='deleteTeacher("+teacher.tId+")'/></td></tr>");
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
                    <div>名称：<input type="text" value="" class="text_search width200" name="tName" id="tName"/></div>
                    <div><input type="button" value="搜索" class="btn_search" id="btn_search" onclick="initList(1);"/></div>
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/teacher/teacher_add.jsp'" />
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
                            <th>教师ID</th>
                            <th>姓名</th>
                            <th>创建日期</th>
                            <th style="width:160px">操作</th>
                        </tr> 
                     </thead> 
                     <tbody id="tbody">
                     </tbody>
                    </table>
                    </div>
                <div id="pages" hidden="hidden">
                    <span id="currentPage"></span>
          	        	<a id="indexPage" >首页</a>
        	        	<a id="prePage" >上一页</a>
                    	<%--<a id="currentPage" href="javaScript:initList(${teacher_page.pageNum})"  class="current_page" ></a>--%>
                    <a id="lastPage">尾页</a>
        	        	<a id="nextPage">下一页</a>
                    <span id="totalPage"></span>
            	</div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
        </div>
    </body>
</html>