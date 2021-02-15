<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage3.Master" AutoEventWireup="true" CodeBehind="UploadGallery2.aspx.cs" Inherits="js.UploadGallery2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="unitedMasterPage3" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody3" runat="Server" tittle="">

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <title></title>
    
    <style type="text/css">
        .auto-style2 {
            height: 120px;
            width: 590px;
        }
        .auto-style3 {
            width: 1031px;
            height: 248px;       
        }
        #t1 tr td {
            border: 1px solid black;
            border-collapse:collapse;
            padding: 12px;
        }
        #t1 td{
            text-align: center;
        }
        .auto-style6 {
            width: 590px;
            height: 50px;
        }
        </style>
    
</head>
<body>
    <form id="form1" >
        <div>
            <h1 style="center">UPLOAD COSTUME AND IMAGES</h1>

            <table class="auto-style3">
                <tr>
                    <td class="auto-style6">
                        ADMIN ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style6">
                        GALLERY ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
               
                <tr>
                    <td class="auto-style6">
                        PRODUCT NAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr> 
                <tr>
                    <td class="auto-style6">
                        GALLERY CATEGORY&nbsp; :&nbsp; 
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Marvel Series</asp:ListItem>
                            <asp:ListItem>Disney Series</asp:ListItem>
                            <asp:ListItem>DC series</asp:ListItem>
                            <asp:ListItem>Anime Figure</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </td>                    
                </tr>                    
                <tr>
                    <td class="auto-style2">
                        DATE ADDED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        IMAGE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                        <asp:Button ID="Button1" runat="server" Text="Choose File" />
                    </td>
                </tr>             
               
                
            </table>
            <br />
            <div>
                <h1 align="center">
                        GALLERY OF THE COSTUME COSPLAY
                    </h1>
            </div>
            <table id="t1" style="width:100%">

                <tr>                    
                    <td>
                        <img src="image/spiderman.jpg" alt="Spiderman" style="width:250px;height:250px;" /><br />
                        SID001
                        GID0001<br />
                        SPIDERMAN <br />
                        MARVEL SERIES <br />
                        15/7/2019 <br />
                    </td>

                    <td>
                        <img src="image/mickeymosue.jfif" alt="Mickey Mouse" style="width:250px;height:250px;" /><br />
                         SID003<br />
                         GID0002<br />
                         Mickey Mouse<br />
                         Disney Series<br />
                         12/5/2019<br />
                    </td>

                    <td>
                        <img src="image/wonderwomen.jpg" alt="Wonder Women" style="width:250px;height:250px;" /><br />
                        SID006<br />
                        GID0003<br />
                        Wonder Women<br />
                        DC Series<br />
                        5/10/2019<br />
                    </td>

                    <td>
                        <img src="image/fairytail.jpg" alt="Fairy Tail" style="width:250px;height:250px;" /><br />
                        SID009<br />
                        GID0008<br />
                        Fairy Tail<br />
                        Anime Figure<br />
                        3/11/2019<br />
                    </td>
                </tr>
            </table>
        </div>
       
    </form>
</body>
</html>

</asp:Content>
