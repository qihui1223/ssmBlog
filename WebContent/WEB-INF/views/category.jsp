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
    <title>分类</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--import style -->
    <link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/reset.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/common/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${APP_PATH}/static/web/css/category.css">
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
						<span class="ant-breadcrumb-link">分类</span>
						<span class="ant-breadcrumb-separator"></span>
					</span>
				</div>
			</div>
		</div>
	</div>

    <div class="container">
        <!--category start-->
        <div class="col-md-8">
        	<div class="category">
        		<h1>category</h1>
	            <div class="all-page-title">目前共计个${category.size()}分类</div>
	            <div class="allpage">
	                <ul>
	                    <c:forEach items="${category}" var="item" varStatus="status">
	                    	<c:if test="${item.status == 0}">
							   <li class="allpage-items">
			                        <a href="archives.do">${item.typeName}</a>
			                        <span>${item.blog}</span>
			                    </li>
							</c:if>
						</c:forEach>

	                    <!--<li class="allpage-items">
	                        <a href="#">Bootstrap</a>
	                        <span>(5)</span>
	                    </li> -->
	                </ul>
	            </div>
        	</div>
        </div>

        <div class="col-md-4 right-content">
            <jsp:include page = "link.jsp"/>
        </div>
    </div>
    <!--paging start-->
    <!-- <div class="page container">
        <ul class="pagination">
    		    <li><a href="#">&laquo;</a></li>
    		    <li><a href="#">1</a></li>
    		    <li><a href="#">2</a></li>
    		    <li><a href="#">3</a></li>
    		    <li><a href="#">4</a></li>
    		    <li><a href="#">5</a></li>
    		    <li><a href="#">&raquo;</a></li>
    		</ul>
    </div> -->
    <!--paging end-->
    
    <!--record start-->
    <jsp:include page = "foot.jsp"/>
    <!--record end-->
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</html>