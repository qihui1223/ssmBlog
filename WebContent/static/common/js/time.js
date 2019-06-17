
function add0(m){return m<10?'0'+m:m }
function format(shijianchuo){
	//shijianchuo是整数，否则要parseInt转换
	var time = new Date(shijianchuo);
	var y = time.getFullYear();
	var m = time.getMonth()+1;
	var d = time.getDate();
	var h = time.getHours();
	var mm = time.getMinutes();
	var s = time.getSeconds();
	return y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);
}






function showdate(dateStr) {
	// 比如需要这样的格式 yyyy-MM-dd hh:mm:ss
	var date = new Date(dateStr);
	//格式化日，如果小于9，前面补0
	var day = ("0" + date.getDate()).slice(-2);
	//格式化月，如果小于9，前面补0
	var month = ("0" + (date.getMonth() + 1)).slice(-2);
	//拼装完整日期格式
	var show = date.getFullYear()+"-"+(month)+"-"+(day) ;
	return show;
}

function showYear(dateStr){
	// 显示年份
	var date = new Date(dateStr);
	var show = date.getFullYear();
	return show;
}

function formatMonth(dateStr){
	alert("1");
	// 显示年份
	// 比如需要这样的格式 MM-dd hh:mm:ss
	var date = new Date(dateStr);
	//格式化日，如果小于9，前面补0
	var day = ("0" + date.getDate()).slice(-2);
	//格式化月，如果小于9，前面补0
	var month = ("0" + (date.getMonth() + 1)).slice(-2);
	//拼装完整日期格式
	var show = (month)+"-"+(day) ;
	return show;
}