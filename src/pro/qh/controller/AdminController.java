package pro.qh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class AdminController {

	
	
	/**
	 * 跳转到主页
	 * @return
	 */
	@RequestMapping(value="main.do")
	public String admin(){
		return "/WEB-INF/admin/main.jsp";
	}
	
	/**
	 * 跳转到个人页
	 * @return
	 */
	@RequestMapping(value="profile.do")
	public String profile(){
		return "/WEB-INF/admin/profile.jsp";
	}
	
	/**
	 * 跳转到blog编辑
	 * @return
	 */
	@RequestMapping(value="toArticle.do")
	public String article(){
		return "/WEB-INF/admin/article.jsp";
	}
	
	/**
	 * 跳转到ckEditor编辑
	 * @return
	 */
	@RequestMapping(value="toCkArticle.do")
	public String ckarticle(){
		return "/WEB-INF/admin/ckArticle.jsp";
	}
	
	/**
	 * 跳转到文章列表
	 * @return
	 */
	@RequestMapping(value="articleContent.do")
	public String articleContent(){
		return "/WEB-INF/admin/articleContent.jsp";
	}
	
	/**
	 * 跳转到分类列表
	 * @return
	 */
	@RequestMapping(value="toCategory.do")
	public String category(){
		return "/WEB-INF/admin/adminCategory.jsp";
	}
	
}
