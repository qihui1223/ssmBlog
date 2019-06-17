package pro.qh.dao;

import java.util.List;

import pro.qh.bean.Blog;

public interface IBlogDao {

	int insertBlog(Blog blog);

	List<Blog> selectArticle();

	Blog selectArticleById(Integer id);

	int updateArticle(Blog blog);

	Boolean deleteArticleById(Integer id);

	List<Blog> queryArticle(String title);
	
}
