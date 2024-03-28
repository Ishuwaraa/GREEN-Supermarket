package com.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	//}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		
//		System.out.println(email);
//		System.out.println(name);
//		System.out.println(phone);
//		System.out.println(message);
		
		boolean isTrue = CustomerDbUtil.feedback(name, email, phone, message);
		if(isTrue) {
			RequestDispatcher dis = request.getRequestDispatcher("contact.jsp");
			dis.forward(request, response);
		}else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Couldn't submit your feedback. Try again later!');");
			out.println("location='contact.jsp'");
			out.println("</script>"); 
		}
	}

}
