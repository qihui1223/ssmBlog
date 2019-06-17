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
	console.log("name")
	return true;
}

//密码验证
function isPwd(el){
	var pwd = $(el).val();
	console.log(pwd);
	var regPwd = /^[a-zA-Z0-9]{6,12}$/;
	if(pwd.length ==0){
		showValidate(el, "error", "密码不能为空");
		return false;
	}
	if(!regPwd.test(pwd)){
		showValidate(el, "error", "密码不能含有非法字符，长度在6-12之间");
		return false;
	}else{
		showValidate(el, "success", "");
	}
	console.log("pwd");
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
	console.log("pw2");
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
	}else{
		showValidate(el, "success", "");
	}
	console.log("邮箱");
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

