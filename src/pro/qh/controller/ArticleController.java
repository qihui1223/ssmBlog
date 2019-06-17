package pro.qh.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import pro.qh.bean.Blog;
import pro.qh.bean.Msg;
import pro.qh.common.ServerResponse;
import pro.qh.service.IBlogService;
import pro.qh.util.DateUtil;

@Controller
@RequestMapping(value="/admin")
public class ArticleController {

	@Autowired
	private IBlogService blogService;
	
	/**
	 * 获取所有文章
	 * @param num
	 * @param model
	 * @return
	 */
	@RequestMapping(value="getAticles.do",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAticles(@RequestParam(value="num",defaultValue="1")Integer num,
			Model model){
		//引用PageHelper插件
		//在查询之前需要调用传入页码,以及每页大小
		PageHelper.startPage(num,5);
		//startPage后面紧跟的这个查询就是分页查询
		List<Blog> blog = blogService.getArticles();
		//使用pageInfo包装查询过后的结果,只需要将pageInfo交给页面就行
		//封装了详细的分页信息,包括我们查询出来的数据,传入连续显示的页数
		PageInfo<Blog> pageInfo = new PageInfo<Blog>(blog,5);
		return Msg.success(0,"成功").add("pageInfo",pageInfo);	
	}
	
	/**
	 * 获取文章id
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="article.do")
	public String getArticleId(@RequestParam("id") Integer id,Model model){
		//Blog blog = blogService.getArticleById(id);
		model.addAttribute("blogid", id);
		return "/WEB-INF/admin/ckEditor.jsp";
	}
	
	/**
	 * 根据id获取文章信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="getArticleById.do",method=RequestMethod.GET)
	@ResponseBody
	public Msg getArticleById(@RequestParam("id") Integer id){
		Blog blog = blogService.getArticleById(id);
		return Msg.success(0,"成功").add("article", blog);
	}
	
	/**
	 * 保存文章
	 * @param request
	 * @param response
	 * @param edmdDoc
	 * @param edmdHtml
	 * @return
	 */
	//@RequestMapping(value="savearticle.do",method=RequestMethod.POST)
	@ResponseBody
	public ServerResponse<String> saveArticle(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="dId") Integer dId,
			@RequestParam(value = "editormd", required = false) String editormd,
			@RequestParam(value = "editorhtml", required = false) String edmdHtml) {
		
		Blog blog = new Blog();
		blog.setdId(dId);
		blog.setTitle(request.getParameter("title"));
		blog.setContent(edmdHtml);
		blog.setMd(editormd);
		
		int resultCount = blogService.addBlog(blog);
		if(resultCount == 0){
			return ServerResponse.createByErrorMessage("保存失败");
		}else{
			return ServerResponse.createBySuccessMessage("保存成功");
		}
	}
	
	/**
	 * 修改文章
	 * @param request
	 * @param response
	 * @param editormd
	 * @param edmdHtml
	 * @return
	 */
	@RequestMapping(value="updateArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public Msg updateArticle(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("id") Integer id,
			@RequestParam(value="dId") Integer dId,
			@RequestParam("createdtime") String createdtime,
			@RequestParam(value = "editormd", required = false) String editormd,
			@RequestParam(value = "editorhtml", required = false) String edmdHtml){
		String dateStr;

		
		Blog blog = new Blog();
		blog.setId(id);
		blog.setdId(dId);
		blog.setContent(edmdHtml);
		blog.setMd(editormd);
		blog.setTitle(request.getParameter("title"));
		if(request.getParameter("createdtime") != null){
			dateStr = request.getParameter("createdtime").replace('/', '-');
		} else {
			dateStr = new String("2019-4-22");
		}
		Date date = DateUtil.fomatDate(dateStr);
		blog.setCreatedtime(date);
		
		int result = blogService.modifyArticle(blog);
		if(result == 1){
			return Msg.success(0,"修改成功!");
		}else {
			return Msg.fail(1,"修改失败!");
		}
	}
	
	/**
	 * 删除文章
	 * @param request
	 * @param response
	 * @param id
	 * @return
	 */
	@RequestMapping(value="deleteArticle.do",method=RequestMethod.GET)
	@ResponseBody
	public Msg deleteArticle(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("id") Integer id){
		Boolean result = blogService.removeArticleById(id);
		if(result){
			return Msg.success(0, "删除成功");
		}else{
			return Msg.fail(1,"删除失败!");
		}	
	}
	
	/**
	 * 文章搜索
	 * @param request
	 * @param response
	 * @param title
	 * @return
	 */
	@RequestMapping(value="seachArticle.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg seach(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("article") String title
			){
		List<Blog> blogs = blogService.seachByArticle(title);
		
		return Msg.success(0, "查询成功").add("blogs", blogs);
	}
}
