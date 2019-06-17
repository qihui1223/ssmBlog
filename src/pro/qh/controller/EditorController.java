package pro.qh.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pro.qh.bean.Blog;
import pro.qh.bean.Msg;
import pro.qh.service.IBlogService;

@Controller
@RequestMapping(value="/admin")
public class EditorController {

	@Autowired
	private IBlogService blogService;
	
	/**
	 * 保存文章
	 * @param request
	 * @param response
	 * @param edmdDoc
	 * @param edmdHtml
	 * @return
	 */
	@RequestMapping(value="savearticle.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveArticle(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="dId") Integer dId,
			@RequestParam(value = "editorhtml", required = false) String edmdHtml) {
		
		Blog blog = new Blog();
		blog.setdId(dId);
		blog.setTitle(request.getParameter("title"));
		blog.setContent(edmdHtml);
	
		int resultCount = blogService.addBlog(blog);
		if(resultCount == 0){
			return Msg.fail(1, "保存失败");
		}else{
			return Msg.success(0, "保存成功");
		}
	}
}
