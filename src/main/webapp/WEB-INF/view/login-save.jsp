<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrapvalidator-master/vendor/bootstrap/css/bootstrap.css"/>
	    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
		
	    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
	    <script type="text/javascript" src="<%=request.getContextPath()%>/bootstrapvalidator-master/vendor/bootstrap/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>
		
		<script type="text/javascript">
			
			$(function() {
			
				//验证表单
			    $('#defaultForm').bootstrapValidator({
			    	//设置文本格式
			        fields: {
			        	userName: {
			        		//验证器
			                validators: {
			                	//非空判断
			                    notEmpty: {
			                    	//不符合规定的提示语句
			                        message: '<font color = "red" size = "2">*用户名不能为空</font>'
			                    },
			                    //字符长度
			                    stringLength: {
			                        min: 6,
			                        max: 30,
			                        message: '<font color = "red" size = "2">*用户名必须大于6个字符，小于30个字符</font>'
			                    },
			                    //正则表达
			                    regexp: {
			                        regexp: /^[a-zA-Z0-9]+$/,
			                        message: '<font color = "red" size = "2">*用户名只能由字母、数字、组成</font>'
			                    },
			                    //非等判断
			                    different: {
			                        field: 'userPwd',
			                        message: '<font color = "red" size = "2">*用户名和密码不能相同</font>'
			                    }
			                }
			            },
			            userPwd: {
			                validators: {
			                    notEmpty: {
			                        message: '<font color = "red" size = "2">*密码不能为空</font>'
			                    },
			                    stringLength: {
			                        min: 6,
			                        max: 30,
			                        message: '<font color = "red" size = "2">*密码必须大于6、小于30个字符</font>'
			                    },
			                    regexp: {
			                        regexp: /^[a-zA-Z0-9]+$/,
			                        message: '<font color = "red" size = "2">*密码不规范</font>'
			                    },
			                    different: {
			                        field: 'userName',
			                        message: '<font color = "red" size = "2">*密码不能与用户名相同</font>'
			                    }
			                }
			            },
			            realName: {
			                validators: {
			                    notEmpty: {
			                        message: '<font color = "red" size = "2">*名字不能为空</font>'
			                    },
			                    regexp: {
			                        regexp: /^[\u4e00-\u9fa5]{2,4}$/,
			                        message: '<font color = "red" size = "2">*姓名只能由2-4为汉字组成</font>'
			                    }
			                }
			            }
			        }
			    });
			});
		
		</script>
		
	</head>
	<body background="<%=request.getContextPath()%>/img/3.jpg">
	
		<div class="container">
	        <div class="row">
	            <!-- form: -->
	            <section>
	                <div class="col-lg-8 col-lg-offset-2">
	                <center>
	                	<div class="page-header">
	                        <h2 style = "color: red;">新增页面</h2>
	                    </div>
	                	
						<form id = "defaultForm" class="form-horizontal" action = "<%=request.getContextPath()%>/login/saveLogin" method = "post">
									<label class="col-lg-3 control-label" style = "color: red;">用户名:</label>
									<div class="col-lg-5">
										<input type="text" style = "width: 250px;" class="form-control" name = "userName" placeholder="userName"/>
									</div>
								
									<label class="col-lg-3 control-label" style = "color: red;">密码:</label>
									<div class="col-lg-5">
										<input type="password" style = "width: 250px;" class="form-control" name = "userPwd" placeholder="password"/><br/>
									</div>
								
									<label class="col-lg-3 control-label" style = "color: red;">真实姓名:</label>
									<div class="col-lg-5">
										<input type="text" style = "width: 250px;" class="form-control" name = "realName" placeholder="realName"/><br/>
									</div>
								
								<button type="submit" class="btn btn-primary" name="signup" value="Sign up">新增数据</button>
						</form>
					</center>
					</div>
				</section>
			</div>
		</div>
		
	</body>
</html>