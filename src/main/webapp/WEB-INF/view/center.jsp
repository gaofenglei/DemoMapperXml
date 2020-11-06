<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap3/css/bootstrap.css">
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
		
		<script type="text/javascript">
			
			$(function(){
				
				$("[wuxiao]").click(function(){
					
					$("[wuxiao]").prop("disabled",false);
					$(this).prop("disabled",true);
					
				})
				
			})
		
		</script>
		
	</head>
	<body style="background-color: #ccc;">
		<ul class="nav navbar-nav" style = "font-weight: bold;">
	        <li><a href="<%=request.getContextPath()%>/login/centerBottomJsp" target = "bottomFrame" style = "text-decoration: none;">首页</a></li>
	        <li><a href="<%=request.getContextPath()%>/login/queryLogin" target = "bottomFrame">用户管理</a></li>
	        <li><a href="<%=request.getContextPath()%>/product/queryProduct" target = "bottomFrame">商品</a></li>
	        <li><a href="<%=request.getContextPath()%>/brand/queryBrand" target = "bottomFrame">品牌</a></li>
	        <li><a href="<%=request.getContextPath()%>/login/areaJsp" target = "bottomFrame">areaZtree</a></li>
	        <%-- <li><a href="<%=request.getContextPath()%>/login/areaJsp" target = "bottomFrame">地区</a></li> --%>
	    </ul>
	</body>
</html>