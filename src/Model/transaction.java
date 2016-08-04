package Model;

public class transaction {
	private int TransactionID;
	private int UserID;
	private int GameID;
	private int Quantity;
	private String DatePurchased;
	private double Price;
	
	public transaction() {
		super();
	}
	
	public transaction(int transactionID, int userID, int gameID, int quantity, String datePurchased, double price) {
		super();
		TransactionID = transactionID;
		UserID = userID;
		GameID = gameID;
		Quantity = quantity;
		DatePurchased = datePurchased;
		Price = price;
		
	}
	
	public int getTransactionID() {
		return TransactionID;
	}
	public void setTransactionID(int transactionID) {
		TransactionID = transactionID;
	}
	public int getUserID() {
		return UserID;
	}
	public void setUserID(int userID) {
		UserID = userID;
	}
	public int getGameID() {
		return GameID;
	}
	public void setGameID(int gameID) {
		GameID = gameID;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public String getDatePurchased() {
		return DatePurchased;
	}
	public void setDatePurchased(String datePurchased) {
		DatePurchased = datePurchased;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
}
