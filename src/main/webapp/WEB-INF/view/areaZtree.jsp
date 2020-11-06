<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ztree/js/jquery.ztree.all.js"></script>
<link href="${pageContext.request.contextPath}/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" >
	 $(document).ready(function(){
		 findCityZtree();
	 });
	 
	 //页面加载查询
	 function findCityZtree(){
		 $.post({
			url:"<%=request.getContextPath()%>/login/queryArea",
			data:"",
			dataType:"json",
			success:function(res){
				var setting = {
						
						callback: {
							//用于捕获节点被点击的事件回调函数
							onClick: zTreeOnClick,
							//编辑名称完毕（Input 失去焦点 或 按下 Enter 键），会触发 setting.callback.beforeRename 
						},
						//使用简单 Array 格式的数据
						data: {
							simpleData: {
								enable: true
							}
						},
						//需要显示 checkbox
						check: {
							enable: true,
							//checkbox 勾选操作，只影响父级节点；取消勾选操作，只影响子级节点
							//chkStyle: "checkbox",
							//chkboxType: { "Y": "p", "N": "s" }
							chkboxType: { "Y": "s", "N": "s" } 
						},
						edit:{
				    		enable:true,//设置树为编辑模式 
				    		showRemoveBtn: false,//设置是否显示删除按钮
				    		showRenameBtn: true//设置是否显示编辑名称按钮
				    	}, 
					}; 
					
					var nodes = res;
				
					var zTreeObj = $.fn.zTree.init($("#tree"), setting, nodes);
					
					//展开全部节点
					//var treeObj = $.fn.zTree.getZTreeObj("tree");
					//zTreeObj.expandAll(true);
				
				
			},
			error:function(res){
				alert("请求失败");
			}
		 })
	 };
	 
	 //点击事件
	 function zTreeOnClick(event, treeId, treeNode) {
		    //alert(treeNode.id + ", " + treeNode.name);
		    $("#pId").val(treeNode.id);
		    
		     if (treeNode.url.length > 0) {
		    	//跳转页面
		    	window.parent.rightFrame.location=treeNode.url;
			} 
		};
	
  </script>
</head>
<body>	
		<!-- zTree 是一个依靠 jQuery 实现的多功能 “树插件”。优异的性能、灵活的配置、多种功能的组合是 zTree 最大优点。
   	    zTree 是开源免费的软件（MIT 许可证） -->
   	    <ul id="tree" class="ztree" style="width:230px; overflow:auto;"></ul>
			
</body>
</html>
