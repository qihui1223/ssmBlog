<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>搜索</title>
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
	            	<c:choose>
	            	   <c:when test="${blog.size() > 0}">
				       		<div class="all-page-title">目前共计${blog.size()}篇日志</div>
			                <div class="archive-title">
			                    <span class="circle"></span>
			                    <h2 class="archive-year">2017</h2>
			                </div>
			                <c:forEach items="${blog}" var="item" varStatus="status">
			                <header class="post-header">
			                    <span class="circle"></span>
			                    <h3 class="post-title">
			                        <a href='detail.do?id="item.id"'>${item.title}</a>
			                    </h3>
			                    <div class="post-time">
			                    	<fmt:formatDate value='${item.updatetime}' pattern='MM-dd' />
			                    </div>
			                </header>
			                </c:forEach>
				       </c:when>
				       <c:otherwise>
				       		<div class="all-page-title" style="font-size:16px;text-align:center">
				       			没有此信息,请换个关键字搜索
				       		</div>
				       </c:otherwise>
	            	</c:choose>
	            </div>
	        </div>
        </div>
        
        <div class="col-md-4 right-content">
            <jsp:include page = "link.jsp"/>
        </div>
    </div>  

    <!--record start-->
    <jsp:include page = "foot.jsp"/>
    <!--record end-->
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
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
