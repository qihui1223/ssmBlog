package pro.qh.service;

import java.util.List;

import pro.qh.bean.Category;

public interface ICategoryService {

	List<Category> getTagsAll();


	List<Category> getTags();


	Category getCategoryById(Integer id);


	int addCategory(Category category);


	int modifyCategory(Category category);


	Boolean removeCategory(Integer id);

}
