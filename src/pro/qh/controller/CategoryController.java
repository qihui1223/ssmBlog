package pro.qh.controller;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pro.qh.bean.Category;
import pro.qh.bean.Msg;
import pro.qh.service.ICategoryService;

@Controller
@RequestMapping(value="/admin")
public class CategoryController {

	@Autowired
	private ICategoryService service;
	
	
	
	/**
	 * 跳转到分类
	 * @return
	 */
	@RequestMapping(value="toTags.do")
	public String tags(){
		return "/WEB-INF/admin/tags.jsp";
	}
	
	
	@RequestMapping(value="getCategory.do", method=RequestMethod.GET)
	@ResponseBody
	public Msg getCategory(){
		List<Category> tags = service.getTags();
		return Msg.success(0, "查询成功").add("tags", tags);
	}
	
	/**
	 * 查询所有的分类信息
	 * 分页查询
	 * @param num
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getCategoryPage.do", method=RequestMethod.GET)
	@ResponseBody
	public Msg getCategoryPage(@RequestParam(value="num",defaultValue="1")Integer num,
			Model model){

		//引用PageHelper插件
		//在查询之前需要调用传入页码,以及每页大小
		PageHelper.startPage(num,5);
		//startPage后面紧跟的这个查询就是分页查询
		//List<Blog> blog = blogService.getArticles();
		List<Category> tags = service.getTags();
		//使用pageInfo包装查询过后的结果,只需要将pageInfo交给页面就行
		//封装了详细的分页信息,包括我们查询出来的数据,传入连续显示的页数
		PageInfo<Category> pageInfo = new PageInfo<Category>(tags,5);
		return Msg.success(0,"成功").add("pageInfo",pageInfo);
	}
	
	
	/**
	 * 通过id查询分类信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="getCategoryById.do", method=RequestMethod.GET)
	@ResponseBody
	public Msg getCategoryById(@RequestParam(value="id")Integer id){
		Category category = service.getCategoryById(id);
		return Msg.success(0, "查询成功").add("category", category);
		
	}
	
	/**
	 * 保存分类
	 * @param typeName
	 * @param status
	 * @return
	 */
	@RequestMapping(value="saveCategory.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveCategory(@RequestParam(value="typeName") String typeName,
			@RequestParam(value = "status") Integer status){
		
		Category category = new Category();
		category.setTypeName(typeName);
		category.setStatus(status);
		
		int resultCount = service.addCategory(category);
		
		if(resultCount == 0){
			return Msg.fail(1, "保存失败");
		}else{
			return Msg.success(0, "保存成功");
		}
	}
	
	/**
	 * 修改分类信息
	 * @param categoryId
	 * @param typeName
	 * @param status
	 * @return
	 */
	@RequestMapping(value="updateCategory.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateCategory(@RequestParam(value="categoryId") Integer categoryId,
			@RequestParam(value="typeName") String typeName,
			@RequestParam(value = "status") Integer status){
		
		Category category = new Category();
		category.setId(categoryId);
		category.setTypeName(typeName);
		category.setStatus(status);
		
		int result = service.modifyCategory(category);
		
		if(result == 0){
			
			return Msg.fail(1, "保存失败");
		}else{
			return Msg.success(0, "保存成功");
		}
	}
	
	/**
	 * 删除分类
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteCategory.do", method=RequestMethod.GET)
	@ResponseBody
	public Msg removeCategory(@RequestParam("id") Integer id){
		
		  Category category = service.getCategoryById(id);

		  List list = new ArrayList(category.getBlog());
		  String count_String = list.get(0).toString();
		  int count = Integer.parseInt(count_String);
		  
		  if(count > 0){
			  return Msg.fail(1, "该分类下有文章,无法删除!");
		  }else{
			  
			  Boolean result = service.removeCategory(id);
			  if(result){
				  return Msg.success(0, "删除成功");
			  }else{
				  return Msg.fail(1,"删除失败!");
			  }	  
		 }

	}
	
}
