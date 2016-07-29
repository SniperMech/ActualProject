package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ManageGames;
import Model.games;

/**
 * Servlet implementation class StockReportServlet
 */
@WebServlet("/StockReportServlet")
public class StockReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		games GameStock = new games();
		GameStock.setStock(quantity);
		ManageGames QuantityCheck = new ManageGames();
		try {
			games[] GamesBelowQuantity = QuantityCheck.quantityCheck(GameStock);
			
				request.setAttribute("Success", GamesBelowQuantity.length!=0);

			request.setAttribute("GamesBelowQuantity", GamesBelowQuantity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("StockReport.jsp");
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
