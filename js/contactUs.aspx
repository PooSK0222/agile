<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="js.contactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">



    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style2 {
            width: 310px;
            height: 227px;
        }
        .auto-style3 {
            font-size: large;
            text-decoration: underline;
        }
        .auto-style4 {
            font-size: xx-large;
        }
        .auto-style5 {
            font-size: large;
        }
        .auto-style6 {
            text-decoration: underline;
        }
    </style>

    <form id="form1" runat="server">
        <div class="auto-style1">
            <br /><h1 class="auto-style4"><strong>Welcome to CarWash2U</h1>
            <br />
            </strong>
            <a href="homepage.aspx"><img class="auto-style2" src="images/CarWash2U%20logo.jpeg" /><br /></a>
            <br />
            <span class="auto-style3"><strong>Contact Info</strong><br />
            <br />
            </span><span class="auto-style5">Our Email : <em><a href="mailto:carwash2u.noreply@gmail.com">carwash2u.noreply@gmail.com</a><br />
            </em>Phone number : 03 - 9188 3133&nbsp;
            <br />
            <br />
            <span class="auto-style6"><strong>Business Hours<br />
            </strong></span>
            <br />
            10.00 a.m. - 8.00 p.m.</span></div>
    </form>


    </asp:Content>

