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
import models.Drone;

public class DronesService {

	private Connection conn;
	private ResultSet res;
	private Statement stmt;
	private PreparedStatement pstmt;
	private int status;
	private String query;
	
	public DronesService() {
		conn = null;
		stmt = null;
		pstmt = null;
		status = 0;
		query = "";
	}
	
	public List<Drone> getDroneStub(){
		return Arrays.asList(
					new Drone(1, "Drone-Stub-Title-1", "Drone-Stub-Desc-1", null, 0),
					new Drone(2, "Drone-Stub-Title-2", "Drone-Stub-Desc-2", null, 0),
					new Drone(2, "Drone-Stub-Title-2", "Drone-Stub-Desc-2", null, 0)
		);
	}
	public List<Drone> getDroneFromDb(){
		List<Drone> drones = new ArrayList<Drone>();
		try {
			conn = DbProvider.getOracleConnection();
			stmt = conn.createStatement();
			res = stmt.executeQuery("select * from DRONES");
			while(res.next()) {
				int id = res.getInt("DRONE_ID");
				String name = res.getString("DRONE_NAME");
				String desc = res.getString("DRONE_DESC");
				String image = res.getString("IMAGE");
				int categoryId = res.getInt("CAT_ID");
				Drone dron = new Drone(id, name, desc, image, categoryId);
				drones.add(dron);
				
			}
			res.close();
			stmt.close();
			conn.close();
		}catch(ClassNotFoundException e) {
			System.out.println("getDroneFromDb-ClassnotFoundException: " + e.getMessage());
			
		}catch(SQLException e) {
			System.out.println("getDroneFromDb-SQLException: " + e.getMessage());
			
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
				System.out.println("getDroneFromDb-SQLException-2: " + e.getMessage());
		
			}
		}
		return drones;
	}
	
	public boolean createDrone(String droneName, String droneDesc, String image, int categoryId) {
		boolean success = false;
		List<Drone> drones = new ArrayList<Drone>();
		try {
			conn = DbProvider.getOracleConnection();
			
			query = "insert into DRONES";
			query += " (DRONE_NAME, DRONE_DESC, IMAGE, CAT_ID)";
			query += " values (?, ?, ?, ?)";		
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, droneName);
			pstmt.setString(2, droneDesc);
			pstmt.setString(3, image);
			pstmt.setInt(4, categoryId);
			status = pstmt.executeUpdate();
			
			if(status != 0) {
				success = true;
			}
			
			pstmt.close();
			conn.close();
		}catch(ClassNotFoundException e) {
			System.out.println("createDrone-ClassnotFoundException: " + e.getMessage());
			
		}catch(SQLException e) {
			System.out.println("createDrone-SQLException: " + e.getMessage());
			
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {
				System.out.println("createDrone-SQLException-2: " + e.getMessage());
		
			}
		}
		return success;
	}
	
	public Drone getDronById(int dronId) {
		Drone drone = null;
		try {
			conn = DbProvider.getOracleConnection();
			query = "select * from DRONES where DRONE_ID=?";	
			pstmt = conn.prepareStatement(query);	
			pstmt.setInt(1, dronId);
			res = pstmt.executeQuery();
			
			if(res.next()) {
				int id = res.getInt("DRONE_ID");
				String name = res.getString("DRONE_NAME");
				String desc = res.getString("DRONE_DESC");
				String image = res.getString("IMAGE");
				int categoryId = res.getInt("CAT_ID");
				drone = new Drone(id, name, desc, image, categoryId);
			}
			
			res.close();
			pstmt.close();
			conn.close();
		}catch(ClassNotFoundException e) {
			System.out.println("getDronById-ClassnotFoundException: " + e.getMessage());
			
		}catch(SQLException e) {
			System.out.println("getDronById-SQLException: " + e.getMessage());
			
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {
				System.out.println("getDronById-SQLException-2: " + e.getMessage());
		
			}
		}
		return drone;
	}
	
}
