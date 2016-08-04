package model;

public class log {

	private String UserID;
	private String Username;
	private String Email;
	private String IPaddr;
	private String Datetime;
	/*private String Location;*/
	
	
	public log(String userID, String username, String email, String iPaddr, String datetime) {
		super();
		UserID = userID;
		Username = username;
		Email = email;
		IPaddr = iPaddr;
		Datetime = datetime;
		/*Location = location;*/
	}


	public String getUserID() {
		return UserID;
	}


	public void setUserID(String userID) {
		UserID = userID;
	}


	public String getUsername() {
		return Username;
	}


	public void setUsername(String username) {
		Username = username;
	}


	public String getEmail() {
		return Email;
	}


	public void setEmail(String email) {
		Email = email;
	}


	public String getIPaddr() {
		return IPaddr;
	}


	public void setIPaddr(String iPaddr) {
		IPaddr = iPaddr;
	}


	public String getDatetime() {
		return Datetime;
	}


	public void setDatetime(String datetime) {
		Datetime = datetime;
	}


	/*public String getLocation() {
		return Location;
	}


	public void setLocation(String location) {
		Location = location;
	}*/


	public log() {
		// TODO Auto-generated constructor stub
	}

}
