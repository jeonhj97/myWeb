package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	//오라클 데이터베이스 연결 메소드
	public Connection getConnection() {
		
	//오라클 DB 연결 정보
		String url     ="jdbc:oracle:thin:@localhost:1521:xe";      
	    String user    ="system";
	    String password="1234";
	    String driver  ="oracle.jdbc.driver.OracleDriver";
	
	Connection con=null;
	
	try {
		Class.forName(driver);
		con=DriverManager.getConnection(url, user, password);
	}catch(Exception e){
		System.out.println("DB실패:"+e);
	}//end

	return con;
		
	}//getConnection() end
}//class end
