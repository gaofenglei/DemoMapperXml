<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap3/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/js/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/moban3007/css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/moban3007/css/fontawesome-all.css">
<!-- 表单验证的插件 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
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
	                    },
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
	})
	
</script>

</head>
<body>
	<h1 style = "color: white;">Update User</h1>
    <div class="sub-main-w3" class="form-group">
        <form action="<%=request.getContextPath()%>/login/updateLogin" method = "post" id = "defaultForm">
        	<input type = "hidden" name = "id" value = "${loginInfo.id}"/>
        	<input type = "hidden" name = "loginTime" value = "${loginInfo.loginTime}"/>
        	<h2 style = "color: white;">Update Now</h2>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">Username</label>
                <div class="col-lg-5">
                	<input type="text" name = "userName" value = "${loginInfo.userName}"/>
                </div>
            </div>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">Password</label>
                <div class="col-lg-5">
                	<input type="password" name = "userPwd" value = "${loginInfo.userPwd}"/>
                </div>
            </div>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">Realname</label>
                <div class="col-lg-5">
                	<input type="text" name = "realName" value = "${loginInfo.realName}">
                </div>
            </div>
            <input type="submit" value = "Update In"/>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <input type="button" data-dismiss="modal" value = "Cancle">
        </form>
    </div>
</body>
</html>