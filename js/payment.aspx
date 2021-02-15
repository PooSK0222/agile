<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="js.payment" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">


    
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
        <style type="text/css">
            .auto-style2 {
                margin: 20px;
                width: 500px;
                height: 120px;
            }

            .auto-style3 {
                width: 1031px;
                height: 200px;
            }
            /*.auto-style6 {
            width: 590px;
            height: 50px;
            }*/

            .btn{
            background-color:black; 
            color:white;
            padding:15px;
            border:none;
            transition:0.4s ease-in-out background-color;
            width: 15%;
            margin-left: 20%
            }

        .btn:hover{
            background-color:#0094ff;
            color:white;
            padding:20px;
            border:none;
            cursor:pointer;
            transition:0.4s ease-in-out background-color;
        }
        
        
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                
                
                <h1 style="text-align: center; margin: 20px;">Payment Method and Details</h1>
                <%--<table class="auto-style2" style="width:50%;margin-left:15%">
                    <tr>
                        <td>Order Summary</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Total Amount:</td>
                        <td>--%>
                                 
                            <h2 style="width:50%;margin-left:15%"><asp:Label  ID="lblTotalAmount" runat="server"></asp:Label></h2>
                       <%-- </td>
                    </tr>
                </table>--%>
                <br />
                <table class="auto-style3" style="width:50%;margin-left:15%">
                    <tr>
                        <td>Payment Type:</td>
                        <td>
                            <asp:RadioButtonList ID="rblPaymentType" RepeatDirection="Horizontal" runat="server">
                                <asp:ListItem>Debit Card&nbsp</asp:ListItem>
                                <asp:ListItem>Credit Card</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        </tr>
                    
                    <tr>
                        <td>Name on Card:</td>
                        <td>
                            <asp:RadioButtonList ID="txtNameCard" RepeatDirection="Horizontal" runat="server">
                                <asp:ListItem>Public Bank&nbsp&nbsp</asp:ListItem>
                                <asp:ListItem>Maybank&nbsp&nbsp</asp:ListItem>
                                <asp:ListItem>CIMB Bank</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>Card Number:</td>
                        <td style="border:1px solid black">
                            <asp:TextBox ID="txtCardNo" maxlength="16" minlength="16" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Expiration Date: (MM/YY)</td>
                        <td style="border:1px solid black">
                            <asp:TextBox ID="txtExpirationDate" maxlength="5" runat="server" pattern="[0-1][0-9]/[0-9][0-9]"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>CVV:</td>
                        <td style="border:1px solid black">
                            <asp:TextBox ID="txtCVV" type="password" maxlength="3" pattern="[0-1][0-9][0-9]" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />

                <div class="form-group">
                  
                    <asp:Button ID="btnBackToMenu" Text="Cancel Payment" runat="server" CssClass="btn" />
                      <asp:Button ID="btnConfirm" Text="Confirm Payment" runat="server" CssClass="btn" OnClick="btnConfirm_Click"/>
                </div>

            </div>
        </form>
    </body>
        </html>
</asp:Content>
