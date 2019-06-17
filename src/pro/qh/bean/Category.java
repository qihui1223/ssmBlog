package pro.qh.bean;

import java.util.Set;

public class Category {

	private Integer id;
	//分类名称
	private String typeName;
	//分类状态
	private Integer status;
	
	
	private Set<Blog> blog;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(Integer id, String typeName, Integer status, Set<Blog> blog) {
		super();
		this.id = id;
		this.typeName = typeName;
		this.status = status;
		this.blog = blog;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set<Blog> getBlog() {
		return blog;
	}

	public void setBlog(Set<Blog> blog) {
		this.blog = blog;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", typeName=" + typeName + ", status=" + status + ", blog=" + blog + "]";
	}
}
