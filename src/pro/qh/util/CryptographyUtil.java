package pro.qh.util;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;

import pro.qh.bean.User;

/**
 * 数据加密
 * @author qihui
 *
 */
public class CryptographyUtil {
	/**
	 * base64加密
	 * @param str
	 * @return
	 */
	public static String encBase64(String str){
		return Base64.encodeToString(str.getBytes());
	}
	
	/**
	 * base64解密
	 * @param str
	 * @return
	 */
	public static String decBase64(String str){
		return Base64.decodeToString(str);
	}
	
	/**
	 * MD5加密
	 * @param str
	 * @param salt
	 * @return
	 */
	public static String md5(String str, String salt){
		return new Md5Hash(str,salt).toString();
	}
	
	//添加user的密码加密方法
    public static String  md5Pwd(User user) {
        String hashAlgorithmName = "MD5";//加密方式  
        
        Object crdentials =user.getPassword();//密码原值  
        
        ByteSource salt = ByteSource.Util.bytes(user.getUsername()+"%s#%s#"+user.getPassword());//以账号作为盐值  
        
        int hashIterations = 10;//加密1024次  
        
        SimpleHash hash = new SimpleHash(hashAlgorithmName,crdentials,salt,hashIterations);
        
        return hash.toString();
    }  
	
	@Test
	public void test() {
		String password="1234";
		System.out.println("Base64加密："+CryptographyUtil.encBase64(password));
		System.out.println("Base64解密："+CryptographyUtil.decBase64(CryptographyUtil.encBase64(password)));
		
		System.out.println("Md5加密："+CryptographyUtil.md5(password, "java1234"));
	}
}
