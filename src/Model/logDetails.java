package Model;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class logDetails {

public boolean insertLog (String email){

	try {
		Connection conn = JavaMethods.getConnection();
		
		String sqlstatement = "select * from gggameshopv2.users where Email = ?";
		
		String sqlstatement2 = "insert into gggameshopv2.log "
				+ "(UserID, UserName, Email, IPaddress, LoginDateTime) values (IFNULL(?,0),IFNULL(?,'Unknown'),IFNULL(?,'Unknown'),IFNULL(?,'Unknown'),IFNULL(now(),'Unknown'))";
		
		PreparedStatement pstmt = conn.prepareStatement(sqlstatement);
		
		PreparedStatement pstmt2 = conn.prepareStatement(sqlstatement2);
		
		pstmt.setString(1, email);
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
		
			pstmt2.setString(1, rs.getString("UserID"));
			pstmt2.setString(2, rs.getString("UserName"));
		}
		pstmt2.setString(3, email);
		String ip = InetAddress.getLocalHost().toString();
		pstmt2.setString(4, ip);
		System.out.println(ip);
		
		int recs = pstmt2.executeUpdate();
		return recs >0;
		

		} catch (Exception e) {}
	return false;
	}

public ArrayList<log> generateLog (){
	
	ArrayList<log> logData = new ArrayList<log>();

	try {
		Class.forName("com.mysql.jdbc.Driver");

		String connURL = "jdbc:mysql://localhost/gggameshopv2?user=root&password=root";

		Connection conn = DriverManager.getConnection(connURL);
		
		String sqlstatement = "select * from gggameshopv2.log";
			
		PreparedStatement pstmt = conn.prepareStatement(sqlstatement);
		
		ResultSet rs = pstmt.executeQuery();
		
		  while (rs.next()){
			  String UserId = rs.getString("UserId");
			  String Username = rs.getString("UserName");
			  String Email = rs.getString("Email");
			  String IPaddress = rs.getString("IPaddress");
			  String DateTime = rs.getString("LoginDateTime");
			  
			  log data = new log(UserId, Username, Email, IPaddress, DateTime);
			  logData.add(data);
			  System.out.println(logData);
		  }
			
		  return logData;

		} catch (Exception e) {
			System.out.println(e);
		}
	return null;
	}

	
	
}


