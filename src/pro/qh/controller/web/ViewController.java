package pro.qh.controller.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pro.qh.bean.Blog;
import pro.qh.bean.Category;
import pro.qh.bean.Msg;
import pro.qh.service.IBlogService;
import pro.qh.service.ICategoryService;



@Controller
public class ViewController {

	
	@Autowired
	private IBlogService blogService;
	@Autowired
	private ICategoryService categoryService;
	
	
	/**
	 * 跳转首页
	 * @return
	 */
	@RequestMapping(value="/toMain.do")
	public String main(){
		return "index.jsp"; 
	}
	
	/**
	 * 主页
	 * @return
	 */
	@RequestMapping(value="/main.do")
	@ResponseBody
	public Msg getAticles(@RequestParam(value="num",defaultValue="1")Integer num,
			@RequestParam(value="size",defaultValue="3")Integer size,
			Model model){
		//引用PageHelper插件
		//在查询之前需要调用传入页码,以及每页大小
		PageHelper.startPage(num,size);
		//startPage后面紧跟的这个查询就是分页查询
		List<Blog> blog = blogService.getArticles();
		//使用pageInfo包装查询过后的结果,只需要将pageInfo交给页面就行
		//封装了详细的分页信息,包括我们查询出来的数据,传入连续显示的页数
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(blog,5);
		return Msg.success(0,"成功").add("pageInfo",pageInfo);	
	}
	
	/**
	 * 分类
	 * @return
	 */
	@RequestMapping(value="category.do", method=RequestMethod.GET)
	public ModelAndView getCategory(){
		ModelAndView mv = new ModelAndView();
		List<Category> category = categoryService.getTags();
		mv.addObject("category", category);
		mv.setViewName("/WEB-INF/views/category.jsp");
		return mv;
		
	}
	
	/**
	 * 标签
	 * @return
	 */
	@RequestMapping(value="tags.do")
	public String Tags(){
		return "/WEB-INF/views/tags.jsp";
	}
	
	/**
	 * 归档
	 * @return
	 */
	@RequestMapping(value="archives.do")
	public String archives(){
		return "/WEB-INF/views/archives.jsp";
	}
	
	/**
	 * 关于
	 * @return
	 */
	@RequestMapping(value="about.do")
	public String about(){
		return "/WEB-INF/views/about.jsp";
	}
	
	
	/**
	 * 详情页
	 * @return
	 */
	@RequestMapping(value="detail.do",method=RequestMethod.GET)
	public ModelAndView detail(@RequestParam("id") Integer id){
		ModelAndView mv = new ModelAndView();
		Blog blog = blogService.getArticleById(id);
		mv.addObject("article", blog);
		mv.setViewName("/WEB-INF/views/detail.jsp");
		return mv;
	}
	
	/**
	 * 文章搜索
	 * @param request
	 * @param response
	 * @param title
	 * @return
	 */
	@RequestMapping(value="search.do",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView serach(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("title") String title
			){
		ModelAndView mv = new ModelAndView();
		List<Blog> blog = blogService.seachByArticle(title);
		mv.addObject("blog", blog);
		mv.setViewName("/WEB-INF/views/search.jsp");
		return mv;
		
	}
	
	/**
	 * 头部
	 * @return
	 */
	@RequestMapping(value="head.do")
	public String head(){
		return "/WEB-INF/views/head.jsp";
	}
}
