package pro.qh.service;

import java.util.List;

import pro.qh.bean.Blog;

public interface IBlogService {

	int addBlog(Blog blog);

	List<Blog> getArticles();

	Blog getArticleById(Integer id);

	int modifyArticle(Blog blog);

	Boolean removeArticleById(Integer id);

	List<Blog> seachByArticle(String title);

}
