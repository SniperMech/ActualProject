package model;
import java.sql.*;
import java.text.DateFormatSymbols;
import java.util.ArrayList;


public class salesDetails {


	public sales monthsales (String month){
		
		sales uBean = null;
		
	try {
		Class.forName("com.mysql.jdbc.Driver");

		String connURL = "jdbc:mysql://localhost/gggameshopv2?user=root&password=root";

		Connection conn = DriverManager.getConnection(connURL);
		
		String sqlstatement = "select gggameshopv2.games.GameID, gggameshopv2.games.Title, "
				+ "gggameshopv2.games.Company, gggameshopv2.games.rawPrice, "
				+ "gggameshopv2.games.Price, gggameshopv2.transaction.Quantity, "
				+ "gggameshopv2.transaction.TransactionID, gggameshopv2.transaction.DatePurchased "
				+ "from gggameshopv2.games, gggameshopv2.transaction where gggameshopv2.games.gameid = gggameshopv2.transaction.gameid "
				+ "and EXTRACT(month from gggameshopv2.transaction.DatePurchased) = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sqlstatement);
		
		pstmt.setString(1, month);
		
		ResultSet rs = pstmt.executeQuery();
		
		Double Tprofit = 0.0;
		Double Cost = 0.0;
		Double Revenue = 0.0;
		
		while (rs.next()) {
			uBean = new sales();
			uBean.setRawPrice(rs.getDouble("rawPrice"));
			uBean.setPrice(rs.getDouble("Price"));
			uBean.setSold(rs.getInt("Quantity"));
			
			Cost = Cost + (uBean.getRawPrice()*uBean.getSold());

			Revenue = Revenue + (uBean.getPrice()*uBean.getSold());
			
			Tprofit = Tprofit + (uBean.getPrice()*uBean.getSold() - uBean.getRawPrice()*uBean.getSold());

			String monthString = new DateFormatSymbols().getMonths()[Integer.parseInt(month)-1];
			System.out.println(Tprofit);
			
			uBean.setDate(monthString);
			uBean.setRevenue(Revenue);
			uBean.setCost(Cost);
			uBean.setProfit(Tprofit);
			
		}
		} catch (Exception e) {}
		return uBean;
	}
	
	
	
	
	public sales gamesales (String GameID){
		
		sales uBean = null;
		
	try {
		Class.forName("com.mysql.jdbc.Driver");

		String connURL = "jdbc:mysql://localhost/gggameshopv2?user=root&password=root";

		Connection conn = DriverManager.getConnection(connURL);
		
		String sqlstatement = "select gggameshopv2.games.GameID, gggameshopv2.games.Title, "
				+ "gggameshopv2.games.Company, gggameshopv2.games.rawPrice, "
				+ "gggameshopv2.games.Price, gggameshopv2.transaction.Quantity, "
				+ "gggameshopv2.transaction.TransactionID, gggameshopv2.transaction.DatePurchased "
				+ "from gggameshopv2.games, gggameshopv2.transaction where gggameshopv2.games.gameid = gggameshopv2.transaction.gameid "
				+ "and gggameshopv2.transaction.gameid = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sqlstatement);
		
		pstmt.setString(1, GameID);
		
		ResultSet rs = pstmt.executeQuery();
		
		Double Tprofit = 0.0;
		Double Cost = 0.0;
		Double Revenue = 0.0;
		int nsold = 0;
		int ntransactions = 0;
		
		while (rs.next()) {
			uBean = new sales();
			uBean.setRawPrice(rs.getDouble("rawPrice"));
			uBean.setPrice(rs.getDouble("Price"));
			uBean.setSold(rs.getInt("Quantity"));
			uBean.setGameName(rs.getString("Title"));

			Cost = Cost + (uBean.getRawPrice()*uBean.getSold());

			Revenue = Revenue + (uBean.getPrice()*uBean.getSold());
			
			nsold = nsold + uBean.getSold();
			
			Tprofit = Revenue - Cost;
			
			ntransactions++;
			
			uBean.setRevenue(Revenue);
			uBean.setCost(Cost);
			uBean.setProfit(Tprofit);
			uBean.setntransactions(ntransactions);
			uBean.setSold(nsold);
			
		}
		return uBean;
		
	} catch (Exception e) {
		System.out.println(e);
	} 
	
	return uBean;
	}	
	
	

}
