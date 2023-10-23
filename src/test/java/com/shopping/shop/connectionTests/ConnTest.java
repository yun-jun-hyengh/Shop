package com.shopping.shop.connectionTests;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class ConnTest {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:6000/ssj?useSSL=false&serverTimezone=Asia/Seoul";
	private static final String USER = "ssjshop";
	private static final String PWD ="ssjshop";
	
	@Test
	public void testConn() throws Exception {
		Class.forName(DRIVER);
		try(Connection conn = DriverManager.getConnection(URL, USER, PWD)){
			System.out.println(conn);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
