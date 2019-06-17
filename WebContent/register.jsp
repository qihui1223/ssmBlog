<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="icon" href="${APP_PATH}/static/common/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="${APP_PATH}/static/web/css/user.css"> 
</head>
<body>  
<div id="bg" class="wall"></div>
<div class="show" style="top: 10px;">
	<%--<div class="top">
		<h5 class="topTitle">
			<a href="${APP_PATH}">返回主页</a>
		</h5>
	</div> --%>
    <h3 class="title" style="margin-top: 55px;">开发者-用户中心</h3>
    <div class="login-panel" id="registerForm">
        <h4 class="form-title">注册&nbsp;开发者账号</h4>
        <hr class="top-line">
        <form action="">
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
            <div class="form-group">
            	<p class="glyphicon glyphicon-lock iconFont"></p>
            	<div class="formInput">
	                <input type="password" name="password2" class="form-control" id="password2" placeholder="请再次输入密码">
	                <span class="help-block"></span>
                </div>
            </div> 
            <div class="form-group">
            	<p class="glyphicon glyphicon-envelope iconFont"></p>
            	<div class="formInput">
	                <input type="text" name="email" class="form-control" id="email" placeholder="请再次输入邮箱">
	                <span class="help-block"></span>
                </div>
            </div> 
            <!-- <div class="form-group">
            	<p class="glyphicon glyphicon-phone iconFont"></p>
            	<div class="formInput">
	                <input type="number" name="mobile" class="form-control" id="mobile" placeholder="请再次输入手机号">
	                <span class="help-block"></span>
                </div>
            </div>  -->
        </form>
        <div class="form-group">
            <button  class="btn btn-info" id="register">注册</button>
        </div>
    </div>

    <div class="switch row">
        <button class="switch-action" id="login">
    		<a href="${APP_PATH}">首页</a>&nbsp;&nbsp;&nbsp;
       	 	已经注册过账号？<span><a href="${APP_PATH}/user/toLogin.do">立即登录</a></span>
       	 </button>
    </div>

    <!-- <div class="bottom-info">
        Powered By：<a href="#">开发者</a>&nbsp;•&nbsp;<a href="#">关于我们</a>
    </div> -->
</div>

<!-- 提示信息 -->
<div id="layerout">
   <p id="registerMsg"></p>
</diV>
</body>  
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/layer/layer.js"></script>
<script>
$(document).ready(function () {
	$("#register").click(function(){
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		restForm("#registerForm form");
		if(check()){
			$.ajax({
				url: "${APP_PATH}/user/register.do",
				type: "POST",
				data: $("#registerForm form").serialize(),
				success: function(result){
					if(result.status == 0){
						//清除内容
						$("#registerMsg").empty();
						$("#registerMsg").append(result.msg);
						layer.open({
						    type:1,//弹出1个页面层
						    title:'<span style="color: #339ef7;font-size: 17px;">成功</span>',
						    shadeClose: false, //点击遮罩关闭
						    area:["350px","150px"],
						    skin: 'layer-ext-moon',
						    content:$("#layerout"),
						    btn: ['确定','取消'],
						    yes : function(index) {     		    	
								layer.close(index); 	
								return location.href = "${APP_PATH}/user/toLogin.do";
						    }
						 })
						
					}else{
						//清除内容
						$("#registerMsg").empty();
						$("#registerMsg").append(result.msg);
						layer.open({
						    type:1,//弹出1个页面层
						    title:'<span style="color: #339ef7;font-size: 17px;">错误</span>',
						    shadeClose: false, //点击遮罩关闭
						    area:["350px","150px"],
						    skin: 'layer-ext-moon',
						    content:$("#layerout"),
						    btn: ['确定','取消'],
						    yes : function(index) {     		    	
								layer.close(index); 	
						    }
						 })
					}
				}
			})
		}
		
	})	
})

function check(){
	return checkName("#username")&isPwd("#password")&checkPwd("#password","#password2")&checkEmail("#email");
}

//bootStrap,提示错误信息样式
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
	if(!regPwd.test(pwd)){
		showValidate(el, "error", "密码不能含有非法字符，长度在6-12之间");
		return false;
	}
	
	showValidate(el, "success", "");
    return true;
}

function checkPwd(el,nl){
	var pwd = $(el).val();
	var Pwd2 = $(nl).val();
	/*if(pwd2.length ==0){
		showValidate(el, "error", "密码不能为空");
		return false;
	}*/
	if(pwd == Pwd2){
		showValidate(nl, "success", "");	
	}else{
		showValidate(el, "error", "密码不一致");
		showValidate(nl, "error", "密码不一致");
		return false;
	}
    return true;
}


//校验邮箱
function checkEmail(el){
	var empEmail = $(el).val();
	//var regEmail = /(^[a-zA-Z0-9/-._]+)@([\a-z\.-]+).([a-z\.]{2,6})/;
	var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	if(!regEmail.test(empEmail)){
		showValidate(el, "error", "邮箱格式不正确");
		return false;
	}
	
	showValidate(el, "success", "");
	
	return true;
}

//检验手机号
function validatemobile(el) { 
	var mobile = $(el).val();
	if(mobile.length==0) { 
		showValidate(el, "error", "手机号码不能为空");
		return false; 
	} 
	if(mobile.length!=11) { 
		showValidate(el, "error", "请输入有效的手机号码，需是11位！");
		return false; 
	} 

	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	if(!myreg.test(mobile)) { 
		showValidate(el, "error", "请输入有效的手机号码!");
		return false; 
	} 
	return true;
}



</script>
</html>