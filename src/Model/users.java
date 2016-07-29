package Model;

public class users {
	private int UserID;
	private String UserName;
	private String Email;
	private String Address;
	private int Number;
	private String PassHash;
	
	public users(){
		super();
	}
	public users(int userID, String userName, String email, String address, int number, String passHash) {
		super();
		this.UserID = userID;
		this.UserName = userName;
		this.Email = email;
		this.Address = address;
		this.Number = number;
		this.PassHash = passHash;
	}
		
	public int getUserID() {
		return UserID;
	}

	public void setUserID(int userID) {
		UserID = userID;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public int getNumber() {
		return Number;
	}

	public void setNumber(int number) {
		Number = number;
	}

	public String getPassHash() {
		return PassHash;
	}

	public void setPassHash(String passHash) {
		PassHash = passHash;
	}
}
