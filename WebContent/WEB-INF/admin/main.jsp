<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>admin</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/animate.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/main.css">
</head>
<body class="fixed-sidebar" style="overflow:hidden">
 	<div id="wrapper">
 		<nav class="navbar-static-side navbar-default" role="navigation">
            <div class="sidebar-collapse">
            	<ul class="nav" id="side-menu">
            		<li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">hAdmin</strong>
                                    </span>
                                </span>
                            </a>
                        </div>
                    </li>
                    <li class="line"></li>
                    <li class="hidden-folded navTitle">
                        <span class="ng-scope">分类</span>
                    </li>
                    <li>
                        <a class="J_menuItem" href="${APP_PATH}/admin/profile.do">
                            <i class="fa fa-home"></i>
                            <span class="nav-label">主页</span>
                        </a>
                    </li>
                    <li>
                        <a>
                            <i class="fa fa fa-bar-chart-o"></i>
                            <span class="nav-label">博客管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="nav-second-title J_menuItem" href="${APP_PATH}/admin/articleContent.do">博客信息管理</a>
                            </li>
                            <!-- <li>
                                <a class="nav-second-title J_menuItem" href="tags.do">标签添加</a>
                            </li> -->
                            <!-- <li>
                                <a class="nav-second-title J_menuItem" href="toArticle.do">写博客</a>
                            </li> -->
                            <li>
                                <a class="nav-second-title J_menuItem" href="${APP_PATH}/admin/toCkArticle.do">写博客</a>
                            </li>
                            <li>
                                <a class="nav-second-title J_menuItem" href="${APP_PATH}/admin/toCategory.do">分类管理</a>
                            </li>
                            <li>
                                <a class="nav-second-title J_menuItem" href="">标签管理</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="J_menuItem" href="">
                            <i class="fa fa-globe"></i>
                            <span class="nav-label">网站管理</span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a class="nav-second-title J_menuItem" href="">友情链接</a>
                            </li>
                            <li>
                                <a class="nav-second-title J_menuItem" href="">评论管理</a>
                            </li>
                            <li>
                                <a class="nav-second-title J_menuItem" href="">公告管理</a>
                            </li>
                        </ul>
                    </li>
            	</ul>
            </div>
 		</nav>
 		<div id="page-wrapper">
 			<div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header"><a class="navbar-retracting btn" href="#"><i class="fa fa-bars"></i> </a>
                        <form role="search" class="navbar-form-custom" method="post" action="#">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li class="m-t-xs">
                                    <div class="dropdown-messages-box">
                                        <a class="pull-left">
                                            <img alt="image" class="img-circle" style="width:50px" src="${APP_PATH}/static/admin/img/a7.jpg"/>
                                        </a>
                                        <div class="media-body">
                                            <small class="pull-right">46小时前</small>
                                            <strong>瑞文</strong> 断剑重铸之日骑士归来之时
                                            <br>
                                            <small class="text-muted">3天前 2014.11.8</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a class="pull-left">
                                            <img alt="image" class="img-circle" style="width:50px"
                                             src="${APP_PATH}/static/admin/img/a4.jpg"/>
                                        </a>
                                        <div class="media-body ">
                                            <small class="pull-right text-navy">25小时前</small>
                                            <strong>崔斯特</strong> 胜利女神在微笑
                                            <br>
                                            <small class="text-muted">昨天</small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a>
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                            <span class="pull-right text-muted small">4分钟前</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a>
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i> 3条新回复
                                            <span class="pull-right text-muted small">12分钟钱</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe id="J_iframe" width="100%" height="100%" src="${APP_PATH}/admin/profile.do" frameborder="0" data-id="profile.do" seamless></iframe>
            </div>
 		</div>
 	</div>  
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"  src="${APP_PATH}/static/common/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript"  src="${APP_PATH}/static/common/slimscroll/jquery.slimscroll.min.js"></script>
<!-- 自定义js -->
<script type="text/javascript"  src="${APP_PATH}/static/admin/js/admin.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/pace/pace.min.js"></script>
<script type="text/javascript">
    $(function(){
        //菜单点击
        //J_iframe
        $(".J_menuItem").on('click',function(){
            var url = $(this).attr('href');
            $("#J_iframe").attr('src',url);
            return false;
        });
    });
</script>
</html>