package model;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.regex.*;

public class JavaMethods {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	public static void connection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/gggameshopv2?user=root&password=root");
	}
	public static Connection getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost/gggameshopv2?user=root&password=root");
	}
	
	public static int autoIncrement(String IDType, String TableName) throws Exception{
		connection();
		pstmt=conn.prepareStatement("SELECT "+IDType+" FROM gggameshopv2."+TableName+";");
		rs=pstmt.executeQuery();
		int i;
		for(i=1 ; rs.next()&&i==rs.getInt(IDType) ; i++ ){
			
		}
		return i;
	}
	
	public static String hashPassword(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(password.getBytes("UTF-8"));
		byte digest[] = md.digest();
		String passString = new String(digest);
		return passString;
	}
	
	public static boolean checkString(String Check, String ToCheck){
		Pattern p = Pattern.compile(Check, Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(ToCheck);
		return m.find();
	}
	public static int counter(String String, char Character){
		int counter = 0;
		for( int i=0; i<String.length(); i++ ) {
		    if( String.charAt(i) == Character ) {
		        counter++;
		    } 
		}
		return counter;
	}
}
