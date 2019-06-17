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
	<title>关于</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<!--import style -->
	<link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${APP_PATH}/static/web/css/reset.css">
	<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/static/common/font-awesome/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="${APP_PATH}/static/web/css/about.css">
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
						<span class="ant-breadcrumb-link">关于</span>
						<span class="ant-breadcrumb-separator"></span>
					</span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
        <!--archive start-->
        <div class="col-md-8">
        	<div class="about">
                <div class="post-body" style="opacity: 1; display: block; transform: translateY(0px);">
                    <p>
                        个人简介：<br>
                        齐辉<br>
                        Web前端开发、node.js爱好者<br>
                        来自湖北 现居于武汉<br>
                        Email: <a target="_blank" rel="noopener">276248772@qq.com</a>
                    </p>
                    <p>关于本站：<br>
                    前端: bootstrap<br>
                    后端: java ssm框架<br>
                    开始于2018年3月22日，基本在2018年5月10日完工。</p>
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