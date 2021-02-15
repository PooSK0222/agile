<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="js.WishList" %>



<asp:Content ID="Content1" ContentPlaceHolderID="unitedMasterPage2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody2" runat="Server" tittle="">
<!DOCTYPE html>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">--%>

    <style>

        .wishlist{
            width:1000px; 
            margin:0 auto;
            border-collapse:separate;
            border-spacing: 15px;
        }

        .word{
            vertical-align:top;
        }

        .orangeword{
            color:#FF8000;
        }

        .btnAddCart{
            background-color: white; 
            border: none;
            color: black; 
            border: 2px solid #1ff218;
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

        .btnAddCart:hover{
            background-color: #1ff218;
            color: white;
        }

        .btnRemove{
            background-color: white; 
            border: none;
            color: black; 
            border: 2px solid #FF0000;
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

        .btnRemove:hover{
            background-color: #FF0000;
            color: white;
        }
        .auto-style1 {
            vertical-align: top;
            width: 500px;
        }
    </style>

<%--</head>
<body>
    <form id="form1" runat="server">--%>
        <div class="wishlist">
            <table class="wishlist">
                <tr>
                    <td class="word">1</td>
                    <td class="word">
                        <img src="images/tanjiro_figure.jpg" alt="Tanjiro" style="width: 100px; height:100px;"/>
                    </td>
                    <td class="auto-style1">
                        Tanjiro figure
                    </td>
                    <td class="word orangeword">
                        RM299
                        <asp:Button class="btnAddCart" runat="server" Text="Add to Cart" />
                    </td>
                    <td class="word">
                        <asp:Button class="btnRemove" runat="server" Text="Remove" />
                    </td>
                </tr>
                <tr>
                    <td class="word">2</td>
                    <td class="word">
                        <img src="images/nezuko_figure.jpg" alt="Tanjiro" style="width: 100px; height:100px;"/>
                    </td>
                    <td class="auto-style1">
                        Nezuko figure
                    </td>
                    <td class="word orangeword">
                        RM299
                        <asp:Button class="btnAddCart" runat="server" Text="Add to Cart" />
                    </td>
                    <td class="word">
                        <asp:Button class="btnRemove" runat="server" Text="Remove" />
                    </td>
                </tr>
            </table>
        </div>
    <%--</form>
</body>
</html>--%>

</asp:Content>
