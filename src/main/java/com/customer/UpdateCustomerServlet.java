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


@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String username = request.getParameter("username");
		
		/* for the auto log out part*/
		boolean isTrue = CustomerDbUtil.updateCustomer(id, name, email, phone, username);		
		if(isTrue) {
			Customer updatedCustomer = CustomerDbUtil.userUpdate(id, name, email, phone, username);
			request.getSession().setAttribute("authenticate", updatedCustomer);
			
			RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			dis.forward(request, response);
		}
		
		/*Customer updatedCustomer = CustomerDbUtil.userUpdate(id, name, email, phone, username);
		if(updatedCustomer != null) {
			request.getSession().setAttribute("authenticate", updatedCustomer);
			
			RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			dis.forward(request, response);
		}else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Failed to update details');");
			out.println("location='profile.jsp'");
			out.println("</script>");
		}*/
		
	}

}
