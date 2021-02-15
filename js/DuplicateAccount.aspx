﻿<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="DuplicateAccount.aspx.cs" Inherits="js.DuplicateAccount" Title="UNITED Log In" %>



<asp:Content>

	<head>

		<!-- Basic -->
		<meta charset="UTF-8">

		<meta name="keywords" content="HTML5 Admin Template" />
		<meta name="description" content="Porto Admin - Responsive HTML5 Template">
		<meta name="author" content="okler.net">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />

		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
	</head>
	<body background="images/userbg.jpg" style="background-size: cover;background-attachment: fixed;">
		<!-- start: page -->
		<section class="body-sign body-locked" >
			<div class="center-sign" >
				<div class="panel panel-sign">
					<div class="panel-body" style="background-color:rgba(255, 255, 255, 0.7);">
	
							<div class="current-user text-center">
								<img src="images/profile_pic.jpg" alt="User" class="img-circle user-image" />
								<h2 class="user-name text-dark m-none" style="font-weight:bold" ><asp:Label runat="server" ID="nameLabel"></asp:Label></h2>                                
								<p class="user-email m-none" style="font-size:13px"><asp:Label runat="server" ID="emailLabel"></asp:Label></p>
							</div>

                            <br />
                            <form method="post" runat="server"  id="duplicateAccount">
							<div class="row">
								<div class="col-xs-5 text-right">							
									<asp:Button OnClick="Buyer_Click" runat="server" type="submit" class="btn btn-primary" style="background-color:darkturquoise;border-color:darkturquoise;color:white;font-weight:500" Text="Login As Customer"></asp:Button>
								
								</div>
								<div class="col-xs-7 text-right" >
									<asp:Button OnClick="Admin_Click" runat="server" type="submit" class="btn btn-primary" style="background-color:hotpink;border-color:hotpink;color:white;font-weight:500" Text="Login As Admin"></asp:Button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- end: page -->

		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>

	</body>


    </asp:Content>