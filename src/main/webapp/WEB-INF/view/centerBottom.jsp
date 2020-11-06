<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap3/css/bootstrap.css">
		
	</head>
	<body background="<%=request.getContextPath()%>/img/15.jpg">
		
        <span style = "font-size: 20px;">尊敬的<font color="red" size="5">${loginInfo.realName}</font>桑麻,欢迎您;这是您今天第${count}次登录</span>
        
        <div style = "background-color: white;float: right;margin-left: 302px;background: url('<%=request.getContextPath()%>/img/3.jpg');">
        
        	<iframe style="background: url('<%=request.getContextPath()%>/img/15.jpg');" id="fancybox-frame" name="fancybox-frame1563327648570" frameborder="0" scrolling="no" hspace="0" src="http://i.tianqi.com/index.php?c=code&a=getcode&id=38&h=50&w=610"></iframe>
    	
    	</div>
		
	</body>
</html>