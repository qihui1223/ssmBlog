package pro.qh.bean;

import java.util.Date;

public class Blog {

	private Integer id;
	//文章标题
	private String title;
	//html文章内容
	private String content;
	//markdown内容
	private String md;
	//文章类型
	private Integer dId;
	//创建时间
	private Date createdtime;
	//修改时间
	private Date updatetime;
	
	//查询blog的同时查询分类
	private Category category;
	
	public Blog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Blog(Integer id, String title, String content, String md, Integer dId, Date createdtime, Date updatetime,
			Category category) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.md = md;
		this.dId = dId;
		this.createdtime = createdtime;
		this.updatetime = updatetime;
		this.category = category;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMd() {
		return md;
	}

	public void setMd(String md) {
		this.md = md;
	}

	public Integer getdId() {
		return dId;
	}

	public void setdId(Integer dId) {
		this.dId = dId;
	}

	public Date getCreatedtime() {
		return createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Blog [id=" + id + ", title=" + title + ", content=" + content + ", md=" + md + ", dId=" + dId
				+ ", createdtime=" + createdtime + ", updatetime=" + updatetime + ", category=" + category + "]";
	}
}
