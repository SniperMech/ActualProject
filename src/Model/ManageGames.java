package Model;

import java.sql.*;

public class ManageGames {
	public games[] quantityCheck(games game) throws Exception{
		Connection conn = JavaMethods.getConnection();
		PreparedStatement pstmt =
		conn.prepareStatement("select GameID, Title, Price, Stock from gggameshopv2.games where Stock<?");
		pstmt.setInt(1, game.getStock());
		ResultSet rs=pstmt.executeQuery();
		
		int rows = 0;
		while (rs.next()){
			rows++;
		}
		rs.beforeFirst();
		
		games[] GamesBelowQuantity = new games[rows];
		
		for(int row=0; row<rows ; row++ ){
			rs.next();
			GamesBelowQuantity[row] = new games();
			GamesBelowQuantity[row].setGameID(rs.getInt("GameID"));
			System.out.println(GamesBelowQuantity[row].getGameID());
			GamesBelowQuantity[row].setTitle(rs.getString("Title"));
			GamesBelowQuantity[row].setPrice(rs.getDouble("Price"));
			GamesBelowQuantity[row].setStock(rs.getInt("Stock"));
		}
		return GamesBelowQuantity;
		
	}
}
