<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
		
		<script type="text/javascript">
			
			$(function(){
				login();
			})
		
			function login(){
				
				var userName = $("#userName").val();
				
				var userPwd = $("#userPwd").val();
				
				var param = {"userName":userName,"userPwd":userPwd};
				
				$.ajax({
					
					url:"<%=request.getContextPath()%>/login/login",
					data:param,
					type:"post",
					dataType:"json",
					success:function(res){
						
						alert(res.success);
						
						if(res.success == "登陆成功!"){
							location.href = "<%=request.getContextPath()%>/login/queryLogin";
						}
						
					},
					error:function(res){
						
					}
					
				})
				
			}
			
		</script>
		
	</head>
	<body>
		<center>
			<h1>登录页面</h1>
			用户名:<input type = "text" name = "userName" id = "userName"/><br/>
			密码:<input type = "password" name = "userPwd" id = "userPwd"/><br/>
			<input type = "button" value = "登录" onclick = "login()"/>
		</center>
	</body>
</html>