package pro.qh.service.impl;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pro.qh.bean.User;
import pro.qh.dao.IUserDao;
import pro.qh.service.IUserService;

@Service("userSevice")
public class UserService implements IUserService {

	@Autowired
	private IUserDao dao;
	
	@Override
	public int findUsername(String username) {
		return dao.checkUsername(username);
		
	}

	@Override
	public int addUser(User user) {
		return dao.insertUser(user);
	}

	@Override
	public User selectLogin(User user) {
		return dao.checkLogin(user);
	}


	@Override
	public Set<String> setRole(String username) {
		return dao.selectRoles(username);
	}

	@Override
	public Set<String> setPermissions(String username) {
		return dao.selectPermissions(username);
	}

	@Override
	public User findByUserName(String username) {
		return dao.selectUserName(username);
	}

	

}
