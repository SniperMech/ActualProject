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
 * Servlet implementation class ObtainSalesDatabyGameID
 */
@WebServlet("/ObtainSalesDatabyGameID")
public class ObtainSalesDatabyGameID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ObtainSalesDatabyGameID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		sales uBean = null;
		String GameID = request.getParameter("GameID");
	try {
		salesDetails sd = new salesDetails();
		uBean = sd.gamesales(GameID);
		
		request.setAttribute("GameSales", uBean);
		RequestDispatcher rd = request.getRequestDispatcher("SpecificGameSales.jsp");
		rd.forward(request, response);
	} catch (Exception e){
		System.out.println(e);
	}
	}

}
