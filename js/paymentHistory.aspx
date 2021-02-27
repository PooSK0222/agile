<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/unitedMasterPage2.Master" CodeBehind="paymentHistory.aspx.cs" Inherits="js.paymentHistory" %>



 
<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }
        .auto-style2 {
            height: 32px;
            width: 214px;
        }
        .auto-style3 {
            width: 214px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <h1 style="margin-left:15%"><b>Receipt</b></h1><br />
            <asp:Repeater ID="rpt" runat="server">
                <ItemTemplate>
                    <div class="row" style="padding:30px;margin-bottom:20px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);">
                        <table style="width:50%;margin-left:15%">
                            <tr>
                                <td class="auto-style2">Payment ID:</td>
                                <td class="auto-style1">
                                    <asp:Label ID="lblPaymentID" runat="server" Text='<%#Eval("payment_id") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Order ID:</td>
                                <td>
                                    <asp:Label ID="lblOrderID" runat="server" Text='<%#Eval("order_id") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Payment Date :</td>
                                <td>
                                    <asp:Label ID="lblPayDate" runat="server" Text='<%#Eval("payment_date") %>' ></asp:Label>
                                </td>
                            </tr>
                              <tr>
                                <td class="auto-style3">Payment  Time:</td>
                                <td>
                                    <asp:Label ID="lblPayTime" runat="server" Text=' <%#Eval("payment_time") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Card No:</td>
                                <td>
                                    <asp:Label ID="lblCardNo" runat="server" Text='<%#Eval("creditNumber") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Card Type:</td>
                                <td>
                                    <asp:Label ID="lblCardType" runat="server" Text='<%#Eval("creditType") %>'></asp:Label>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="auto-style3">Total Pay:</td>
                                <td>
                                    RM <asp:Label ID="lblTotalPay" runat="server" Text='<%#Eval("totalPayment") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
            <br />
            <%--<asp:Button ID="btnBackToMenu"  Text="Back to Menu" runat="server" />--%>
        </div>
    </form>
</body>
</html>

    </asp:Content>
