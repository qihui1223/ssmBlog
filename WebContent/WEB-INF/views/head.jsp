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
	 <!--header start-->
    <header class="nav-header">
        <div class="nav-header-bar container">
            <div class="nav-logo"><a href="${APP_PATH}/toMain.do">齐辉的博客</a></div>
            <div class="nav-menu">
                <ul>
                    <li class="menus">
                        <a href="${APP_PATH}/toMain.do">
                            <span><i class="fa fa-home"></i></span>
                            <span>首页</span>
                        </a>
                    </li>
                    <li class="menus">
                        <a href="category.do">
                            <span><i class="menu-item-icon fa fa-fw fa-th"></i></span>
                            <span>分类</span>
                        </a>
                    </li>
                    <li class="menus">
                        <a href="archives.do">
                            <span><i class="fa fa-file"></i></span>
                            <span>归档</span>
                        </a>
                    </li>
                    <li class="menus">
                        <a href="tags.do">
                            <span><i class="fa fa-tags"></i></span>
                            <span>标签</span>
                        </a>
                    </li>
                    <li class="menus">
                        <a href="about.do">
                            <span><i class="fa fa-user-circle"></i></span>
                            <span>关于</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <!--header end-->
</body>
</html>