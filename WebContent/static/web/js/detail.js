//正则校验
function checkForm(nl,el){
	//拿到校验数据,进行正则校验
	var empName = $(nl).val();
	var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
	if(!regName.test(empName)){
		showValidate(nl, "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
        return false;
	}else{
		showValidate(nl, "success", "");
	}
	
	//校验邮箱
	var empEmail = $(el).val();
	//var regEmail = /(^[a-zA-Z0-9/-._]+)@([\a-z\.-]+).([a-z\.]{2,6})/;
	var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	if(!regEmail.test(empEmail)){
		showValidate(el, "error", "邮箱格式不正确");
		return false;
	}else{
		showValidate(el, "success", "");
	}
	return true;
}

function checkEmail(el){
	//校验邮箱
	var empEmail = $(el).val();
	//var regEmail = /(^[a-zA-Z0-9/-._]+)@([\a-z\.-]+).([a-z\.]{2,6})/;
	var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	if(!regEmail.test(empEmail)){
		showValidate(el, "error", "邮箱格式不正确");
		return false;
	}else{
		showValidate(el, "success", "");
	}
	return true;
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