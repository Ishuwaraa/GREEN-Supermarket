package com.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editPrice")
public class editPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		int id = Integer.parseInt(request.getParameter("pid"));
		double price = Double.parseDouble(request.getParameter("pprice"));
		
		boolean isTrue = AdminDbUtil.editPrice(id, price);
		if(isTrue) {
			response.sendRedirect("adminProducts.jsp");
		}else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Product update failed!');");
			out.println("location='adminProducts.jsp'");
			out.println("</script>"); 
		}
	}

}
