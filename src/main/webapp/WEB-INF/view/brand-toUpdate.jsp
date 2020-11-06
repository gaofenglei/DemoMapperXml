<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap3/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<link href="${pageContext.request.contextPath}/js/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<!-- 这是字体图片所需要的css -->
<%-- <link href="${pageContext.request.contextPath}/js/bootstrap3/fonts/glyphicons-halflings-regular.svg" rel="stylesheet"> --%>

<!-- 这是dataTable的css -->
<link href="${pageContext.request.contextPath}/js/DataTables/datatables.min.css" rel="stylesheet">
<!-- 表单验证的插件 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>

<!-- 这是dataTable的js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/DataTables/datatables.min.js"></script>

<!-- 这是基于bootstrap的js分页工具 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapByPage.js"></script>

<!-- 时间选择器样式表 -->
<link href="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">

<!-- 时间选择器前置脚本 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/moment-with-locales.js"></script>

<!-- 时间选择器核心脚本 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/moban3007/css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/moban3007/css/fontawesome-all.css">

</head>
<body>
	<h1 style = "color: white;">Update Brand</h1>
    <div class="sub-main-w3" class="form-group">
        <form action="<%=request.getContextPath()%>/brand/updateBrand" action = "post" id = "defaultForm">
        	<input type = "hidden" name = "id" value = "${brandInfo.id}"/>
        	<input type = "hidden" name = "createDate" value = "${brandInfo.createDate}"/>
        	<h2 style = "color: white;">Update Now</h2>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">BrandName</label>
                <div class="col-lg-5">
                	<input type="text" name = "brandName" value = "${brandInfo.brandName}" style = "width: 350px;"/>
                </div>
            </div>
            <input type="submit" value = "Update In"/>
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <input type="button" data-dismiss="modal" value = "Cancle" >
        </form>
    </div>
</body>
</html>