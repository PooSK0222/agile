<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/unitedMasterPage3.Master" CodeBehind="myProduct.aspx.cs" Inherits="js.myProduct" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

 
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


    <asp:Repeater ID="r3" runat="server">
                <HeaderTemplate>
                    <table id="t1" style="width:100%">
                <tr>
                    <td>
                        ADMIN ID
                    </td>
                    <td>
                        SERVICE ID
                    </td>
                    <td>
                        SERVICE NAME
                    </td>
                    <td>
                        SERVICE CATEGORY
                    </td>
                    <td>
                        DESCRIPTION
                    </td>
                    <td>
                        PRICE (RM)
                    </td>
                  
                    <td>
                        DATE ADDED
                    </td>
                    <td>
                        IMAGE
                    </td>
                    <td>
                     DELETE
                 </td>
                </tr>

                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                    <td>
                      <%#Eval("seller_id") %>
                    </td>
                    <td>
                        <%#Eval("product_id") %>
                    </td>
                    <td>
                        <%#Eval("name") %>
                    </td>
                    <td>
                        <%#Eval("product_category") %>
                    </td>
                    <td>
                        <%#Eval("description") %> 
                    </td>
                    <td>
                       <%#Eval("price") %>
                    </td>
                  
                    <td>
                       <%#Eval("date_added") %>
                    </td>
                    <td>
                        <img src="<%#Eval("image") %>" alt="Spiderman" style="width:150px;height:150px;" />
                    </td>
                     <td><a href="delete.aspx?id=<%#Eval("product_id") %>">Delete</a></td>  
                </tr>

                </ItemTemplate>
                <FooterTemplate>
                      </table>
                </FooterTemplate>
            </asp:Repeater>

   


    </asp:Content>
