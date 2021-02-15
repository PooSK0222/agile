<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master"  AutoEventWireup="true" CodeBehind="OrdersHistory.aspx.cs" Inherits="js.OrdersHistory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>--%>
    <style>
        .orderHistoryContent{
            width:1000px; 
            margin:0 auto;
        }
    </style>
<%--</head>
<body>--%>
    <form id="form1" runat="server">
        <div class="orderHistoryContent">
            <br />
            <h1>My Orders</h1>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="order_id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="order_id" HeaderText="order_id" ReadOnly="True" SortExpression="order_id" />
                    <asp:BoundField DataField="totalAmount" HeaderText="totalAmount" SortExpression="totalAmount" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [order_id], [totalAmount] FROM [orders] WHERE ([customer_id] = @customer_id)">
                <SelectParameters>
                    <asp:SessionParameter Name="customer_id" SessionField="id" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
<%--</body>
</html>--%>
</asp:Content> 
