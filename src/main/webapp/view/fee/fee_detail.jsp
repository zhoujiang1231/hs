<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html> 
<html lang="en" class="no-js"> 
<head> 
  <meta charset="utf-8" /> 
  <title>陈杨的粒子特效</title> 
  <%@ include file ="../include/cy.jsp"%>
  <meta stuAddress="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
  <script type='text/javascript' src='${pageContext.request.contextPath}/js/jquery.particleground.min.js'></script>
  <script type='text/javascript' src='${pageContext.request.contextPath}/js/demo.js'></script>
  <style type="text/css">
  	body{
       	overflow:-Scroll;
       	overflow-x:hidden;
    }
    form.main_form{
    			width: 800px;
   				margin:15px auto;
    			max-height: 500px;
	}
  </style>
  <script type="text/javascript">
	  $(function(){
		  var fee_type = $('input:radio:checked').val();
		  if(fee_type==1){
			 $("#ftime").hide();
			 $("#fcost").show();
			 $("#funitcost").hide();
		  }
		  if(fee_type==2){
			 $("#ftime").show();
			 $("#fcost").show();
			 $("#funitcost").show();
		  }
		  if(fee_type==3){
	 		 $("#ftime").hide();
	 		 $("#fcost").hide();
	 		 $("#funitcost").show();
	 	  }
	  })
  </script>		   
</head> 

<body>
<div id="particles">
	<div class="intro">
		        <!-- <div class="row" style="margin-top:-80px;"> -->
	        <div style="margin-top:-40px;font-size:12px">
	        <form id="form1" action="${pageContext.request.contextPath}/fee/feeAdd.do" method="post" class="main_form form-horizontal" >
	        	<fieldset>
	        	
	        		<div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费 ID ：</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" id="useridentify" stuAddress="fee_id" value="${fee.fee_id}" disabled="disabled"/>
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费名称：</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" id="useridentify" stuAddress="fee_name" value="${fee.fee_name}" disabled="disabled"/>
	                     </div>
	                 </div>

					<div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费状态：</label>
	                     <div class="col-xs-4">
	                         <select class="form-control" disabled="disabled">
								<c:choose>
                       				<c:when test="${fee.fee_state==0}"><option>暂停</option></c:when>
                       				<c:when test="${fee.fee_state==1}"><option>开通</option></c:when>
                   				</c:choose>
							 </select>
	                     </div>
	                 </div>
		
				<div class="form-group" style="line-height：3">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费类型：</label>
	                     <div class="col-xs-4">
	                   		<label class="radio-inline">
								<input type="radio" stuAddress="fee_type" id="monthly" value="1" disabled="disabled"
								 	<c:if test="${fee.fee_type==1}">checked</c:if>
								/> 包月
							</label>
							<label class="radio-inline">
								<input type="radio" stuAddress="fee_type" id="package"  value="2" disabled="disabled"
									 <c:if test="${fee.fee_type==2}">checked</c:if>
								/> 套餐
							</label>
							<label class="radio-inline">
								<input type="radio" stuAddress="fee_type" id="timeBased"  value="3" disabled="disabled"
									 <c:if test="${fee.fee_type==3}">checked</c:if>
								/> 计时
							</label>
	                     </div>
	                 </div>
	                 
	                 <div class="form-group" id="ftime">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">基本时长：</label>
	                     <div class="col-xs-4">
	                     <div class="input-group">
	                         <input type="text" class="form-control" stuAddress="time" value="${fee.fee_time}" disabled="disabled"/>
	                         <span class="input-group-addon">小时</span>
	                     </div>
	                     </div>
	                 </div>
	                 <div class="form-group" id="fcost">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">基本费用：</label>
	                     <div class="col-xs-4">
	                     	<div class="input-group">
	                         	<input type="text" class="form-control" stuAddress="basecost" value="${fee.fee_basecost}" disabled="disabled"/>
	                          	<span class="input-group-addon">元</span>
	                        </div>
	                     </div>
	                 </div>
	                 <div class="form-group" id="funitcost">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">单位费用：</label>
	                     <div class="col-xs-4 ">
	                     	<div class="input-group">
	                         	<input type="text" class="form-control" stuAddress="unitcost" value="${fee.fee_unitcost}" disabled="disabled"/>
	                         	<span class="input-group-addon">元/小时</span>
	                         </div>
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">创建时间：</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" id="useridentify" stuAddress="fee_startdate" value="<fmt:formatDate value="${fee.fee_startdate}" pattern="yyyy/MM/dd HH:mm:ss"/>" disabled="disabled"/>
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">启动时间：</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" id="useridentify" stuAddress="fee_date" disabled="disabled" value="<fmt:formatDate value="${fee.fee_date}" pattern="yyyy/MM/dd hh:mm:ss"/>"/>
	                     </div>
	                 </div>
	                 
	                 <div class="form-group">
    					<label for="stuAddress" class="col-xs-3 col-xs-offset-1 control-label">资费说明：</label>
    					<div class="col-xs-4">
   							<textarea class="form-control" rows="4" disabled="disabled">${fee.fee_comment}</textarea>
   						</div>
  					</div>
  							
	                 <div class="form-group">
	                   <div class="col-xs-4"  style="margin-left:275px;">
	                    <a href="${pageContext.request.contextPath}/fee/feeList.do;" class="btn btn-info btn-block" >
          					<span class="glyphicon glyphicon-share-alt"></span> 返回
        				</a> 
       
        			   </div>                          
	                 </div>  
	        	</fieldset>
	        </form>
	      
	        </div>  
        
	</div>
</div>

</body> 
</html> 