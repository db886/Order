package service;

import bean.User;
import databaseutil.UseDB;

public class RegistService {
	public int regist(User user){
		UseDB ub = new UseDB();
		String username = user.getUsername();
		String password = user.getPassword();
		int reuslt = ub.insertUser(username, password);	
		return reuslt;
	}
}
