package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class deleteCart
 */
@WebServlet("/deleteCart")
public class deleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(true);
		String GameID = request.getParameter("GameID");
		
		ArrayList<CartItemBean> addCart = (ArrayList<CartItemBean>) session.getAttribute("addSuccess");
		if(addCart != null){
			//for(CartItemBean cart : addCart){//int i; i<addCart.size();i++ {CartItemBean cart = addCart.get(i);
				//if(cart.getGameID() == GameID){
					// addCart.remove(cart);
			//	}
			 //}
			for(int i=0; i<addCart.size();i++){
				CartItemBean cart = addCart.get(i);
					if(cart.getGameID().equals(GameID)){
						addCart.remove(cart);
					}

			}
		}
		 session.setAttribute("addSuccess", addCart);
		 RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
		 rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}
}
