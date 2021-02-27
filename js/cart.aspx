<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage2.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="js.cart" %>

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
            border:solid;
            transition:0.4s ease-in-out background-color;
        }

        .btn:hover{
            background-color:#37a0ae; 
            color:white;
            padding:20px;
            border:solid;
            cursor:pointer;
            transition:0.4s ease-in-out background-color;
        }

        .btnModify{
            background-color:darkblue; 
            color:white;
            padding:10px;
            border:solid;
            transition:0.4s ease-in-out background-color;
        }
        
        .btnModify:hover{
            background-color:darkcyan;
            color:white;
            padding:10px;
            border:solid;
            cursor:pointer;
            transition:0.4s ease-in-out background-color;
        }
    </style>
</head>
<body>
    
        
        
    <form id="form1" runat="server">
        <div class="container-fluid row">
        <div class="col-xl-8" style="margin-left:200px;">
            <h1 style="text-align: center;margin:20px;" >Cart</h1><br />
            
           
                <div style="box-shadow: 0 4px 8px 0 rgb(255, 106, 0);padding:30px;margin-bottom:30px"> 
                                <div><h3>Check the Date Schedule </h3><div style="padding-left: 600px;"> There are total <h3 style="color: black" id="item_in_cart" runat="server"></h3>in this date</div>
                                Date <asp:Textbox type="date" CssClass="t" ID="cDate" runat="server"/><br /><br />
                <asp:Button ID="btnCheck" runat="server" OnClick="btnCheck_ServerClick" CssClass="btnModify" Text="Check Date Schedule" />

           </div>
            
            
                  </div>
            
            

            <asp:Repeater ID="rpt" runat="server">
                <ItemTemplate>
                    <div class="row" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);padding:30px;margin-bottom:30px">

                        <asp:HiddenField ID="hdf" runat="server"  Value='<%#Eval("pid") %>' />
                            <div class="col-xl-3">
                                <img src="<%#Eval("image") %>" alt="IMG" style="width: 150px; height: 150px" />
                            </div>
                            <div class="col-xl-3" style="padding-top: 30px;">
                                <label style="font-size: 20px"><%#Eval("name") %> </label> 
                              
                            </div>
                            <div class="col-xl-3" style="padding-top: 15px;"> 
                                 Date:
                                <asp:Textbox type="date" CssClass="d" ID="inDate" runat="server" Text='<%#Eval("date")%>'/><br /><br />
                                Time:<br />
                                <asp:Textbox type="time" CssClass="t" ID="inTime" runat="server" Text='<%#Eval("time")%>' min="12:00" max="18:00" required pattern="[0-9]{2}:[0-9]{2}"/><br /><br />
                               
                                <asp:Button ID="btnModify" runat="server" OnClick="btnModify_ServerClick" CssClass="btnModify" Text="Confirm Date" /> 
                            </div>
                            <div class="col-xl-3" style="padding-top: 50px;">
                              Price :  <label>$<%#Eval("price")%></label>

                                
                            </div>

                     <div style="position:absolute;float:right;right:30px;margin-top:-10px">
                       <a id="del" runat="server" onserverclick="del_ServerClick" style="font-size: 20px; font-weight: bold">x</a>
                    </div>
                         
                    </div>


                   
                </ItemTemplate>
            
                </asp:Repeater>
            <%--<div class="col-xl-3" style="padding-top: 15px;"> 
                                 Date:
                                <asp:Textbox type="date" CssClass="d" ID="inDate" runat="server" Text='<%#Eval("date")%>'/><br /><br />
                                Time:<br />
                                <asp:Textbox type="time" CssClass="t" ID="inTime" runat="server" Text='<%#Eval("time")%>' min="12:00" max="18:00" required pattern="[0-9]{2}:[0-9]{2}"/><br /><br />
                               
                                <asp:Button ID="btnModify" runat="server" OnClick="btnModify_ServerClick" CssClass="btnModify" Text="Modify" /> 
                            </div>--%>
               <div class="row" style="padding-left: 400px;">

                    <asp:Button ID="btnOrder" runat="server" Text="Check Out" CssClass="btn" OnClick="btnOrder_Click"   required/>
                </div>
        </div>
            </div>
            
    </form>
        
</body>
</html>
    </asp:Content>
