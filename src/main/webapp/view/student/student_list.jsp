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
                        var stuId =[];
                        $('input[name="pswcheckbox"]:checked').each(function(){
                            stuId.push($(this).val());
                        })
                        $.ajax({
                            url :'${pageContext.request.contextPath}/student/updateStudentPswAll',
                            type : 'post',
                            dataType:'json',
                            data : {stuId:stuId},
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
            function deleteStudent(stuId){
                var r = window.confirm("确定要删除该学生吗？");
                if(r){
                    $.ajax({
                        url :'${pageContext.request.contextPath}/student/deleteStudent',
                        type : 'post',
                        data :{stuId :stuId},
                        dataType:'json',
                        success : function(data){
                            $(".operate_info").text(data.msg)
                            $(".operate_info").fadeIn(100);
                            $(".operate_info").fadeOut(3500);
                            if(data.result=="0"){
                                $("#"+stuId).remove();
                                initList(${student_page.pageNum});
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
                var stuName = $("#stuName").val();
                var stuDepart = $("#stuDepart").val();
                var stuSex = $("#stuSex").val();
                if(pageNum==""||pageNum==0||pageNum==null){
                    pageNum=1;
                }
                $.ajax({
                    url:'${pageContext.request.contextPath}/student/getAllStudent',
                    dataType:'text',
                    type:'post',
                    /*async:false,*/
                    data:{pageNum:pageNum,
                        stuName:stuName,
                        stuDepart:stuDepart,
                        stuSex:stuSex},
                    success:function(data){
                        $("#pages").show();
                        $("#currentPage").text("第      ${student_page.pageNum} 页");
                        $("#indexPage").prop("href","javaScript:initList(${student_page.firstPage})");
                        $("#prePage").prop("href","javaScript:initList(${student_page.prePage})");
                        $("#nextPage").prop("href","javaScript:initList(${student_page.nextPage})");
                        $("#lastPage").prop("href","javaScript:initList(${student_page.lastPage})");
                        $("#totalPage").text("共       ${student_page.total} 条记录");
                        var responseData = jQuery.parseJSON(data);
                        var list = responseData.list;
                        $("#tbody").empty();
                        $.each(list,function (i,student) {
                            var htmlstr = "<tr id='"+student.stuId+"'><td><input type='checkbox' value='"+student.stuId+"' id ='pswcheckbox' name='pswcheckbox' /></td><td>"+student.stuId+"</td><td>"+student.stuName+"</td><td>";
                            if(student.stuSex==0){
                                htmlstr = htmlstr+"男";
                            }
                            if(student.stuSex==1){
                                htmlstr = htmlstr+"女";
                            }
                            htmlstr = htmlstr +"</td><td>"+student.stuDepart+"</td><td>"+student.stuAddress+"</td><td>"+student.stuTel+"</td><td>"+student.stuEmail+"</td><td>"+student.stuIdcard+"</td><td>"+student.creatTime+"</td><td><input type='button' value='删除' class='btn_delete' onclick='deleteStudent("+student.stuId+")'/></td></tr>";
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
                    <div>姓名：<input type="text" value="" class="text_search width100" name="stuName" id="stuName"/></div>
                    <div>院系：<input type="text" value="" class="text_search width100" name="stuDepart" id="stuDepart"/></div>
                    <div>性别：<select id="stuSex" name="stuSex" class="text_search width70">
                        <option value="10">全部</option>
                        <option value="0">男</option>
                        <option value="1">女</option>
                    </select>
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" id="btn_search" onclick="initList(1);"/></div>
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/student/student_add.jsp'" />
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
                            <th>学号</th>
                            <th>姓名</th>
                            <th>性别</th>
                            <th>院系</th>
                            <th>住址</th>
                            <th>电话</th>
                            <th>Email</th>
                            <th>身份证</th>
                            <th>创建日期</th>
                            <th style="width:160px">操作</th>
                        </tr> 
                     </thead> 
                     <tbody id="tbody">
                     </tbody>
                    </table>
                    </div>
                <div id="pages" hidden="hidden">
                    <span id="currentPage">第      ${student_page.pageNum} 页</span>
          	        	<a id="indexPage" href="javaScript:initList(${student_page.firstPage})">首页</a>
        	        	<a id="prePage" href="javaScript:initList(${student_page.prePage})">上一页</a>
                    	<%--<a id="currentPage" href="javaScript:initList(${student_page.pageNum})"  class="current_page" ></a>--%>
                    <a id="lastPage" href="javaScript:initList(${student_page.lastPage})">尾页</a>
        	        	<a id="nextPage" href="javaScript:initList(${student_page.nextPage})">下一页</a>
                    <span id="totalPage">共       ${student_page.total} 条记录</span>
            	</div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
        </div>
    </body>
</html>