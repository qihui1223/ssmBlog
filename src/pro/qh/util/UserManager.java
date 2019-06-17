package pro.qh.util;

import pro.qh.bean.User;

public class UserManager {

	
	/**
	 * 字符串返回值
	 * @param username
	 * @param password
	 * @return
	 */
	public static String md5Pwd(User user){
		String password = String.format("%s#%s#", user.getUsername(),user.getPassword());
		password = MD5Util.getMD5(password);
		return password;
	}
}
