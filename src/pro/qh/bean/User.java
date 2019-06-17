package pro.qh.bean;

import java.io.Serializable;
import java.sql.Date;

import net.sf.json.JSONObject;

public class User implements Serializable {
	//0:禁止登录
	public static final Long _0 = new Long(0);
	//1:有效
	public static final Long _1 = new Long(1);
	private Integer id;
	//用户名
	private String username;
	//密码
	private String password;
	//用户权限
	private long roleId;
	private String email;
	//创建时间
	private Date createTime;
	//修改时间
	private Date updateTime;
	//1:有效，0:禁止登录
    private Long status;
    
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(Integer id, String username, String password, long roleId, String email, Date createTime,
			Date updateTime, Long status) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.roleId = roleId;
		this.email = email;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", roleId=" + roleId
				+ ", email=" + email + ", createTime=" + createTime + ", updateTime=" + updateTime + ", status="
				+ status + "]";
	}
}
