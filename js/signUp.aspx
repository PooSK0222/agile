<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signUp.aspx.cs" Inherits="js.WebForm3" Title="UNITED Registration" %>


<asp:Content>



    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">


    <div class="main">

        <div class="container">
            <div class="signup-content">
                <form method="POST" id="signUpForm" class="signup-form" runat="server">

                    <h2 style="color:ghostwhite; font-weight:bold; font-family:Arial; font-size:25px"><span class="fa fa-user-plus"></span> CREATE AN ACCOUNT</h2>
                    
                        
                    <h3 runat="server" id="errorMsg" style="color:#AD0000" ></h3>

                      <div class="form-group"  >
      
                         <a class="fa fa-user-o" style="font-size:20px"> &nbsp&nbsp </a><span style="font-family:Arial;font-weight:normal" class="form-input">Account Type : </span>
                         <input runat="server" style="width:4%" type="radio" name="acctype" value="seller"  required>ADMIN &nbsp&nbsp
                         <input runat="server" style="width:4%" type="radio" name="acctype" value="customer" required>CUSTOMER
                        </fieldset>
                              </div>



                     <div class="form-group">
                       <a class="fa fa-id-card" style="font-size:20px"> &nbsp&nbsp </a><input runat="server" type="text" class="form-input" name="fullname" id="fullname" placeholder="Full Name" maxlength = "49" required/>
                    </div>

                    <div class="form-group">
                       <a class="fa fa-envelope-o" style="font-size:20px"> &nbsp&nbsp </a><input runat="server" type="text" class="form-input" name="email" id="email" placeholder="Email Address - peter@example.com" title="@example.com is Required" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  required/>
                    </div>
             
            
                    <div class="form-group" >
                        <a class="fa fa-key" style="font-size:20px" id="keyicon"> &nbsp&nbsp </a><input runat="server" required onchange='checkPass();' onkeyup='checkPass();' style="width:35%" type="password" class="form-input" name="password" id="password" placeholder="Password">
                        <span toggle="#password" style="color:mediumspringgreen;" class="zmdi zmdi-eye-off toggle-password" ></span>
                        &nbsp&nbsp&nbsp&nbsp&nbsp
                        <a class="fa fa-key" style="font-size:20px" id="keyicon2"> &nbsp&nbsp </a><input onchange='checkPass();' onkeyup='checkPass();' style="width:35%" type="password" class="form-input" name="password2" id="password2" placeholder="Confirm Password">
                        <span toggle="#password2" style="color:mediumspringgreen;" class="zmdi zmdi-eye-off toggle-password2"></span>
                    </div>

                    <div class="form-group" >
                        
                         <a class="fa fa-venus-mars" style="font-size:20px"> &nbsp&nbsp </a><span style="font-family:Arial;font-weight:normal" class="form-input">Gender : </span>
                         <input runat="server" style="width:4%" type="radio" name="gender" value="Male" required>Male &nbsp&nbsp
                         <input runat="server" style="width:4%" type="radio" name="gender" value="Female" required>Female
                        
                            <br />                 
                    </div>


                    <div class="form-group">
                        <a class="fa fa-mobile" style="font-size:20px"> &nbsp&nbsp </a>
                        <input runat="server" style="width:50%" type="text" class="form-input" name="phone" id="phone" placeholder="Contact Number +60123456789" maxlength="14" title="+60 & 10 Digit NO. IS REQUIRED" pattern="^\+60\d{9,12}$" required/>
                        &nbsp&nbsp&nbsp
                        <a  class="fa fa-birthday-cake" style="font-size:20px"> &nbsp&nbsp </a><input runat="server" style="width:30%" type="date" class="form-input" name="birthdate" id="birthdate" />
                    </div>


                               
                     <div class="form-group" style="padding-left:150px;width:100%">
                        <asp:Button runat="server" onclick="Register_Click" type="submit" name="signUpBtnn" id="signUp" class="form-submit submit" text="Sign Up"/>
                         <br /><br />
                           <p style="padding-left: 0px ;font-size:16px">Having Account? <a href="signIn.aspx" style="text-decoration:underline; font-weight:bold; color:deepskyblue;padding-left:27px;font-size:15px">Sign In Here!  </a> 
                    </p>
                    </div>

                    
                  
                     
                   

                </form>
            </div>
        </div>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main2.js"></script>

    <script>
            var checkPass = function() {
            if (document.getElementById('password').value ===
                document.getElementById('password2').value) {
                document.getElementById('password').style.color = 'lightgreen';
                document.getElementById('password2').style.color = 'lightgreen';
                document.getElementById('keyicon').style.color = 'lightgreen';
                document.getElementById('keyicon2').style.color = 'lightgreen';
                document.getElementById('signUp').disabled = false;

                document.getElementById('signUp').style.backgroundColor = "white";
                document.getElementById('signUp').style.border = "1px solid white";
                document.getElementById('signUp').style.color = "color: orange";
                document.getElementById('signUp').style.cursor = "pointer";

                
           

 
            } else {
                document.getElementById('password').style.color = 'darkred';
                document.getElementById('password2').style.color = 'darkred';
                document.getElementById('keyicon').style.color = 'darkred';
                document.getElementById('keyicon2').style.color = 'darkred';
                document.getElementById('signUp').disabled = true;
                document.getElementById('signUp').style.backgroundColor = "#cccccc";
                document.getElementById('signUp').style.border = "1px solid #999999";
                document.getElementById('signUp').style.color = "color: #666666;";
                document.getElementById('signUp').style.cursor = "not-allowed";

                      
        }
    }

    </script>




</asp:Content>

