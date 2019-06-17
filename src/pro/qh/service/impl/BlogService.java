package pro.qh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pro.qh.bean.Blog;
import pro.qh.dao.IBlogDao;
import pro.qh.service.IBlogService;

@Service("blogService")
public class BlogService implements IBlogService {

	@Autowired
	private IBlogDao dao;
	
	@Override
	public int addBlog(Blog blog) {
		return dao.insertBlog(blog);
	}

	@Override
	public List<Blog> getArticles() {
		return dao.selectArticle();
	}

	@Override
	public Blog getArticleById(Integer id) {
		return dao.selectArticleById(id);
	}

	@Override
	public int modifyArticle(Blog blog) {
		return dao.updateArticle(blog);
	}

	@Override
	public Boolean removeArticleById(Integer id) {
		return dao.deleteArticleById(id);
	}

	@Override
	public List<Blog> seachByArticle(String title) {
		return dao.queryArticle(title);
	}

}
