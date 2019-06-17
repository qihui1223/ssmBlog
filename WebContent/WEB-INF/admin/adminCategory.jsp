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
<title>index</title>
<meta name="description" content="">
<meta name="keywords" content="">
<link rel="stylesheet" href="${APP_PATH}/static/common/css/reset.css">
<link rel="stylesheet" href="${APP_PATH}/static/common/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH}/static/admin/css/articleContent.css" type="text/css" /> 
<link rel="stylesheet" href="${APP_PATH}/static/admin/editormd/css/editormd.min.css" type="text/css" />
<link rel="stylesheet" href="${APP_PATH}/static/common/css/layer.css" type="text/css" />
</head>
<body>
<div style="padding: 20px">
	<div class="col-md-12" style="padding: 0">
		<ol class="breadcrumb">
	        <li><a href="profile.do">首页</a></li>
	        <li class="active">分类列表</li>
	    </ol>
	</div>
	<div class="container main">
		<div class="result_wrap">
            <!--快捷导航 开始-->
            <div class="result_content">
                <div class="short_wrap">
                    <div class="wrapBtn" id="addBtn"><i class="fa fa-plus"></i>新增分类</div>
                    <div class="wrapBtn"><i class="fa fa-recycle"></i>批量删除</div>
                    <div class="wrapBtn"><i class="fa fa-refresh"></i>更新排序</div>
                </div>
            </div>
            <!--快捷导航 结束-->
        </div>
		<div style="margin-top: 10px"></div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover table-bordered text-center" id="article_table">
					<thead>
						<tr>
							<th class="text-center"><input type="checkbox" id="check_all"/></th>
	                    	<th class="text-center">序号</th>
		                    <th class="text-center">分类</th>
		                    <th class="text-center">文章数</th>
		                    <th class="text-center">状态</th>
		                    <th class="text-center">操作</th>
						</tr>
					</thead>
					<tbody>	
						
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-6" id="pageInfo"></div>
			<!--分页条信息  -->
			<div class="col-md-6 text-right" id="pageInfoNav"></div>
		</div>	
	</div>

</div>
<!-- 删除员工 -->
<div id="layerout">
   <p id="del-val"></p>
</diV>

<!-- 增加员工 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">增加分类</h4>
            </div>
            <div class="modal-body">
            	<form action="" name="categoryForm" class="form-horizontal" role="form">  
            		<div class="form-group">
					    <label for="name" class="col-sm-2 control-label">分类名字: </label>
					    <div class="col-sm-10">
					    	<input type="text" name="typeName" class="form-control" id="add_name" placeholder="请分类名称">
					    	<span class="help-block"></span>
					    </div>
					</div>
					<!-- <div class="form-group">
					    <label for="age" class="col-sm-2 control-label">描述</label>
					    <div class="col-sm-10">
					    	<input type="text" class="form-control" id="age" placeholder="请输入信息">
					    </div>
					</div> -->
					<div class="form-group">
					    <label for="age" class="col-sm-2 control-label">是否可用:</label>
					    <div class="col-sm-10">
					    	<label class="radio-inline">
								<input type="radio" name="status" id="optionsRadios1" value="0" checked> 可用
							</label>
							<label class="radio-inline">
								<input type="radio" name="status" id="optionsRadios2"  value="1"> 不可用
							</label>
					    </div>
					</div>
			    </form> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveBtn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 增加员工 end -->

<!-- 修改员工 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">分类修改</h4>
            </div>
            <div class="modal-body">
            	<form action="" name="userForm" class="form-horizontal" role="form">  
            		<input type="hidden" name="categoryId" class="form-control" id="update_id"/>
            		<div class="form-group">
					    <label for="name" class="col-sm-2 control-label">分类名称: </label>
					    <div class="col-sm-10">
					    	<input type="text" name="typeName" class="form-control" id="update_name">
					    	<span class="help-block"></span>
					    </div>
					</div>
					<!-- <div class="form-group">
					    <label for="age" class="col-sm-2 control-label">描述信息:</label>
					    <div class="col-sm-10">
					    	<input type="text" name="describe" class="form-control has-error" id="update_describe" placeholder="描述信息">
					    	<span class="help-block"></span>
					    </div>
					</div> -->
					<div class="form-group">
					    <label for="age" class="col-sm-2 control-label">文章数:</label>
					    <div class="col-sm-10">
					    	<input type="text" name="num" readonly="readonly" class="form-control" id="update_num">
					    	<span class="help-block"></span>
					    </div>
					</div>
					<div class="form-group"  id="update_status">
					    <label for="age" class="col-sm-2 control-label">是否可用:</label>
					    <div class="col-sm-10">
					    	<label class="radio-inline">
							  <input type="radio" name="status" id="status_update_input" value="0"> 可用
							</label>
							<label class="radio-inline">
							  <input type="radio" name="status" id="status_update_input" value="1"> 不可用
							</label>
					    </div>
					</div>
			    </form> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="UpDateBtn">提交更改</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改 end -->
</body>
<script type="text/javascript" src="${APP_PATH}/static/common/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/js/time.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/static/common/layer/layer.js"></script>
<script type="text/javascript">
	var totalRecord,currentPage;
	//页面加载实现ajax
	$(function(){
		getTags(1);
	});
	
	function getTags(num){
		//清空table表格
		$("#article_table tbody").empty();

		$.ajax({
			url: "${APP_PATH}/admin/getCategoryPage.do",
			data:"num="+num,
			type: "GET",
			success: function(result){
				if(result.code == 0){
					//table表格
					categoryTable(result);
					//分页信息
					showPageInfo(result);
					//分页信息条
					showPageNav(result);
				}else{
					layer.alert(result.msg, {
					  icon: 2,
					  skin: 'layer-ext-moon' 
					})
					//alert(result.msg);
				}	
			}
		})
	}
	
	function categoryTable(result){
		//清空table表格
		$("#article_table tbody").empty();
		var category = result.data.pageInfo.list;
		var pageNum = result.data.pageInfo.pageNum;
		var pageSize = result.data.pageInfo.pageSize;
		
		$.each(category,function(index,item){
			var checkBox = $("<input type='checkbox' class='check_item'/>");
			//为删除按钮添加一个自定义的属性，来表示当前员工id
			checkBox.attr("check-id",item.id);
			//添加自定义属性,表示当前员工名字
			checkBox.attr("check-name",item.typeName);
			var checkBoxTd = $("<td></td>").append(checkBox);
			var page = $("<td></td>").append(pageSize * (pageNum - 1) + index + 1);
			//return pageSize * (pageNumber - 1) + index + 1;    //返回每条的序号： 每页条数 * （当前页 - 1 ）+ 序号
			var articleCategory = $("<td></td>").append(item.typeName);
			var num = $("<td></td>").append(item.blog);
			var status;
			/* if(item.status == 0){
				status = true;
			}else{
				status = false;
			} */
			var statusTd = $("<td></td>").append(item.status == 0 ? "true" : "false");
			
			
			var editBtn = $("<a></a>").addClass("editBtn")
							.append("<span></span>").append("编辑");
			//为编辑按钮添加一个自定义的属性，来表示当前文章id
			editBtn.attr("edit-id",item.id);
			var delBtn = $("<a></a>").addClass("delBtn")
						.append("<span></span>").append("删除");
			//为删除按钮添加一个自定义的属性，来表示当前文章id
			delBtn.attr("del-id",item.id);
			//添加自定义属性,表示当前文章标题
			delBtn.attr("del-name",item.typeName);
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
			
			//append方法执行完成以后还是返回原来的元素
			//拼接dom
			$("<tr></tr>").append(checkBoxTd)
				.append(page)
				.append(articleCategory)
				.append(num)
				.append(statusTd)
				.append(btnTd)
				.appendTo("#article_table tbody")
		})
	}
	
	//分页信息
	function showPageInfo(result){
		$("#pageInfo").empty();
		var pageInfo = result.data.pageInfo;
		/* <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
		页,总 ${pageInfo.total } 条记录</div> */
		$("#pageInfo").append("当前第 "+"<b>"+pageInfo.pageNum+"</b>"+" 页,总 "+"<b>"+pageInfo.total
				+"</b>"+" 条记录")
		
		//总记录数
		totalRecord = pageInfo.total;
		//当前页数
        currentPage = pageInfo.pageNum;
	}
	
	//显示分页条信息
	function showPageNav(result){
		$("#pageInfoNav").empty();
		var pageNav = result.data.pageInfo;
		/**
			<ul class="pagination">
				<li><a href="#">&laquo;</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		**/
		var ul = $("<ul></ul>").addClass("pagination");
		//构建元素
		var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(pageNav.hasPreviousPage == false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			//为元素添加点击事件
			firstPageLi.click(function(){
				getTags(1);
			})
			prePageLi.click(function(){
				getTags(pageNav.pageNum-1);
			})
		}
		
		var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		if(pageNav.hasNextPage == false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}else{
			nextPageLi.click(function(){
				getTags(pageNav.pageNum+1);
			})
			lastPageLi.click(function(){
				getTags(pageNav.pages);
			})
		}
		
		//添加首页和上一页的提示
		ul.append(firstPageLi).append(prePageLi);
		
		//遍历页码
		$.each(pageNav.navigatepageNums,function(index,item){
			var numLi = $("<li></li>").append($("<a></a>").append(item));
			
			//显示高亮
			if(pageNav.pageNum == item){
				numLi.addClass("active");
			}
			
			numLi.click(function(){
				getTags(item);
			})
			
			ul.append(numLi);
			
		});
		
		//添加下一页和末页提示
		ul.append(nextPageLi).append(lastPageLi);
		
		//把ul加入到nav
        var navEle = $("<nav></nav>").addClass("navPage").append(ul);
        navEle.appendTo("#pageInfoNav");
	}
	
	//清除表单数据
	function restForm(ele){
		$(ele)[0].reset();
		//清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
	}
	
	$("#addBtn").click(function(){
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		restForm("#addModal form");
		//弹出模态框
        $("#addModal").modal({
            backdrop:"static"
        });
	})
	
	//保存员工
	$("#saveBtn").click(function(){
		//正则验证
		if(!validateCategory("#add_name")){
            return false;
        };
		$.ajax({
			url: "${APP_PATH}/admin/saveCategory.do",
			type: "POST",
			data: $("#addModal form").serialize(),
			success: function(result){
				if(result.code == 0){
					//关闭模态框
					$("#addModal").modal('hide');
					//发送ajax显示最后一页
					getTags(totalRecord);
				}else{
					layer.alert(result.msg, {
					  icon: 2,
					  skin: 'layer-ext-moon' 
					})
                }
			}
		})
	})
	
	//在修改按钮上添加点击事件
	$(document).on("click",".editBtn",function(){
		//查詢分类信息
		getCategoryById($(this).attr("edit-id"));
		$("#updateModal").modal({
			backdrop:"static"
		});
	})
	
	
	/*修改分类*/
	$("#UpDateBtn").click(function(){
		//正则验证
		if(!validateCategory("#update_name")){
            return false;
        };
        var data = $("#updateModal form").serialize()
        
        console.log(data);

        $.ajax({
        	url: "${APP_PATH}/admin/updateCategory.do",
        	type: "POST",
        	data: $("#updateModal form").serialize(),
        	success: function(result){
        		if(result.code == 0){
        			$("#updateModal").modal('hide');
        			getTags(currentPage);
        		}else{
        			layer.alert(result.msg, {
  					  icon: 2,
  					  skin: 'layer-ext-moon' 
  					})
        			//alert(result.msg);
        		}
        		
        	}
        }) 
	})
	
	/*删除分类*/
	$(document).on("click",".delBtn",function(){
		var delId = $(this).attr("del-id");
		var articleTitle = $(this).attr("del-name");
		
		//清除内容
		$("#del-val").empty();
		$("#del-val").append("确认删除【"+articleTitle+"】吗？");
		
		
		layer.open({
		    type:1,//弹出1个页面层
		    title:'<span style="color: #339ef7;font-size: 17px;">确认删除</span>',
		    shadeClose: true, //点击遮罩关闭
		    area:["350px","150px"],
		    shadeClose:true,
		    skin: 'layer-ext-moon',
		    content:$("#layerout"),
		    btn: ['确定','取消'],
		    yes : function(index) {  
		    	$.ajax({
					url: "${APP_PATH}/admin/deleteCategory.do",
					type: "GET",
					data: "id="+delId,
					success: function(result){
						if(result.code == 0){
							//关闭弹出层
							layer.close(index); 
							//回到当前页面
							getTags(currentPage);
						}else{
							//关闭弹出层
							layer.close(index);
							layer.alert(result.msg, {
							  icon: 2,
							  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
							})
							//alert(result.msg);	
						}
					}
		    	}) 
		    }
		})
	})
	

	
	//根据id查询员工
	function getCategoryById(id){
		$.ajax({
			url: "${APP_PATH}/admin/getCategoryById.do?id="+id,
			type: "GET",
			success: function(result){
				if(result.code == 0){
					var category = result.data.category;
					$("#update_id").val(category.id);
					$("#update_name").val(category.typeName);
					$("#update_num").val(category.blog);
					$("#update_status input[name=status]").val([category.status]);
				}else{
					layer.alert(result.msg, {
					  icon: 2,
					  skin: 'layer-ext-moon' 
					})
				}
			}
		})
	}
	
	
	//检验分类名称
	function validateCategory(el) { 
		var msg = $(el).val();
		if(msg.length==0) { 
			showValidate(el, "error", "分类名称不能为空");
			return false; 
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
</script>
</html>
    