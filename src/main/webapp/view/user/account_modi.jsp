<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/link.jsp" %>
         <%@ include file ="../include/easyui.jsp"%>
         <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global.css" />
<link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/css/global_color.css" />
         <style type="text/css">
            .xx{
            	color: red;
            }
       		#main1{
       			width:1000px;
       			algin:center;
       			margin-top:40px;
       		}       
        </style>
        <script language="javascript" type="text/javascript">
        //生日为用户的
        $(function(){
        		var idcr=$("#stuIdcard").val();
        		var year=idcr.substring(6,10);
            	var m =idcr.substring(10,12);
            	var day=idcr.substring(12,14);
            	$("[stuAddress='birth']").val(year+"年"+m+"月"+day+"日");
        	})
          //保存成功的提示信息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
            //显示修改密码的信息项
            function showPwd(chkObj) {
                if (chkObj.checked)
                    document.getElementById("divPwds").style.display = "block";
                else
                    document.getElementById("divPwds").style.display = "none";
            }
            //初始化表单验证
        	$(function(){
        		$(".xx").hide();
        	})
        	 //表单验证,验证姓名
            function addName(){
            	var reg =  /^[\w\u4e00-\u9fa5]{1,20}$/; 
            	var r = $("[stuAddress='acc_name']").val().match(reg);
            	if($("[stuAddress='acc_name']").val()==null || $("[stuAddress='acc_name']").val()==""){
            		$("#name1").hide();
            		$("#name2").show();
            		$("#name3").hide();
            		return false;
            	}else if(r==null){
            		$("#name1").hide();
            		$("#name3").show();
            		$("#name2").hide();
            		return false;
            	}else{
            		$("#name1").hide();
            		$("#name2").hide();
            		$("#name3").hide();
            		return true;
            	}
            }
        	//登录账号和密码
            function addLogin(aa){
            	var reg =  /^[\w\u4e00-\u9fa5]{1,30}$/;
            	var r = $("[stuAddress='acc_"+aa+"']").val().match(reg);
            	if($("[stuAddress='acc_"+aa+"']").val()==null || $("[stuAddress='acc_"+aa+"']").val()==""){
            		$("#"+aa+"1").hide();
            		$("#"+aa+"2").hide();
            		$("#"+aa+"3").hide();
            		return true;
            	}else if(r==null){
            		$("#"+aa+"1").hide();
            		$("#"+aa+"3").show();
            		$("#"+aa+"2").hide();
            		return false;
            	}else{
            		$("#"+aa+"1").hide();
            		$("#"+aa+"2").hide();
            		$("#"+aa+"3").hide();
            		return true;
            	}
            }
        	 //验证手机号
            function addTel(){
            	var reg=/^(1)\d{10}$/;
            	var r=$("[stuAddress='acc_tel']").val().match(reg);
            	if($("[stuAddress='acc_tel']").val()==null||$("[stuAddress='acc_tel']").val()==""){
            		$("#stuTel").hide();
            		return true;
            	}else if(r==null){
            		$("#stuTel").show();
            		return false;
            	}else $("#stuTel").hide();return true;
            }
            //验证推荐人省份证
            function recidcard(){
            	var reg=/^[1-9]\d{5}((19|20)\d{2})((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}[\d|x]$/;
            	var idcr=$("[stuAddress='acc_recidcard']").val();
            	var birth =idcr.substring(6,14);
            	var r=idcr.match(reg);
            	if($("[stuAddress='acc_recidcard']").val()==null||$("[stuAddress='acc_recidcard']").val()==""){
            		$("#recidcard3").hide();
            		$("#recidcard2").hide();
            		return true;
            	}else if(r==null){
            		$("#recidcard3").show();
            		$("#recidcard2").hide();
            		return false;
            	}else if(checkbirth(birth)){
            		$("#recidcard3").hide();
            		$("#recidcard2").hide();
            		/* $("[stuAddress='birth']").val(birth); */
            		return true;
            	}else{
            		$("#recidcard3").show();
            		$("#recidcard2").hide();
            		return false;
            	}
            }
          //验证生日
            function checkbirth(birth){
            	var date=new Date();
            	var year=date.getFullYear(); //获取当前年份
            	var mon=date.getMonth()+1; //获取当前月份
            	var da=date.getDate(); //获取当前日
            	if(mon<10) var t=year+"0"+mon+""+da;
            	var y=birth.substring(0,4);
            	var m=birth.substring(4,6);
            	var d=birth.substring(6,8);
            	
            	if(birth>t){
            		return false;
            	}else if((m==01||m==03||m==05||m==07||m==08||m==10||m==12)&&d<32&&d>0){
            		return true;
            	}else if((m==04||m==06||m==09||m==11)&&d<31&&d>0){
            		return true;
            	}else if(m==02){
            		if(y%4==0&&y%100!=0||y%400==0){
            			if(d<30) return true;
            			else return false;
  	    		  }else{
  	    			if(d<29) return true;
  	    			else return false;
  	    		  }
            	}else{
            		return false;
            	}
            }
            //验证邮箱
            function addEmail(){
            	var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            	var r=$("[stuAddress='acc_email']").val().match(reg);
            	if($("[stuAddress='acc_email']").val()==null||$("[stuAddress='acc_email']").val()==""){
            		$("#stuEmail").hide();
            		return true;
            	}else if(r==null){
            		$("#stuEmail").show();
            		return false;
            	}else{
            		$("#stuEmail").hide();
            		return true;
            	}
            }
          //验证通信地址
            function address(){
            	var reg=/^[\w\u4e00-\u9fa5]{0,50}$/;
            	var r=$("[stuAddress='acc_address']").val().match(reg);
            	if(r==null){
            		$("#address").show();
            		return false;
            	}else $("#address").hide();return true;
            }
            //验证邮编
            function zipcode(){
            	var reg=/^\d{6}$/;
            	var r=$("[stuAddress='acc_zipcode']").val().match(reg);
            	if($("[stuAddress='acc_zipcode']").val()==null||$("[stuAddress='acc_zipcode']").val()==""){
            		$("#zipcode").hide();
            		return true;
            	}else if(r==null){
            		$("#zipcode").show();
            		return false;
            	}else $("#zipcode").hide();return true;
            }
            //重复密码
            function addpsw(){
            	if($("[stuAddress='acc_psw']").val()==$("[stuAddress='password']").val()){
            		$("#password").hide();
            		return true;
            	}else{
            		$("#password").show();
            		return false;
            	}
            }
            //验证qq
            function qq(){
            	var reg=/^\d{5,16}$/;
            	var r=$("[stuAddress='acc_qq']").val().match(reg);
            	if($("[stuAddress='acc_qq']").val()==null||$("[stuAddress='acc_qq']").val()==""){
            		$("#qq").hide();
            		return true;
            	}else if(r==null){
            		$("#qq").show();
            		return false;
            	}else $("#qq").hide();return true;
            }
            function uptAccount(){
            	
            	if(addName()&&addLogin('psw')&&addpsw()&&addTel()&&recidcard()
            			&&addEmail()&&address()&&zipcode()&&qq()){
            		update();
            	
            	}else{
            		$(".operate_fail").text("请将信息填写完整（注意红色提示）");
					$(".operate_fail").fadeIn(100);
					$(".operate_fail").fadeOut(2500);
            	}
            }  
            

           
             
            function update(){
            	$.ajax({
            		url:'${pageContext.request.contextPath }/account/updateAccount.do',
            		type:'post',
            		data:$("#form").serialize(),
            		success:function(data){
            			if(data==1){
            				$(".operate_success").text("修改成功");
        					$(".operate_success").fadeIn(100);
        					$(".operate_success").fadeOut(2500);
            				/* $("#"+id).remove(); */
            			}else if(data==0){
            				$(".operate_fail").text("修改失败");
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
            
            function back(){
            	location.href="${pageContext.request.contextPath }/account/selectAllAccount.do";
            }
        </script>
    </head>
    <body>
        <!--Logo区域开始-->
        <!-- <div id="header">
            <img src="../../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div> -->
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <!-- <div id="navi"> -->
            
        <!-- </div> -->
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main1">  
                
            <div id="save_result_info" class="save_fail">保存失败，旧密码错误！</div>
            <form id="form" action="${pageContext.request.contextPath }/account/updateAccount.do" method="post" class="main_form">
                    <!--必填项-->
                    <div class="text_info clearfix"><span>账务账号ID：</span></div>
                    <div class="input_info">
                        <input type="text" stuAddress="acc_id" value="${Accent.acc_id }" readonly class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" stuAddress="acc_name" value="${Accent.acc_name }" onblur="addName()" />
                        <!-- <span class="required">*</span>-->
                        <div class="validate_msg_long"><p id="name1">20长度以内的汉字、字母和数字的组合</p>
                    <p id="name2" class="xx" >姓名不能为空</p>
                    <p id="name3" class="xx" >姓名格式不正确</p></div>
                    </div>
                    <div class="text_info clearfix"><span>身份证：</span></div>
                    <div class="input_info">
                        <input type="text" id="stuIdcard" stuAddress="acc_idcard" value="${Accent.acc_idcard }" readonly class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>登录账号：</span></div>
                    <div class="input_info">
                        <input type="text" stuAddress="acc_login" value="${Accent.acc_login }" readonly class="readonly"  />
                        <div class="change_pwd">
                            <input id="chkModiPwd" type="checkbox" onclick="showPwd(this);" />
                            <label for="chkModiPwd">修改密码</label>
                        </div>
                    </div>
                    <!--修改密码部分-->
                    <div id="divPwds">
                        <div class="text_info clearfix"><span>旧密码：</span></div>
                        <div class="input_info">
                            <input type="password" value="${Accent.acc_psw }" stuAddress="oldpsw" />
                            <!-- <span class="required">*</span>-->
                            <div class="validate_msg_long"></div>
                        </div>
                        <div class="text_info clearfix"><span>新密码：</span></div>
                        <div class="input_info">
                            <input type="password" stuAddress="acc_psw" onblur="addLogin('psw')"/>
                            <!-- <span class="required">*</span>-->
                            <div class="validate_msg_long"><p id="psw1">30长度以内的字母、数字和下划线的组合</p>
                    	<p id="psw2" class="xx">密码不能为空</p>
                    	<p id="psw3" class="xx">密码格式错误</p></div>
                        </div>
                        <div class="text_info clearfix"><span>重复新密码：</span></div>
                        <div class="input_info">
                            <input type="password" stuAddress="password"  onblur="addpsw()"/>
                            <!-- <span class="required">*</span>-->
                            <div class="validate_msg_long"><p class="xx" id="password">两次密码必须相同</p></div>
                        </div>  
                    </div>                   
                    <div class="text_info clearfix"><span>手机号：</span></div>
                    <div class="input_info">
                        <input type="text"  stuAddress="acc_tel" value="${Accent.acc_tel}" onblur="addTel()"/>
                        <!-- <span class="required">*</span>-->
                        <div class="validate_msg_long"><p id="stuTel" class="xx">请输入正确手机号</p></div>
                    </div>
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input type="text" stuAddress="acc_recidcard" value="${Accent.acc_recidcard }" onblur="recidcard()"/>
                        <div class="validate_msg_long error_msgs"> <p id="recidcard2" class="xx">身份证不能为空</p>  <!-- 这句没用 -->
                    	<p id="recidcard3" class="xx">身份证格式错误</p></div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input type="text" value="" readonly stuAddress="birth" class="readonly"  />
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text"  stuAddress="acc_email" value="${Accent.acc_email }" onblur="addEmail()"/>
                        <div class="validate_msg_medium"><p class="xx" id="stuEmail">请输入正确的邮箱格式</p></div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                        <select stuAddress="acc_job">
                       
                        	<option <c:if test="${Accent.acc_job==1 }">selected="selected"</c:if> value="1" >干部</option>
                        	<option <c:if test="${Accent.acc_job==2 }">selected="selected"</c:if> value="2" >学生</option>
                        	<option <c:if test="${Accent.acc_job==3}">selected="selected"</c:if> value="3" >技术人员</option>
                        	<option <c:if test="${Accent.acc_job==4}">selected="selected"</c:if> value="4" >其他</option>
                        	
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info fee_type">
                    	
                        <input type="radio" stuAddress="acc_sex" value="0" <c:choose><c:when test="${Accent.acc_sex==0}">checked="checked"</c:when> </c:choose> id="female" onclick="feeTypeChange(1);" />
                        <label for="female">女</label>
                        <input type="radio" stuAddress="acc_sex" value="1" <c:choose><c:when test="${Accent.acc_sex==1}">checked="checked"</c:when> </c:choose>  id="male" onclick="feeTypeChange(2);" />
                        <label for="male">男</label>
                    </div> 
                     <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success" style="margin-top:10%">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                    			删除成功！
                </div>  
                <div id="operate_result_info" class="operate_fail" style="margin-top:10%">
                    <img src="${pageContext.request.contextPath}/images/close.png" onclick="this.parentNode.style.display='none';" />
                    	删除失败！
                </div>     
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text"  stuAddress="acc_address" value="${Accent.acc_address }" onblur="address()"/>
                        <div class="validate_msg_tiny"><p class="xx" id="address">不能使用符号五十长度以内</p></div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input type="text" stuAddress="acc_zipcode" value="${Accent.acc_zipcode}" onblur="zipcode()"/>
                        <div class="validate_msg_long"><p class="xx" id="zipcode">6位数字</p></div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input type="text" stuAddress="acc_qq" value="${Accent.acc_qq }" onblur="qq();" />
                        <div class="validate_msg_long"><p class="xx" id="qq">5到13位数字</p></div>
                    </div>                
                    <!--操作按钮-->
                    <div class="button_info clearfix" >
                        <input type="button" value="保存" class="btn_save" onclick="uptAccount();" />
                        <input type="button" value="返回" class="btn_save" onclick="back()"/>
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
