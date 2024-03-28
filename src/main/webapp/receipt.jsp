<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%
	Date d = new Date();
	int incrementedId = (Integer) request.getAttribute("incrementedId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GREEN Supermarket</title>
<link rel="stylesheet" href="review.css">
<link rel="stylesheet" href="receipt.css">
<link rel="icon" type="image/x-icon" href="./assets/logo/favicon.ico">
</head>
<body style="background-color: #fff;">

	<div class="invoice-wrapper" id="print-area">
		<div class="invoice">
			<div class="px-14 py-6">
				<table class="w-full border-collapse border-spacing-0"
					style="background-color: #3cb815;">
					<tbody>
						<tr>
							<td class="w-full align-top">
								<div>
									<h1 class="heading" style="color: #fff; display: flex;">
										<img src="./assets/logo/logo-white.png" class="h-12"
											style="display: flex; background-color: #3cb815;">
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
															style="color: #fff;">Date: <%= d %></p>

														<p class="whitespace-nowrap font-bold text-white text-left">Order ID: <%= incrementedId %></p>
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

			<h1>Payment Done. Thank you for purchasing our products</h1>
			<div class="invoice-container">
				<h3 style="color: #ff7e00;">Receipt Details:</h3>

				<div class="overflow-view">
					<div class="invoice-body">
						<table>
							<thead>
								<tr>
									<td class="text-bold"></td>
									<td class="text-bold" style="text-align: right;"></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-bold">Merchant:</td>
									<td style="text-align: right;">Green Supermarket</td>
								</tr>
								<tr>
									<td class="text-bold">Payer:</td>
									<td style="text-align: right;">${payer.firstName}</td>
								</tr>
								<tr>
									<td class="text-bold">Description:</td>
									<td style="text-align: right;">${transaction.description}</td>
								</tr>
								<tr>
									<td class="text-bold">Subtotal:</td>
									<td style="text-align: right;">${transaction.amount.details.subtotal}
										LKR</td>
								</tr>
								<tr>
									<td class="text-bold">Shipping:</td>
									<td style="text-align: right;">${transaction.amount.details.shipping}
										LKR</td>
								</tr>
								<tr>
									<td class="text-bold">Tax:</td>
									<td style="text-align: right;">
										${transaction.amount.details.tax} LKR</td>
								</tr>
								<tr>
									<td class="text-bold">Total Amount:</td>
									<td style="text-align: right;">
										${transaction.amount.total} LKR</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
				<div class="invoice-foot text-center">
					

					<div class="invoice-btns">
						<a href="home.jsp" class="btn btn-primary invoice-btn">Back to Store</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer
		class="fixed bottom-0 left-0  w-full text-neutral-600 text-center text-xs py-3"
		style="background-color: #fef4ea;">
		Green Supermarket <span class="text-slate-300 px-2">|</span>
		greensupermarket246@gmail.com <span class="text-slate-300 px-2">|</span>
		+94-011-2345678
	</footer>

</body>
</html>