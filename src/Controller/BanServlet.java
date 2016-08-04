package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class BanServlet
 */
@WebServlet("/BanServlet")
public class BanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String reason = request.getParameter("reason");
		users userbanned = new users();
		userbanned.setEmail(email);
		userbanned.setReason(reason);
		ManageUsers manageusers = new ManageUsers();
		String result;
		try {
			if(manageusers.banUser(userbanned)){
				result = "Ban Success!";
			}
			else{
				result = "User does not exist!";
			}
		} catch (Exception e) {
			result = "Error in submission";
			
		}
		request.setAttribute("display1", result);;
		RequestDispatcher rd = request.getRequestDispatcher("banUsers.jsp");
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
