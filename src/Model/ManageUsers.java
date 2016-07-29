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
	
}
