package pro.qh.common;

/**
 * 使用枚举定义响应码
 * @author qihui
 *
 */
public enum ResponseCode {

	
	SUCCESS(0,"SUCCESS"), //成功
	ERROR(1,"ERROR"), //失败
	NEED_LOGIN(10,"NEED_LOGIN"), //需要登录
	ILLEGAL_ARGUMENT(2,"ILLEGAL_ARGUMENT"); //错误信息

	private final int code;
	private final String desc;
	
	ResponseCode(int code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	public int getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}	
}
