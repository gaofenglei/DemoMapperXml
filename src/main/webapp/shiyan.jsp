<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录注册</title>
		
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap3/css/bootstrap.min.css">
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	    <script src="${pageContext.request.contextPath}/js/bootstrap3/js/bootstrap.min.js"></script>
	
	    <style>
	        body{
	            background-color: #C7EDCC;
	            font-family: "microsoft yahei";
	            /*min-width: 800px;*/
	        }
	        img{
	            width: 100%;
	            /*height: 462px;*/
	        }
	        .navbar{
	            /*margin-bottom: -10px;*/
	        }
	        #myppt{
	            margin-top: -20px;
	
	        }
	    </style>
	</head>
	<body>
	    <ul class="nav navbar-nav navbar-right">
	        <li><a data-toggle="modal" data-target="#register" href=""><span class="glyphicon glyphicon-user"></span> 注册</a></li>
	        <li><a data-toggle="modal" data-target="#login" href=""><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	    </ul>
	    <!-- 注册窗口 -->
	    <div id="register" class="modal fade" tabindex="-1">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-body">
	                    <button class="close" data-dismiss="modal">
	                        <span>&times;</span>
	                    </button>
	                </div>
	                <div class="modal-title">
	                    <h1 class="text-center">注册</h1>
	                </div>
	                <div class="modal-body">
	                    <form class="form-group" action="">
	                            <div class="form-group">
	                                <label for="">用户名</label>
	                                <input class="form-control" type="text" placeholder="6-15位字母或数字">
	                            </div>
	                            <div class="form-group">
	                                <label for="">密码</label>
	                                <input class="form-control" type="password" placeholder="至少6位字母或数字">
	                            </div>
	                            <div class="form-group">
	                                <label for="">再次输入密码</label>
	                                <input class="form-control" type="password" placeholder="至少6位字母或数字">
	                            </div>
	                            <div class="form-group">
	                                <label for="">邮箱</label>
	                                <input class="form-control" type="email" placeholder="例如:123@123.com">
	                            </div>
	                            <div class="text-right">
	                                <button class="btn btn-primary" type="submit">提交</button>
	                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
	                            </div>
	                            <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- 登录窗口 -->
	    <div id="login" class="modal fade">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-body">
	                    <button class="close" data-dismiss="modal">
	                        <span>&times;</span>
	                    </button>
	                </div>
	                <div class="modal-title">
	                    <h1 class="text-center">登录</h1>
	                </div>
	                <div class="modal-body">
	                    <form class="form-group" action="">
                            <div class="form-group">
                                <label for="">用户名</label>
                                <input class="form-control" type="text" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="">密码</label>
                                <input class="form-control" type="password" placeholder="">
                            </div>
                            <div class="text-right">
                                <button class="btn btn-primary" type="submit">登录</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>
                            <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
		
	</body>
</html>