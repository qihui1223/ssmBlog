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
<title>登录</title>
<link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="${APP_PATH}/static/web/css/user.css"> 
</head>
<body>
<div id="bg" class="wall"></div>
<div class="show">
    <h3 class="title" style="margin-top: 120px;">用户登录</h3>
    <div class="login-panel" id="loginForm">
        <h4 class="form-title">登录&nbsp;开发者账号</h4>
        <hr class="top-line">
        <form method="post">
            <div class="form-group">
            	<p class="glyphicon glyphicon-user iconFont"></p>
            	<div class="formInput">
	                <input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名">
	                <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
            	<p class="glyphicon glyphicon-lock iconFont"></p>
            	<div class="formInput">
	                <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">
	                <span class="help-block"></span>
                </div>
            </div>
        </form>
        <div class="form-group">
            <button class="btn btn-info" id="login">登录</button>
        </div>
    </div>

    <div class="switch row">
        <button class="switch-action" id="register">
        <a href="${APP_PATH}">首页</a>&nbsp;&nbsp;&nbsp;
        &lt;&nbsp;还没有账号？<span><%-- <a href="${APP_PATH}/user/toRegister.do">立即注册</a> --%></span>
        </button>
    </div>

    <!-- <div class="bottom-info">
        Powered By：<a href="#">开发者</a>&nbsp;•&nbsp;<a href="#">关于我们</a>
    </div> -->
</div>
<!-- 提示信息 -->
<div id="layerout">
   <p id="loginMsg"></p>
</diV>
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/layer/layer.js"></script>
<script>
$(document).ready(function () {
	$("#login").click(function(){
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		restForm("#loginForm form");
		if(check()){
			console.log("1")
			$.ajax({
				url: "${APP_PATH}/user/login.do",
				type: "POST",
				data: $("#loginForm form").serialize(),
				success: function(result){
					console.log("success:"+result)
					if(result.status == 0){
						console.log(result)
						return location.href = "${APP_PATH}/admin/main.do";
						//return location.href = "${APP_PATH}/user/toLogin.do";
					}else{
						//清除内容
						$("#loginMsg").empty();
						$("#loginMsg").append(result.msg);
						layer.open({
						    type:1,//弹出1个页面层
						    title:'<span style="color: #339ef7;font-size: 17px;">错误</span>',
						    shadeClose: false, //点击遮罩关闭
						    area:["250px","150px"],
						    skin: 'layer-ext-moon',
						    content:$("#layerout"),
						    btn: ['确定','取消'],
						    yes : function(index) {     		    	
								layer.close(index); 
								return location.href = "${APP_PATH}/user/toLogin.do";
						    }
						 })
					}
				}
			})
		}
		
	})	
})

function check(){
	return (checkName("#username")&isPwd("#password"));
}

function showValidate(el,status,msg){
	//清除当前信息
	$(el).parent().removeClass("has-success has-error");
	$(el).next("span").text("");
    if("success"==status){
        $(el).parent().addClass("has-success");
        $(el).next("span").text(msg);
    }else if("error" == status){
        $(el).parent().addClass("has-error");
        $(el).next("span").text(msg);
    }
}

//清除表单数据
function restForm(ele){
	//清空表单样式
    $(ele).find(".form-control").removeClass("has-error has-success");
    $(ele).find(".help-block").text("");
}

//校验名字
function checkName(nl){
	//拿到校验数据,进行正则校验
	var empName = $(nl).val();
	//var regName1 = /^[a-zA-Z\x{4e00}-\x{9fa5}]{6,20}$/;
	var regName = /(^[\u4e00-\u9fa5_a-zA-Z0-9_]{4,12}$)/;
	if(!regName.test(empName)){
		showValidate(nl, "error", "用户名长度为4-12位");
        return false;
	}else{
		showValidate(nl, "success", "");
	}
	return true;
}

//密码验证
function isPwd(el){
	var pwd = $(el).val();
	var regPwd = /^[a-zA-Z0-9]{6,12}$/;
	if(pwd.length ==0){
		showValidate(el, "error", "密码不能为空");
		return false;
	}
	showValidate(el, "success", "");
    return true;
}

</script>
<script>	
</script>
</html>