package com.admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/AdminAddProductServlet")
@MultipartConfig
public class AdminAddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String name = request.getParameter("name");
		String size = request.getParameter("size");
		double price = Double.parseDouble(request.getParameter("price"));
		Part filePart = request.getPart("image");
		int category = Integer.parseInt(request.getParameter("category"));
		//int cId = Integer.parseInt(category);
		//double Price = Double.parseDouble(price);
		
		//String fileName = extractFileName(filePart);
		String fileName = Paths.get(filePart.getName()).getFileName().toString();
	    System.out.println(fileName);
	    
	    boolean isTrue = AdminDbUtil.addProduct(name, size, price, fileName, category);
	    if(isTrue) {
	    	String uploadDir = getServletContext().getRealPath("/assets/images/products");
		    //String uploadDir = "\\assets\\images\\products";
	    	System.out.println("uploadDir: " +uploadDir);

		    Path filePath = Path.of(uploadDir, fileName);

		    try (InputStream fileContent = filePart.getInputStream()) {
		    	Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
		    }catch(Exception e) {
		    	e.printStackTrace();
		    }
		    System.out.println("file saved to: " +filePath.toString());
		    System.out.println("file saved to: " +filePath);

		    response.sendRedirect("adminAddProduct.jsp");
		    out.println("<script type='text/javascript'>");
			out.println("alert('Product added successfully!');");
			out.println("location='adminAddProduct.jsp'");
			out.println("</script>"); 
	    }else {
	    	out.println("<script type='text/javascript'>");
			out.println("alert('Product update failed!');");
			out.println("location='adminAddProduct.jsp'");
			out.println("</script>"); 
	    }
	    	    	   
	}

}
