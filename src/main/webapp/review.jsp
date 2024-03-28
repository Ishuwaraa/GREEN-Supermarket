<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%
	Date d = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GREEN Supermarket</title>
<link rel="stylesheet" href="review.css">
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
</head>
<body>
	<div>
		<div class="py-4">
			<div class="px-14 py-6">
				<table class="w-full border-collapse border-spacing-0"
					style="background-color: #3cb815;">
					<tbody>
						<tr>
							<td class="w-full align-top">
								<div>
									<h1 class="heading" style="color: #fff; display: flex;">
										<img src="./assets/logo/logo-white.png" class="h-12" style="display: flex; background-color: #3cb815;" alt="green supermarket">
										Green Supermarket
									</h1>

								</div>
							</td>

							<td class="align-top">
								<div class="text-sm">
									<table class="border-collapse border-spacing-0">
										<tbody>
											<tr>
												<td class="pl-4" style="padding-right: 3rem;">
													<div>
														<p class="whitespace-nowrap  text-left"
															style="color: #fff;">Date</p>
														<p class="whitespace-nowrap font-bold text-white text-left"><%= d %></p>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<form action="ExecutePaymentServlet" method="post">
				<div class="px-14 py-6 text-sm" style="background-color: #e9f4ea;">
					<table class="w-full border-collapse border-spacing-0">
						<tbody>
							<tr>
								<td class="w-1/2 align-top"><input type="hidden"
									name="paymentId" value="${param.paymentId}" /> <input
									type="hidden" name="PayerID" value="${param.PayerID}" />

									<div class="text-sm text-neutral-600">
										<p class="font-bold">Payer Information:</p>
										<br>
										<p>Full Name: ${payer.firstName}</p>
										<p>Email: ${payer.email}</p>


									</div></td>
								<td class="w-1/2 align-top text-right">
									<div class="text-sm text-neutral-600">
										<p class="font-bold">Shipping Address:</p>
										<p>Recipient Name: ${shippingAddress.recipientName}</p>
										<p>Address: ${shippingAddress.line1}</p>
										<p>City: ${shippingAddress.city}</p>
										<p>State: ${shippingAddress.state}</p>
										<p>Country Code: ${shippingAddress.countryCode}</p>
										<p>Postal Code: ${shippingAddress.postalCode}</p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="px-14 py-10 text-sm text-neutral-700">
					<table class="w-full border-collapse border-spacing-0">
						<thead>
							<tr>
								<td class="border-b-2 border-main pb-3 pl-3 font-bold text-main">#</td>
								<td class="border-b-2 border-main pb-3 pl-2 font-bold text-main">Transaction
									Details</td>
								<td
									class="border-b-2 border-main pb-3 pl-2 text-right font-bold text-main">Price(LKR)</td>

							</tr>
						</thead>
						<tbody>

							<tr>
								<td class="border-b py-3 pl-3">1.</td>
								<td class="border-b py-3 pl-2">Subtotal:</td>
								<td class="border-b py-3 pl-2 text-right">${transaction.amount.details.subtotal}
									LKR</td>

							</tr>
							<tr>
								<td class="border-b py-3 pl-3">2.</td>
								<td class="border-b py-3 pl-2">Shipping:</td>
								<td class="border-b py-3 pl-2 text-right">${transaction.amount.details.shipping}
									LKR</td>

							</tr>
							<tr>
								<td class="border-b py-3 pl-3">3.</td>
								<td class="border-b py-3 pl-2">Tax:</td>
								<td class="border-b py-3 pl-2 text-right">${transaction.amount.details.tax}
									LKR</td>

							</tr>
							<tr>
								<td class="border-b py-3 pl-3">4.</td>
								<td class="border-b py-3 pl-2">Total Amount:</td>
								<td class="border-b py-3 pl-2 text-right font-bold">${transaction.amount.total}
									LKR</td>

							</tr>

							<tr>
								<td colspan="7">
									<table class="w-full border-collapse border-spacing-0">
										<tbody>
											<tr>
												<td class="w-full"></td>
												<td>
													<!-- <table class="w-full border-collapse border-spacing-0">
														 <tbody>														
															<tr>															
															<tr>
																<td class="p-3">																
																</td>																															
															</tr>																																										
														</tbody> -->
														<!-- <a href=""> <button class="btn btn-primary" id="" type="submit">
															<b>Pay Now</b>  
													</a> 
																											

													</table>-->
													<input class="btn btn-primary" type="submit" value="Pay Now" >	
												</td>
											</tr>
										</tbody>
									</table>

								</td>
							</tr>
						</tbody>

					</table>
				</div>
			</form>

			<footer
				class="fixed bottom-0 left-0  w-full text-neutral-600 text-center text-xs py-3"
				style="background-color: #fef4ea;">
				Green Supermarket <span class="text-slate-300 px-2">|</span>
				greensupermarket246@gmail.com <span class="text-slate-300 px-2">|</span>
				+94-011-2345678
			</footer>
		</div>
	</div>
	
</body>
</html>