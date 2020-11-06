$(document).ready(function(){
	var htmlCode = '<table width = "80%" align="center"' + 
				   		'<tr align = "center">' + 
							'<td>' + 
				   				'<a onclick="goFirst()">首页</a>' + 
							'</td>' + 
							
				   			'<td>' + 
								'<a onclick="goPri()">上一页</a>' + 
				   			'</td>'+ 
				   			
				   			'<td>' + 
				   				'第<span id="cpage">1</span>页&nbsp;共<span id="totalPage">0</span>页' + 
				   			'</td>' + 
				   			
				   			'<td>' + 
				   				'<a onclick="goNext()">下一页</a>' + 
				   			'</td>' + 
				   			
				   			'<td>' + 
				   				'<a onclick="goLast()">尾页</a>' + 
				   			'</td>' + 
				   			
				   			'<td>' + 
				   				'展示<select id="pageSize" onchange="changePageSize()">' + 
				   						'<option value="4">4</option>' + 
				   						'<option value="6">6</option>' + 
				   						'<option value="8">8</option>' + 
				   				  '</select>条' + 
				   			'</td>' + 
				   			
				   			'<td align = "left">' + 
				   				'<input type="text" id="targetPage" style="width: 50px">'+ 
				   				'<input type="button" value="Go" onclick="goToPage()">' + 
				   			'</td>'+ 
				   		'</tr>' + 
				   	'</table>' + 
				   	
				   	'<center>' + 
				   		'<span id="pager_tips" style="color:red;"></span>' + 
				   	'</center>';
	$("#pager_tools").html(htmlCode);
});


function goNext(){
	var cpage = Number($("#cpage").html());
	var totalPage = Number($("#totalPage").html());
	if(cpage + 1 > totalPage){
		$("#pager_tips").html("已经是最后一页");
	}else{
		$("#pager_tips").html("");
		$("#cpage").html(cpage+1);
		ajaxQuery();
	}
}

function goPri(){
	var cpage = Number($("#cpage").html());
	if(cpage - 1 < 1){
		$("#pager_tips").html("已经是第一页");
	}else{
		$("#pager_tips").html("");
		$("#cpage").html(cpage-1);
		ajaxQuery();
	}
}

function goFirst(){
	$("#pager_tips").html("");
	$("#cpage").html(1);
	ajaxQuery();
}

function goLast(){
	$("#pager_tips").html("");
	var totalPage = Number($("#totalPage").html());
	$("#cpage").html(totalPage);
	ajaxQuery();
}

function changePageSize(){
	$("#pager_tips").html("");
	$("#cpage").html(1);
	ajaxQuery();
}

function goToPage(){
	var targetPage = Number($("#targetPage").val());
	var totalPage = Number($("#totalPage").html());
	if( targetPage > totalPage){
		targetPage = totalPage;
	}
	$("#pager_tips").html("");
	$("#cpage").html(targetPage);
	$("#targetPage").val(targetPage);
	ajaxQuery();
}
