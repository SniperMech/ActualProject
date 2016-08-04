package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.games;
import Model.salesDetails;
import Model.transaction;

/**
 * Servlet implementation class DropDownList
 */
@WebServlet("/DropDownList")
public class DropDownList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DropDownList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
salesDetails manager = new salesDetails();
		
		ArrayList<games> gameslist = null;
		ArrayList<transaction> months = null;
		ArrayList<transaction> years = null;
		try {
			gameslist = manager.dropdowngames();
			months = manager.dropDownMonths();
			years = manager.dropDownYears();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("gameslist", gameslist);
		request.setAttribute("months", months);
		request.setAttribute("years", years);
		RequestDispatcher rd = request.getRequestDispatcher("AdminUI.jsp");
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
