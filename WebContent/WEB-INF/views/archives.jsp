<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>归档</title>
<meta name="description" content="">
<meta name="keywords" content="">
	<!--import style -->
	<link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/reset.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/archives.css">
</head>
<body>
	<!--header start-->
    <jsp:include page = "head.jsp"/>
    <!--header end-->

    <div class="container">
		<div class="bread">
			<div class="bread-crumb">
				<span class="fl">当前位置: &nbsp; &nbsp;</span>
				<div class="breadTitle ant-breadcrumb">
					<span>
						<span class="ant-breadcrumb-link">归档</span>
						<span class="ant-breadcrumb-separator"></span>
					</span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
        <!--archive start-->
        <div class="col-md-8">
        	<div class="archives">
	            <div class="border-right"> 
	                <!-- <div class="all-page-title">目前共计19篇日志</div>
	                <div class="archive-title">
	                    <span class="circle"></span>
	                    <h2 class="archive-year">2017</h2>
	                </div>
	                <header class="post-header">
	                    <span class="circle"></span>
	                    <h3 class="post-title">
	                        <a href="detail.html">web前端基础</a>
	                    </h3>
	                    <div class="post-time">8-23</div>
	                </header> -->
	            </div>
	            <!--paging start-->
			    <!-- 分页信息 -->
				<div class="page">
					<!--分页条信息  -->
					<div id="pageInfoNav"></div>
				</div>	
			    <!--paging end-->
	        </div>
        </div>
        
        <div class="col-md-4 right-content">
            <jsp:include page = "link.jsp"/>
        </div>
    </div>  

    <!--record start-->
    <<jsp:include page = "foot.jsp"/>
    <!--record end-->
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	toPage(1);
})

function toPage(num){
	$.ajax({
		url: "${APP_PATH}/main.do",
		data:{
			num:num,
			size:5
		},
        type:"GET",
		success: function(result){
			if(result.code == 0){
				//文章列表
				articleLi(result);
				//分页信息条
				showPageNav(result);
			}else{
				alert(result.msg);
			}
		}
	})
}

function articleLi(result){
	/**
		<div class="border-right"> 
            <div class="all-page-title">目前共计19篇日志</div>
            <div class="archive-title">
                <span class="circle"></span>
                <h2 class="archive-year">2017</h2>
            </div>
            <header class="post-header">
                <span class="circle"></span>
                <h3 class="post-title">
                    <a href="detail.html">web前端基础</a>
                </h3>
                <div class="post-time">8-23</div>
            </header>
        </div>
	**/
	var data = result.data.pageInfo.list;
	$(".border-right").empty();
	var total = $("<div></div>").addClass("all-page-title").append("OK! 目前共计"+result.data.pageInfo.total+"篇日志。 继续努力。");
	var title = $("<div></div>").addClass("archive-title");
	var tSpan = $("<span></span>").addClass("circle");
	var tYear = $("<h2></h2>").addClass("archive-year").append("2019");
	title.append(tSpan).append(tYear);
	$(".border-right").append(total)
		.append(title);
		
	$.each(data,function(index,item){
		var head = $("<header></header>").addClass("post-header");
		var circle = $("<span></span>").addClass("circle");
		var h3 = $("<h3></h3>").addClass("post-title");
		var link = $("<a href='detail.do?id="+item.id+"'></a>").append(item.title);
		h3.append(link);
		var time = $("<div></div>").addClass("post-time").append(formatMonth(item.updatetime));
		
		head.append(circle)
			.append(h3)
			.append(time);
		
		$(".border-right").append(head);
	})
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
	//var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
	if(pageNav.hasPreviousPage == false){
		prePageLi.addClass("disabled");
	}else{
		//为元素添加点击事件
		prePageLi.click(function(){
			toPage(pageNav.pageNum-1);
		})
	}
	
	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	//var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	if(pageNav.hasNextPage == false){
		nextPageLi.addClass("disabled");
	}else{
		nextPageLi.click(function(){
			toPage(pageNav.pageNum+1);
		})
	}
	
	//添加首页和上一页的提示
	ul.append(prePageLi);
	
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
	ul.append(nextPageLi);
	
	//把ul加入到nav
    var navEle = $("<nav></nav>").addClass("navPage").append(ul);
    navEle.appendTo("#pageInfoNav");
}

function formatMonth(dateStr){
	// 显示年份
	// 比如需要这样的格式 MM-dd hh:mm:ss
	var date = new Date(dateStr);
	//格式化日，如果小于9，前面补0
	var day = ("0" + date.getDate()).slice(-2);
	//格式化月，如果小于9，前面补0
	var month = ("0" + (date.getMonth() + 1)).slice(-2);
	//拼装完整日期格式
	var show = (month)+"-"+(day) ;
	return show;
}
</script>
</html>