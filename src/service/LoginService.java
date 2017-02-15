package service;

import bean.User;
import databaseutil.UseDB;

public class LoginService {
	public User getUser(String username){
		UseDB udb = new UseDB();
		User user = udb.selectUser(username);
		return user;
	}
}
