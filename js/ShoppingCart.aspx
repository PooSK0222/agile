<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="js.ShoppingCart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">--%>
    <style>

        .content{
            width:1000px; 
            margin:0 auto;
        }

        .cart{
            width:72%;
            float:left;
        }

        .summary{
            width: 26%;
            float:right;
        }   

        .word{
            vertical-align:top;
        }

        .orangeword{
            color:#FF8000;
        }

        .btnMinus,.btnAdd{
            background-color: #e7e7e7; 
            border: none;
            color: white;
            padding: 8px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .btnMinus:hover, .btnAdd:hover{
            background-color: #a0a0a0; 
        }

        .btnOrder{
            background-color: white; 
            border: none;
            color: black; 
            border: 2px solid #FF8000;
            padding: 16px 80px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .btnOrder:hover{
            background-color: #FF8000;
            color: white;
        }

        .btnAddToCart1234{
            background-color: white; 
            border: none;
            color: black; 
            border: 2px solid #0ff74d;
            padding: 4px 8px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
            cursor: pointer;
        }

        .btnAddToCart1234:hover{
            background-color: #0ff74d;
            color: white;
        }

        </style>
<%--</head>
<body>--%>
    <form id="form1" runat="server">
        <div class="content">
        <div class="cart">
            <%--<table class="auto-style1">--%><%--<tr>
                    <td class="word">1</td>
                    <td class="word">
                        <img src="/picture/tanjiro_figure.jpg" alt="Tanjiro" style="width: 100px; height:100px;"/>
                    </td>
                    <td class="auto-style2">
                        <asp:GridView ID="GridviewASP" runat="server">
                        </asp:GridView>

                    </td>
                    <td class="word orangeword">
                        RM299
                    </td>
                    <td class="word" style="text-align:center;">
                        <asp:Button class="btnMinus" runat="server" Text="-" />
                        <asp:TextBox ID="TextBox1" runat="server" Width="40px" style="text-align:center;" Height="30px">1</asp:TextBox>
                        <asp:Button class="btnAdd" runat="server" Text="+" />
                    </td>
                    <td class="word">
                        <asp:Button class="btnRemove" runat="server" Text="Remove" />
                    </td>
                </tr>--%><%--<tr>
                    <td class="word">2</td>
                    <td class="word">
                        <img src="/picture/nezuko_figure.jpg" alt="Tanjiro" style="width: 100px; height:100px;"/>
                    </td>
                    <td class="auto-style2">
                        Nezuko figure
                    </td>
                    <td class="word orangeword">
                        RM299
                    </td>
                    <td class="word" style="text-align:center;">
                        <asp:Button class="btnMinus" runat="server" Text="-" />
                        <asp:TextBox ID="TextBox2" runat="server" Width="40px" style="text-align:center;" Height="30px">1</asp:TextBox>
                        <asp:Button class="btnAdd" runat="server" Text="+" />
                    </td>
                    <td class="word">
                        <asp:Button class="btnRemove" runat="server" Text="Remove" />
                    </td>
                </tr>--%>            
            <%--</table>--%>
            <br />
            <h1>Shopping Cart</h1>
            <br />
            <asp:Label ID="lblEmptyCartMsg" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="product_id" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="product_id" HeaderText="product_id" ReadOnly="True" SortExpression="product_id" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <br />
            Product ID:
            <asp:TextBox ID="txtProduct" runat="server"></asp:TextBox>
&nbsp;&nbsp;
            <asp:Button class="btnAddToCart1234" ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click" Text="Add to Cart" />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM cart
WHERE product_id = @product_id" SelectCommand="SELECT p.product_id, p.name, p.price, c.quantity
FROM cart c, product p
WHERE p.product_id = c.product_id
AND c.customer_id = @customer_id;">
                <DeleteParameters>
                    <asp:Parameter Name="product_id" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="customer_id" SessionField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
     
        <div class="summary">
            <br />
            Shipping Address:<br />
            <asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label>
            <hr />
            Order Summary:<br />
            <br />
            <span style="float:right">
                <asp:Label ID="lblTotalQuantity" runat="server" Text="Label"></asp:Label></span>
            <br />
            <br />
            <b>Total</b><span class="orangeword" style="float:right;"><asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label></span>
            <br />
            <br />
            <asp:Button class="btnOrder" runat="server" Text="Place Order" ID="btnPlaceOrder" OnClick="btnPlaceOrder_Click"/>
        </div>
     </div>
     </form>
<%--</body>
</html>--%>
</asp:Content>  