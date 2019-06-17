package pro.qh.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的类
 * @author qihui
 *
 */


public class Msg {
	//状态码  100-成功    200-失败
	private int code;
	//提示信息
	private String msg;
	
	private Map<String, Object> data = new HashMap<String, Object>();

	public Msg() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Msg(int code, String msg, Map<String, Object> data) {
		super();
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	
	
	public static Msg success(int code, String successMsg){
		Msg result = new Msg();
		result.setCode(code);
		result.setMsg(successMsg);
		return result;
	}
	
	public static Msg fail(int code, String failMsg){
		Msg result = new Msg();
		result.setCode(code);
		result.setMsg(failMsg);
		return result;
	}
	
	public Msg add(String key,Object value){
		this.getData().put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}
}
