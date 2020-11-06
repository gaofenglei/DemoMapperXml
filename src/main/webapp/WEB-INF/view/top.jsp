<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap3/css/bootstrap.css">
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
		
		<script type="text/javascript">
			
			$(function(){
				
				changeTime();
				
				newClock();
				
			})
		
			function changeTime(){
				
				var date = new Date($("#loginTime").html());
				
				$("#loginTime").html(date.toLocaleString());
				
			}
		
			function newClock(){
				
				setInterval(function(){
					
					var date = new Date();
					
					$("#clock").html(date.toLocaleString());
					
				}, 1)
				
			}
		
		</script>
		
	</head>
	<body background="<%=request.getContextPath()%>/img/3.jpg">
		
		<nav class="navbar navbar-inverse navbar-fixed-top">
	        
	        <ul class="nav navbar-nav">
	        
	        	<li><a><font style = "color: white;">当前登录账号:${loginInfo.userName}</font></a></li>
		        
		        <li><a><font style = "color: white;">上次登陆时间:</font>
		        
		        <font style = "color: red;font-size: 20px;" id = "loginTime"><fmt:formatDate value="${login.loginTime}" pattern = "yyyy-MM-dd HH:mm:ss"></fmt:formatDate></font></a></li>
		        
		        <li><a style = "margin-left: 370px;color: white;">当前时间:<span id = "clock" style = "color: red;font-size: 20px;"></span></a></li>
		        
	        </ul>
	        
	    </nav>
		
	</body>
</html>