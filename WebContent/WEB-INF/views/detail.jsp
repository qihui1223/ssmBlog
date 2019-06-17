<%@page import="pro.qh.bean.Blog"%>
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
<title>${article.getTitle()}</title>
<meta name="description" content="">
<meta name="keywords" content="">
	<!--import style -->
	<link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/reset.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/detail.css">
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
						<span class="ant-breadcrumb-link">详情页</span>
						<span class="ant-breadcrumb-separator"></span>
					</span>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
        <!--detail start-->
        <div class="col-md-12">
        	<div class="detail">
               <div class="main-inner">
                <div class="list-items-inner">
                    <p class="article">
                        ${article.getTitle()}
                    </p>
                    <div class="post-meta">
                        <span class="post-time">
                            <span class="post-meta-item-icon">
                                <i class="fa fa-calendar-o"></i>
                            </span>
                                <span class="post-meta-item-text">发表于</span>
                            <time title="创建于" itemprop="dateCreated datePublished" datetime="2019-01-02">
                                ${article.createdtime}
                            </time>
                        </span>
                        <span class="post-category">
                            <span class="post-meta-divider">|</span>
                            <span class="post-meta-item-icon">
                                <i class="fa fa-folder-o"></i>
                            </span>
                            <span class="post-meta-item-text">分类于</span>
                            <span itemprop="about" itemscope="" itemtype="http://schema.org/Thing">
                                <a href="category.do" itemprop="url" rel="index">
                                    <span itemprop="name">${article.category.typeName}</span>
                                </a>
                            </span>
                        </span>
                    </div>
                    <div class="post-body">
                      ${article.getContent()}
                    </div>
                </div>
            </div>
            </div>
        </div>
        <!--detail end  -->
    </div>  

    <!--record start-->
    <jsp:include page = "foot.jsp"/>
    <!--record end-->
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/js/time.js"></script>
</html>