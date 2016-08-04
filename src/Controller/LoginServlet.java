package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		users login = new users();
		login.setPassHash(password);
		login.setEmail(email);
		logDetails log = new logDetails();
		log.insertLog(email);
		ManageUsers LoggingIn = new ManageUsers();
		
		try {
			int UserID = LoggingIn.checkLogin(email, password);
			
			HttpSession session = request.getSession();
			session.setAttribute("UserID", UserID);
			
			if(UserID == -1){
				request.setAttribute("display", "Your account has been banned.");
				
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
			else if(UserID >= 1){
				session.setAttribute("UserName", LoggingIn.getUserName(UserID));
				
				if(UserID > 1){
					request.setAttribute("display", "Login Successful!");
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
				else if(UserID == 1){
					request.setAttribute("display", "Welcome Admin!");
					
					RequestDispatcher rd = request.getRequestDispatcher("AdminUI.jsp");
					rd.forward(request, response);
				}
				
			}
			else{
				request.setAttribute("display", "Invalid Username/Password..");
				
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
