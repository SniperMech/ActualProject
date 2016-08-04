package model;

public class sales {
	
	private String GameID;
	private String GameName;
	private String Company;
	private double Price;
	private double rawPrice;
	private int sold;
	private String date;
	//profit is a variable used to compare individual months or 2 months
	private double profit; 
	private double target;
	private double cost;
	private double revenue;
	private int ntransactions;
	private boolean success;

	public sales(String gameID, String gameName, double price, double rawPrice, int sold, String date, double profit,
			double target) {
		super();
		GameID = gameID;
		GameName = gameName;
		Price = price;
		this.rawPrice = rawPrice;
		this.sold = sold;
		this.date = date;
		this.profit = profit;
		this.target = target;
	}


	public String getGameID() {
		return GameID;
	}

	public void setGameID(String gameID) {
		GameID = gameID;
	}

	public String getGameName() {
		return GameName;
	}

	public void setGameName(String gameName) {
		GameName = gameName;
	}
	
	public String getCompany() {
		return Company;
	}

	public void setCompany(String company) {
		Company = company;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public double getRawPrice() {
		return rawPrice;
	}

	public void setRawPrice(double rawPrice) {
		this.rawPrice = rawPrice;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public double getProfit() {
		return profit;
	}

	public void setProfit(double profit) {
		this.profit = profit;
	}

	public double getTarget() {
		return target;
	}

	public void setTarget(double target) {
		this.target = target;
	}

	public sales() {
		// TODO Auto-generated constructor stub
		
		
		
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public double getRevenue() {
		return revenue;
	}

	public void setRevenue(double revenue) {
		this.revenue = revenue;
	}

	public int getntransactions() {
		return ntransactions;
	}

	public void setntransactions(int ntransactions) {
		this.ntransactions = ntransactions;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

}
