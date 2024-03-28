package com.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.paypal.base.rest.PayPalRESTException;

@WebServlet("/AuthorizePaymentServlet")
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dname = request.getParameter("dname");
		String daddress = request.getParameter("daddress");
		String dphone = request.getParameter("dphone");				
		
		String subTotal = request.getParameter("total");
		String shipping = request.getParameter("shipping");
		String tax = request.getParameter("tax");
		String total = request.getParameter("payable");
		System.out.println("sub: "+subTotal+"ship: "+shipping+"tax:"+tax+"total:"+total);
		
		HttpSession dsess = request.getSession();
		dsess.setAttribute("dname", dname);
		dsess.setAttribute("daddress", daddress);
		dsess.setAttribute("dphone", dphone);
		dsess.setAttribute("dtotal", total);
		
		OrderDetail orderDetail = new OrderDetail(subTotal, total, shipping, tax);
		
		try {
			PaymentServices paymentServices = new PaymentServices(); //creating instance of the paymentservice class
			String approvalLink = paymentServices.authorizePayment(orderDetail, dname); //
			
			response.sendRedirect(approvalLink);
			//request.getRequestDispatcher(approvalLink).forward(request, response);
		}catch(PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
