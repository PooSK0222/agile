<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="js.orders" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MasterPage" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteBody" runat="Server" tittle="">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <title></title>
    <style>
        a{
            color:black;
            text-decoration:none; 
        }

        a:hover{
            color:black;
            text-decoration:none; 
            cursor:pointer;
        }

        .btn{
            background-color:darkcyan; 
            color:white;
            padding:20px;
            border:none;
            transition:0.4s ease-in-out background-color;
        }

        .btn:hover{
            background-color:#37a0ae; 
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
        <div class="container-fluid row">
            <div class="col-xl-8" style="margin-left: 200px;">
                <h1 style="text-align: center; margin: 20px;">Order</h1>
                <asp:Repeater ID="rpt" runat="server">
                    <ItemTemplate>
                        <div class="row" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); padding: 30px; margin-bottom: 30px">

                            <asp:HiddenField ID="hdf" runat="server" Value='<%#Eval("pid") %>' />
                            <div class="col-xl-3">
                                <img src="<%#Eval("image") %>" alt="IMG" style="width: 150px; height: 150px" />
                            </div>
                            <div class="col-xl-3" style="padding-top: 30px;">
                                <label style="font-size: 20px"><%#Eval("name") %> </label>
                                <br />
                            
                            </div>
                            <div class="col-xl-3" style="padding-top: 15px;"> 
                                 Date:
                                <asp:Label   ID="inDate" runat="server" Text='<%#Eval("date")%>'/><br /><br />
                                Time:<br />
                               <asp:Label   ID="inTime" runat="server" Text='<%#Eval("time")%>'/><br />
                               
                               
                            </div>
                            <div class="col-xl-3" style="padding-top: 50px;">
                                Price : 
                                   <span>$<%#Eval("price")%></span>
                            </div>

                           <%-- <div style="position: absolute; float: right; right: 30px; margin-top: -10px">
                                <a id="del" runat="server" onserverclick="del_ServerClick" style="font-size: 20px; font-weight: bold">x</a>
                            </div>--%>

                        </div>



                    </ItemTemplate>
                </asp:Repeater>
               <%-- <div class="col-xl-3" style="padding-top: 15px;"> 
                                 Date:
                                <asp:Label   ID="inDate" runat="server" Text='<%#Eval("date")%>'/><br /><br />
                                Time:<br />
                               <asp:Label   ID="inTime" runat="server" Text='<%#Eval("time")%>'/><br />
                               
                               
                            </div>--%>

                  <div class="row" style="padding-left: 400px;font-weight:bold;font-size:25px;">
                   Total : RM <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </div>


                <div class="row" style="padding-left: 400px;">
                    <asp:Button ID="btnOrder" runat="server" Text="Place Order" CssClass="btn" OnClick="btnOrder_Click" OnClientClick="return confirm('Confirm to place this order?');" />
                </div>
                 

            </div>
        </div>
    </form>
</body>
    </html>
</asp:Content>
