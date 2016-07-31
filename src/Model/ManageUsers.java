package Model;

import java.sql.*;

public class ManageUsers {

	public boolean insertUser(users RegisteredUser) throws Exception{
		Connection conn = JavaMethods.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement("insert into gggameshopv2.users values (?,?,?,?,?,?)");
		pstmt.setInt(1, JavaMethods.autoIncrement("UserID", "users"));
		pstmt.setString(2, RegisteredUser.getUserName());
		pstmt.setString(3, RegisteredUser.getEmail());
		pstmt.setString(4, RegisteredUser.getAddress());
		pstmt.setInt(5, RegisteredUser.getNumber());
		pstmt.setString(6, JavaMethods.hashPassword(RegisteredUser.getPassHash()));
		
		int fail = pstmt.executeUpdate();
		return fail>0;
	}
	public boolean checkEmail(String email){
		Connection conn;
		try {
			conn = JavaMethods.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("select Email from gggameshopv2.users where Email =?");
			pstmt.setString(1, "email");
			ResultSet rs = pstmt.executeQuery();
			if (!rs.next()){
				if(!JavaMethods.checkString("^0-9a-zA-Z@.", email)){
					if(JavaMethods.counter(email, '.')>=1){
						if(JavaMethods.counter(email, '@')==1){
							return true;
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}	
			}else{
				return false;
			}
			
		} catch (Exception e) {
			return false;
		}
	}
	public boolean checkNumber(int Number){
		if(!JavaMethods.checkString("[^0-9]", Integer.toString(Number))){
			if(Integer.toString(Number).length()==8){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	public boolean checkPassword(String password){
		if(!JavaMethods.checkString("[^a-zA-Z0-9@!#$%^&*]", password)){
			if(password.length()<=16 && password.length()>=8){
				if (JavaMethods.checkString("[a-zA-Z]", password)){
					if(JavaMethods.checkString("[0-9]", password)){
						return true;
						
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	public int checkLogin(String email, String password) throws Exception{
		password = JavaMethods.hashPassword(password);
		Connection conn = JavaMethods.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("Select UserID from gggameshopv2.users where PassHash=? and Email=?");
		pstmt.setString(1, password);
		pstmt.setString(2, email);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()){
			int UserID = rs.getInt("UserID");
			pstmt = conn.prepareStatement("Select UserID from gggameshopv2.userbanned where UserID=?");
			pstmt.setInt(1, UserID);
			rs = pstmt.executeQuery();
			if (!rs.next()){
				return UserID;
			}else{
				return -1;
			}
		}else{
			return 0;
		}
	}
	public users getProfileValues(users user) throws Exception{
		Connection conn = JavaMethods.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select email, Address, number from gggameshopv2.users where UserID=?");
		pstmt.setInt(1, user.getUserID());
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		users UserDetails = new users();
		UserDetails.setEmail(rs.getString("email"));
		UserDetails.setNumber(rs.getInt("number"));
		UserDetails.setAddress(rs.getString("address"));
		return UserDetails;
	}
	public boolean updateUserEmail(users user) throws Exception{
		
		Connection conn = JavaMethods.getConnection();
		String email = user.getEmail();
		int UserID = user.getUserID();
		
		PreparedStatement pstmt = conn.prepareStatement("select email from gggameshopv2.users where email=?");
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();
		if (!rs.next()){
			pstmt = conn.prepareStatement("update gggameshopv2.users set email=? where UserID=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, UserID);
			pstmt.executeUpdate();
			return true;
		}
		else{
			return false;
		}
	}
	public boolean updateUserNumber(users user) throws Exception{
		Connection conn = JavaMethods.getConnection();
		int number = user.getNumber();
		int UserID = user.getUserID();
		
		PreparedStatement pstmt = conn.prepareStatement("select Number from gggameshopv2.users where Number=?");
		pstmt.setInt(1, number);
		ResultSet rs = pstmt.executeQuery();
		if (!rs.next()){
			pstmt = conn.prepareStatement("update gggameshopv2.users set Number=? where UserID=?");
			pstmt.setInt(1, number);
			pstmt.setInt(2, UserID);
			pstmt.executeUpdate();
			return true;
		}
		else{
			return false;
		}
	}
	public boolean updateUserAddress(users user) throws Exception{
		
		Connection conn = JavaMethods.getConnection();
		String address = user.getAddress();
		int UserID = user.getUserID();
		
		PreparedStatement pstmt = conn.prepareStatement("select address from gggameshopv2.users where address=?");
		pstmt.setString(1, address);
		ResultSet rs = pstmt.executeQuery();
		if (!rs.next()){
			pstmt = conn.prepareStatement("update gggameshopv2.users set address=? where UserID=?");
			pstmt.setString(1, address);
			pstmt.setInt(2, UserID);
			pstmt.executeUpdate();
			return true;
		}
		else{
			return false;
		}
	}
}
