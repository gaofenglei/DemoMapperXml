<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Main title here</title>
		
		
		
	</head>
	<!--  frameborder="no" border="0" framespacing="0" -->
	<frameset cols = "1, 10, 1" frameborder="no" border="0" framespacing="0">
	  <frameset>
	  	<frame style = "background: url('<%=request.getContextPath()%>/img/12.jpg');"/>
	  </frameset>
	  <frameset rows="1, 1, 6">
	  	<%-- <frame src="<%=request.getContextPath()%>/login/headJsp"/> --%>
	  	<frame src="<%=request.getContextPath()%>/login/topJsp" name = "topFrame"/>
	  	<frame src="<%=request.getContextPath()%>/login/centerJsp" name = "centerFrame"/>
	  	<%-- <frame src="<%=request.getContextPath()%>/login/centerBottomJsp" name = "centerBottomFrame"/> --%>
	  	<frame src="<%=request.getContextPath()%>/login/centerBottomJsp" name = "bottomFrame"/>
	  </frameset>
	  <frameset>
		<frame style = "background: url('<%=request.getContextPath()%>/img/13.jpg');"/>
	  </frameset>
	</frameset>
</html>