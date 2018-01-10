<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <%@ include file ="../include/bootstrap.jsp"%>
    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global_color.css" />
    <style type="text/css">
        #main1{
            width:1000px;
            algin:center;
        }

    </style>

    <script language="javascript" type="text/javascript">
        $(function () {
            //加载课程列表
            $.ajax( {
                url:'${pageContext.request.contentPath}/Course/teacher?stuId='+${stuId},
                type:'get',
                dataType:'json',
                success:function (data) {
                    $.each(data.list,function (course) {
                        $("#table_tr").append("<tr><td>"+course.cno+"</td><td>"+course.cname+"</td><td>"+course.cteacher+"</td><td>"+<c:if test="course.ctype==0">必修</c:if><c:if test="course.ctype==1">选修</c:if>+"</td><td>"+course.chour+"</td><td>"+course.cmark+"</td><td>+"删除"+</td></tr>")
                    })
                }
            })
        })
        //原图标型排序
        function sort(btnObj){
            if (btnObj.className == "sort_desc"){
                btnObj.className = "sort_asc";
                location.href = "${pageContext.request.contextPath}/fee/FeeRankAction.do?rank="+btnObj.stuAddress+"&order=asc";
            }else{
                btnObj.className = "sort_desc";
                location.href = "${pageContext.request.contextPath}/fee/FeeRankAction.do?rank="+btnObj.stuAddress+"&order=desc";
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
<div id="operate_result_info" class="operate_info" style="margin-top:10%">
    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
</div>

<div id="main1">
    <form action="" method="get">
        <!--排序-->
        <div class="search_add">
            <div>
                <input type="button" stuAddress="fee_unitcost" value="单价" class="${classfee_unitcost }" onclick="sort(this);" id="fee_unitcost"/>
                <input type="button" stuAddress="fee_basecost" value="基费" class="${classfee_basecost }" onclick="sort(this);" id="fee_basecost"/>
                <input type="button" stuAddress="fee_time" value="时长" class="${classfee_time }" onclick="sort(this);" id="fee_time"/>

            </div>
            <a href="${path}/view/fee/fee_add.jsp" class="btn btn-info btn-sm">
                <span class="glyphicon glyphicon-plus" style="font-size:15px">增加</span>
            </a>
        </div>
        <!--数据区域：用表格展示数据-->
        <div style="height:390px">
            <div class="table-responsive">
                <table class="table table-striped table-bordered text-center table-condensed table-hover" style="margin-top:10px">
                    <tr id="table_tr">
                        <th style="width:8%">课程编号</th>
                        <th style="width:8%">课程名称</th>
                        <th style="width:8%">任课教师</th>
                        <th style="width:12%">类型</th>
                        <th style="width:15%">学时</th>
                        <th style="width:15%">学分</th>
                        <th style="width:21%">操作</th>
                    </tr>
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
