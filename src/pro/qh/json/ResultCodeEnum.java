package pro.qh.json;

public enum ResultCodeEnum {
	
	OK(0,"ok"),
	
	SYSTEM_UNKNOWN_ERROR(10001,"系统内部错误"),
	ILLEGAL_REQUEST(10002,"非法请求或资源不存在"),
	OPERATION_FAILED(10003,"操作失败"),
	OBJECT_UN_EXIST(10004,"对象不存在"),
	NOT_HAVE_PERMISSION(10005,"没有权限"),
	INTERNAL_INTERFACE_ERROR(10006,"内部接口请求错误"),
	DATABASE_EXCEPTION(10007,"数据库执行异常"),
	
	
	LOGIN_FIRST(20001,"请登录后再访问"),
	USERNAME_PASSWORD_MISMATCH(20002,"用户名或密码错误"),
	USER_DISABLED(20003,"用户被禁用"),
	VALID_CODE_ERROR(20004,"验证码错误"),
	IMAGE_VALID_CODE_REQUIRED(20005,"请提交图片验证码"),
	SMS_VALID_CODE_REQUIRED(20006,"请提交短信验证码"),
	EMAIL_VALID_CODE_REQUIRED(20007,"请提交邮件验证码"),
	REGISTER_NAME_ERROR(20008,"用户名格式错误或已经被注册"),
	VALID_CODE_OUTDATE(20009,"验证码过期或没有获取验证码"),
	OLD_PASSWORD_ERROR(20010,"原密码错误"),
	STATION_UNIT_OWN_COLLECTOR(20011,"不能删除有采集器的电站单元"),
	STATION_UNIT_NOT_EXIST(20012,"分组不存在"),
	SN_INVALID(20013,"序列号不存在或已经注册"),
	SN_INVALID_2(20014,"序列号不合法"),
	INVALID_EDIT_SHARE_STATION(20015,"不能修改共享电站"),
	REACHED_MAX_LIMIT(20016,"当前已达上限，不能再进行新增操作"),
	MOBILE_NUM_EXIST(20017,"当前手机号已经被使用"),
	DATAPLAT_REQ_ERROT(20018,"数据平台请求错误"),
	BATCHCODE_EXIST(20019,"批次号已存在"),
	ROLECODE_EXIST(20020,"权限字符已存在"),
	BATCHCOUNT_NOT_OK(20021,"批次数量不合法"),
	NAME_EXIST(20022,"名称已存在"),
	CODE_EXIST(20033,"编码已存在"),
	
	PARAMETER_ERROR(30001,"请求参数错误"),
	UPLOAD_FILE_INVALID(30002,"上传文件不合法"),
	
	PLEASE_UPDATE_CLIENT(40001,"请使用最新客户端"),
	UNSURPORT(40002,"暂不支持此功能"),
	
	Unauthorized(50001,"未授权-权限不够"),
	BUILD_IN_ROLE_DATA(50002,"系统内置角色，不允许修改或删除");
	
	
	private int code;
	
	private String msg;
	
	private ResultCodeEnum(int code,String msg){
		this.code = code;
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}	
	
}
