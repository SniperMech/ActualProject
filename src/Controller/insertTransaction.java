package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.*;
import java.util.ArrayList;
import java.util.Calendar;

import Model.*;

/**
 * Servlet implementation class insertTransaction
 */
@WebServlet("/insertTransaction")
public class insertTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertTransaction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//request.getSession(false).getAttribute("addSuccess");
		ArrayList<CartItemBean> carts = (ArrayList<CartItemBean>)request.getSession(false).getAttribute("addSuccess");
		int userid = Integer.parseInt(request.getParameter("userid"));
			for (CartItemBean cart: carts){
		int gameid = Integer.parseInt(cart.getGameID());
		int quantity = cart.getStock();
		double price = cart.getPrice();
		//int gameid = Integer.parseInt(request.getParameter("gameid"));
		//int quantity = Integer.parseInt(request.getParameter("quantity"));
		//double price = Double.parseDouble(request.getParameter("price"));
	
	    java.util.Date today = Calendar.getInstance().getTime();
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String date = formatter.format(today);	    		
		
		transaction inv = new transaction(0, userid, gameid, quantity, date, price);
		
		ManageTransaction manager = new ManageTransaction();
		boolean success = manager.insertCheckout(inv);
		
		try {
			int calculation = manager.retrieveQuantity(gameid) - quantity;
			manager.updateQuantity(gameid, calculation);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession(false).removeAttribute("addSuccess");
		request.setAttribute("insertSuccess", success);
		}
		RequestDispatcher rd = request.getRequestDispatcher("insertResults.jsp");
		rd.forward(request, response); //target only use it once
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
