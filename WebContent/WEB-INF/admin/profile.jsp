<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 个人资料</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
	<link href="${APP_PATH}/static/common/css/reset.css" rel="stylesheet">
	<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
    <link href="${APP_PATH}/static/admin/css/font-awesome.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/admin/css/animate.css" rel="stylesheet">
    <link href="${APP_PATH}/static/admin/css/profile.css" rel="stylesheet">
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>个人资料</h5>
                    </div>
                    <div>
                        <div class="ibox-content no-padding border-left-right">
                            <img alt="image" class="img-responsive" src="${APP_PATH}/static/admin/img/profile_big.jpg">
                        </div>
                        <div class="ibox-content profile-content">
                            <h4><strong>Beaut-qihui</strong></h4>
                            <p><i class="fa fa-map-marker"></i> 武汉光谷</p>
                            <h5>关于我</h5>
                            <p>
                               	 会前端技术，js,react之类的，努力学习后端；
                               	 热爱生活，热爱互联网，热爱新技术；在不断的寻求新的突破。
                            </p>
                            <div class="row m-t-lg">
                                <div class="col-sm-4">
                                    <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                    <h5><strong>169</strong> 文章</h5>
                                </div>
                                <div class="col-sm-4">
                                    <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                    <h5><strong>28</strong> 关注</h5>
                                </div>
                                <div class="col-sm-4">
                                    <span class="bar">5,3,2,-1,-3,-2,2,3,5,2</span>
                                    <h5><strong>240</strong> 关注者</h5>
                                </div>
                            </div>
                            <div class="user-button">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-primary btn-sm btn-block"><i class="fa fa-envelope"></i> 发送消息</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-default btn-sm btn-block"><i class="fa fa-coffee"></i> 赞助</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="col-sm-8">
                <div class="ibox float-e-margins">
                    
                </div>

            </div> -->
        </div>
    </div>
</body>
<!-- 全局js -->
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- 自定义js -->
<!-- Peity -->
<script type="text/javascript" src="${APP_PATH}/static/common/peity/jquery.peity.min.js"></script>
<!-- Peity -->
<script type="text/javascript" src="${APP_PATH}/static/admin/js/peity-demo.js"></script>
</html>
