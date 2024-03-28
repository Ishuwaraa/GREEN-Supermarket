package com.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
				
		String email = request.getParameter("email");
		String password = request.getParameter("password");		
		
		Customer customer = CustomerDbUtil.userLogin(email, password);
		if(customer != null) {
			List<Customer> cusDetails = CustomerDbUtil.getCustomer(email, password);
			request.setAttribute("cusDetails", cusDetails);
			
			//changed stuff
			HttpSession session = request.getSession();			
			session.setAttribute("authenticate", customer);
			session.setMaxInactiveInterval(600); //seconds
			
			
			//request.getSession().setAttribute("authenticate", customer);
			response.sendRedirect("home.jsp");
		}else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Your email or password is incorrect');");
			out.println("location='login.jsp'");
			out.println("</script>"); 
		}
	}

}
