<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="js.product" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

   
	<title>Product</title>
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
	<link rel="stylesheet" type="text/css" href="vendor/noui/nouislider.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
    <style type="text/css">
        .auto-style1 {
            height: 1546px;
        }
    </style>


	

	
	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
					<div class="leftbar p-r-20 p-r-0-sm">
						<!--  -->
						<h4 class="m-text14 p-b-7">
							Categories
						</h4>

						<ul class="p-b-54">
							<li class="p-t-4">
								<a href="Product.aspx" class="s-text13 active1">
									All
								</a>
							</li>

							<li class="p-t-4">
								<a href="Product.aspx?category=Washing Services" class="s-text13">
									Washing Services
								</a>
							</li>

							<li class="p-t-4">
								<a href="Product.aspx?category=Vacuuming Services" class="s-text13">
									Vacuuming Services
								</a>
							</li>

							<li class="p-t-4">
								<a href="Product.aspx?category=Cleaning Services" class="s-text13">
									Cleaning Services
								</a>
							</li>

						</ul>

						
					</div>
				</div>

				<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
					<!--  -->
					<div class="flex-sb-m flex-w p-b-35">
						<div class="flex-w">
							

							
						</div>

						<span class="s-text8 p-t-5 p-b-5">
							Showing all results
						</span>
					</div>

					<!-- Product -->
					<div class="row">

                        <asp:Repeater ID="r1" runat="server">
                            <ItemTemplate>
                            <div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-img wrap-pic-w of-hidden pos-relative">
									<img src="<%#Eval("image") %>" alt="spiderman">

									<div class="block2-overlay trans-0-4">
										
										<div class="block2-btn-addcart w-size1 trans-0-4">
											<!-- Button -->
											<a href="ProductDetail.aspx?product_id=<%#Eval("product_id") %>" class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
												View Details
											</a>
										</div>
									</div>
								</div>

								<div class="block2-txt p-t-20">
									<%--<a href="product-detail.html" class="block2-name dis-block s-text3 p-b-5">
										<%#Eval("name") %>
									</a>--%>

									<span class="block2-price m-text6 p-r-5">
										<h3>RM <%#Eval("price") %></h3>
									</span>
								</div>
							</div>
						</div>
                                </ItemTemplate>
                        </asp:Repeater>
						

					</div>

					<!-- Pagination -->
					
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
	<script type="text/javascript" src="vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
        $('.block2-btn-addcart').each(function () {
            var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
            $(this).on('click', function () {
                swal(nameProduct, "Proceeding", "success");
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
	<script type="text/javascript" src="vendor/noui/nouislider.min.js"></script>
	<script type="text/javascript">
		/*[ No ui ]
	    ===========================================================*/
        var filterBar = document.getElementById('filter-bar');

        noUiSlider.create(filterBar, {
            start: [50, 200],
            connect: true,
            range: {
                'min': 50,
                'max': 200
            }
        });

        var skipValues = [
            document.getElementById('value-lower'),
            document.getElementById('value-upper')
        ];

        filterBar.noUiSlider.on('update', function (values, handle) {
            skipValues[handle].innerHTML = Math.round(values[handle]);
        });
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>


    </asp:Content>
