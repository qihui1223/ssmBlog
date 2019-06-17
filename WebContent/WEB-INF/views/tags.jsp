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
<title>标签</title>
<meta name="description" content="">
<meta name="keywords" content="">
	<!--import style -->
	<link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/reset.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/tags.css">
</head>
<body>
	<!--header start-->
    <jsp:include page = "head.jsp"/>
    </header>
    <!--header end-->

    <div class="container">
		<div class="bread">
			<div class="bread-crumb">
				<span class="fl">当前位置: &nbsp; &nbsp;</span>
				<div class="breadTitle ant-breadcrumb">
					<span>
						<span class="ant-breadcrumb-link">标签</span>
						<span class="ant-breadcrumb-separator"></span>
					</span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
        <!--archive start-->
        <div class="col-md-8">
        	<div class="tags">
	            <div class="all-page-title">目前共计13个标签</div>
                <div class="tags-content">
                        <a href="index.html" style="font-size: 12px; color: #ccc">Blob</a>
                        <a href="detail.html" style="font-size: 22.8px; color: #5c5c5c">HTML5</a>
                        <a href="" style="font-size: 30px; color: #111">JavaScript</a>
                        <a href="" style="font-size: 12px; color: #ccc">canvas</a>
                        <a href="" style="font-size: 12px; color: #ccc">element</a>
                        <a href="" style="font-size: 12px; color: #ccc">exif</a>
                        <a href="" style="font-size: 15.6px; color: #a7a7a7">gulp</a>
                        <a href="" style="font-size: 26.4px; color: #363636">vue</a>
                        <a href="" style="font-size: 12px; color: #ccc">vuex</a>
                        <a href="" style="font-size: 12px; color: #ccc">webpack</a>
                        <a href="" style="font-size: 12px; color: #ccc">图片上传</a>
                        <a href="" style="font-size: 19.2px; color: #818181">图表</a>
                        <a href="" style="font-size: 12px; color: #ccc">微信小程序</a>
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
</html>