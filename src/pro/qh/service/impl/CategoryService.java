package pro.qh.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pro.qh.bean.Category;
import pro.qh.dao.ICategoryDao;
import pro.qh.service.ICategoryService;

@Service("categoryService")
public class CategoryService implements ICategoryService {

	@Autowired
	private ICategoryDao dao;
	
	@Override
	public List<Category> getTagsAll() {
		return dao.selectTags();
	}

	@Override
	public List<Category> getTags() {
		return dao.selectCategory();
	}

	@Override
	public Category getCategoryById(Integer id) {
		return dao.selectCategoryById(id);
	}

	@Override
	public int addCategory(Category category) {
		return dao.saveCategory(category);
	}

	@Override
	public int modifyCategory(Category category) {
		return dao.updateCategory(category);
	}

	@Override
	public Boolean removeCategory(Integer id) {
		return dao.deleteCategory(id);
	}


}
