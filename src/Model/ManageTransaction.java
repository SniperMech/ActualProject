package Model;

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
}
