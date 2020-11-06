<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap3/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
<link href="<%=request.getContextPath()%>/js/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/fileinput5/css/fileinput.min.css"/>
<!-- 这是字体图片所需要的css -->
<%-- <link href="<%=request.getContextPath()%>/js/bootstrap3/fonts/glyphicons-halflings-regular.svg" rel="stylesheet"> --%>

<!-- 这是dataTable的css -->
<link href="<%=request.getContextPath()%>/js/DataTables/datatables.min.css" rel="stylesheet">

<!-- 表单验证的插件 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>

<!-- 这是基于bootstrap的js分页工具 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrapByPage.js"></script>

<!-- 时间选择器样式表 -->
<link href="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">

<link rel="stylesheet" href="<%=request.getContextPath()%>/moban3007/css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/moban3007/css/fontawesome-all.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput5/js/fileinput.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput5/js/locales/zh.js"></script>

<script type="text/javascript">
	$(document).ready( function (){
		getData();
		//给对应的input框 绑定bootstrap-datetime 样式
		var beginDate  = $("#beginDate").val();
		$("#beginDate").datetimepicker({
			//设置日期格式
			format: 'YYYY-MM-DD HH:mm:ss',
			//设置为中文 默认是英文
	        locale: moment.locale('zh-CN'),
	        maxDate:new Date()
		})
		//给对应的input框 绑定bootstrap-datetime 样式
		$("#endDate").datetimepicker({
			//设置日期格式
			format: 'YYYY-MM-DD HH:mm:ss',
			//设置为中文 默认是英文
	        locale: moment.locale('zh-CN'),
	        minDate:new Date()
		})
		
		//验证表单
	    $('#defaultForm').bootstrapValidator({
	    	//设置文本格式
	        fields: {
	        	productName: {
	        		//验证器
	                validators: {
	                	//非空判断
	                    notEmpty: {
	                    	//不符合规定的提示语句
	                        message: '<font color = "red" size = "2">*商品名不能为空</font>'
	                    },
	                }
	            },
	            price: {
	                validators: {
	                    notEmpty: {
	                        message: '<font color = "red" size = "2">*评分不能为空</font>'
	                    },
	                }
	            }
	        }
	    });
		
		//查询省级下拉框
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
		
		//品牌下拉框查询
		$.ajax({
			url:"<%=request.getContextPath()%>/product/showBrand",
			data:{},
			type:"post",
			dataType:"json",
			success:function(res){
				var str = "<option value = '-1'>===请选择===</option>";
				for (var i = 0; i < res.length; i++) {
					str += "<option value = '" + res[i].id + "'>" + res[i].brandName + "</option>";
				}
				$("#brand").html(str);
			},
			error:function(res){
				alert("请求失败!");
			}
		})
		
	});
	
	//改变市级
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
	
	//改变县级
	function changeCounty(){
		var city = $("#city").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/product/getAllAreaByPid",
			data:{pid:city},
			type:"post",
			dataType:"json",
			success:function(res){
				$("#county").html("");
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
	
	//删除
	function deleteProduct(id){
		
		location.href = "<%=request.getContextPath()%>/product/deleteProduct?id="+id;
		
	}
	
	//回显
	function toUpdateProduct(id){
		
		$.ajax({
			url:"<%=request.getContextPath()%>/product/toUpdateProduct",
			data:{id:id},
			type:"post",
			dataType:"html",
			success:function(res){
				$("#modal-body").html(res);
			},
			error:function(res){
				
			}
			
		})
		
	}
	
	
	
	//分页on条件
	function getData(){
		var cpage = $("#cpage").html();
		var pageSize = $("#pageSize").val();
		var productName = $("#productName").val();
		var beginDate = $("#beginDate").val();
		var endDate = $("#endDate").val();
		var param = {"cpage":cpage,"pageSize":pageSize,"productName":productName,"beginDate":beginDate,"endDate":endDate};
		$.ajax({
			url:"<%=request.getContextPath()%>/product/pagingQueryProduct",
			dataType:"json",
			type:"post",
			data:param,
			success:function(res){
				/* btn-danger 这是警告的按钮 红色的 */
		 		/* btn-primary	原始按钮样式（未被操作） */
		 		/* btn-success	表示成功的动作(绿色的) */
		 		/* btn-info	该样式可用于要弹出信息的按钮(蓝色的) */
		 		/* btn-warning	表示需要谨慎操作的按钮(黄色的) */
		 		/* btn-sm	制作一个小按钮 */
		 		/* btn-lg	制作一个大按钮 */
				var dataList = res.dataList;//查询到的数据集合 和下面对应
				$("#thead").html("");//清空原有的表头不然会重复出现
				//datatable 所需要的数据格式 键值对  这里定义的是列的数据 通过和data里放的数据源对应 可以直接通过属性名取出数据
				var columName  = [
						              {"data":function(data){ 	//这个data就是咱们查到的pageInfo中的数据集合里的对象
						            	  return '<input type="checkbox" value="'+data.id+'" class="box"/>'
						              }},
						              {"data":"productName"},
						              {"data":function(data){//这个data就是咱们查到的pageInfo中的数据集合里的对象
						            	  return '<img height="80px" src="http://127.0.0.1:8080/picture/'+data.mainImgPath+'"/>'
						              }},
						              {"data":"price"},
						              {"data":"brandName"},
						              {"data":"provinceName"},
						              {"data":"address"},
						              {"data":"createDate"},
						              {"data":function(data){ 	//data是你的数据集合   通过你的属性名 可以直接.出来 这个data 只是个名字
						              	return '<button class="btn btn-danger btn-sm" onclick = "deleteProduct('+"'"+data.id+"'"+')"><span class="glyphicon glyphicon-trash" style="color: #ffffff;"></span> '+
											   ' </button><button class="btn btn-info btn-sm" onclick = "toUpdateProduct('+"'"+data.id+"'"+')" data-toggle="modal" data-target="#toUpdate"><span class="glyphicon glyphicon-pencil" style="color: #ffffff;"></span></button>';
				              	 }}];
				/* 定义一个json数组 放表头所需要的数据 给表头的tr赋值   */
				var tabHead  = [{"data":"选择"},{"data":"商品名称"},{"data":"商品图片"},{"data":"商品评分"},{"data":"商品品牌"},{"data":"产地"},{"data":"详细地址"},{"data":"创建时间"},{"data":"操作"}];
				for(var i = 0; i<tabHead.length; i++){
			       	$("#thead").append("<th style='text-align: center;'>"+tabHead[i].data+"</th>");
			    }
				//重新初始化 不然数据不会变
				var table = $('#table').dataTable();//获取table表格的dataTable  table是id
				table.fnClearTable(); //清空一下table
				table.fnDestroy(); //还原初始化了的dataTable
				
				/* 渲染datatables */
				//初始化 渲染表格 附上数据
				$('#table').DataTable({
					language: {
		                zeroRecords: "您搜索的内容不存在",//table tbody内容为空时，tbody的内容。
		                //下面三者构成了总体的左下角的内容。
		                info: "",//左下角的信息显示，大写的词为关键字。
		                infoEmpty: "",//筛选为空时左下角的显示。
		                infoFiltered: ""//筛选之后的左下角筛选提示，
		            },
		            ordering: false,//是否启用排序 
		            searching: false,//关闭搜索 这个搜索只会查找已经存在数据里符合条件的  默认是true
		            paging:false,//关闭自带的分页
		            data: dataList,//查询到的数据集合 和上面对应  这是datatables所需要的数据源 这个数据源必须是数组或者集合
		            columns:columName,//设置列的初始化属性
		            createdRow : function ( row, data, index ) {
		            	$('td', row).css('font-weight',"bold").css("text-align","center");//这是让表中的数据默认居中和加粗  标签选择器
		            },
				} );
				$("#totalPage").html(res.totalPage);//把后台查到的总页数赋值给分页工具
			}
		})
		
		//更改时间格式
		function getMyDate(str){  
			 var oDate = new Date(str),  
			 oYear = oDate.getFullYear(),  
			 oMonth = oDate.getMonth()+1,  
			 oDay = oDate.getDate(),  
			 oHour = oDate.getHours(),  
			 oMin = oDate.getMinutes(),  
			 oSen = oDate.getSeconds(),  
			 oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
			 return oTime;  
	     };  
	     //补0操作  
	     function getzf(num){  
	         if(parseInt(num) < 10){  
	             num = '0'+num;  
	         }  
	         return num;  
	     }  
	}
</script>
<script type="text/javascript">
	var t=null;
	t=setTimeout(time,1000);   //设置定时器，一秒刷新一次
	function time(){
	    clearTimeout(t);  //清楚定时器
	    dt=new Date();
	    var y=dt.getYear()+1900;
	    var m=dt.getMonth()+1;
	    var d=dt.getDate();
	    var weekday=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
	    var day=dt.getDay();
	    var h=dt.getHours();
	    var min=dt.getMinutes();
	    var s=dt.getSeconds();
	    if(h<10){
	        h="0"+h;
	    }
	    if(min<10){
	        min="0"+min;
	    }
	    if(s<10){
	        s="0"+s;
	    }
	    if(document.getElementById("timeShow")){
	    	document.getElementById("timeShow").innerHTML= y + "年" + m + "月" + d + "日" + weekday[day] + "" + h + ":" + min + ":" + s + "";
	    }
	    t = setTimeout(time, 1000);
	}
</script>



</head>
<body background="<%=request.getContextPath()%>/img/3.jpg">
	<!-- 天气 -->
	<!-- 条件查询 -->
	<div><!-- 上 左 右 -->
		<div class="input-group">
	        <span class="input-group-addon">商品名称:</span>
			<input type="text" id="productName" class="form-control" placeholder="请输入商品名称" style="width: 200px"/><br/>
			
			<span class="input-group-addon">开始时间:</span>
			<input type="text" id="beginDate" class="form-control" placeholder="开始时间" style="width: 200px"/><br/>
	    	
	    	<span class="input-group-addon">结束时间:</span>
			<input type="text" id="endDate" class="form-control" placeholder="结束时间" style="width: 200px"/><br/>
		</div>
	</div>
	
	<input type="button" value = "Insert" data-toggle="modal" data-target="#save" style = "width: 100px;margin-top: 15px;">
	<input type="button" value = "Search" onclick="getData()" style = "width: 100px;margin-left: 400px;margin-top: 15px;">
	
	<!-- 新增窗口 -->
    <div id="save" class="modal fade" tabindex="-1">
        <h1 style = "color: white;">Insert Product</h1>
        
        <div class="sub-main-w3" class="form-group">
            <form action="<%=request.getContextPath()%>/product/saveProduct" action = "post" id = "defaultForm">
            	<h2 style = "color: white;">Insert Now</h2>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">ProductName</label>
                    <div class="col-lg-5">
                    	<input type="text" placeholder="Productname" name = "productName"/>
                    </div>
                </div>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">Price</label>
                    <div class="col-lg-5">
                    	<input type="text" placeholder="Price" name = "price">
                    </div>
                </div>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">BrandName</label>
                    <div class="col-lg-5">
                    	<select name = "brandid" id = "brand">
                    	</select>
                    </div>
                </div>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">Area</label>
                    <div class="col-lg-5">
                    	<select id = "province" name = "provinceId" onchange = "changeCity()">
                    		<option>===请选择===</option>
                    	</select>
                    	<select id = "city" name = "cityId" onchange = "changeCounty()">
                    		<option>===请选择===</option>
                    	</select>
                    	<select id = "county" name = "countyId">
                    		<option>===请选择===</option>
                    	</select>
                    </div>
                </div>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">MainImagePath</label>
                    <div class="col-lg-5">
                    	<div class="col-sm-10">
							<input type="file" name="myfile" data-ref="url2"
								class="col-sm-10 myfile" value="" /> <input type="hidden"
								name="url2" value="">
						</div>
                    </div>
                </div>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">Detailed Address</label>
                    <div class="col-lg-5">
						<input type="text" name="address"/>
                    </div>
                </div>
                <input type="submit" value = "Insert In"/>
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <input type="button" data-dismiss="modal" value = "Cancle" >
            </form>
        </div>
    </div>
    
    <!-- 回显窗口 -->
    <div id="toUpdate" class="modal fade" tabindex="-1">
        <div class="col-lg-5" id = "modal-body">
        	
        </div>
    </div>
	
	<!-- table 原始样式 加了这个才能加别的  -->
	<!-- table-bordered 添加边框 也就是我们以前加的border -->
	<!-- table-hover 移上变色 -->
	<!-- table-striped 斑马线条纹 -->
	<!-- table-condensed 让表格更加紧促 -->
	<table id="table" class="table table-striped table-hover">
		<thead>
			<tr class="active" id="thead">
				
			</tr>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
	<div id="pager_tools"></div>
</body>

<script type="text/javascript">
    $(".myfile").fileinput({
        //上传的地址
        uploadUrl:"<%=request.getContextPath()%>/ProductController/uploadFile",
        uploadAsync : true, //默认异步上传
        showUpload : false, //是否显示上传按钮,跟随文本框的那个
        showRemove : false, //显示移除按钮,跟随文本框的那个
        showCaption : true,//是否显示标题,就是那个文本框
        showPreview : true, //是否显示预览,不写默认为true
        dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
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

<!-- 这是dataTable的js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables/datatables.min.js"></script>

<!-- 时间选择器前置脚本 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/moment-with-locales.js"></script>

<!-- 时间选择器核心脚本 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

</html>