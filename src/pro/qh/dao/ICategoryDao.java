package pro.qh.dao;

import java.util.List;

import pro.qh.bean.Category;

public interface ICategoryDao {

	List<Category> selectTags();

	List<Category> selectCategory();

	Category selectCategoryById(Integer id);

	int saveCategory(Category category);

	int updateCategory(Category category);

	Boolean deleteCategory(Integer id);;
}
