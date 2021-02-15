<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="js.homepage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

    





<%--<head>--%>

<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/themify/themify-icons.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/elegant-font/html-css/style.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<%--</head>
<body class="animsition">--%>

	

	<!-- Slide1 -->
	<section class="slide1">
		<div class="wrap-slick1">
			<div class="slick1">

                <div class="item-slick1 item2-slick1" style="background-image: url(images/carwash.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<h2 style="color:magenta;font-weight:bolder" class="caption1-slide1 xl-text2 t-center bo14 p-b-6 animated visible-false m-b-22" data-appear="rollIn">
							Car Wash
						</h2>

						
					</div>
				</div>
            

				<div class="item-slick1 item1-slick1"  style="background-image: url(images/carvacuum.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<h2  class="caption1-slide1 xl-text2 t-center bo14 p-b-6 animated visible-false m-b-22" data-appear="fadeInUp">
							Car Seat Vacuum
						</h2>

						
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- Banner -->
	<div class="banner bgwhite p-t-40 p-b-40">
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">                   
					<!-- block1 -->
					<div class="block1 hov-img-zoom pos-relative m-b-30">                        
						<img src="images/carwashing.jpg" style="height:240px" alt="carwashing">

						<div class="block1-wrapbtn w-size2">
							<!-- Button -->                            
							<a href="Product.aspx?category=Washing Services" class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
								WASHING
							</a>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
					<!-- block1 -->
					<div class="block1 hov-img-zoom pos-relative m-b-30">
						<img src="images/carvacuuming.jpg" style="height:240px" alt="carvacuuming">

						<div class="block1-wrapbtn w-size2">
							<!-- Button -->
							<a href="Product.aspx?category=Vacuuming Services" class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
								VACUUMING 
							</a>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
					<!-- block1 -->
					<div class="block1 hov-img-zoom pos-relative m-b-30">
						<img src="images/carcleaning.jfif" style="height:240px" alt="carcleaning">

						<div class="block1-wrapbtn w-size2">
							<!-- Button -->
							<a href="Product.aspx?category=Cleaning Services" class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
								CLEANING
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	
	<!-- Blog -->
	<section class="blog bgwhite p-t-94 p-b-65">
		<div class="container">
			<div class="sec-title p-b-52">
				<h3 class="m-text5 t-center">
					Our Blog
				</h3>
			</div>

			<div class="row">
				<div class="col-sm-10 col-md-4 p-b-30 m-l-r-auto">
					<!-- Block3 -->
					<div class="block3">
						<a href="#" class="block3-img dis-block hov-img-zoom">
							<img src="images/CarWash2U%20logo.jpeg" alt="IMG-BLOG">
						</a>

						<div class="block3-txt p-t-14">
							<h4 class="p-b-7">
								<a href="#" class="m-text11">
									Welcome to access our website. More things can be discover in the website.
								</a>
							</h4>

							<span class="s-text6">By</span> <span class="s-text7">Admin</span>
							<span class="s-text6">on</span> <span class="s-text7">May 18, 2019</span>

							<p class="s-text8 p-t-16">
								Our website is providing many car wash services to our customers. Let's find out!
							</p>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-md-4 p-b-30 m-l-r-auto">
					<!-- Block3 -->
					<div class="block3">
						<a href="#" class="block3-img dis-block hov-img-zoom">
							<img src="images/surprise.jpg" alt="IMG-BLOG">
						</a>

						<div class="block3-txt p-t-14">
							<h4 class="p-b-7">
								<a href="blog-detail.html" class="m-text11">
									Many surprises are waiting you. Grab it before it finish.
								</a>
							</h4>

							<span class="s-text6">By</span> <span class="s-text7">Admin</span>
							<span class="s-text6">on</span> <span class="s-text7">Jan 1, 2021</span>

							<p class="s-text8 p-t-16">
								Many surprises are ready for the customer and many vouchers are waiting to be grab.
							</p>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-md-4 p-b-30 m-l-r-auto">
					<!-- Block3 -->
					<div class="block3">
						<a href="#" class="block3-img dis-block hov-img-zoom">
							<img src="images/voucher.jfif" alt="IMG-BLOG">
						</a>

						<div class="block3-txt p-t-14">
							<h4 class="p-b-7">
								<a href="blog-detail.html" class="m-text11">
									Chinese New Year Voucher is ready to be grab.
								</a>
							</h4>

							<span class="s-text6">By</span> <span class="s-text7">Admin</span>
							<span class="s-text6">on</span> <span class="s-text7">Feb 1, 2021</span>

							<p class="s-text8 p-t-16">
								Customer can grab the voucher to enjoy cheaper price for the car wash services. These voucher cannot be exchange in cash.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>

<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
	<script type="text/javascript">
        $(".selection-1").select2({
            minimumResultsForSearch: 20,
            dropdownParent: $('#dropDownSelect1')
        });
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
        $('.block2-btn-addcart').each(function () {
            var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "is added to cart !", "success");
            });
        });

        //$('.block2-btn-addwishlist').each(function () {
        //    var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
        //    $(this).on('click', function () {
        //        swal(nameProduct, "is added to wishlist !", "success");
        //    });
        //});
	</script>

<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

<%--</body>
</html>--%>


</asp:Content>








