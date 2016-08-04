package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		int number = Integer.parseInt(request.getParameter("number"));
		users user = new users();
		user.setUserID((int)request.getSession().getAttribute("UserID"));
		user.setEmail(email);
		user.setAddress(address);
		user.setNumber(number);
		
		ArrayList<String> result = new ArrayList<String>();
		ManageUsers manageuser = new ManageUsers();
		try {
			if(manageuser.updateUserEmail(user)){
				result.add("Email updated successfully!");
			}
			else{
				result.add("Email already in use by another user.");
			}
			
			
			if(manageuser.updateUserAddress(user)){
				result.add("Address updated successfully!");
			}
			else{
				result.add("Address already in use by another user.");
			}
			
			
			if(manageuser.updateUserNumber(user)){
				result.add("Number updated successfully!");
			}
			else{
				result.add("Number already in use by another user.");
			}
			
			
			String[] resultArray = (String[])result.toArray(new String[0]);
			request.setAttribute("result", resultArray);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("UpdateProfileView.jsp");
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
