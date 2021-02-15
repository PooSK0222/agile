<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage3.Master" AutoEventWireup="true" CodeBehind="filter.aspx.cs" Inherits="WebApplication1.filter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

    <style type="text/css">
        .auto-style1 {
            width: 43%;
            height: 218px;
            background-color: #CCFFFF;
        }

        .auto-style2 {
            height: 26px;
            width: 558px;
            
        }

        .auto-style4 {
            height: 26px;
            width: 263px;
            font-weight: bold;
            text-align: center;
        }

        .auto-style6 {
            width: 100%;
            height: 45px;
        }

        .auto-style7 {
            width: 481px;
        }

        .auto-style8 {
            height: 12px;
            width: 263px;
            font-weight: bold;
            text-align: center;
        }

        .auto-style9 {
            height: 12px;
            width: 558px;
            
        }

        .simpletransit:hover {
            background-color: #ffdf9d;
            color: #000;
            height: 65px;
            width: 375px;
            padding: 10px;
            border: solid 1px #fff;
            -webkit-border-radius: 16px 2px 16px 2px;
            -moz-border-radius: 16px 2px 16px 2px;
            border-radius: 16px 2px 16px 2px;
            font-size: 25px;
            transition: opacity 1s, top 1s, right 1s;
            cursor: pointer;
        }
    </style>

    <style type="text/css">
        table.table_class tbody tr th {
            text-align: center !important;
        }
        .auto-style10 {
            font-weight: normal;
        }
    </style>



<body>
    <form id="form1" runat="server">  
        
        <div>
            <br />
            <center><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="CarWash2U Monthly Sales Report "></asp:Label>
            &nbsp;<br />
            <br />
            
            
            <center><table class="auto-style1">
                <tr>
                    <td class="auto-style8"><strong>Select the Month<br /> </td>
                    <td class="auto-style9">
                        <table class="auto-style6">
                            <tr>
                                <center><td class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style10">&nbsp;Month :&nbsp;</span>&nbsp;</b>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Value="1">January</asp:ListItem>
                                        <asp:ListItem Value="2">February</asp:ListItem>
                                        <asp:ListItem Value="3">March</asp:ListItem>
                                        <asp:ListItem Value="4">April</asp:ListItem>
                                        <asp:ListItem Value="5">May</asp:ListItem>
                                        <asp:ListItem Value="6">June</asp:ListItem>
                                        <asp:ListItem Value="7">July</asp:ListItem>
                                        <asp:ListItem Value="8">August</asp:ListItem>
                                        <asp:ListItem Value="9">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList>
                                </td></center><br />
                                <td>&nbsp;</td>
                            </tr>
                        </table></center>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"><center>Type the Year</center></td>
                    <td class="auto-style2">
                        
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style10">&nbsp;Year :</span> &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        
                        </strong>
                        
                    </td>
                </tr>
            </table>
            <br />
            <center><asp:Button runat="server" CssClass="simpletransit" OnClick="Button1_Click" Text="Show Sales Data" /><br /><br />
             
                



            <table>
                <br />
                

                <asp:GridView ID="GridView1" runat="server" CssClass="table_class" AutoGenerateColumns="False" Width="1395px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Height="96px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="guest_id" HeaderText="Guest ID" />
                        <asp:BoundField DataField="branch" HeaderText="Branch" />
                        <asp:BoundField DataField="product_category" HeaderText="Service Category" />
                        <asp:BoundField DataField="total_price" HeaderText="Total Price" />
                        <asp:BoundField DataField="date_added" HeaderText="Date" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView><br /><br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\unitedDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [guest]"></asp:SqlDataSource>
                

            </table></center>
                 
        </div>
        </div>
    </form>
</asp:Content>