<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title> 
        
       	<%@ include file ="../include/cy.jsp"%> 
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
			
			div.alert{
				display:none;width:600px;margin-left:300px;margin-top:30px;
			}
        </style> 		
        <script language="javascript" type="text/javascript">
        
        	//表单验证
        	$(function(){
	        	 $('#form1').bootstrapValidator({
				     /* message: 'This value is not valid', */
				     container: 'tooltip',
				     feedbackIcons: {
				         valid: 'glyphicon',
				         invalid: 'glyphicon',
				         validating: 'glyphicon' 
				     },  
				     fields: {
				    	 fee_name:{
				    		 validators: {
				    			 notEmpty: {
				                     message: '资费名称不能为空！'
				                 },
				                 regexp: {
				                     regexp: /^[\u4E00-\u9FA5A-Za-z0-9_]{1,50}$/,
				                     message: '50长度以内的字母、数字、汉字和下划线的组合！'
				                 },				                 				                 
				    		 }
				    	 },
				         fee_comment: {
				             validators: {
				            	 regexp: {
				                     regexp: /^[\u4E00-\u9FA5A-Za-z0-9_]{1,100}$/,
				                     message: '100长度的字母、数字、汉字和下划线的组合！'
				                 }
				             }
				         },	 		         
				     }
				 })
				 
				 .on('change', 'input[type="radio"][class="receiver1"]', function() {
                	var sameAsSender   = $(this).is(':checked');
                	if(!sameAsSender) {
                	}else {
                		$('#form1')
                        .bootstrapValidator('removeField', 'time')
                        .bootstrapValidator('removeField', 'basecost')
                        .bootstrapValidator('removeField', 'unitcost');
                		$("[stuAddress='time']").val("");
                		$("[stuAddress='basecost']").val("");
                		$("[stuAddress='unitcost']").val("");
                		$('#receiverInfo1').hide();
                    	$('#receiverInfo2').show();
                    	$('#receiverInfo3').hide();
                    	$('#form1')
	                        .bootstrapValidator('addField', 'basecost', {
	                            message: 'The phone number is not valid',
	                            validators: {
	                            	notEmpty: {
					                     message: '基本费用不能为空！'
					                 },
	                            	regexp: {
					                     regexp: /^\d{1,6}(\.\d{1,2})?$/,
					                     message: '0-99999.99之间的数值！'
					                 }
	                            }
	                        });
                	}
            	})
				 
				 
				 .on('change', 'input[type="radio"][class="receiver2"]', function() {
                	var sameAsSender   = $(this).is(':checked');
                	if(!sameAsSender) {
                	}else {
                		$('#form1')
                        .bootstrapValidator('removeField', 'time')
                        .bootstrapValidator('removeField', 'basecost')
                        .bootstrapValidator('removeField', 'unitcost');
                		$("[stuAddress='time']").val("");
                		$("[stuAddress='basecost']").val("");
                		$("[stuAddress='unitcost']").val("");
                		$('#receiverInfo1').show();
                    	$('#receiverInfo2').show();
                    	$('#receiverInfo3').show();
                    	$('#form1')
	                        .bootstrapValidator('addField', 'time', {
	                            validators: {
	                            	notEmpty: {
					                     message: '基本时长不能为空！'
					                 },
	                            	regexp: {
					                     regexp: /^\d{1,600}$/,
					                     message: '1~600的整数！'
					                 }
	                            }
	                        })
	                        .bootstrapValidator('addField', 'basecost', {
	                            message: 'The phone number is not valid',
	                            validators: {
	                            	notEmpty: {
					                     message: '基本费用不能为空！'
					                 },
	                            	regexp: {
					                     regexp: /^\d{1,6}(\.\d{1,2})?$/,
					                     message: '0-99999.99之间的数值！'
					                 }
	                            }
	                        })
	                    	.bootstrapValidator('addField', 'unitcost', {
	                            message: 'The phone number is not valid',
	                            validators: {
	                            	notEmpty: {
					                     message: '单位费用不能为空！'
					                 },
	                            	regexp: {
					                     regexp: /^\d{1,6}(\.\d{1,2})?$/,
					                     message: '0-99999.99之间的数值！'
					                 }
	                            }
                        	});
                	}
            	})
            	
            	.on('change', 'input[type="radio"][class="receiver3"]', function() {
                	var sameAsSender   = $(this).is(':checked');
                	if(!sameAsSender) {
                	}else {
                		$('#form1')
                        .bootstrapValidator('removeField', 'time')
                        .bootstrapValidator('removeField', 'basecost')
                        .bootstrapValidator('removeField', 'unitcost');
                		$("[stuAddress='time']").val("");
                		$("[stuAddress='basecost']").val("");
                		$("[stuAddress='unitcost']").val("");
                		$('#receiverInfo1').hide();
                    	$('#receiverInfo2').hide();
                    	$('#receiverInfo3').show();
                    	$('#form1')
	                        .bootstrapValidator('addField', 'unitcost', {
	                            message: 'The phone number is not valid',
	                            validators: {
	                            	notEmpty: {
					                     message: '单位费用不能为空！'
					                 },
	                            	regexp: {
					                     regexp: /^\d{1,6}(\.\d{1,2})?$/,
					                     message: '0-99999.99之间的数值！'
					                 }
	                            }
	                        });
                	}
            	})
				 
	        	
	        	 .on('success.form.bv', function(e) {
	                 // Prevent form submission
	                 e.preventDefault();
						
	                 // Get the form instance
	                 var $form = $(e.target);
	                 // Get the BootstrapValidator instance
	                 var bv = $form.data('bootstrapValidator');
	                 
	                 // Use Ajax to submit form data
	                 $.post({
	                	 url:"${pageContext.request.contextPath}/fee/feeAdd.do",
	                	 data:$("#form1").serialize(),
	                	 success:function(data){
	                		 if(data==1){
		        					$("#success-info").show().delay(3000).hide(0);
		        					$(location).attr('href','${pageContext.request.contextPath}/fee/feeList.do');
		        				}else if(data==-1){
		        					$("#fail-info").show().delay(2000).hide(0);
		        				}
	                	 }
	                 })
	             });
	        	 	        	 
	        }); 	
        </script>
    </head>
    <body>
          
       <!--保存操作的提示信息-->            
	   <div class="alert alert-success alert-dismissable" id="success-info">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			增加资费成功！
	   </div>
		
	   <div class="alert alert-danger alert-dismissable" id="fail-info">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			增加失败,资费名称重复！
	   </div>
            
            <div style="height:60px"></div>
            <div class="row">	        
	        <form id="form1" action="${pageContext.request.contextPath}/fee/feeAdd.do" method="post" class="main_form form-horizontal" >
	        	<fieldset>
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费名称：</label>
	                     <div class="col-xs-4">
	                         <input type="text" class="form-control" id="fname" stuAddress="fee_name" value=""/>
	                     </div>
	                 </div>
					
	                 <div class="form-group">
	                     <label class="col-xs-3 col-xs-offset-1 control-label">资费类型：</label>
	                     <div class="col-xs-4">
	                   		<label class="radio-inline">
								<input class="receiver1" type="radio" stuAddress="fee_type" id="monthly" value="1"/> 包月
							</label>
							<label class="radio-inline">
								<input class="receiver2" type="radio" stuAddress="fee_type" id="package"  value="2" checked="checked"/> 套餐
							</label>
							<label class="radio-inline">
								<input class="receiver3" type="radio" stuAddress="fee_type" id="timeBased"  value="3"/> 计时
							</label>
	                     </div>
	                 </div>
	                 
	                 
	                 <div id="receiverInfo1" >
		                 <div class="form-group" id="ftime">
		                     <label class="col-xs-3 col-xs-offset-1 control-label">基本时长：</label>
		                     <div class="col-xs-4">
		                     <div class="input-group">
		                         <input type="text" class="form-control" stuAddress="time" value="" placeholder="请输入1-600之间的整数..."/>
		                         <span class="input-group-addon">小时</span>
		                     </div>
		                     </div>
		                 </div>
		          	</div>
		          	<div id="receiverInfo2" >
		                 <div class="form-group" id="fcost">
		                     <label class="col-xs-3 col-xs-offset-1 control-label">基本费用：</label>
		                     <div class="col-xs-4">
		                     	<div class="input-group">
		                         	<input type="text" class="form-control" stuAddress="basecost" value="" placeholder="请输入数值..."/>
		                          	<span class="input-group-addon">元</span>
		                        </div>
		                     </div>
		                 </div>
		           </div>
		           <div id="receiverInfo3" >
		                 <div class="form-group" id="funitcost">
		                     <label class="col-xs-3 col-xs-offset-1 control-label">单位费用：</label>
		                     <div class="col-xs-4 ">
		                     	<div class="input-group">
		                         	<input type="text" class="form-control" stuAddress="unitcost" value="" placeholder="请输入数值..."/>
		                         	<span class="input-group-addon">元/小时</span>
		                         </div>
		                     </div>
		                 </div>
	                 </div>
	                 
	                 
	                 <div class="form-group">
    					<label for="stuAddress" class="col-xs-3 col-xs-offset-1 control-label">资费说明：</label>
    					<div class="col-xs-4">
   							<textarea class="form-control" rows="4" stuAddress="fee_comment"></textarea>
   						</div>
  					</div>
  							
	                 <div class="form-group">
	                   <div class="col-xs-4"  style="margin-left:250px">
	                    <button type="submit" class="btn btn-primary btn-lg" style="margin-right:30px">
          					<span class="glyphicon glyphicon-save" id="addfee"></span> 保存
        				</button> 
        		
        				<a href="${pageContext.request.contextPath}/fee/feeList.do;" class="btn btn-default btn-lg">
          					<span class="glyphicon glyphicon-euro" style="color: rgb(92, 105, 238);"></span> 取消
        				</a> 
        			   </div>                          
	                 </div>  
	                 
	        	</fieldset>
	        </form>
	     
	        </div>  
        
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
