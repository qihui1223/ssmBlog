<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${APP_PATH}/static/web/css/reset.css">
<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/common/font-awesome/css/font-awesome.min.css"/>
<link rel="stylesheet" href="${APP_PATH}/static/web/css/common.css">
</head>
<body>
<div class="col">
	<form class="search" action="search.do" method="post">
        <input type="text" name="title" placeholder="请输入搜索内容"> 
        <button class="btn btn-primary">搜索</button>
        <div class="clear"></div>
    </form>
</div>
<div class="col">
	<div class="tag">
		<h3>热门标签</h3>
		<hr/>
		<div class="tag-content">
            <a class="btn-success">php</a>

            <a class="btn-info">mysql</a>
         
            <a class="btn-warning">Golang</a>
         
            <a class="btn-danger">Go</a>
         
            <a class="btn-success">图片处理</a>
         
            <a class="btn-info">图片截取</a>
         
            <a class="btn-warning">python</a>
        </div>
	</div>
</div>
<div class="col">
	<div class="link">
        <p>友情链接</p>
        <hr/>                    
        <ul>
            <li><a title="" href="http://www.haodaquan.com/82"></a><a href="">百度</a></li>
            <li><a href="">搜狐</a></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>