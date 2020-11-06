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
<!-- 这是字体图片所需要的css -->
<%-- <link href="${pageContext.request.contextPath}/js/bootstrap3/fonts/glyphicons-halflings-regular.svg" rel="stylesheet"> --%>

<!-- 这是dataTable的css -->
<link href="<%=request.getContextPath()%>/js/DataTables/datatables.min.css" rel="stylesheet">
<!-- 表单验证的插件 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/css/bootstrapValidator.css"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>

<!-- 这是dataTable的js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/DataTables/datatables.min.js"></script>

<!-- 这是基于bootstrap的js分页工具 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrapByPage.js"></script>

<!-- 时间选择器样式表 -->
<link href="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">

<!-- 时间选择器前置脚本 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/moment-with-locales.js"></script>

<!-- 时间选择器核心脚本 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/moban3007/css/style.css" type="text/css" media="all"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/moban3007/css/fontawesome-all.css">

<script type="text/javascript">
	$(document).ready(function(){
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
	});
	

	//删除
	function deleteLogin(id){
		
		location.href = "<%=request.getContextPath()%>/login/deleteLogin?id="+id;
		
	}
	
	//回显
	function toUpdateLogin(id){
		$.ajax({
			url:"<%=request.getContextPath()%>/login/toUpdateLogin",
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
		var userName = $("#userName").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var param = {"cpage":cpage,"pageSize":pageSize,"userName":userName,"startDate":startDate,"endDate":endDate};
		$.ajax({
			url:"<%=request.getContextPath()%>/login/pagingQueryLogin",
			data:param,
			type:"post",
			dataType:"json",
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
				var columName = [
					              {"data":function(data){ 	//这个data就是咱们查到的pageInfo中的数据集合里的对象
					               return '<input type="checkbox" name = "check" value="'+data.id+'" class="box"/>'
					              }},
					              {"data":"userName"},
					              {"data":"realName"},
					              {"data":"loginTime"},
					              {"data":function(data){ 	//data是你的数据集合   通过你的属性名 可以直接.出来 这个data 只是个名字
					               return '<button class="btn btn-danger btn-sm" onclick = "deleteLogin('+"'"+data.id+"'"+')"><span class="glyphicon glyphicon-trash" style="color: #ffffff;"></span>'+
										  '</button><button class="btn btn-info btn-sm" onclick = "toUpdateLogin('+"'"+data.id+"'"+')" data-toggle="modal" data-target="#toUpdate"><span class="glyphicon glyphicon-pencil" style="color: #ffffff;"></span></button>';
				              	}}];
				/* 定义一个json数组 放表头所需要的数据 给表头的tr赋值   */
				var tabHead = [{"data":"选择"},{"data":"用户名"},{"data":"真实姓名"},{"data":"登录时间"},{"data":"操作"}];
				for(var i = 0; i < tabHead.length; i++){
			       	$("#thead").append("<th style='text-align: center;'>"+tabHead[i].data+"</th>");
			    }
				//重新初始化 不然数据不会变
				var table = $('#table').dataTable();//获取table表格的dataTable table是id
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
		                infoFiltered: ""//筛选之后的左下角筛选提示,
		            },
		            ordering: false,//是否启用排序
		            searching: false,//关闭搜索 这个搜索只会查找已经存在数据里符合条件的  默认是true
		            paging:false,//关闭自带的分页
		            data: dataList,//查询到的数据集合 和上面对应这是datatables所需要的数据源 这个数据源必须是数组或者集合
		            columns:columName,//设置列的初始化属性
		            createdRow : function ( row, data, index ) {
		            	$('td', row).css('font-weight',"bold").css("text-align","center");//这是让表中的数据默认居中和加粗  标签选择器
		            },
				});
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
			 oTime = oYear + '-' + getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
			 return oTime;  
	     };  
	     //补0操作  
	     function getzf(num){  
	         if(parseInt(num) < 10){  
	             num = '0' + num;  
	         }  
	         return num;  
	     }  
	}
	
	var ids = ",";
	//判断是否存在 存在就加选中
	function ifExist(){
		$("input[name = 'check']").each(function() {
			//在ids中的给checked
			if (ids.indexOf("," + this.value + ",") != -1) {
				$(this).attr("checked", true);
			}
		})
	}
	//如果被选中 就加进去
	function ifCheck(){
		$("input[name = 'check']").each(function(){
	
		//判断当前页选中的复选框  如果没有在ids中  就加进去
         	if (this.checked == true){
				if (ids.indexOf("," + this.value + ",") == -1) {
					ids += this.value + ",";
				}
			}else{
			
			//判断当前页没有被选中的复选框 在ids是否存在 存在就替换
				if (ids.indexOf("," + this.value + ",") != -1) {
					ids = ids.replace(this.value + ",", "");
				}
			}		
 		});
	}
	
	//导出Excel
	function importExcel(){
		ifCheck();
		if(ids.length > 1){
			if(confirm("确定导出该数据?")){
				location.href = "<%=request.getContextPath()%>/login/importExcel?ids="+ids;
			}
		}else{
			alert("请至少选择一项!");
		}
		
	}
	
	//导出Xml
	function importXml(){
		ifCheck();
		if(ids.length > 1){
			if(confirm("确定导出该数据?")){
				location.href = "<%=request.getContextPath()%>/login/importXml?ids="+ids;
			}
		}else{
			alert("请至少选择一项!");
		}
		
	}
	
	//导出Pdf
	function importPdf(){
		ifCheck();
		if(ids.length > 1){
			if(confirm("确定导出该数据?")){
				location.href = "<%=request.getContextPath()%>/login/importPdf?ids="+ids;
			}
		}else{
			alert("请至少选择一项!");
		}
		
	}
	
</script>

</head>
<body background="<%=request.getContextPath()%>/img/3.jpg">
	<!-- 天气 -->
	<!-- 条件查询 -->
	<div><!-- 上 左 右 -->
		<div class="input-group">
	        <span class="input-group-addon">用户名:</span>
			<input type="text" id="userName" class="form-control" placeholder="请输入用户名" style="width: 200px"/><br/>
			
			<span class="input-group-addon">开始时间:</span>
			<input type="text" id="startDate" class="form-control" placeholder="开始时间" style="width: 200px"/><br/>
	    	
	    	<span class="input-group-addon">结束时间:</span>
			<input type="text" id="endDate" class="form-control" placeholder="结束时间" style="width: 200px"/><br/>
		</div>
	</div>
	
	<input type="button" value = "Insert" data-toggle="modal" data-target="#save" style = "width: 100px;">
	<input type="button" value = "Search" onclick="getData()" style = "width: 100px;margin-left: 90px;">
	<input type="button" value = "Excel" onclick="importExcel()" style = "width: 100px;margin-left: 90px;">
	<input type="button" value = "Xml" onclick="importXml()" style = "width: 100px;margin-left: 90px;">
	<input type="button" value = "Pdf" onclick="importPdf()" style = "width: 100px;margin-left: 90px;">
	<input type="button" value = "Word" onclick="importWord()" style = "width: 100px;margin-left: 90px;">
	
	<!-- 新增窗口 -->
    <div id="save" class="modal fade" tabindex="-1">
        <h1 style = "color: white;">Insert User</h1>
        
        <div class="sub-main-w3" class="form-group">
            <form action="<%=request.getContextPath()%>/login/saveLogin" method = "post" id = "defaultForm">
            	<h2 style = "color: white;">Insert Now</h2>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">UserName</label>
                    <div class="col-lg-5">
                    	<input type="text" placeholder="Username" name = "userName" style = "width: 350px;"/>
                    </div>
                </div>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">Password</label>
                    <div class="col-lg-5">
                    	<input type="password" placeholder="Password" name = "userPwd" style = "width: 350px;">
                    </div>
                </div>
                <div class="form-style-agile">
                    <label class="col-lg-3 control-label">RealName</label>
                    <div class="col-lg-5">
                    	<input type="text" placeholder="Realname" name = "realName" style = "width: 350px;">
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
</html>