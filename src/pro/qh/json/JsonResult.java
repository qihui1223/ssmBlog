package pro.qh.json;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.support.RequestContext;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;

public class JsonResult {

	private int status;

	private String msg;

	@JsonProperty("data")
	@JsonInclude(JsonInclude.Include.NON_NULL) 
	private Object data;

	public JsonResult() {
		status = 0;
		msg = "ok";
	}

	// 错误时的构造器
	private JsonResult(int status, String msg) {
		this.status = status;
		this.msg = msg;
	}
	
	/**
	 * 直接返回ok
	 * @return
	 */
	public static JsonResult ok(){
		int code = ResultCodeEnum.OK.getCode();
        String message = ResultCodeEnum.OK.getMsg();
		JsonResult jr = new JsonResult(code,message);
		return jr;
	}

	public static JsonResult code(ResultCodeEnum error){		
        int code = error.getCode();
        String message = error.getMsg();
		JsonResult jr = new JsonResult(code,message);
		return jr;
	}
	
	public static JsonResult code(ResultCodeEnum error,HttpServletRequest request){	
		int code = error.getCode();
        RequestContext req = new RequestContext(request);
		String message = req.getMessage(code + "");
		JsonResult jr = new JsonResult(code,message);
		return jr;		
	}
	
	public static JsonResult code(ResultCodeEnum error,String msg){	
		int code = error.getCode();
		String message = msg;
		JsonResult jr = new JsonResult(code,message);
		return jr;		
	}

	public static JsonResult data(Object data){
		JsonResult jr = new JsonResult(
				ResultCodeEnum.OK.getCode(),
				ResultCodeEnum.OK.getMsg());
		jr.setData(data);
		return jr;
	}
	
	public static JsonResult data(Object data,HttpServletRequest request){
		int code = ResultCodeEnum.OK.getCode();
        RequestContext req = new RequestContext(request);
		String message = req.getMessage(code + "");
		JsonResult jr = new JsonResult(code,message);
		jr.setData(data);
		return jr;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}	

}