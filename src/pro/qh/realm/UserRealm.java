package pro.qh.realm;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pro.qh.bean.User;
import pro.qh.service.IUserService;

@Service("userRealm")
public class UserRealm extends AuthorizingRealm {
	
	@Autowired
	private IUserService userService;

	/**
	 * 为当前登录的用户赋予角色与权限
	 * @param principal
	 * @return
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
		String username = (String) principal.getPrimaryPrincipal();
		//身份授权
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		//注意这里的setRoles和setStringPermissions需要的都是一个Set<String>类型参数,即不可以重复
		
		//角色授权
		authorizationInfo.setRoles(userService.setRole(username));
		//权限授权
		authorizationInfo.setStringPermissions(userService.setPermissions(username));
		
		
		return authorizationInfo;
	}

	/**
	 * 验证当前登录的用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// 获取当前用户
		String username = (String) token.getPrincipal();
		//从数据库中查询此用户是否存在
		User user = userService.findByUserName(username);
		if(user != null){
			AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user.getUsername(),user.getPassword(),getName());
			return authenticationInfo;
		}
		
		return null;
	}

}
