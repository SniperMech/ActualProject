package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.*;

/**
 * Servlet implementation class UnbanServlet
 */
@WebServlet("/UnbanServlet")
public class UnbanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnbanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		users userunbanned = new users();
		userunbanned.setEmail(email);
		ManageUsers manageusers = new ManageUsers();
		String result;
		try {
			if (manageusers.unbanUser(userunbanned)){
				result = "User Unbanned!";
			}
			else{
				result = "User does not exist!";
			}
		} catch (Exception e) {
			result = "Error in submission.";
		}
		request.setAttribute("display2", result);;
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
