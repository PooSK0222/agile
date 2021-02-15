<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="js.WebForm2" Title="UNITED Log In" %>




<asp:Content>



    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">


    <div class="main">

        <div class="container"  >
            <div class="signup-content">
                <form method="post" runat="server" class="signup-form" id="signInForm" autocomplete="off">
                    <h2 style="color:ghostwhite; font-weight:bold; font-family:Arial"><span class="fa fa-sign-in"></span> Sign In  </h2>
                    <h3 class="desc" style="font-weight:bold; color:aquamarine">Welcome to <span style="color:deepskyblue">CarWash2U</span></h3>
                    
                    <p><asp:Label style="color:#AD0000" id="errorMsg" Visible="false" runat="server"></asp:Label></p>
                    <div class="form-group">
                       <asp:TextBox class="fa fa-envelope-o" style="font-size:20px"> &nbsp&nbsp </asp:TextBox><input runat="server" type="text" class="form-input" name="email" id="email" placeholder="Email Address - peter@example.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"></asp:TextBox>
                    </div>
             
                    <div class="form-group" >
                        <a class="fa fa-key" style="font-size:20px"> &nbsp&nbsp </a><input runat="server" type="password" class="form-input" name="password" id="password" placeholder="Password"/>
                        <span toggle="#password" style="color:mediumspringgreen;" class="zmdi zmdi-eye-off field-icon toggle-password"></span>
                    </div>

               

                   <br />
                     <div class="form-group" style="padding-left:150px">
                        <asp:Button runat="server" onclick="Submit_Click" type="submit" name="signIn" id="signIn" class="form-submit submit" text="Sign In"></asp:Button>
                    </div>

                       <br />
                    <asp:HiddenField ID="hfNum" runat="server" />
                    <asp:Button ID="Button1" style="width:130px;font-size:13px;color:dodgerblue;border:thin;cursor:pointer"  OnClientClick="return GetNumber()" runat="server" Text="Forget Password?"
                     OnClick="Button1_Click" />

                    <span id="errorSpace" runat="server" visible="false"><br /></span>

                    <br />
                    <p style="padding-left:155px;font-size:16px">Not A Member Yet? 
                        <br />
                    <a href="signUp.aspx" style="text-decoration:underline; font-weight:bold; color:gold;padding-left:27px;font-size:17px">Join Now</a></br />
                    
                    </p>
                     
                    

                   

                </form>
            </div>
        </div>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main2.js"></script>

    <script type="text/javascript">
        function GetNumber() {
            var num = prompt("*****  Forget Password  *****\nEmail Address : ");

            if (num != null) {
                document.getElementById('hfNum').value = num;
                return true;
            } else {
                return false;
            }
            
        }
    </script>



</asp:Content>
