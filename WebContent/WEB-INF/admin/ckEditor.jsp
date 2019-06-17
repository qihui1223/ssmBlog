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
                    <li class="active">发布文章-ckeditor编辑器</li>
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
                    <input type="hidden" name="id" id="articleId" value="${blogid}"/> 
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
				                <th><i class="require">*</i>创建时间：</th>
				                <td>
				                    <input type="date" readonly = "readonly"
				                    id="createdtime" name="createdtime">
				                </td>
				            </tr>
				            <tr>
				                <th><i class="require">*</i>内容：</th>
				            </tr>
                		</tbody>
                	</table>
                    
                    <div class="ckeditor form-group">
                        <div class="col-md-12 col-xs-12">
                            <div id="editor">
								<!-- ckEditor 内容编辑器 -->
							</div>
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
<script type="text/javascript" src="${APP_PATH}/static/admin/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/admin/ckeditor5/translations/zh-cn.js"></script>
<script>
    var myEditor = null;;
    window.onload = function(){
	    ClassicEditor.create(document.querySelector( '#editor' ), {
                //工具栏，可选择添加或去除
		        toolbar: [
		        	"heading", // 标题
		        	"undo", //撤销
				    "redo", //不撤销
				    "bold", //加粗
				    "italic", //斜体
				    "blockQuote",  //块引用
				    "imageTextAlternative", //用于图片加载不出来时替换显示的文字
				    "imageUpload", // 插入图片
				    "imageStyle:full",  //图片与上下文组合方式：图片占一整行
				    "imageStyle:side",  //图片与上下文组合方式：图片在文字的旁边
				    "link", // 链接
				    "numberedList",   //有序列表
				    "bulletedList"    //无序列表

		        ],
		        image: {
		            // You need to configure the image toolbar, too, so it uses the new style buttons.
		            toolbar: [ 'imageTextAlternative', '|', 'imageStyle:alignLeft', 'imageStyle:full', 'imageStyle:alignRight' ],

		            styles: [
		                // This option is equal to a situation where no style is applied.
		                'full',

		                // This represents an image aligned to the left.
		                'alignLeft',

		                // This represents an image aligned to the right.
		                'alignRight'
		            ]
		        },
		        //editor加载中文简体，默认是英文
                language: 'zh-cn',
                ckfinder: {
                	uploadUrl: '${APP_PATH}/admin/loadImage.do',//后端处理上传逻辑返回json数据,包括uploaded(选项true/false)和url两个字段
                	
                }
            }
	    ).then(editor => {
		    window.editor = editor;
		    myEditor = editor.getData();
	    } )
	    .catch(error => {
	        console.log(error);
	    } );
	}

 
    //文章提交 
    function submitArticle(){
    	var title = $("#title").val();
    	var dId = $("#selectContent").val();
        var content = window.editor.getData();
        if(check()){
        	$.ajax({
        		url: "${APP_PATH}/admin/savearticle.do",
        		type: "POST",
        		data: {
        			title: title, 
        			dId: dId,
        			editorhtml:content
        		},
        		success: function(result){
        			console.log(result)
        			if(result.code == 0){
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
        						location.href = "toCkArticle.do";
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
    	return checkTitle("#title")&checkCategory("#selectContent")&checkContent();
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
    	var content = window.editor.getData();
    	console.log("内容:"+content);
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
<script>

$(function(){
	getCategory("#selectContent");
	// 获取要编辑文章的内容
	var id = ${blogid };
	getBlogContent(id);
	
})

function getBlogContent(id){
	$.ajax({
		url: "${APP_PATH}/admin/getArticleById.do",
        type:"GET",
        data: "id="+id,
		dataType: "json",
        success: function(result){
        	if(result.code == 0){
        		
        		var article = result.data.article;
        		var editor=window.editor;
        		$("#title").val(article.title);
        		$("#createdtime").val(showdate(article.createdtime));
        		//查询分类信息,填充到select中
        		$("#selectContent").val(article.category.id);
        		editor.setData(article.content);
        		//$("#editor").val(article.content);
        	}
        }
	})
}

function getCategory(el){
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
			console.log(result);
			if(result.code == 0){
				$.each(result.data.tags,function(index,item){
					optionEle = $("<option></option>").append(item.typeName).attr("value",item.id);
					optionEle.appendTo(el)
				})
			}		
		}
	})
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

</script>
</html>