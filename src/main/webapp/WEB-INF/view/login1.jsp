<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登陆页面</title>
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
		
		<style>
		
			input[type="submit"],input[type="button"]{
			    color: #fff;
			    background: #f7296f;
			    border: none;
			    padding: 13px 0;
			    margin-top: 30px;
			    outline: none;
			    width: 36%;
			    font-size: 16px;
			    cursor: pointer;
			    letter-spacing: 2px;
			    -webkit-transition: 0.5s all;
			    -o-transition: 0.5s all;
			    -moz-transition: 0.5s all;
			    -ms-transition: 0.5s all;
			    transition: 0.5s all;
			    box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.49);
			}
			
			input[type="submit"]:hover,input[type="button"]:hover{
			    background: #000;
			    -webkit-transition: 0.5s all;
			    -o-transition: 0.5s all;
			    -moz-transition: 0.5s all;
			    -ms-transition: 0.5s all;
			    transition: 0.5s all;
			}
			
			@media(max-width:414px) {
			
				input[type="submit"],input[type="button"]{
			        width: 56%;
			    }
				
			}
		
		</style>
		
		<script>
			addEventListener("load", function () {
				setTimeout(hideURLbar, 0);
			}, false);
			
			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/moban3007/css/style.css" type="text/css" media="all" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/moban3007/css/fontawesome-all.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap3/css/bootstrap.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
		
		<style type="text/css">
			body{
			    background: url("${pageContext.request.contextPath}/img/1.jpg");
			    animation-name:myfirst;
			    animation-duration:12s;
			    /*变换时间*/
			    animation-delay:3s;
			    /*动画开始时间*/
			    animation-iteration-count:infinite;
			    /*下一周期循环播放*/
			    animation-play-state:running;
			    /*动画开始运行*/
			}
		@keyframes myfirst
		{
		    0%   {background:url("${pageContext.request.contextPath}/img/1.jpg");}
		    10%  {background:url("${pageContext.request.contextPath}/img/2.jpg");}
		    20%  {background:url("${pageContext.request.contextPath}/img/3.jpg");}
		    30%  {background:url("${pageContext.request.contextPath}/img/4.jpg");}
		    40%  {background:url("${pageContext.request.contextPath}/img/5.jpg");}
		    50%  {background:url("${pageContext.request.contextPath}/img/6.jpg");}
		    60%  {background:url("${pageContext.request.contextPath}/img/7.jpg");}
		    70%  {background:url("${pageContext.request.contextPath}/img/8.jpg");}
		    80%  {background:url("${pageContext.request.contextPath}/img/9.jpg");}
		    90%  {background:url("${pageContext.request.contextPath}/img/14.jpg");}
		    100%  {background:url("${pageContext.request.contextPath}/img/1.jpg");}
		}
		.form{background: rgba(255,255,255,0.2);width:400px;margin:120px auto;}
		/*阴影*/
		.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
		input[type="text"],input[type="password"]{padding-left:26px;}
		.checkbox{padding-left:21px;}
		</style>
		
		<script type="text/javascript">
		
		<!-- 表单验证 -->
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
			            confirmUserPwd: {
			            	validators: {
			            		notEmpty: {
			                        message: '<font color = "red" size = "2">*确认密码不能为空</font>'
			                    },
			            		identical: {
			                        field: 'userPwd',
			                        message: '<font color = "red" size = "2">*确认密码和密码不一样'
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
				
			    var userName = localStorage.getItem('userName');
		        var userPwd = localStorage.getItem('userPwd');
		        if(userName){
		            $('#userName').val(userName);
		        }if(userPwd){
		            $('#userPwd').val(userPwd);
		        }
				
			});
		
			//登陆方法
			function login(){
				
				//获取账号密码
				var userName = $("#userName").val();
				
				var userPwd = $("#userPwd").val();
				
				//记住密码
		        if($('#remember').is(':checked')) {
		        	localStorage.setItem('userName',userName);
		            localStorage.setItem('userPwd',userPwd);
		        }else{
		        	localStorage.removeItem('userName');
		            localStorage.removeItem('userPwd');
		        }
				
				var param = {"userName":userName,"userPwd":userPwd};
				
				$.ajax({
					
					url:"<%=request.getContextPath()%>/login/login",
					data:param,
					type:"post",
					dataType:"json",
					success:function(res){
						
						alert(res.success);
						
						if(res.success == "登录成功!"){
							location.href = "<%=request.getContextPath()%>/login/mainJsp";
						}
						
					},
					error:function(res){
						
					}
					
				})
			}
			
		</script>
		
	</head>
	<body>
		<!-- <div class="container">
	        <div class="form row">
	            <div class="form-horizontal col-md-offset-3" id="login_form">
	                <h3 class="form-title">商品平台登陆</h3>
	                <div class="col-md-9">
	                    <div class="form-group">
	                        <i class="fa fa-user fa-lg"></i>
	                        <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
	                    </div>
	                    <div class="form-group">
	                            <i class="fa fa-lock fa-lg"></i>
	                            <input class="form-control required" type="password" placeholder="Password" id="password" name="password" maxlength="8"/>
	                    </div>
	                    <div class="form-group">
	                        <label class="checkbox">
	                            <input type="checkbox" name="remember" value="1"/>记住我
	                        </label>
	                    </div>
	                    <div class="form-group col-md-offset-9">
	                        <button type="button" class="btn btn-success pull-right" onclick="login()">登录</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div> -->
	    
	    
	    
	    
	    <!-- bg effect -->
		<div id="bg">
			<canvas></canvas>
			<canvas></canvas>
			<canvas></canvas>
		</div>
		<!-- //bg effect -->
		<!-- title -->
		<h1 style = "color: white;">Effect Login Form</h1>
		<!-- //title -->
		<!-- content -->
		<div class="sub-main-w3">
			<form action = "#">
				<h2 style = "color: white;">Login Now</h2>
				<div class="form-style-agile">
					<label>
						Username
					</label>
					<input placeholder="Username" name="userName" id = "userName" type="text" required=""/>
				</div>
				<div class="form-style-agile">
					<label>
						Password
					</label>
					<input placeholder="Password" name="userPwd" id = "userPwd" type="password" required=""/>
				</div>
				<!-- checkbox -->
				<div class="wthree-text">
					<ul>
						<li>
							<label>
								<input type="checkbox" class="checkbox" id = "remember" style = "float: left;" required="">
								<span style = "margin-left: 20px;">Remember Password</span>
							</label>
						</li>
					</ul>
				</div>
				<!-- 登录按钮 -->
				<input type="button" value="Log In" onclick = "login()">
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<!-- 注册按钮 -->
				<input type="button" value="Sign In" data-toggle="modal" data-target="#register">
			</form>
			
		</div>
		
		<!-- 注册窗口 -->
	    <div id="register" class="modal fade" tabindex="-1">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            
            <h1 style = "color: white;">Effect Sign Form</h1>
            
            <div class="sub-main-w3" class="form-group">
                <form action="<%=request.getContextPath()%>/login/saveLogin" action = "post" id = "defaultForm">
                	<h2 style = "color: white;">Sign Now</h2>
                    <div class="form-style-agile">
                        <label class="col-lg-3 control-label">Username</label>
                        <div class="col-lg-5">
                        	<input type="text" placeholder="Username" name = "userName" id = "username" style = "width: 350px;"/>
                        </div>
                    </div>
                    <div class="form-style-agile">
                        <label class="col-lg-3 control-label">Password</label>
                        <div class="col-lg-5">
                        	<input type="password" placeholder="Password" name = "userPwd" id = "userpwd" style = "width: 350px;">
                        </div>
                    </div>
                    <div class="form-style-agile">
                        <label class="col-lg-3 control-label">Confirm Password</label>
                        <div class="col-lg-5">
                        	<input type="password" name = "confirmUserPwd" placeholder="Again Input Password" style = "width: 350px;">
                        </div>
                    </div>
                    <div class="form-style-agile">
                        <label class="col-lg-3 control-label">Realname</label>
                        <div class="col-lg-5">
                        	<input type="text" placeholder="Realname" name = "realName" id = "realname" style = "width: 350px;">
                        </div>
                    </div>
                    <input type="submit" value = "Sign In"/>
                    
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    
                    <input type="button" data-dismiss="modal" value = "Cancle" >
                    
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login" style = "font-weight: bold;color: white;">An account?Let me login!</a>
                </form>
            </div>
	    </div>
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>
		
		<script src="${pageContext.request.contextPath}/js/bootstrap3/js/bootstrap.min.js"></script>
		<!-- effect js -->
		<script src="${pageContext.request.contextPath}/moban3007/js/canva_moving_effect.js"></script>
		
	</body>
</html>
