package Controller;

import Model.*;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterMemberServlet
 */
@WebServlet("/RegisterUserServlet")
public class RegisterUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> errors = new ArrayList<String>();
		users UserDetails = new users();
		ManageUsers insert = new ManageUsers();
		
		if (request.getParameter("uname")==null || request.getParameter("uname")==""){
			errors.add("Please input Username");
		}
		if (request.getParameter("email")==null || request.getParameter("email")==""){
			errors.add("Please input Email");
		}
		if (request.getParameter("address")==null || request.getParameter("address")==""){
			errors.add("Please input Address");
		}
		if (request.getParameter("number")==null || request.getParameter("number")==""){
			errors.add("Please input Number");
		}
		if(request.getParameter("password")==null || request.getParameter("password")==""){
			errors.add("Please input Password");
		}
		if(errors.size()==0){
			String userName = request.getParameter("uname");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			int number = Integer.parseInt(request.getParameter("number"));
			String passHash = request.getParameter("password");
		
			UserDetails = new users(0, userName, email, address, number, passHash);
			if (!insert.checkEmail(email)){
				errors.add("Invalid Email or Email already in use");
			}
			if (!insert.checkNumber(number)){
				errors.add("Invalid Number (8 digits long)");
			}
			if (!insert.checkPassword(passHash)){
				errors.add("Invalid Password/Password does not meet complexity requirement (8-16 characters and alphanumeric)");
			}
		}
		if (errors.size()==0){
			try {
				boolean success = insert.insertUser(UserDetails);
				request.setAttribute("insertSuccess", success);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("insertSuccess", false);
			}
		}else{
			String[] errorArray = (String[])errors.toArray(new String[0]);
			request.setAttribute("errors", errorArray);
		}
		RequestDispatcher rd = request.getRequestDispatcher("RegisterUserView.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
