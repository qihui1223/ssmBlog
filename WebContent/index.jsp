<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>齐辉的博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--import style -->
    <link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/reset.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/main.css">
</head>

<body>
    <!--header start-->
    <jsp:include page = "/WEB-INF/views/head.jsp"/>
    <!--header end-->

    <div class="container">
		<div class="bread">
			<div class="bread-crumb">
				<span class="fl">当前位置: &nbsp; &nbsp;</span>
				<div class="breadTitle ant-breadcrumb">
					<span>
						<span class="ant-breadcrumb-link">首页</span>
						<span class="ant-breadcrumb-separator"></span>
					</span>
				</div>
			</div>
		</div>
	</div>

    <div class="container">
        <!--list start-->
        <div class="col-md-8">
        	<div class="list-box">
        		<ul id="articleDetailt">
	                <!-- <li class="list-items">
	                    <div class="list-items-inner">
	                        <div class="article">
	                            <a href="detail.do">WEB前端基础</a>
	                        </div>
	                        <div class="tag-group">
	                            <span>发表于：2018-08-23</span>
	                            <span>分类于：前端</span>
	                            <span>阅读数：50</span>
	                        </div>
	                        <div class="article-desc">
				                                前端对于网站来说，通常是指，网站的前台部分包括网站的表现层和结构层。
				                                因此前端技术一般分为前端设计和前端开发，前端设计一般可以理解为网站的视觉设计，
				                                前端开发则是网站的前台代码实现，包括基本的HTML和CSS以及JavaScript/ajax，
				                                现在最新的高级版本HTML5、CSS3，以及SVG等。
	                        </div>
	                        <div class="articleLink">
	                            <a href="detail.do">阅读详情 &gt;&gt;</a>
	                        </div>
	                        <div class="article-footer">
	                            <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;2017-09-08</span>
	                            <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;Administrator</span>
	                            <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#">编程语言</a></span>
	                            <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;334</span>
	                            <span class="article-viewinfo"><i class="fa fa-commenting"></i>&nbsp;4</span>
	                        </div>
	                    </div>
	                </li>   -->
	            </ul>
        	</div>
            <!--paging start-->
		    <!-- 分页信息 -->
			<div class="page">
				<!--分页条信息  -->
				<div id="pageInfoNav"></div>
			</div>	
		    <!--paging end-->
        </div>
        <!--list end-->
        <div class="col-md-4 right-content">
        	<div class="col">
                <div class="right-title">
                    <img alt="345708673" class="img-circle img-avatar" src="${APP_PATH}/static/web/img/avatar.jpg">
                    <p class="title1">齐辉</p>
                    <p class="describe">
                    	书读的少,而想的太多......
                    </p>
                    <hr>
                    <div class="title-icon">
                        <a target="_blank" title="GitHub" href="#"><i class="fa fa-git fa-2x"></i></a>
                        <a target="_blank" title="给我写信" href="#"><i class="fa fa-envelope fa-2x"></i></a>
                        <a target="_blank" title="QQ交流" href="#"><i class="fa fa-qq fa-2x"></i></a>
                    </div>
                </div>
            </div>
            <jsp:include page = "/WEB-INF/views/link.jsp"/>
        </div>
    </div>
    
    <!--record start-->
    <jsp:include page = "/WEB-INF/views/foot.jsp"/>
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
		data:"num="+num,
        type:"GET",
		success: function(result){
			if(result.code == 0){
				//文章详情
				articleDetail(result);
				//分页信息条
				showPageNav(result);
			}else{
				alert(result.msg);
			}
		}
	})
}

function articleDetail(result){
	/* <li class="list-items">
		    <div class="list-items-inner">
		        <div class="article">
		            <a href="detail.do">WEB前端基础</a>
		        </div>
		        <div class="tag-group">
		            <span>发表于：2018-08-23</span>
		            <span>分类于：前端</span>
		            <span>阅读数：50</span>
		        </div>
		        <div class="article-desc">
		                            前端对于网站来说，通常是指，网站的前台部分包括网站的表现层和结构层。
		                            因此前端技术一般分为前端设计和前端开发，前端设计一般可以理解为网站的视觉设计，
		                            前端开发则是网站的前台代码实现，包括基本的HTML和CSS以及JavaScript/ajax，
		                            现在最新的高级版本HTML5、CSS3，以及SVG等。
		        </div>
		        <div class="articleLink">
		            <a href="detail.do">阅读详情 &gt;&gt;</a>
		        </div>
		        <div class="article-footer">
		            <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;2017-09-08</span>
		            <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;Administrator</span>
		            <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#">编程语言</a></span>
		            <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;334</span>
		            <span class="article-viewinfo"><i class="fa fa-commenting"></i>&nbsp;4</span>
		        </div>
		    </div>
		</li> */
	//清空文章
	$("#articleDetailt").empty();
	var article = result.data.pageInfo.list;

	$.each(article,function(index,item){
		var li = $("<li></li>").addClass("list-items");
		var div = $("<div></div>").addClass("list-items-inner");
		
		var divArticle = $("<div></div>").addClass("article");
		//"<a href='${BASE}/psbc/monitor.do?method=selectHis&&APPLICATION_ID="+id+"' >"
		var title = $("<a href='detail.do?id="+item.id+"'></a>").append(item.title);
		divArticle.append(title);
		
		
		var tagGroup = $("<div></div>").addClass("tag-group");
		var tSpan1 = $("<span></span>").append("发表于 : "+format(item.createdtime));
		var tSpan2 = $("<span></span>").append("分类于: "+item.category.typeName);
		var tSpan3 = $("<span></span>").append("阅读数: 50");
		tagGroup.append(tSpan1)
			.append(tSpan2)
			.append(tSpan3);

		var article = item.content.substring(0, 300);
		
		
		var articleDesc = $("<div></div>").addClass("article-desc").append(article);
		
		var articleLink = $("<div></div>").addClass("articleLink");
		var link = $("<a href='detail.do?id="+item.id+"'></a>").append("阅读详情 &gt;&gt;");
		articleLink.append(link);
		
		var foot = $("<div></div>").addClass("article-footer");
		var icon1 = $("<i></i>").addClass("fa fa-clock-o");
		var span1 = $("<span></span>").append(icon1).append("&nbsp;&nbsp;"+format(item.updatetime));
		
		var icon2 = $("<i></i>").addClass("fa fa-user");
		var span2 = $("<span></span>").addClass("article-author").append(icon2).append("&nbsp;&nbsp;Administrator");
		
		var icon3 = $("<i></i>").addClass("fa fa-tag");
		var span3A = $("<a></a>").append("编程语言");
		var span3 = $("<span></span>").append(icon3).append(span3A);
		
		var icon4 = $("<i></i>").addClass("fa fa-eye");
		var span4 = $("<span></span>").addClass("article-viewinfo").append(icon2).append("&nbsp;334");
		
		var icon5 = $("<i></i>").addClass("fa fa-commenting");
		var span5 = $("<span></span>").addClass("article-viewinfo").append(icon2).append("&nbsp;4");
		foot.append(span1)
			.append(span2)
			.append(span3)
			.append(span4)
			.append(span5);
		
		//拼接字符串
		div.append(divArticle)
			.append(divArticle)
			.append(tagGroup)
			.append(articleDesc)
			.append(articleLink)
			.append(foot);
		$("#articleDetailt").append(li.append(div))
			
		 
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
//显示时间
function add0(m){return m<10?'0'+m:m }
function format(shijianchuo){
	//shijianchuo是整数，否则要parseInt转换
	var time = new Date(shijianchuo);
	var y = time.getFullYear();
	var m = time.getMonth()+1;
	var d = time.getDate();
	return y+'-'+add0(m)+'-'+add0(d);
}
</script>
</html>