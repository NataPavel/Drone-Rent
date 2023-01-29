package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import data.DbProvider;
import models.Category;

public class CategoriesService {
	
	private Connection conn;
	private ResultSet res;
	private Statement stmt;
	private PreparedStatement pstmt;
	private int status;
	private String query;
	
	public CategoriesService() {
		conn = null;
		stmt = null;
		pstmt = null;
		status = 0;
		query = "";
	}
	
	public List<Category> getCategoryStub(){
		return Arrays.asList(
				new Category(1, "Category-Stub-Title-1"),
				new Category(2, "Category-Stub-Title-2"),
				new Category(2, "Category-Stub-Title-2")
				);
	}
	
	public List<Category> getCategoryFromDb(){
		List<Category> categories = new ArrayList<Category>();
		try {
			conn = DbProvider.getOracleConnection();
			stmt = conn.createStatement();
			res = stmt.executeQuery("select * from CATEGORIES");
			while(res.next()) {
				int id = res.getInt("CAT_ID");
				String name = res.getString("CAT_NAME");
				Category cat = new Category(id, name);
				categories.add(cat);
				
			}
			res.close();
			stmt.close();
			conn.close();
		}catch(ClassNotFoundException e) {
			System.out.println("getCategoryFromDb-ClassnotFoundException: " + e.getMessage());
			
		}catch(SQLException e) {
			System.out.println("getCategoryFromDb-SQLException: " + e.getMessage());
			
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
				System.out.println("getCategoryFromDb-SQLException-2: " + e.getMessage());
		
			}
		}
		return categories;
	}

}
