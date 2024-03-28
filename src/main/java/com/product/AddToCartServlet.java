package com.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		ArrayList<Cart> cartList = new ArrayList<>(); //to store items in the session as an array list
		try {			
			int id = Integer.parseInt(request.getParameter("id")); //receving the id from the url cart?id=
			String page = request.getParameter("page");
			Cart cm = new Cart();
			cm.setId(id); //inheritance
			cm.setQuantity(1); //giving a default values
			
			//creating the session
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			//means no sessions w the name cart_list (no products)
			if(cart_list == null) {
				cartList.add(cm); //adding the product to the cartList array
				session.setAttribute("cart-list", cartList); //cartList added to the session as a cart-list
				//out.println("session created and product added to the list");
				response.sendRedirect(page+".jsp");
			}else {
				//out.println("cart list exist/ session exist");
				cartList = cart_list; //if the cart session does exist, adding it to the cartList array
				boolean exist = false; 
				
				//checking product alr exist in the cart. in a loop due to having multiple products ig?
				for(Cart c:cart_list) {
					if(c.getId() == id) {
						exist = true;
						out.println("<script type='text/javascript'>");
						out.println("alert('product already added to the cart');");
						out.println("location='"+page+".jsp'");
						out.println("</script>");
					}					
				}
				
				//adding product if not in the cart
				if(!exist) {
					cartList.add(cm);
					out.println("product added");
					response.sendRedirect(page+".jsp");
				}
			}
		}catch (Exception e) {
		    // Print the exception to the console
		    System.out.println("An error occurred while processing the shopping cart:");
		    System.out.println(e.getMessage());
		    e.printStackTrace();

		    // Provide a user-friendly error message
		    //good practise cuz you dont wann display the errors to the end client
		    //response.sendRedirect("error.jsp"); 
		}
	}

}
