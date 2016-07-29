package Model;

public class games {
	private int GameID;
	private String Title;
	private String Company;
	private String Date;
	private String Description;
	private double Price;
	private String Image;
	private int Stock;
	
	public games(){
		super();
	}
	
	public games(int gameID, String title, String company, String date, String description, double price, String image,
			int stock) {
		super();
		this.GameID = gameID;
		this.Title = title;
		this.Company = company;
		this.Date = date;
		this.Description = description;
		this.Price = price;
		this.Image = image;
		this.Stock = stock;
	}

	public int getGameID() {
		return GameID;
	}

	public void setGameID(int gameID) {
		GameID = gameID;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getCompany() {
		return Company;
	}

	public void setCompany(String company) {
		Company = company;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public double getPrice() {
		return Price;
	}

	public void setPrice(double price) {
		Price = price;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public int getStock() {
		return Stock;
	}

	public void setStock(int stock) {
		Stock = stock;
	}
	
}
