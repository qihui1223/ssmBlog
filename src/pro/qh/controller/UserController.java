package pro.qh.controller;


import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pro.qh.bean.User;
import pro.qh.common.ServerResponse;
import pro.qh.service.IUserService;
import pro.qh.util.CryptographyUtil;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Autowired
	private IUserService service;
	
	/**
	 * 跳转登录界面
	 * @return
	 */
	@RequestMapping(value="toLogin.do")
	public String toLogin(){
		return "/login.jsp";
	}
	
	/**
	 * 跳转注册界面
	 * @return
	 */
	@RequestMapping(value="toRegister.do")
	public String toRegister(){
		return "/register.jsp";
	}
	
	/**
	 * 登录 shiro验证
	 * @param user
	 * @return
	 */
	@RequestMapping(value="logined.do")
	@ResponseBody
	public ServerResponse<User> login111(User user){
		String username = user.getUsername();
		int count = service.findUsername(username);
		if(count == 0){
			return ServerResponse.createByErrorMessage("用户名不存在");
		}
		//为每个请求创建一个Subject,
		Subject currentUser = SecurityUtils.getSubject();
		//MD5加密
		String password = CryptographyUtil.md5Pwd(user);
		//生成token令牌, 用户名/密码
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),password);
		try {
			//登录
			currentUser.login(token);
			//设置密码为空
			user.setPassword(StringUtils.EMPTY);
			Session session = currentUser.getSession();
			
			/*System.out.println("sessionId:"+session.getId());
			System.out.println("sessionHost:"+session.getHost());
			System.out.println("sessionTimeout:"+session.getTimeout());*/
			session.setAttribute("info", user);
			
			return ServerResponse.createBySuccessMessage("登录成功");
		} catch (AuthenticationException e) {
			//e.printStackTrace();
			return ServerResponse.createByErrorMessage("密码错误"+e.getMessage());
		}
	}
	
	/**
	 * 登录
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value="login.do")
	@ResponseBody
	public ServerResponse<User> login(User user){
		String username = user.getUsername();
		int count = service.findUsername(username);
		if(count == 0){
			return ServerResponse.createByErrorMessage("用户名不存在");
		}
		//为每个请求创建一个Subject,
		System.out.println("login");
		Subject currentUser = SecurityUtils.getSubject();
		//MD5加密
		String password = CryptographyUtil.md5Pwd(user);
		//生成token令牌, 用户名/密码
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),password);
		try {
			//登录
			currentUser.login(token);
			//设置密码为空
			//user.setPassword(StringUtils.EMPTY);
			//获取用户session(如果当前用户没有常见session的话,true则创建一个并返回,false为返回null)  
		    //Session session = currentUser.getSession(true);
		    /*System.out.println("sessionId:"+session.getId());
			System.out.println("sessionHost:"+session.getHost());
			System.out.println("sessionTimeout:"+session.getTimeout());*/
			//session.setAttribute("session", user);

		}catch (AuthenticationException ae) {
            //unexpected condition?  error?
			return ServerResponse.createByErrorMessage("登录失败,用户名或密码错误");
        }	
		
		return ServerResponse.createBySuccessMessage("登录成功");
	}
	
	/**
	 * 注册
	 * @param user
	 * @param model
	 * @return
	 */
	//@RequestMapping(value="register.do")
	@ResponseBody
	public ServerResponse<String> submitRegister(User user){
		String username = user.getUsername();
		int count = service.findUsername(username);
		if(count > 0){
			return ServerResponse.createByErrorMessage("用户名已存在");
		}
		
		//增加权限控制
		user.setRoleId(1);
		
		//MD5加密
		String password = CryptographyUtil.md5Pwd(user);
		user.setPassword(password);
		System.out.println(user);
		//查询用户是否存在
		int resultCount = service.addUser(user);
		if(resultCount == 0){
			return ServerResponse.createByErrorMessage("注册失败");
		}else{
			return ServerResponse.createBySuccessMessage("注册成功");
		}
	}
	
	
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	/*@RequestMapping(value="login.do")
	@ResponseBody
	public ServerResponse<User> login(User user){
		String username = user.getUsername();
		int count = service.findUsername(username);
		if(count == 0){
			return ServerResponse.createByErrorMessage("用户名不存在");
		}
		
		//MD5加密
		UserManager.md5Pwd(user);
		//检验用户及密码是否正确
		User name = service.selectLogin(user);
		if(name == null){
            return ServerResponse.createByErrorMessage("密码错误");
        }
		//设置密码为空
		user.setPassword(StringUtils.EMPTY);
		return ServerResponse.createBySuccessMessage("登录成功");
	}*/
}
