package com.huaxin.webexam.utils;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtil {
	static String url;
	static String user;
	static String pwd;
	static ComboPooledDataSource cpds;
	static {
		cpds = new ComboPooledDataSource();
		// try {
		// /** 配置文件 **/
		// Properties properties = new Properties();
		// InputStream in =
		// JdbcUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
		// // 加载文件
		// properties.load(in);
		// // 动态获取账号密码
		// url = properties.getProperty("url");
		// user = properties.getProperty("user");
		// pwd = properties.getProperty("pwd");
		// System.out.println(url + " " + user + " " + "pwd");
		// /** 注册驱动 **/
		// Class.forName(properties.getProperty("forName"));
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
	}

	/** 获取连接 **/
	public static Connection getConn() throws SQLException {
		return cpds.getConnection();
		// Connection connection = DriverManager.getConnection(url, user, pwd);
	}

	//
	// public static void closeResource(ResultSet resultSet, PreparedStatement
	// stmt, Connection conn) {
	// if (resultSet != null) {
	// try {
	// resultSet.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// } finally {
	// resultSet = null;
	// }
	// }
	// //
	// if (stmt != null) {
	// try {
	// stmt.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// } finally {
	// stmt = null;
	// }
	// }
	// //
	// if (conn != null) {
	// try {
	// conn.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// } finally {
	// conn = null;
	// }
	// }
	//
	// }

}
