package com.ecommerce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private Connection connection;
	
	public DBConnection(String dbURL, String user, String pwd) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		this.connection=DriverManager.getConnection(dbURL,user,pwd);
			
	}
	
	public Connection getConnection() {
		return this.connection;
	}
	
	public void closeConnection() {
		if(this.connection != null) {
			try {
				this.connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
