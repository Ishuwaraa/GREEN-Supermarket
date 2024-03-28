package com.product;

import com.customer.Customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;

import com.product.PaymentServices;
import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;

@WebServlet("/ExecutePaymentServlet")
public class ExecutePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isTrue = false;
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        
        //getting the session from authorize servlet
        HttpSession dsess = request.getSession(false); //taking the existing session w false
        String name = (String) dsess.getAttribute("dname");
        String address = (String) dsess.getAttribute("daddress");
        String phone = (String) dsess.getAttribute("dphone");
        String total = (String) dsess.getAttribute("dtotal");
        Double convTotal = Double.parseDouble(total);
        System.out.println("name:"+name+"address"+address+"phone"+phone+"total"+total);
         
        //sending the mail
        String fromEmail = "greensupermarket246@gmail.com";
		String password = "wvie awdm knkf vebq";
		String toEmail = "greensupermarket246@gmail.com";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");	
		
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});
		
		//getting order id
		int orderId = ProductDbUtil.getOrderId();
		int incrementedId = orderId + 1;
		System.out.println(orderId+ "& inc:"+ incrementedId);
        
        try {
        	//paypal stuff
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
             
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.setAttribute("incrementedId", incrementedId);
            
            //getting cart and user session
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			Customer authenticate = (Customer) request.getSession().getAttribute("authenticate");
			//String[] orderRow = new String[cart_list.size()];
			if(authenticate != null) {
				toEmail = authenticate.getEmail();
			}
			System.out.println("cart list" + cart_list);
			System.out.println("authenticate" + authenticate);
			
			if(cart_list != null && authenticate != null) {			
				for(Cart c:cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setCustomerId(authenticate.getId());
					order.setOrderQty(c.getQuantity()); 
					isTrue = ProductDbUtil.addOrder(order, incrementedId);
					//product failed to add
					if(!isTrue) {
						break;
					}
				}
				System.out.println("istrue: "+isTrue);
				if(isTrue) {
					//updating order id and delivery stuff
					ProductDbUtil.updateOrderId(incrementedId, orderId);
					boolean shipping = ProductDbUtil.shippingDetails(incrementedId, authenticate.getId(), name, phone, address, convTotal);
					cart_list.clear();
					System.out.println(incrementedId);
					System.out.println(shipping);
					System.out.println(cart_list);
					
					//sending order confirm email
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress(fromEmail));
					message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(toEmail));
					message.setSubject("Order confirmed!");					
					//message.setContent(htmlCode, "text/html");
					message.setText("Order Id: " +incrementedId+ "\nYour total bill value: Rs." +total+ ". Thank you for ordering with us! \n\n"
							+ "This is an auto generated email. "
							+ "Replying to this email will not be monitored or attended to. "
							+ "If you have any inquiries or require assistance, kindly visit our website green.supermarket.com "
							+ "or contact our customer support. ThankYou.");				

					Transport.send(message);
					//response.sendRedirect("payment.jsp");
				}
			}
			/*else {
				if(authenticate == null) {
					//this will purchase the order automatically once logged in
					//RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
					//dis.forward(request, response);
					response.sendRedirect("login.jsp");
				}
			}*/
 
            request.getRequestDispatcher("receipt.jsp").forward(request, response);
             
        } catch (PayPalRESTException | MessagingException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
	}

}
