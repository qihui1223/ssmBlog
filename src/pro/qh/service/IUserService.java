package pro.qh.service;

import java.util.Set;

import org.springframework.stereotype.Service;

import pro.qh.bean.User;

@Service("userService")
public interface IUserService {

	int findUsername(String username);

	int addUser(User user);

	User selectLogin(User user);

	Set<String> setRole(String username);

	Set<String> setPermissions(String username);

	User findByUserName(String username);

}
