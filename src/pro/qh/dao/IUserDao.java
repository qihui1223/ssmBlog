package pro.qh.dao;

import java.util.Set;

import pro.qh.bean.User;

public interface IUserDao {

	int checkUsername(String username);

	int insertUser(User user);

	User checkLogin(User user);

	Set<String> selectRoles(String username);

	Set<String> selectPermissions(String username);

	User selectUserName(String username);

}
