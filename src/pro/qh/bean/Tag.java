package pro.qh.bean;

public class Tag {
	private Integer id;
	//分类名称
	private String typeName;
	//状态, 0为显示,1为隐藏
	private String describe;
	
	public Tag() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tag(Integer id, String typeName, String describe) {
		super();
		this.id = id;
		this.typeName = typeName;
		this.describe = describe;
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

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	@Override
	public String toString() {
		return "Tag [id=" + id + ", typeName=" + typeName + ", describe=" + describe + "]";
	}
}
