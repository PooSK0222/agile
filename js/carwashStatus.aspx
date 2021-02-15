<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage3.Master" AutoEventWireup="true" CodeBehind="carwashStatus.aspx.cs" Inherits="js.carwashStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

    <style type="text/css">
        table.table_class tbody tr th {
            text-align: center !important;
        }
    </style>
    <br />
    <br />
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table_class" AutoGenerateColumns="False" AutoGenerateEditButton="True" DataKeyNames="guest_id" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:BoundField DataField="guest_id" HeaderText="Guest ID" ReadOnly="True" SortExpression="guest_id" />
                    <asp:BoundField DataField="cust_name" HeaderText="Customer Name" SortExpression="cust_name" ReadOnly="True" />
                    <asp:BoundField DataField="branch" HeaderText="Branch" SortExpression="branch" ReadOnly="True" />
                    <asp:BoundField DataField="carplate_no" HeaderText="Car Plate Number" SortExpression="carplate_no" ReadOnly="True" />
                    <asp:BoundField DataField="product_category" HeaderText="Service Category" SortExpression="product_category" ReadOnly="True" />
                    <asp:BoundField DataField="service_selected" HeaderText="Additional Remark" SortExpression="service_selected" />
                    <asp:BoundField DataField="total_price" HeaderText="Total Price" SortExpression="total_price" ReadOnly="True" />
                    <asp:BoundField DataField="contact_no" HeaderText="Contact Number" SortExpression="contact_no" ReadOnly="True" />
                    <asp:BoundField DataField="date_added" HeaderText="Date" SortExpression="date_added" ReadOnly="True" />
                    <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" ReadOnly="True" />
                    <asp:BoundField DataField="payment_status" HeaderText="Payment Status" SortExpression="payment_status" />
                    <asp:BoundField DataField="seller_id" HeaderText="Seller ID" SortExpression="seller_id" ReadOnly="True" />
                    <asp:BoundField DataField="status" HeaderText="Order Status" SortExpression="status" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\unitedDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework"
                ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [guest]" UpdateCommand="UPDATE [guest] Set [payment_status]=@payment_status,[status]=@status Where [guest_id]=@guest_id"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
