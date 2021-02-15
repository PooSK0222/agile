<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/unitedMasterPage3.Master"  CodeBehind="AdminProfile.aspx.cs" Inherits="js.AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

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
    <link rel="stylesheet" href="css/theme.css" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="css/default.css" />

    <!-- Theme Custom CSS -->
    <link rel="stylesheet" href="css/theme-custom.css">

    <!-- Head Libs -->
    <script src="vendor/modernizr/modernizr.js"></script>

</head>
<body background="images/userbg.jpg" style="background-size: cover;background-attachment: fixed">
<section class="body">

    

        <section role="main" class="content-body">
            <header class="page-header">
                <h2>Admin Profile</h2>

                <div class="right-wrapper pull-right" style="padding-right:50px;">
                    <ol class="breadcrumbs">
                        <li>
                            <a href="homepage.aspx">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li><span>My Profile</span></li>
                    </ol>

                    
                </div>
            </header>

            <!-- start: page -->

            <div class="row">
                <div class="col-md-4 col-lg-3">

                    <section class="panel">
                        <div class="panel-body">
                            <div class="thumb-info mb-md">
                               
                                <img src="images/profile_pic.jpg" style="width:338px;height:320px" class="rounded img-responsive" alt="John Doe">
                                <div class="thumb-info-title">
                                    <span class="thumb-info-inner"><asp:Label ID="nameHeader" runat="server"></asp:Label></span>
                                    <span class="thumb-info-type">Admin</span>
                                    
                                </div>
                                <hr class="dotted short">
                            </div>


                            

                            

                            <h4 class="text-weight-bold" style="color: black;">My Details</h4>
                            <div style="color: black">                              
                                <p>Name       : <asp:Label ID="nameLabel" runat="server"></asp:Label> </p>
                                <p>Email      : <asp:Label ID="emailLabel" runat="server"></asp:Label></p>
                                <p>Phone No   : <asp:Label ID="phoneLabel" runat="server"></asp:Label></p>
                                <p>BirthDate  : <asp:Label ID="birthdateLabel" runat="server"></asp:Label></p>
                                <p>Date Joined: <asp:Label ID="dateJoinedLabel" runat="server"></asp:Label></p>                                
                            </div>


                        </div>
                    </section>




                </div>
                <div class="col-md-8 col-lg-6">

                  

                    <div class="tabs">
                        <ul class="nav nav-tabs tabs-primary">
                            <li class="active">
                                <a href="#overview" data-toggle="tab">Overview</a>
                            </li>
                            <li>
                                <a href="#changepassword" data-toggle="tab">Edit</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="overview" class="tab-pane active">

                                <h4 class="mb-xlg"style="color: black;font-weight: bold">Timeline</h4>

                                <div class="timeline timeline-simple mt-xlg mb-md">
                                    <div class="tm-body">
                                       
                                        <div class="tm-title">
                                            <h3 class="h5 text-uppercase">January&nbsp;&nbsp;&nbsp;2020</h3>
                                        </div>
                                        <ol class="tm-items">
                                            <li>
                                                <div class="tm-box" style="background-color: #1d2127">
                                                    <p class=" mb-none" style="color: dodgerblue">On <asp:Label ID="FeedDateJoined" runat="server"></asp:Label> 
                                                    <p style="color:white;">
                                                        <span style="color: magenta">Welcome to CarWash2U !&nbsp;&nbsp;</span> Thanks for joining us.
                                                    </p>
                                                    <div class="thumbnail-gallery">
                                                        <a class=" lightbox" href="/images/tqJoinedUs.jpg" data-plugin-options='{ "type":"image" }'>
                                                            <img class="img-responsive" width="215" src="/images/tqJoinedUs.jpg">
                                                            <span class="zoom">
																		<i class="fa fa-search"></i>
																	</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                        </ol>

                                        <div class="tm-title">
                                            <h3 class="h5 text-uppercase">APRIL&nbsp;&nbsp;&nbsp;2019</h3>
                                        </div>
                                        
                                        
                                       
                                        <ol class="tm-items">
                                            <li >
                                                <div class="tm-box" style="background-color: #1d2127"  >
                                                    <p class=" mb-none" style="color: dodgerblue">On 10-04-2019</p>
                                                    <p style="color: white">
                                                        <span style="color: deeppink">Congrats!&nbsp;</span>CarWash2U Finally Launched !
                                                    </p>
                                                    <div class="thumbnail-gallery">
                                                        <a class=" lightbox" href="images/unitedLaunching.jpg" data-plugin-options='{ "type":"image" }'>
                                                            <img class="img-responsive" width="215" src="images/unitedLaunching.jpg">
                                                            <span class="zoom">
																		<i class="fa fa-search"></i>
																	</span>
                                                        </a>
                                                    </div>                                              
                                                </div>
                                            </li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                            <div id="changepassword" class="tab-pane">
                               
                                <form id="chgPassForm" method="POST" runat="server">
                                    <h4 class="mb-xlg" style="color: black;font-weight: bold">Change Password</h4>


                                    <div class="alert alert-info">
                                        <p class="m-none text-weight-semibold h6 center">EMAIL : <asp:Label ID="edit_email" runat="server" ></asp:Label> <br/><br/> NAME : <asp:Label ID="edit_name" runat="server" ></asp:Label>  </p>
                                    </div>

                                    <span id='message' style="text-align: center"></span>
                                    <fieldset>
                                        <div class="form-group">
                                            <label style="color: black;border-color:black" class="pull-left">Enter Your New Password :</label>
                                            <input class="form-control input-lg" type="password" name="password" id="password"  onchange='checkPass();' onkeyup='checkPass();' runat="server"  required ClientIDMode="Static"   >
                                        </div>

                                        <div class="form-group">
                                            <label style="color: black" for="password" class="pull-left">Confirmation Password :</label>
                                            <input  class="form-control input-lg" type="password" name="confirm_password" id="confirm_password" onchange='checkPass();' onkeyup='checkPass();' required >
                                        </div>
                                        <br/><br/>
                                        <div class="col-lg-pull-15 text-center">
                                            
                                            <asp:Button OnClick="ChangePass_Click" runat="server"  id="submit"  type="submit"  class="btn btn-primary btn-lg hidden-xs" Text="Change Password !" ClientIDMode="Static"></asp:Button>
                                        </div>

                                    </fieldset>


                                    <br/>
                                    <p class="text-center mt-lg">Wish to cancel? <a href="AdminProfile.aspx">Go Back!</a>

                                    <hr class="dotted tall">
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-3" style="background-color: white">
                    
                    <h4 class="mb-md" style="color: black;text-decoration-line: underline">Messages</h4>
                    <br/>
                    <ul class="simple-bullet-list mb-xlg">
                        <li class="green">
                            <span class="title">CarWash2U is available for online booking.</span>
                            <span class="description truncate">You can visit CarWash2U website for booking car wash services! </span>
                        </li>
                        <br/>
                        <li class="red">
                            <span class="title">E-wallet payment is coming soon. </span>
                            <span class="description truncate">CarWash2U will accept e-wallet payment in the future.</span>
                        </li>
                        <br/>
                        <li class="orange">
                            <span class="title">Stay tune for the Chinese New Year Promotion.</span>
                            <span class="description truncate">CNY Promotion will be annouched on 1st February 2021!</span>
                        </li>
                    </ul>



                </div>

            </div>
            <!-- end: page -->
        </section>
  

   
</section>

<!-- Vendor -->
<script src="assets/vendor/jquery/jquery.js"></script>
<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Specific Page Vendor -->
<script src="assets/vendor/jquery-autosize/jquery.autosize.js"></script>

<!-- Theme Base, Components and Settings -->
<script src="assets/javascripts/theme.js"></script>

<!-- Theme Custom -->
<script src="assets/javascripts/theme.custom.js"></script>

<!-- Theme Initialization Files -->
<script src="assets/javascripts/theme.init.js"></script>

<script>
    var checkPass = function () {

        if (document.getElementById('password').value ===
            document.getElementById('confirm_password').value) {
            document.getElementById('message').style.color = 'green';
            document.getElementById('message').innerHTML = 'PASSWORD MATCHING';
            document.getElementById('submit').disabled = false;
          


        } else {
            document.getElementById('message').style.color = 'red';
            document.getElementById('message').innerHTML = 'PASSWORD NOT MATCHING';
            document.getElementById('submit').disabled = true;
        }
    }
</script>

</body>
</asp:Content>
