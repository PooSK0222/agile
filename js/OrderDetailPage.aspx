<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="OrderDetailPage.aspx.cs" Inherits="js.OrderDetailPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>--%>
    <style>
        .orderDetailContent {
            width: 1000px;
            margin: 0 auto; 
        }

        .orderDetailPart {
            width: 72%;
            float: left;
        }

        .summaryPart {
            width: 26%;
            float: right;
        }

        .btnBackDesign{
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

        .btnBackDesign:hover{
            background-color: #a0a0a0; 
        }
    </style>
<%--</head>
<body>--%>
    <form id="form1" runat="server">
        <div class="orderDetailContent">
            <div class="orderDetailPart">
                <br />
                <h1>Order Detail</h1>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="order_qty" HeaderText="order_qty" SortExpression="order_qty" />
                        <asp:BoundField DataField="unit_price" HeaderText="unit_price" SortExpression="unit_price" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <asp:Button class="btnBackDesign" ID="btnBack" runat="server" Text="Back to My Order" OnClick="btnBack_Click" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT p.name, od.order_qty, od.unit_price
FROM order_detail od, product p
WHERE p.product_id = od.product_id 
AND od.order_id = @order_id">
                    <SelectParameters>
                        <asp:SessionParameter Name="order_id" SessionField="sessOrderID" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            <div class="summaryPart">
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
            <b>Total</b><span style="float:right;"><asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label></span>
            </div>
        </div>
    </form>
<%--</body>
</html>--%>
</asp:Content> 
