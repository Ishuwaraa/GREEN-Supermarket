package com.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			if(request.getSession().getAttribute("authenticate") != null){
				request.getSession().removeAttribute("authenticate");
				response.sendRedirect("adminLogin.jsp");
			}else {
				response.sendRedirect("adminLogin.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
