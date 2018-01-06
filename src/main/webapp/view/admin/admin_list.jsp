<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
        
            //显示角色详细信息
            function showDetail(flag, a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                    detailDiv.style.display = "none";
            }
            //重置密码
            function resetPwd() {
            	if($(":checkbox[name=updatePsw]:checked").size() == 0){
	                alert("请至少选择一条数据！");           		
            	}else{
            		var b = window.confirm("确定重置选中管理员密码吗？");
            		if(b){
            			var value =[]; 
            			$('input[name="updatePsw"]:checked').each(function(){ 
            				value.push($(this).val());
            			})
            			$.ajax({
	           				url :'${pageContext.request.contextPath}/admin/updateAdminPsw.do',
	           				type : 'post',
	           				data :{"psw" : value},
	           				success : function(date){
		           				if(date=="1"){
		       						$(".operate_success").text("修改成功！");
		       						$(".operate_success").fadeIn(100);
		    						$(".operate_success").fadeOut(3500);
		       					}
		           				if(date=="0"){
	 	           					$(".operate_fail").text("修改失败!");
		       						$(".operate_fail").fadeIn(100);
		    						$(".operate_fail").fadeOut(2500); 
		           				}
		           				if(date=="2"){
		           					$(".operate_fail").text("不能再此重置当前登录人密码，重置失败!");
		           					$(".operate_fail").fadeIn(100);
		           					$(".operate_fail").fadeOut(3500); 
		           				}
	           				}
            			})
            		}
            		else{
            			 $("input:checkbox").removeAttr("checked");
            		}
            	}
            }
            //删除
            function deleteAdmin(admin_id){
                var r = window.confirm("确定要删除此管理员吗？");
                if(r){
                	$.ajax({
           				url :'${pageContext.request.contextPath}/admin/adminDelete.do',
           				type : 'post',
           				data :{admin_id :admin_id},
           				success : function(date){
           					if (date=="0"){
           						$(".operate_fail").text("删除失败！")
           						$(".operate_fail").fadeIn(100);
        						$(".operate_fail").fadeOut(3500);
           					}
           					if(date=="1"){
           						$(".operate_success").text("删除成功！");
           						$("#"+admin_id).remove();
           						$(".operate_success").fadeIn(100);
        						$(".operate_success").fadeOut(3500);
           					}
           					if(date=="2"){
           						$(".operate_fail").text("不能删除当前登录人，删除失败！");
           						$(".operate_fail").fadeIn(100);
        						$(".operate_fail").fadeOut(3500);
           					}
           				}
           				
           			})
                }else{
                	$(".operate_fail").text("已取消！")
					$(".operate_fail").fadeIn(100);
					$(".operate_fail").fadeOut(2500);
                }
            }
            //全选
            function selectAdmins(inputObj) {
                var inputArray = document.getElementById("updatePsw").getElementsByTagName("input");
                for (var i = 1; i < inputArray.length; i++) {
                    if (inputArray[i].type == "checkbox") {
                        inputArray[i].checked = inputObj.checked;
                    }
                }
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
     <div style="height:20px"></div>
        <!--主要区域开始-->
        <div id="main1">
            <form action="${pageContext.request.contextPath}/admin/adminList.do?cur=1" method="post">
                <!--查询-->
                <div class="search_add">
                    <div>
                        模块：
                        <select id="selModules" class="select_search" name="per">
                            <option value=0 <c:if test="${requestScope.rpname=='0'}">selected</c:if>>全部</option>
                            <option value=1 <c:if test="${requestScope.rpname=='1'}">selected</c:if>>角色管理</option>
                            <option value=2 <c:if test="${requestScope.rpname=='2'}">selected</c:if>>管理员管理</option>
                            <option value=3 <c:if test="${requestScope.rpname=='3'}">selected</c:if>>资费管理</option>
                            <option value=4 <c:if test="${requestScope.rpname=='4'}">selected</c:if>>账务账号</option>
                            <option value=5 <c:if test="${requestScope.rpname=='5'}">selected</c:if>>业务账号</option>
                            <option value=6 <c:if test="${requestScope.rpname=='6'}">selected</c:if>>账单管理</option>
                            <option value=7 <c:if test="${requestScope.rpname=='7'}">selected</c:if>>报表</option>
                        </select>
                    </div>
                    <div>角色：<input type="text" value="${requestScope.rname}" class="text_search width200" name="rolename" /></div>
                    <div><input type="submit" value="搜索" class="btn_search" /></div>
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/admin/getRole.do'" />              
 						
 					 </div>
               
                <!--删除和密码重置的操作提示-->
                 <div id="operate_result_info" class="operate_success">
                    <img src="../../images/close.png" onclick="this.parentNode.style.display='none';" />
                   		 删除成功！
                </div> 
                <div id="operate_result_info" class="operate_fail">
                    <img src="../../images/close.png" onclick="this.parentNode.style.display='none';" />
                    <span>删除失败！数据并发错误。</span><!--密码重置失败！数据并发错误。-->
                </div>
                <!--数据区域：用表格展示数据-->     
                
               	  <div class="table-responsive">            
                    <table class="table table-striped table-bordered text-center table-condensed table-hover" id="updatePsw">
                    <thead>
                        <tr>
                        	<div>
	                            <th class="th_select_all">
	                                <input style="margin-top:-5px;height:12px" type="checkbox" onclick="selectAdmins(this);" />全选
	                            </th>
                            </div>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th>登录名</th>
                            <th>电话</th>
                            <th>电子邮件</th>
                            <th>授权日期</th>
                            <th class="width100">拥有角色</th>
                            <th style="width:160px"></th>
                        </tr> 
                     </thead> 
                     <tbody>
                        <c:forEach items="${requestScope.allAdmin_list}" var="admin_list">                    
                        <tr id="${admin_list.admin_id}">
                            <td><input type="checkbox" value="${admin_list.admin_id}" name="updatePsw" /></td>
                            <td>${admin_list.admin_id}</td>
                            <td>${admin_list.admin_name}</td>
                            <td>${admin_list.admin_account}</td>
                            <td>${admin_list.admin_tel}</td>
                            <td>${admin_list.admin_email}</td>
                            <td><fmt:formatDate value="${admin_list.admin_date}" type="both" /></td>
                           <%--  <td><c:forEach items="${admin_list.admin_role}" var="role" >
                            	${role.role_name}
                          		</c:forEach>
                            </td> --%>
                            <td>
                                <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this)">
                                	 <c:forEach items="${admin_list.admin_role}" var="role" begin="0" end="0">
	                            			${role.role_name}
	                       		 </c:forEach>
                              </a>
                                <!--浮动的详细信息-->
                                <div class="detail_info">
	                                 <c:forEach items="${admin_list.admin_role}" var="role" begin="0" >
	                            			${role.role_name}
	                          		 </c:forEach>
                                </div>
                            </td>
                            <td class="td_modi">
                               <c:if test="${admin_list.admin_id!=1&&admin_list.admin_id!=2}">
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/admin/adminModi.do?admin_id=${admin_list.admin_id}'"  />
                                <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin(${admin_list.admin_id})" />
                               </c:if>
                            </td>
                        </tr>
                        </c:forEach>
                       </tbody>
                    </table>
                    </div>
           <!--      分页   -->
                <div id="pages">
                 <c:if test="${requestScope.rpname=='0'&& requestScope.rname==''}">
                    <span>第      ${requestScope.cur} 页</span>
          	        	<a href="${pageContext.request.contextPath}/admin/adminList.do?cur=1">首页</a>
        	        	<c:if test="${requestScope.cur!=1}">
        	        	<a href="${pageContext.request.contextPath}/admin/adminList.do?cur=${requestScope.cur-1}">上一页</a>
        	        	 </c:if> 
        	        <c:forEach var="i" begin="1" end="${requestScope.count}">
                    	<a href="${pageContext.request.contextPath}/admin/adminList.do?cur=${i}" class="current_page" ><c:out value="${i}"/></a>
					</c:forEach>
                    <a href="${pageContext.request.contextPath}/admin/adminList.do?cur=${requestScope.count}">尾页</a>
             			<c:if test="${requestScope.cur!=requestScope.count}">
        	        	<a href="${pageContext.request.contextPath}/admin/adminList.do?cur=${requestScope.cur+1}">下一页</a>
        	        	</c:if>
              	</c:if> 
                    <span>共       ${requestScope.sum} 条记录</span>
            	</div>              
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
