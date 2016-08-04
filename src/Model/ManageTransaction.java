package model;

import java.sql.*;

public class ManageTransaction {
	
	public Object[] getTransactionHistory(users User) throws Exception{
		Connection conn = JavaMethods.getConnection();
		PreparedStatement pstmt =
		conn.prepareStatement("select transaction.TransactionID, games.Title, transaction.Price, transaction.Quantity, "+
		"transaction.DatePurchased from gggameshopv2.transaction, gggameshopv2.games where games.GameID = transaction.GameID"+
		" and transaction.UserID=?");
		pstmt.setInt(1, User.getUserID());
		ResultSet rs=pstmt.executeQuery();
		
		int rows = 0;
		while (rs.next()){
			rows++;
		}
		rs.beforeFirst();
		
		transaction[] TransactionHistory = new transaction[rows];
		games[] TransactionTitle = new games[rows];
		
		for(int row=0; row<rows ; row++ ){
			rs.next();
			TransactionHistory[row] = new transaction();
			TransactionTitle[row] = new games();
			TransactionHistory[row].setTransactionID(rs.getInt("TransactionID"));
			TransactionTitle[row].setTitle(rs.getString("Title"));
			TransactionHistory[row].setPrice(rs.getDouble("Price"));
			TransactionHistory[row].setQuantity(rs.getInt("Quantity"));
			TransactionHistory[row].setDatePurchased(rs.getString("DatePurchased"));
		}
		Object[] Transaction = new Object[2];
		Transaction[0] = TransactionHistory;
		Transaction[1] = TransactionTitle;
		return Transaction;
	}
	
	public boolean insertCheckout(transaction cib){
		try {
			
			  Class.forName("com.mysql.jdbc.Driver");
			  String connURL ="jdbc:mysql://localhost/gggameshopv2?user=root&password=root";
			  Connection conn = DriverManager.getConnection(connURL);
			  
			  String sql = "Insert into gggameshopv2.transaction values(?,?,?,?,?,?)";
			  PreparedStatement pstmtInsert = conn.prepareStatement(sql);
			  pstmtInsert.setInt(1, JavaMethods.autoIncrement("TransactionID", "transaction"));
			  pstmtInsert.setInt(2, cib.getUserID());
			  pstmtInsert.setInt(3, cib.getGameID());
			  pstmtInsert.setInt(4, cib.getQuantity());
			  pstmtInsert.setString(5, cib.getDatePurchased());
			  pstmtInsert.setDouble(6, cib.getPrice());
			  
			  int recs = pstmtInsert.executeUpdate();
			 
			  return recs >0;
		} catch (Exception e){
			System.out.println(e);
			return false;
		}
	}
	
	public void updateQuantity (int gameid, int calculation){
		
		try {
			
			  Class.forName("com.mysql.jdbc.Driver");
			  String connURL ="jdbc:mysql://localhost/gggameshopv2?user=root&password=root";
			  Connection conn = DriverManager.getConnection(connURL);
			  String sql = "Update gggameshopv2.games set stock = ? where GameID = ?";
			  PreparedStatement pstmt = conn.prepareStatement(sql);
			  pstmt.setInt(1, calculation);
			  pstmt.setInt(2, gameid);
			  pstmt.executeUpdate();
		} catch (Exception e){
			System.out.println(e);
		}
	}
	
	public int retrieveQuantity (int gameid) throws Exception{
		try {
			  Class.forName("com.mysql.jdbc.Driver");
			  String connURL ="jdbc:mysql://localhost/gggameshopv2?user=root&password=root";
			  Connection conn = DriverManager.getConnection(connURL);
			  String sql = "Select * from gggameshopv2.games where GameID = ?";
			  PreparedStatement pstmt = conn.prepareStatement(sql);
			  pstmt.setInt(1, gameid);
			  ResultSet rs = pstmt.executeQuery();
			  int quantity =0;
			  while(rs.next()){
			  quantity = rs.getInt("stock");
			  }
			  return quantity;
		} catch (Exception e){
			System.out.println(e);
			return 0;
		}
	}
	
}
