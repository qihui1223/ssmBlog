/**
 * 
 * @authors Your Name (you@example.org)
 * @date    2019-04-12 10:07:14
 * @version $Id$
 */
var E = window.wangEditor
var editor = new E('#editor')
editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片  
// 隐藏“网络图片”tab
editor.customConfig.showLinkImg = false
editor.customConfig.menus = [
'head',  // 标题
'bold',  // 粗体
'italic',  // 斜体
'underline',  // 下划线
'foreColor',  // 文字颜色
'backColor',  // 背景颜色
'list',  // 列表
'justify',  // 对齐方式
'quote',  // 引用
'image',  // 插入图片
'table',  // 表格
'undo',  // 撤销
'redo'  // 重复
]
editor.create()

function submitDate(){
	/* var json = editor.txt.getJSON()  // 获取 JSON 格式的内容
    var jsonStr = JSON.stringify(json)
    console.log(json)
    console.log(jsonStr) */
	
	var title = document.getElementById('title').value;
	var content = editor.txt.html();
	if(title==""||content==""){
		layer.msg('请把内容填写完整！',{icon:2,time:1000});
		return false;
	}
     console.log(content)  
	/* $.ajax({
		type : "post",
		url : "newsAddPage.action",
		data : {
			"id":id,
			"title" : title,
			"content" : content,
			"type":type
		},
		success : function(result) {
			layer.msg('添加成功!',{icon:1,time:1000});
		},
		error : function(data) {
			$.Huimodalalert('修改失败！', 2000);
		}
	});   */
}
