<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>index</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="stylesheet" href="${APP_PATH}/static/common/css/reset.css">
<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/articleContent.css" type="text/css" /> 
<link rel="stylesheet" href="${APP_PATH}/static/admin/editormd/css/editormd.min.css" type="text/css" />
<link rel="stylesheet" href="${APP_PATH}/static/common/css/layer.css" type="text/css" />
</head>
<body>
<div style="padding: 20px">
	<div class="col-md-12" style="padding: 0">
		<ol class="breadcrumb">
	        <li><a href="profile.do">首页</a></li>
	        <li class="active">文章列表</li>
	    </ol>
	</div>
	<div class="search_wrap">
        <form action="" method="post">
            <table class="search_tab">
                <tbody>
	                <tr>
	                    <th width="120">选择分类:</th>
	                    <td>
	                        <select id="selectContent">
	                            <!--  -->
	                        </select>
	                    </td>
	                    <th width="70">关键字:</th>
	                    <td><input type="text" id="keywords" name="keywords" placeholder="关键字"></td>
	                    <td>
	                    	<input type="button" name="sub" onclick="seach()" value="查询">
	                    	<span class="help-block contentMsg help-message"></span>
	                    </td>
	                </tr>
	            </tbody>
            </table>
        </form>
    </div>
	<div class="container main">
		<div class="result_wrap">
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <a href="toCkArticle.do"><i class="fa fa-plus"></i>新增文章</a>
                    <a href="#"><i class="fa fa-recycle"></i>批量删除</a>
                    <a href="#"><i class="fa fa-refresh"></i>更新排序</a>
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>
		<div style="margin-top: 10px"></div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-bordered text-center" id="article_table">
					<thead>
						<tr>
							<th class="text-center"><input type="checkbox" id="check_all"/></th>
	                    	<th class="text-center">序号</th>
		                    <th class="text-center">分类</th>
		                    <th class="text-center">标题</th>
		                    <th class="text-center">时间</th>
		                    <th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>	
						
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="pageInfo"></div>
			<!--分页条信息  -->
			<div class="col-md-6 text-right" id="pageInfoNav"></div>
		</div>	
	</div>

</div>
<!-- 删除员工 -->
<div id="layerout">
   <p id="del-val"></p>
</diV>
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/js/time.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/layer/layer.js"></script>
<script type="text/javascript">
	var totalRecord,currentPage;
	
	//页面加载实现ajax
	$(function(){
		toPage(1);
		//获取分类信息
		getTags("#selectContent");
	});
	
	function toPage(num){
		//清除全选
		$("#check_all").prop("checked","");
		$.ajax({
			url: "${APP_PATH}/admin/getAticles.do",
			data:"num="+num,
            type:"GET",
			success: function(result){
				if(result.code == 0){
					//table表格
					articleTable(result);
					//分页信息
					showPageInfo(result);
					//分页信息条
					showPageNav(result);
				}else{
					alert(result.msg);
				}
			}
		})
	}
	
	function getTags(el){
		//清空之前下拉列表的值
	    $(el).empty();
		
	    var optionEle;
	  	//<option value="">==请选择==</option>
		optionEle = $("<option></option>").append("==请选择==").attr("value","");
		optionEle.appendTo(el)
		
		$.ajax({
			url: "${APP_PATH}/admin/getCategory.do",
			type: "GET",
			success: function(result){
				if(result.code == 0){
					$.each(result.data.tags,function(index,item){
						optionEle = $("<option></option>").append(item.typeName).attr("value",item.id);
						optionEle.appendTo(el)
					})
				}		
			}
		})
	}

	
	function articleTable(result){
		//清空table表格
		$("#article_table tbody").empty();
		var article = result.data.pageInfo.list;
		var pageNum = result.data.pageInfo.pageNum;
		var pageSize = result.data.pageInfo.pageSize;

		$.each(article,function(index,item){
			var checkBox = $("<input type='checkbox' class='check_item'/>");
			//为删除按钮添加一个自定义的属性，来表示当前员工id
			checkBox.attr("check-id",item.id);
			//添加自定义属性,表示当前员工名字
			checkBox.attr("check-name",item.title);
			var checkBoxTd = $("<td></td>").append(checkBox);
			var page = $("<td></td>").append(pageSize * (pageNum - 1) + index + 1);
			//return pageSize * (pageNumber - 1) + index + 1;    //返回每条的序号： 每页条数 * （当前页 - 1 ）+ 序号
			var articleCategory = $("<td></td>").append(item.category.typeName);
			var articleTitle = $("<td></td>").append(item.title);
			var articleTime = $("<td></td>").append(format(item.updatetime));
			
			/*
				<button class="btn btn-primary btn-sm">
	           		<span class="glyphicon glyphicon-edit"aria-hidden="true"></span> 
	           		编辑
                </button>
			*/
			var editBtn = $("<a></a>").addClass("editBtn")
							.append("<span></span>").append("编辑");
			//为编辑按钮添加一个自定义的属性，来表示当前文章id
			editBtn.attr("edit-id",item.id);
			var delBtn = $("<a></a>").addClass("delBtn")
							.append("<span></span>").append("删除");
			//为删除按钮添加一个自定义的属性，来表示当前文章id
			delBtn.attr("del-id",item.id);
			//添加自定义属性,表示当前文章标题
			delBtn.attr("del-name",item.title);
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
			
			//append方法执行完成以后还是返回原来的元素
			//拼接dom
			$("<tr></tr>").append(checkBoxTd)
				.append(page)
				.append(articleCategory)
				.append(articleTitle)
				.append(articleTime)
				.append(btnTd)
				.appendTo("#article_table tbody")
		})
	}
	
	//分页信息
	function showPageInfo(result){
		$("#pageInfo").empty();
		var pageInfo = result.data.pageInfo;
		/* <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
		页,总 ${pageInfo.total } 条记录</div> */
		$("#pageInfo").append("当前第 "+"<b>"+pageInfo.pageNum+"</b>"+" 页,总 "+"<b>"+pageInfo.total
				+"</b>"+" 条记录")
		
		//总记录数
		totalRecord = pageInfo.total;
		//当前页数
        currentPage = pageInfo.pageNum;
	}
	
	//显示分页条信息
	function showPageNav(result){
		$("#pageInfoNav").empty();
		var pageNav = result.data.pageInfo;
		/**
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		**/
		var ul = $("<ul></ul>").addClass("pagination");
		//构建元素
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(pageNav.hasPreviousPage == false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			//为元素添加点击事件
			firstPageLi.click(function(){
				toPage(1);
			})
			prePageLi.click(function(){
				toPage(pageNav.pageNum-1);
			})
		}
		
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		if(pageNav.hasNextPage == false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			nextPageLi.click(function(){
				toPage(pageNav.pageNum+1);
			})
			lastPageLi.click(function(){
				toPage(pageNav.pages);
			})
		}
		
		//添加首页和上一页的提示
		ul.append(firstPageLi).append(prePageLi);
		
		//遍历页码
		$.each(pageNav.navigatepageNums,function(index,item){
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			
			//显示高亮
			if(pageNav.pageNum == item){
				numLi.addClass("active");
			}
			
			numLi.click(function(){
				toPage(item);
			})
			
			ul.append(numLi);
			
		});
		
		//添加下一页和末页提示
		ul.append(nextPageLi).append(lastPageLi);
		
		//把ul加入到nav
        var navEle = $("<nav></nav>").addClass("navPage").append(ul);
        navEle.appendTo("#pageInfoNav");
	}
	
	//在修改按钮上添加点击事件
	$(document).on("click",".editBtn",function(){
		//查询文章信息
		getArticle($(this).attr("edit-id"));
	})
	
	function getArticle(id){
		location.href = "${APP_PATH}/admin/article.do?id="+id;
	}
	
	$(document).on("click",".delBtn",function(){
		var delId = $(this).attr("del-id");
		var articleTitle = $(this).attr("del-name");
		
		//清除内容
		$("#del-val").empty();
		$("#del-val").append("确认删除【"+articleTitle+"】吗？");
		
		
		layer.open({
		    type:1,//弹出1个页面层
		    title:'<span style="color: #339ef7;font-size: 17px;">确认删除</span>',
		    shadeClose: true, //点击遮罩关闭
		    area:["350px","150px"],
		    shadeClose:true,
		    skin: 'layer-ext-moon',
		    content:$("#layerout"),
		    btn: ['确定','取消'],
		    yes : function(index) {  
		    	$.ajax({
					url: "${APP_PATH}/admin/deleteArticle.do",
					type: "GET",
					data: "id="+delId,
					success: function(result){
						if(result.code == 0){
							//关闭弹出层
							layer.close(index); 
							//回到当前页面
							toPage(currentPage);
						}else{
							alert(result.msg)
						}
					}
		    	})  
		    }
		})
	})
	
	function seach(){
		var article = $("#keywords").val();
		if(checkWords("#keywords")){
			$.ajax({
				url: "${APP_PATH}/admin/seachArticle.do",
	            type:"POST",
	            data: {
	            	article: article,
	            },
				success: function(result){
					if(result.code == 0){
						console.log(result);
					}else{
						alert(result.msg);
					}
				}
			})
		}
	}
	
	function checkWords(el){
		var content = $(el).val();
		$(".contentMsg").removeClass("help-message");
		$(".contentMsg").text("");
		if(content.length == 0){
			$(".contentMsg").addClass("help-message");
			$(".contentMsg").text("查询内容不能为空");
			return false;
		}
		$(".contentMsg").addClass("has-success");
	    return true;
	}
	
</script>
</html>
    