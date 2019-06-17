<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${APP_PATH}/static/common/css/reset.css">
<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css"> 
<link rel="stylesheet" href="${APP_PATH}/static/admin/editormd/css/editormd.min.css" type="text/css" />
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/article.css" type="text/css" />
<link rel="stylesheet" href="${APP_PATH}/static/common/css/layer.css" type="text/css" />
</head>
<body>
<form id="articleForm" class="form-horizontal form-label-left" method="post" style="padding: 20px;">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div>
                <ol class="breadcrumb">
                    <li><a href="profile.do">首页</a></li>
                    <li class="active"><a href="articleContent.do">文章列表</a></li>
                    <li class="active">发布文章-editormd编辑器</li>
                </ol>
            </div>
            <div class="x_panel">
                <div class="x_title">
                    <h2>
                    	发布文章 
                    	<small>
                    		Markdown编辑器，使用 <!-- <a href="/article/publishMd">Markdown编辑器</a> -->
                    	</small>
                    </h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                	<input type="hidden" name="isMarkdown" value="0">
                    <input type="hidden" name="id">
                	<table class="articleTable">
                		<tbody>
                			<tr>
				                <th><i class="require">*</i>标题：</th>
				                <td>
				                    <input type="text" name="title" style="margin-right: 10px;"
				                    id="title" required="required" placeholder="请输入标题"/>
				                     <!-- <span>
				                     	<label>
		                                    <input type="checkbox" class="square" name="original"> 原创
		                                 </label>
				                     </span> -->
				                     <span class="help-block help-message"></span>
				                </td>
				            </tr>
                			<tr>
		                        <th width="120"><i class="require">*</i>分类：</th>
		                        <td>
		                            <select id="selectContent" name="tag">
		                                <!-- <option value="">==请选择==</option>
		                                <option value="19">精品界面</option>
		                                <option value="20">推荐界面</option> -->
		                            </select>
		                            <span class="help-block help-message"></span>
		                        </td>
		                    </tr>
				            <tr>
				                <th><i class="require">*</i>内容：</th>
				            </tr>
                		</tbody>
                	</table>
                    
                    <div class="item form-group">
                        <div class="col-md-12 col-xs-12">
                            <div class="editormd" id="test-editormd">
							  <textarea id="content" class="editormd-markdown-textarea" name="test-editormd-markdown-doc"></textarea>
							  <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
							  <textarea id="htmlContent" class="editormd-html-textarea" name="editorhtml"></textarea>
							</div>
							<span class="help-block contentMsg"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <!-- <label class="control-label col-md-1 col-sm-1 col-xs-12"></label> -->
                        <div class="col-md-10 col-sm-10 col-xs-12">
                            <button type="button" onclick="submitArticle()" 
                            class="btn btn-success to-choose-info"><i class="fa fa-pencil"> 发布文章</i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>  
<!-- 提示信息 -->
<div id="layerout">
   <p id="Msg"></p>
</diV> 
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/layer/layer.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/admin/editormd/editormd.min.js"></script>
<script type="text/javascript">
	var testEditor;
	testEditor=$(function() {
	    editormd("test-editormd", {
	     width   : "100%",
	  	 height  : 640,
	  	 syncScrolling : "single",
	 	 path  : "${APP_PATH}/static/admin/editormd/lib/",
	 	  /**上传图片相关配置如下*/
	     imageUpload : true,
	     imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
	     imageUploadURL : "uploadImg.do",
	  	 saveHTMLToTextarea : true,	//注意3：这个配置，方便post提交表单
		 emoji : true,
		 taskList : true,
	 	 tex : true, // 默认不解析
		 flowChart : true, // 默认不解析
		 sequenceDiagram : true, // 默认不解析
		 codeFold : true
		});
	});
	
	
</script>
<script>

$(function(){
	
	//获取分类信息
	getTags("#selectContent");
})

function getTags(el){
	//清空之前下拉列表的值
    $(el).empty();
	
    var optionEle;
  	//<option value="">==请选择==</option>
	optionEle = $("<option></option>").append("==请选择==").attr("value","");
	optionEle.appendTo(el)
	
	$.ajax({
		url: "${APP_PATH}/admin/getCategory.do",
		type: "GET",
		success: function(result){
			if(result.code == 0){
				$.each(result.data.tags,function(index,item){
					optionEle = $("<option></option>").append(item.typeName).attr("value",item.id);
					optionEle.appendTo(el)
				})
			}		
		}
	})
}

function submitArticle(){
	var title = $("#title").val();
	var dId = $("#selectContent").val();
    var content = $("#content").val();
    var htmlContent = $("#htmlContent").val();
    if(check()){
    	$.ajax({
    		url: "${APP_PATH}/admin/savearticle.do",
    		type: "POST",
    		data: {
    			title: title, 
    			dId: dId,
    			editormd:content,
    			editorhtml:htmlContent
    			},
    		success: function(result){
    			if(result.status == 0){
    				//清除内容
    				$("#Msg").empty();
    				$("#Msg").append(result.msg);
    				layer.open({
    				    type:1,//弹出1个页面层
    				    title:'<span style="color: #339ef7;font-size: 17px;">成功</span>',
    				    shadeClose: false, //点击遮罩关闭
    				    area:["250px","150px"],
    				    skin: 'layer-ext-moon',
    				    content:$("#layerout"),
    				    btn: ['确定','取消'],
    				    yes : function(index) {     		    	
    						layer.close(index); 
    						location.href = "toArticle.do";
    				    }
    				 })
    			}else{
    				//清除内容
    				$("#Msg").empty();
    				$("#Msg").append(result.msg);
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
    				    }
    				 })
    			}
    		}
    	})
    }
}

function check(){
	return checkTitle("#title")&checkCategory("#selectContent")&checkContent("#content");
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

//校验标题
function checkTitle(el){
	var title = $(el).val();
	if(title.length ==0){
		showValidate(el, "error", "标题不能为空");
		return false;
	}
	showValidate(el, "success", "");
    return true;
}

//校验分类
function checkCategory(el){
	var title = $(el).val();
	if(title == ""){
		showValidate(el, "error", "分类不能为空");
		return false;
	}
	showValidate(el, "success", "");
    return true;
}



//校验内容
function checkContent(el){
	var content = $(el).val();
	$(".contentMsg").removeClass("help-message");
	$(".contentMsg").text("");
	if(content.length == 0){
		$(".contentMsg").addClass("help-message");
		$(".contentMsg").text("内容不能为空");
		return false;
	}
	$(".contentMsg").addClass("has-success");
    return true;
}	
</script>
</html>