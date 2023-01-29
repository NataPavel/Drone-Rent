package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import data.DbProvider;
import models.User;

public class UsersService {

	private Connection conn;
	private ResultSet res;
	private Statement stmt;
	private PreparedStatement pstmt;
	private int status;
	private String query;
	
	public UsersService() {
		conn = null;
		stmt = null;
		pstmt = null;
		status = 0;
		query = "";
	}
	
	public boolean addUser(String login, String email, String passw, String phone, int roleId, int statusId) {
		boolean success = false;
		
		try {
			query = "insert into USERS";
			query += " (USER_NAME, PASSW, EMAIL, PHONE, ROLE_ID, STATUS_ID)";
			query += " values (?, ?, ?, ?, ?, ?)";
			conn = DbProvider.getOracleConnection();
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, login);
			pstmt.setString(2, passw);
			pstmt.setString(3, email);
			pstmt.setString(4, phone);
			pstmt.setInt(5, roleId);
			pstmt.setInt(6, statusId);
			
			status = pstmt.executeUpdate();
			if(status != 0) {
				success = true;
			}
			pstmt.close();
			conn.close();
		}catch(ClassNotFoundException e) {
			System.out.println("addUser-ClassnotFoundException: " + e.getMessage());
			success = false;
		}catch(SQLException e) {
			System.out.println("addUser-SQLException: " + e.getMessage());
			success = false;
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {
				System.out.println("addUser-SQLException-2: " + e.getMessage());
				success = false;
			}
		}
		
		return success;
	}
	
	public boolean loginUser(String email, String pass) {
		boolean success = false;
	    try {
	      query = "select PASSW from USERS where EMAIl=?";
	      conn = DbProvider.getOracleConnection();
	      pstmt = conn.prepareStatement(query);
	      pstmt.setString(1, email);
	      
	      res = pstmt.executeQuery();
	      if (res.next()) {
	        String real_passw = res.getString("PASSW");
	        if(real_passw.equals(pass)) {
	          success = true;
	        }
	      }
	      else {
	        success = false;
	      }
	      res.close();
	      pstmt.close();
	      conn.close();
	    }
	    catch (ClassNotFoundException ex) {
	      System.out.println("checkSignin-ClassNotFoundException: " + ex.getMessage());
	      success = false;
	    }
	    catch (SQLException ex) {
	      System.out.println("checkSignin-SQLException: " + ex.getMessage());
	      success = false;
	    }
	    finally {
	      try {
	        if (res != null) {
	          res.close();
	        }
	        if (pstmt != null) {
	          pstmt.close();
	        }
	        if (conn != null) {
	          conn.close();
	        }
	      }
	      catch (SQLException ex) {
	        System.out.println("checkSignin-SQLException2: " + ex.getMessage());
	        success = false;
	      }
	    }
	    return success;
	}
	public List<User> getUserFromDb(){
		List<User> users = new ArrayList<User>();
		try {
			conn = DbProvider.getOracleConnection();
			stmt = conn.createStatement();
			res = stmt.executeQuery("select * from USERS");
			while(res.next()) {
				int id = res.getInt("USER_ID");
				String name = res.getString("USER_NAME");
				String passw = res.getString("USER_PASSW");
				String email = res.getString("EMAIL");
				String regDate = res.getString("REGISTRY_DATE");
				String phone = res.getString("PHONE");
				int roleId = res.getInt("ROLE_ID");
				int statusId = res.getInt("STATUS_ID");
				int mailConfirm = res.getInt("MAIL_CONFIRM");
				User user = new User(id, name, passw, email, regDate, phone, roleId, statusId,
						 mailConfirm);
				users.add(user);
				
			}
			res.close();
			stmt.close();
			conn.close();
		}catch(ClassNotFoundException e) {
			System.out.println("getUserFromDb-ClassnotFoundException: " + e.getMessage());
			
		}catch(SQLException e) {
			System.out.println("getUserFromDb-SQLException: " + e.getMessage());
			
		}finally {
			try {
				if(res != null) {
					res.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {
				System.out.println("getUserFromDb-SQLException-2: " + e.getMessage());
		
			}
		}
		return users;
	}
	
}
