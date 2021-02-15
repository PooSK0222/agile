<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage3.Master" AutoEventWireup="true" CodeBehind="WalkInService.aspx.cs" Inherits="WebApplication1.WalkInService" %>

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

     <form runat="server" method="post">
        <div>
            <h1 style="margin-left:15%"><b>REGISTER FOR CAR WASH SERVICES (FOR WALK-IN CUSTOMER) </b></h1><br />
            
            <table class="auto-style3" style="width:50%;margin-left:15%">
                <p style="color:red">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;* One order one service only.</p>
                <p style="color:red">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;* All payment accept cash only.</p>
                
                <tr>
                    <td class="auto-style6">
                        ADMIN ID:
                        </td>
                    <td class="form-control">
                        <asp:TextBox ID="txt1" runat="server" Style="border-style:solid; border-width:1px;border-color:black;"></asp:TextBox>
                    </td>
                </tr> 

                 <tr>
                    <td class="auto-style6">
                        GUEST ID:
                        </td>
                    <td class="form-control">
                        <asp:TextBox ID="txt2" runat="server" Style="border-style:solid; border-width:1px;border-color:black;"></asp:TextBox>
                    </td>
                </tr>
                                               
                <tr >
                    <td class="auto-style6">
                        CUSTOMER NAME : 
                         </td>
                    <td class="form-control">
                        <asp:TextBox ID="txt3" runat="server"></asp:TextBox>
                    </td>
                </tr>

                 <tr>
                    <td class="auto-style6">
                        BRANCHES :
                         </td>
                    <td>
                        <asp:DropDownList ID="ddl3" runat="server" CssClass="form-control">
                            <asp:ListItem>Please choose one...</asp:ListItem>
                            <asp:ListItem>SUBANG</asp:ListItem>                            
                            <asp:ListItem>KEPONG</asp:ListItem>                            
                        </asp:DropDownList>
                        <br />
                    </td>                    
                </tr>
               
                <tr>
                    <td class="auto-style6">
                        CAR PLATE NUMBER : 
                         </td>
                    <td class="form-control">
                        <asp:TextBox ID="txt4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td class="auto-style6">
                        SERVICE CATEGOERY
                         </td>
                    <td>
                        <asp:DropDownList ID="ddl1" runat="server" CssClass="form-control">
                            <asp:ListItem>Choose the services...</asp:ListItem>
                            <asp:ListItem>Washing Service - Car Wash (washing only) [ RM6 ] </asp:ListItem>
                            <asp:ListItem>Washing Service - Wash & Soap [ RM15 ]</asp:ListItem>
                            <asp:ListItem>Washing Service - Foam Brush [ RM20 ]</asp:ListItem>
                            <asp:ListItem>Washing Service - Carpet Washing [ RM20 ]</asp:ListItem>
                            <asp:ListItem>Vacuuming Service - Car Seat Vacuuming [ RM20 ]</asp:ListItem>
                            <asp:ListItem>Vacuuming Service - Rear Compartment Vacuuming [ RM30 ]</asp:ListItem>
                            <asp:ListItem>Vacuuming Service - Whole Car Vacuuming [ RM50 ]</asp:ListItem>
                            <asp:ListItem>Vacuuming Service - Carpet Vacuum [ RM20 ]</asp:ListItem>
                            <asp:ListItem>Cleaning Service - Tire Cleaning [ RM20 ]</asp:ListItem>
                            <asp:ListItem>Cleaning Service - Interior Cleaning [RM30 ]</asp:ListItem>
                            <asp:ListItem>Cleaning Service - Polishing and Waxing [ RM100 ]</asp:ListItem>
                            <asp:ListItem>Cleaning Service - Engine Cleaning [ RM30 ]</asp:ListItem>                                                       
                            <asp:ListItem>Combo Service - Car Wash & Vacuum Car Seat [ RM25 ]</asp:ListItem>
                            <asp:ListItem>Combo Service - Tire Cleaning & Vacuum Carpet [ RM35 ]</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </td>                    
                </tr>

                <tr>
                    <td class="auto-style6">
                        ADDTIONAL REMARK :
                         </td>
                    <td >
                        <asp:TextBox id="txt5" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Example: No"></asp:TextBox></td>
                </tr>
                
                <tr>
                    <td class="auto-style6">
                        TOTAL PRICE :
                         </td>
                    <td class="form-control">
                        <asp:TextBox ID="txt6" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style6">
                        CONTACT NUMBER :
                         </td>
                    <td class="form-control">
                        <asp:TextBox ID="txt7" runat="server" ></asp:TextBox>
                    </td>
                </tr>

                 <tr>
                    <td class="auto-style6">
                        PAYMENT STATUS :
                         </td>
                    <td>
                        <asp:DropDownList ID="ddl2" runat="server" CssClass="form-control">
                            <asp:ListItem>UNPAID</asp:ListItem>
                            <asp:ListItem>PAID</asp:ListItem>                            
                        </asp:DropDownList>
                        <br />
                    </td>                    
                </tr>

                <tr>
                   <td class="auto-style6">
                        ORDER STATUS :
                         </td>
                    <td>
                        <asp:DropDownList ID="ddl5" runat="server" CssClass="form-control">
                            <asp:ListItem>Pending</asp:ListItem>                                                      
                        </asp:DropDownList>
                        <br />
                    </td>             
                </tr>

                 <tr>
                    
                    <td colspan="2" align="center" >
                        <asp:Button ID="submit" runat="server" cssclass="form-control btn-success col-lg-4" Text="Submit" OnClick="submit_Click" style="color:white"/><br />
                        <asp:Button ID="btn1" runat="server" cssclass="form-control btn-success col-lg-4" PostBackUrl="~/carwashStatus.aspx" Text="Check Status" style="color:white"/>
                    </td>
                </tr>
           </table>
            <br />

    <asp:Repeater ID="r4" runat="server">
        <HeaderTemplate>
            <table id="t1" style="width:100%">

                <tr>
                    <td>
                        ADMIN ID
                    </td>
                    <td>
                        GUEST ID
                    </td>                    
                    <td>
                        CUSTOMER NAME
                    </td>
                    <td>
                        BRANCH
                    </td>
                    <td>
                        CAR PLATE NUMBER
                    </td>
                    <td>
                        SERVICE CATEGORY
                    </td>
                    <td>
                        ADDITIONAL REMARK
                    </td>
                    <td>
                        TOTAL PRICE (RM)
                    </td>
                    <td>
                        CONTACT NUMBER 
                    </td>
                    <td>
                        DATE
                    </td>
                    <td>
                        TIME
                    </td>
                    <td>
                        PAYMENT STATUS
                    </td> 
                    <td>RECEIPT</td>
                    <td>ORDER STATUS</td>
                </tr>
                
        </HeaderTemplate>
        <ItemTemplate>
                    <tr>
                    <td>
                      <%#Eval("seller_id") %>
                    </td>
                    <td>
                        <%#Eval("guest_id") %>
                    </td>                      
                    <td>
                        <%#Eval("cust_name") %>
                    </td>
                    <td>
                         <%#Eval("branch") %>
                    </td>
                    <td>
                        <%#Eval("carplate_no") %>
                    </td>                    
                    <td>
                        <%#Eval("product_category") %> 
                    </td>
                    <td>
                       <%#Eval("service_selected") %>
                    </td>
                    <td>
                        <%#Eval("total_price") %>
                    </td>
                    <td>
                        <%#Eval("contact_no") %>
                    </td>
                    <td>
                       <%#Eval("date_added") %>
                    </td>
                    <td>
                         <%#Eval("time") %>
                    </td>
                    <td>
                        <%#Eval("payment_status") %>
                    </td>
                    <td><a href="receipt.aspx?gid=<%#Eval("guest_id") %>">Generate Receipt</a></td>
                    <td><%#Eval("status") %></td>
                </tr>
            
                </ItemTemplate>
        
                
        
                <FooterTemplate>
                    </table>
                    
                </FooterTemplate>
            </asp:Repeater>
            
            

               

               
          
        </div>
        </form>
   


    </asp:Content>



