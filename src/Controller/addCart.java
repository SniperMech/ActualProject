package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import Model.*;

/**
 * Servlet implementation class addCart
 */
@WebServlet("/addCart")
public class addCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession session = request.getSession();
		String GameID = request.getParameter("GameID");
		String Title = request.getParameter("Title");
		String Description = request.getParameter("Description");
		String logoURL = request.getParameter("logoURL");
		String price = request.getParameter("Price");
		String stock = request.getParameter("Stock");
		String total = "0";
		CartBean manager = new CartBean();
		ArrayList<CartItemBean> addCart = new ArrayList<CartItemBean>();
		
		try {
			if(manager.checkQuantity(GameID, stock) == true) {
			//Checks if there is already an Array created
			if(request.getSession().getAttribute("addSuccess")!= null){	
			addCart = (ArrayList<CartItemBean>) request.getSession().getAttribute("addSuccess");
			}
			//Removes duplicate products in cart
			for(int i=0; i<addCart.size();i++){
				CartItemBean cart = addCart.get(i);
				if(cart.getGameID().equals(GameID)){
					cart.setStock(Integer.parseInt(stock));
					addCart.remove(cart);
				}
			}
			
			try {
				
				addCart.add(manager.cartList(GameID, Title, Description, logoURL, price, stock, total));
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			session.setAttribute("addSuccess", addCart);		
			RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
			rd.forward(request, response);
				
			}
			else{
			    response.sendRedirect("cart.jsp");
			}
		} catch (NumberFormatException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
