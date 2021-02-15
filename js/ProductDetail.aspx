<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="js.ProductDetail" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Product Detail</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        .p1{
            font-family:fantasy;
        }

        .inDate{
            margin: .4rem 0;
        }

        .inTime{
            margin: .4rem 0;
        }
    </style>
<!--===============================================================================================-->
</head>
<body class="animsition">

	<form id="form1" runat="server">

	<!-- breadcrumb -->
	<div class="bread-crumb bgwhite flex-w p-l-52 p-r-15 p-t-30 p-l-15-sm">
		<a href="homepage.aspx" class="s-text16">
			Home
			<i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
		</a>

		<a href="product.aspx" class="s-text16">
			Product
			<i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
		</a>

		<a href="#" class="s-text16">
			All
			<i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
		</a>


	</div>

	<!-- Product Detail -->
	<%--<div class="container bgwhite p-t-35 p-b-80">--%>


		<div class="flex-w flex-sb">
			<div class="w-size13 p-t-30 respon5">
				<div class="wrap-slick3 flex-sb flex-w">
					<div class="wrap-slick3-dots"></div>

					<div class="slick3">
						<div class="item-slick3"  data-thumb="<%#Eval("image") %>">
							<div class="wrap-pic-w">
								<img id="img" runat="server" alt="IMG-PRODUCT" />
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="w-size14 p-t-30 respon5">
				<%--<h2 class="product-detail-name m-text16 p-b-13">--%>
                    <h2 class="p1">
					<label id="lblName" runat="server"></label>
                    </h2>
                <h4>
				 <label id="lblDescription" runat="server"></label>
				</h4>

				<span class="m-text8">
                    
						<label id="lblCat" runat="server"></label>

				 
				</span>

				<p class="s-text8 p-t-10"><h4>RM</h4>
						<label id="lblPrice" runat="server"></label>
				 
				</p>

				<!--  -->
				<%--<div class="p-t-33 p-b-60">
                    <h1 style="color: black" id="currenttime" runat="server"></h1>
					<h4>Set Your Date:</h4><input type="date" id="inDate" runat="server" /><br /><br />
					<h4>Set Your Time:</h4> <input type="time" id="inTime" title= "intime" runat="server"  min="12:00" max="18:00" required
           pattern="[0-9]{2}:[0-9]{2}">
    <span class="validity"></span>
                    <small>Office hours are 12pm to 6pm</small>--%>
                    
                            <%--<p style="color: black;font-weight: bolder  ">Booking Status</p>--%>
							
                                <div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10">
								<!-- Button -->
								<button class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" id="btnAdd" runat="server" onserverclick="btnAdd_ServerClick">
									Add To Cart
								</button>
							</div>
                
						</div>
					
				</div>
                
				<!--  -->
				<div class="wrap-dropdown-content bo6 p-t-15 p-b-14 active-dropdown-content">
					<%--<h4 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
						Description
                        <asp:Label runat="server" Text=' <%#Eval("description") %>'></asp:Label>
					</h4>--%>



				</div>

				
			</div>
		



        
	

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>



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

        $(".selection-2").select2({
            minimumResultsForSearch: 20,
            dropdownParent: $('#dropDownSelect2')
        });
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
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
        //        swal(nameProduct, "is added to cart !", "success");
        //    });
        //});

        $('.btn-addcart-product-detail').each(function () {
            var nameProduct = $('.product-detail-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "is added to cart !", "success");
            });
        });
    </script>

<!--===============================================================================================-->
	<script src="js/main.js"></script>
		</form>
</body>
</html>
    </asp:Content>

