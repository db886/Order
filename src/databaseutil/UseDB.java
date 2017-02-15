package databaseutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.User;

public class UseDB {
	public User selectUser(String username){
		DataBaseUtil db = new DataBaseUtil();
		Connection conn = db.getConnection();

		User user = new User();
		StringBuffer sb = new StringBuffer();
		String sq = "select * from user where username=";
		String s = "\"";
		String sql = sb.append(sq).append(s).append(username).append(s).toString();
		
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
			}		
			pst.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	public int insertUser(String username,String password){
		DataBaseUtil db = new DataBaseUtil();
		Connection conn = db.getConnection();
		String sql = "insert into user values(?,?)";
		int i = 0;
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			i=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
}
