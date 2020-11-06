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
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/fileinput5/css/fileinput.min.css"/>

<!-- 这是dataTable的css -->
<link href="${pageContext.request.contextPath}/js/DataTables/datatables.min.css" rel="stylesheet">

<!-- 表单验证的插件 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>

<!-- 时间选择器样式表 -->
<link href="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/moban3007/css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/moban3007/css/fontawesome-all.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput5/js/fileinput.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput5/js/locales/zh.js"></script>

<script type="text/javascript">

	$(function(){
		var pid = 1;
		$.ajax({
			url:"<%=request.getContextPath()%>/product/getAllAreaByPid",
			data:{pid:pid},
			type:"post",
			dataType:"json",
			success:function(res){
				for (var i = 0; i < res.length; i++) {
					var str = "<option value = '" + res[i].id + "'>" + res[i].name + "</option>";
					$("#province").append(str);
				}
			},
			error:function(res){
				alert("请求失败!");
			}
		})
	})
	
	function changeCity(){
		var province = $("#province").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/product/getAllAreaByPid",
			data:{pid:province},
			type:"post",
			dataType:"json",
			success:function(res){
				$("#city").html("");
				for (var i = 0; i < res.length; i++) {
					var str = "<option value = '" + res[i].id + "'>" + res[i].name + "</option>";
					$("#city").append(str);
				}
			},
			error:function(res){
				alert("请求失败!");
			}
		})
	}
	
	function changeCounty(){
		var city = $("#city").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/product/getAllAreaByPid",
			data:{pid:city},
			type:"post",
			dataType:"json",
			success:function(res){
				$("#county").html("请选择");
				for (var i = 0; i < res.length; i++) {
					var str = "<option value = '" + res[i].id + "'>" + res[i].name + "</option>";
					$("#county").append(str);
				}
			},
			error:function(res){
				alert("请求失败!");
			}
		})
	}

	function showUpdateProduct(id){
		$.ajax({
			url:"<%=request.getContextPath()%>/product/showBrand",
			type:"post",
			dataType:"json",
			success:function(data){
				var str = "<option value='-1'>--选择品牌--</option>";
				for (var i = 0; i < data.length; i++) {
					str += "<option value='"+data[i].id+"' "+(data[i].id==$("[name='brandId']").val()?'selected':'')+">"+data[i].brandName+"</option>";
				}
				$("#brand").html(str);
			}
		})
		
		<%-- $.ajax({
			url:"<%=request.getContextPath()%>/product/showUpdateProduct",
			type:"post",
			data:{id:id},
			dataType:"json",
			success:function(data){
				$("[name='id']").val(data.id);
				$("[name='productName']").val(data.productName);
				$("[name='brandId']").val(data.brandId);
				$("[name='price']").val(data.price);
				$("#img").prop("src","http://127.0.0.1:8080/pic/"+data.mainImgPath);
				oldImgPath = data.mainImgPath;
			},
			error:function(){
				alert(1);
			}
		}) --%>
	}
	var oldImgPath = "";

	
	
</script>

<script type="text/javascript">

	$(".myfile").fileinput({
	    //上传的地址
	    uploadUrl:"<%=request.getContextPath()%>/product/uploadFile",
	    uploadAsync : true, //默认异步上传
	    showUpload : false, //是否显示上传按钮,跟随文本框的那个
	    showRemove : false, //显示移除按钮,跟随文本框的那个
	    showCaption : true, //是否显示标题,就是那个文本框
	    showPreview : true, //是否显示预览,不写默认为true
	    dropZoneEnabled : false, //是否显示拖拽区域，默认不写为true,但是会占用很大区域
	    //minImageWidth: 50, //图片的最小宽度
	    //minImageHeight: 50, //图片的最小高度
	    //maxImageWidth: 1000, //图片的最大宽度
	    //maxImageHeight: 1000, //图片的最大高度
	    //maxFileSize: 0, //单位为kb，如果为0表示不限制文件大小
	    //minFileCount: 0,
	    maxFileCount : 1, //表示允许同时上传的最大文件个数
	    enctype : 'multipart/form-data',
	    validateInitialCount : true,
	    previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
	    msgFilesTooMany : "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
	    allowedFileTypes : [ 'image' ],//配置允许文件上传的类型
	    allowedPreviewTypes : [ 'image' ],//配置所有的被预览文件类型
	    allowedPreviewMimeTypes : [ 'jpg', 'png', 'gif' ],//控制被预览的所有mime类型
	    language : 'zh'
	})
	//异步上传返回结果处理
	$('.myfile').on('fileerror', function(event, data, msg) {
	    console.log("fileerror");
	    console.log(data);
	});
	//异步上传返回结果处理
	$(".myfile").on("fileuploaded", function(event, data, previewId, index) {
	    console.log("fileuploaded");
	    var ref = $(this).attr("data-ref");
	    $("input[name='" + ref + "']").val(data.response.url);
	
	    //alert(data.response.url);
	    $("#img").remove();
	    $("#old").val(oldImgPath);
	});
	
	//同步上传错误处理
	$('.myfile').on('filebatchuploaderror', function(event, data, msg) {
	    console.log("filebatchuploaderror");
	    console.log(data);
	});
	
	//同步上传返回结果处理
	$(".myfile").on("filebatchuploadsuccess",
	        function(event, data, previewId, index) {
	            console.log("filebatchuploadsuccess");
	            console.log(data);
	        });
	//上传前
	$('.myfile').on('filepreupload', function(event, data, previewId, index) {
	    console.log("filepreupload");
	});

</script>

</head>
<body>
	<!-- 回显窗口 -->
    <h1 style = "color: white;">Update Product</h1>
    <div class="sub-main-w3" class="form-group">
        <form action="<%=request.getContextPath()%>/product/updateProduct" method = "post" id = "defaultForm">
        	<input type = "hidden" name = "id" value = "${productInfo.id}"/>
        	<input type = "hidden" name = "brandName" value = "${productInfo.brandName}"/>
        	<input type = "hidden" name = "createDate" value = "${productInfo.createDate}"/>
        	<h2 style = "color: white;">Update Now</h2>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">ProductName</label>
                <div class="col-lg-5">
                	<input type="text" name = "productName" value = "${productInfo.productName}"/>
                </div>
            </div>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">BrandName</label>
                <div class="col-lg-5">
				    <select id="brand" name="brandId">
				    </select>
				</div>
            </div>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">Price</label>
                <div class="col-lg-5">
                	<input type="text" name = "price" value = "${productInfo.price}">
                </div>
            </div>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">Area</label>
                <div class="col-lg-5">
                	<select id = "province" name = "" onchange = "changeCity()">
                		<option>===请选择===</option>
                	</select>
                	<select id = "city" onchange = "changeCounty()">
                		<option>===请选择===</option>
                	</select>
                	<select id = "county">
                		<option>===请选择===</option>
                	</select>
                </div>
            </div>
            <div class="form-style-agile">
                <label class="col-lg-3 control-label">MainImagePath</label>
                <div class="col-lg-5">
                	<div class="col-sm-10">
						<img height="100px" src="" id="img"/>
						<input type="hidden" name="old" id="old"/>
						<input type="file" name="myfile" data-ref="url2"
							class="col-sm-10 myfile" value="" /> <input type="hidden"
							name="url2" value="">
					</div>
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