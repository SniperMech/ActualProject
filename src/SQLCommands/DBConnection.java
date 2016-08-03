package SQLCommands;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class DBConnection {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	private static CallableStatement cs;
	
	public static void getConnection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost/gggameshopv2?user=root&password=root");
	}
	
	
	public static boolean checkLogin(String uname, String Enteredpsswd) throws Exception{
		pstmt=conn.prepareStatement("SELECT psswd FROM gggameshopv2.logins where uname=?");	
		pstmt.setString(1,uname); 
		rs=pstmt.executeQuery();
		if(rs.next()==true){
		return rs.getString("psswd")==Enteredpsswd;
		}
		else{
			return false;
		}
	}
	public static int autoIncrement(String IDType, String TableName) throws SQLException{
		pstmt=conn.prepareStatement("SELECT "+IDType+" FROM gggameshopv2."+TableName+";");
		rs=pstmt.executeQuery();
		int i;
		for(i=1 ; rs.next()&&i==rs.getInt(IDType) ; i++ ){
			
		}
		return i;
	}
	
	public static String[] getGenres() throws SQLException{
		pstmt=conn.prepareStatement("SELECT Genre FROM gggameshopv2.genre");
		rs=pstmt.executeQuery();
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()){
		   result.add( rs.getString("Genre"));
		}
		return result.toArray(new String[result.size()]);
	}
	
	
	public static String[] getGenreIDs() throws SQLException{
		pstmt=conn.prepareStatement("SELECT GenreID FROM gggameshopv2.genre");
		rs=pstmt.executeQuery();
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()){
		   result.add( rs.getString("GenreID"));
		}
		return result.toArray(new String[result.size()]);
	}
	
	public static String[] getLogins(String Column) throws SQLException{
		pstmt=conn.prepareStatement("SELECT "+Column+" FROM gggameshop.logins");
		rs=pstmt.executeQuery();
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()){
		   result.add( rs.getString(Column));
		}
		return result.toArray(new String[result.size()]);
	}
	
	public static String[] getValues(String Column) throws SQLException{
		pstmt=conn.prepareStatement("SELECT "+Column+" FROM gggameshopv2.games");
		rs=pstmt.executeQuery();
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()){
		   result.add( rs.getString(Column));
		}
		return result.toArray(new String[result.size()]);
	}
	
	public static String[] getSpecificGames(String Column, String preowned, String genre, String search) throws SQLException{
		if(search!=""){
			pstmt=conn.prepareStatement("SELECT "+Column+" FROM gggameshopv2.games Ga WHERE Title=?");
			pstmt.setString(1, search);
		}
		
		else if (preowned!=null){
			if(genre!=""){
				pstmt=conn.prepareStatement("SELECT "+Column+" FROM Games Ga, GameGenre GG, Genre Ge WHERE GG.GameID=Ga.GameID AND GG.GenreID=Ge.GenreID AND Ge.Genre=? AND Ga.Preowned=?;");
				pstmt.setString(1, genre);
				pstmt.setString(2, preowned);
			}
			else{
				pstmt=conn.prepareStatement("SELECT "+Column+" FROM gggameshopv2.games Ga WHERE Preowned=?");
				pstmt.setString(1,preowned);
			}
		}
		else if (genre!=""){
			pstmt=conn.prepareStatement("SELECT "+Column+" FROM Games Ga, GameGenre GG, Genre Ge WHERE GG.GameID=Ga.GameID AND GG.GenreID=Ge.GenreID AND Ge.Genre=?;");
			pstmt.setString(1,genre);
		}
		else{
			pstmt=conn.prepareStatement("SELECT "+Column+" FROM gggameshopv2.games Ga");
		}
		rs=pstmt.executeQuery();
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()){
		   result.add( rs.getString(Column));
		}
		return result.toArray(new String[result.size()]);
	}

	
	public static void insertProduct(String Title, String Company, String Date,
			String Description, double Price, String icon1, String icon2, String icon3,
			String image1, String image2, String image3, String logo, String logo2,
			String preowned, int[] Genres) throws SQLException, FileNotFoundException{
		
		InputStream icon1file = new FileInputStream(new File(icon1));
		InputStream icon2file = new FileInputStream(new File(icon2));
		InputStream icon3file = new FileInputStream(new File(icon3));
		InputStream image1file = new FileInputStream(new File(image1));
		InputStream image2file = new FileInputStream(new File(image2));
		InputStream image3file = new FileInputStream(new File(image3));
		InputStream logofile = new FileInputStream(new File(logo));
		InputStream logo2file = new FileInputStream(new File(logo2));
		int ID=autoIncrement("GameID", "games");
		
		pstmt=conn.prepareStatement("insert into gggameshopv2.games(GameID, Title, Company, Date, Description, Price,"
				+ "icon1, icon2, icon3, image1, image2, image3, logo, logo2, Preowned) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
		pstmt.setInt(1, ID);
		pstmt.setString(2, Title);
		pstmt.setString(3, Company);
		pstmt.setString(4, Date);
		pstmt.setString(5, Description);
		pstmt.setDouble(6, Price);
		pstmt.setBlob(7, icon1file);
		pstmt.setBlob(8, icon2file);
		pstmt.setBlob(9, icon3file);
		pstmt.setBlob(10, image1file);
		pstmt.setBlob(11, image2file);
		pstmt.setBlob(12, image3file);
		pstmt.setBlob(13, logofile);
		pstmt.setBlob(14, logo2file);
		pstmt.setString(15, preowned);
		pstmt.executeUpdate();
		for(int i=0;i<Genres.length;i++){
			pstmt=conn.prepareStatement("insert into gggameshopv2.gamegenre(GameID, GenreID) values(?,?);");
			pstmt.setInt(1, ID);
			pstmt.setInt(2, Genres[i]);
			pstmt.executeUpdate();
		}
	}
	public static void updateProduct(String ToUpdate, String NewValue, String Title) throws SQLException{
		pstmt=conn.prepareStatement("UPDATE gggameshopv2.games SET "+ToUpdate+"=? WHERE Title=?;");
		pstmt.setString(1, NewValue);
		pstmt.setString(2, Title);
		pstmt.executeUpdate();
	}
	public static void updateProductImage(String ToUpdate, String NewImage, String Title) throws SQLException, FileNotFoundException{
		pstmt=conn.prepareStatement("UPDATE gggameshopv2.games SET "+ToUpdate+"=? WHERE Title=?;");
		InputStream image = new FileInputStream(new File(NewImage));
		pstmt.setBlob(1,image);
		pstmt.setString(2, Title);
		pstmt.executeUpdate();
	}
	public static void deleteProduct(String Game) throws SQLException{
		pstmt=conn.prepareStatement("DELETE FROM gggameshopv2.games WHERE Title=?;");
		pstmt.setString(1, Game);
		pstmt.executeUpdate();
	}
	
	
	public static void insertUser(String uname, String psswd, String email) throws SQLException{
		pstmt=conn.prepareStatement("insert into gggameshopv2.logins(uname, psswd, email) values(?,?,?);");
		pstmt.setString(1, uname);
		pstmt.setString(2, psswd);
		pstmt.setString(3, email);
		pstmt.executeUpdate();
	}
	public static void updateUser(String ToUpdate, String NewValue, String uname) throws SQLException{
		pstmt=conn.prepareStatement("UPDATE gggameshopv2.logins SET "+ToUpdate+"=? WHERE uname=?;");
		pstmt.setString(1, NewValue);
		pstmt.setString(2, uname);
		pstmt.executeUpdate();
	}
	public static void deleteUser(String uname) throws SQLException{
		pstmt=conn.prepareStatement("DELETE FROM gggameshopv2.logins WHERE uname=?;");
		pstmt.setString(1, uname);
		pstmt.executeUpdate();
	}
	
	public static void insertGenre(String Genre) throws SQLException{
		int ID=autoIncrement("GenreID", "genre");
		pstmt=conn.prepareStatement("insert into gggameshopv2.genre(GenreID, Genre) values(?,?);");
		pstmt.setInt(1, ID);
		pstmt.setString(2, Genre);
		pstmt.executeUpdate();
	}
	
	public static void deleteGenre(String Genre) throws SQLException{
		pstmt=conn.prepareStatement("DELETE FROM gggameshopv2.genre WHERE Genre=?;");
		pstmt.setString(1, Genre);
		pstmt.executeUpdate();
	}
	
	public static void checkPromoCode(String promocode, String uname) throws SQLException{
		if (promocode=="helloworld"){
			pstmt=conn.prepareStatement("UPDATE gggameshopv2.logins SET promocode=1 WHERE uname=?;");
			pstmt.setString(1, uname);
			pstmt.executeUpdate();
		}
	}
	
	public static ArrayList<String> showGames(String Genre) throws SQLException{
		cs = conn.prepareCall("{call joinAndSelect(?)}");
		cs.setString(1,Genre);
		cs.execute();
		rs=cs.getResultSet();
		
		ArrayList<String> result = new ArrayList<String>();
		while(rs.next()){
			
		   result.add( rs.getString("Title"));
		}
		return result;
	}
	public static void insertComment(int GameID, String Comment) throws SQLException{
		
		pstmt=conn.prepareStatement("SELECT CommentID FROM gggameshopv2.comments WHERE GameID=?");
		pstmt.setInt(1, GameID);
		rs=pstmt.executeQuery();
		int ID;
		for(ID=1 ; rs.next()&&ID==rs.getInt("CommentID") ; ID++ ){
		}
		
		pstmt=conn.prepareStatement("insert into gggameshopv2.comments(CommentID, Comment, GameID) values(?,?, ?);");
		
		pstmt.setInt(1, ID);
		pstmt.setString(2, Comment);
		pstmt.setInt(3, GameID);
		pstmt.executeUpdate();
	}
	
	public static void deleteComment(int GameID, int CommentID) throws SQLException{
		pstmt=conn.prepareStatement("DELETE FROM gggameshopv2.comments WHERE GameID=? AND CommentID=?;");
		pstmt.setInt(1, GameID);
		pstmt.setInt(2, CommentID);
		pstmt.executeUpdate();
	}
	
	public static String[][] tableToArray(String TableName) throws SQLException, IOException{
		pstmt=conn.prepareStatement("SELECT * FROM gggameshopv2."+TableName+";");
		rs=pstmt.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();
		int columns = rsmd.getColumnCount();
		rs.last();
		int rows = rs.getRow()+1;
		String[][] Table = new String[rows][columns];
		rs.beforeFirst();
		
		for(int column=0 ; column<columns ; column++ ){
			Table[0][column]=rsmd.getColumnName(column+1);
		}
		
		for(int row=0; row+1<rows ; row++ ){
			rs.next();
			for(int column=0 ; column<columns ; column++ ){
				if (rs.getString(column+1)!=null){
					if(rs.getObject(column+1) instanceof byte[]){
						Table[row+1][column]="[Image]";
					}
					else{
						Table[row+1][column]=rs.getString(column+1);
					}
				}
			}
		}
		return Table;
	}
	
	public static String getQuestion(String uname) throws Exception{
		pstmt=conn.prepareStatement("Select * from gggameshopv2.questions where uname=?");
		pstmt.setString(1, uname);
		String question;
		rs=pstmt.executeQuery();
		if(rs.next() == true){
			for(int i=0 ; i<(int)(Math.random() * 2); i++){
				rs.next();
			}
					question = rs.getString("Question");
			} 
		else{
			question="null";
		}
		return question;
	}
	public static boolean getAnswer(String UserAnswer, String uname) throws Exception{
		pstmt=conn.prepareStatement("Select * from gggameshopv2.questions where uname=? and Answer=?");
		pstmt.setString(1, uname);
		pstmt.setString(2, UserAnswer);
		ResultSet rs2=pstmt.executeQuery();
		return(rs2.next());
	}
	
	public static String[] productPage(String GameID) throws Exception {
		pstmt = conn.prepareStatement("Select * from gggameshopv2.games WHERE GameID=?");
		pstmt.setString(1, GameID);
		rs = pstmt.executeQuery();
		
		rs.next();
		String[] productArray = {
				rs.getString("GameID"), 
				rs.getString("Title"),
				rs.getString("Company"),
				rs.getString("price"),
				rs.getString("Preowned"),
				rs.getString("icon1URL"),
				rs.getString("icon2URL"),
				rs.getString("icon3URL"),
				rs.getString("image1URL"),
				rs.getString("image2URL"),
				rs.getString("image3URL"),
				rs.getString("logoURL"),
				rs.getString("logo2URL"),
				rs.getString("Description"),
				rs.getString("stock")};
		
		return productArray; 
		
	}
	
}
