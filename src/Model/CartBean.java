package model;
import java.sql.*;


public class CartBean {

	public CartItemBean cartList (String GameID, String Title, String Description, String logoURL, String price, String stock, String total) throws Exception{
		
			  CartItemBean cart = new CartItemBean();
			  
			  try {
			 Connection conn = JavaMethods.getConnection();
			  String sqlStr = "Select * from gggameshopv2.games where GameID=?";
			  PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			  pstmt.setString(1, GameID);
			  ResultSet rs = pstmt.executeQuery();
			  while (rs.next()){
						String gameID = rs.getString("GameID");
						String title = rs.getString("Title");
						String description = rs.getString("Description");
						String logoURL1 = rs.getString("logoURL");
						double price1 = rs.getDouble("price");
						int stock1 = Integer.parseInt(stock);
						//cart.setStock(stock1);
						double total1 = stock1*price1;
						cart = new CartItemBean(gameID,title,description,logoURL1,price1,stock1,total1);
						
						System.out.println(gameID);						
			  }
			  
			  return cart;
				} catch (NumberFormatException | ClassNotFoundException ex) {
					// TODO Auto-generated catch block
					
					System.out.println(ex);
					ex.printStackTrace();
					return null;
					
				}
			  
	}
	
	public boolean checkQuantity (String GameID, String stock) throws Exception{
		Connection conn = JavaMethods.getConnection();
		  String sqlStr = "Select * from gggameshopv2.games where GameID=?";
		  PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		  pstmt.setString(1, GameID);
		  ResultSet rs = pstmt.executeQuery();
		  boolean check = false;
		  while (rs.next()){
					int stock1 = Integer.parseInt(stock);
					int quantity = rs.getInt("stock");
					if(stock1 <= quantity){
						check = true;
					}
					else{
						check = false;  
					}
		  }
		return check;		
		  
	}
	
	
}
