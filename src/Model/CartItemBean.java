package Model;

public class CartItemBean {


	private String GameID;
	private String Title;
	private String Description;
	private String logoURL;
	private double price;
	
	private int stock;
	private double total;
	
	public CartItemBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CartItemBean(String gameID, String title, String description, String logoURL, double price, int stock, double total) {
		super();
		GameID = gameID;
		Title = title;
		Description = description;
		this.logoURL = logoURL;
		this.price = price;
		this.stock = stock;
		this.total = total;
	}
	
	public String getGameID() {
		return GameID;
	}
	
	public void setGameID(String gameID) {
		GameID = gameID;
	}
	
	public String getTitle() {
		return Title;
	}
	
	public void setTitle(String title) {
		Title = title;
	}
	
	public String getDescription() {
		return Description;
	}
	
	public void setDescription(String description) {
		this.Description = description;
	}
	
	public String getLogoURL() {
		return logoURL;
	}
	
	public void setLogoURL(String logoURL) {
		this.logoURL = logoURL;
	}
	
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}
	
	public int getStock() {
		return stock;
	}
	
	public void setStock(int stock) {
		this.stock = stock;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
	
	

}
