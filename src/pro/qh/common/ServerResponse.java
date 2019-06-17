package pro.qh.common;

import java.io.Serializable;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
//保证序列化json的时候,如果是null的对象,key也会消失
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ServerResponse<T> implements Serializable { //实现序列化接口

	private static final long serialVersionUID = 1L;
	private int status;
	private String msg;
	/**
   * 泛型在返回时可以指定里面返回的内容，也可以不指定，
   * 泛型还可以包含多种类型：String，map，list等
   */
	private T data;
	
	/**
	 * 使用了类上面那个注解，在这种情况下，只返回status，不会有msg和data
	 * @param status
	 */
	private ServerResponse(int status) {
		super();
		this.status = status;
	}

	private ServerResponse(int status, String msg) {
		super();
		this.status = status;
		this.msg = msg;
	}
	
	private ServerResponse(int status, T data) {
		super();
		this.status = status;
		this.data = data;
	}

	private ServerResponse(int status, String msg, T data) {
		super();
		this.status = status;
		this.msg = msg;
		this.data = data;
	}

	public int getStatus() {
		return status;
	}

	public String getMsg() {
		return msg;
	}

	public T getData() {
		return data;
	}
	
	/**
	 * @JsonIgnore,在json序列化时，该字段不会显示在json里面
   * 使之不在json序列化结果当中
	 * @return
	 */
	@JsonIgnore
	public boolean isSuccess(){
		return this.status == ResponseCode.SUCCESS.getCode();
	}
	
	 /*public static ServerResponse<T> createBySuccess(){}不加第一个是声明了一个方法，一个有泛型作为返回值的函数方法，
　　然后加上第一个<T>是说声明此方法持有一个类型T，也可以理解成，将此方法声明为泛型方法，第一个记住是持有的意思，如果不持有，
　　后面的Serv<T>会报错*/
	/**
   * 成功，返回一个status。
   */
	public static <T> ServerResponse<T> createBySuccess(){
		return new ServerResponse<>(ResponseCode.SUCCESS.getCode());
	}
	
	public static <T> ServerResponse<T> createBySuccessMessage(String msg){
		return new ServerResponse<>(ResponseCode.SUCCESS.getCode(),msg);
	}
	
	public static <T> ServerResponse<T> createBySuccess(T data){
      return new ServerResponse<T>(ResponseCode.SUCCESS.getCode(),data);
  }

	public static <T> ServerResponse<T> createBySuccess(String msg,T data){
		return new ServerResponse<>(ResponseCode.SUCCESS.getCode(),msg,data);
	}
	
	/**
	 * 错误,返回信息
	 */
	public static <T> ServerResponse<T> createByError(){
		return new ServerResponse<T>(ResponseCode.ERROR.getCode(),ResponseCode.ERROR.getDesc());
	}
	
	public static <T> ServerResponse<T> createByErrorMessage(String errorMessage){
		return new ServerResponse<T>(ResponseCode.ERROR.getCode(),errorMessage);
	}
	
	public static <T> ServerResponse<T> createByError(int errorCode,String errorMessage){
		return new ServerResponse<T>(errorCode,errorMessage);
	}
}
