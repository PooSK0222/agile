<%@ Page Language="C#" MasterPageFile="~/unitedMasterPage3.Master" AutoEventWireup="true" CodeBehind="AddProduct1.aspx.cs" Inherits="WebApplication1.AddProduct1" EnableEventValidation="false" %>


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
            <h1 style="margin-left:15%">ADD NEW CAR WASH SERVICES</h1>
            
            <table class="auto-style3" style="width:50%;margin-left:15%">
                <tr>
                    <td class="auto-style6">
                        ADMIN ID:
                        </td>
                    <td class="form-control">
                        <asp:TextBox ID="TextBox1" runat="server" Style="border-style:solid; border-width:1px;border-color:black;"></asp:TextBox>
                    </td>
                </tr>

                <tr >
                    <td class="auto-style6">
                        SERVICE ID: 
                         </td>
                    <td class="form-control">
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
               
                <tr>
                    <td class="auto-style6">
                        SERVICE NAME: 
                         </td>
                    <td class="form-control">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr> 
                <tr>
                    <td class="auto-style6">
                        SERVICE CATEGORY
                         </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                            <asp:ListItem>Washing Services</asp:ListItem>
                            <asp:ListItem>Vacuuming Services</asp:ListItem>
                            <asp:ListItem>Cleaning Services</asp:ListItem>
                            <asp:ListItem>Combo Services</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </td>                    
                </tr>
                <tr>
                    <td class="auto-style6">
                        DESCRIPTION:
                         </td>
                    <td >
                        <asp:TextBox id="TextBox4" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox></td>
                </tr> 
                <tr>
                    <td class="auto-style6">
                      
                         </td>
                    <td >
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        PRICE :
                         </td>
                    <td class="form-control">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>

                  
                
                <tr>
                    <td class="auto-style6">
                        IMAGE:
                         </td>
                    <td>
                        <asp:FileUpload ID="f1" runat="server" cssclass="form-control" />
                    </td>
                </tr>  
                <tr>
                    
                    <td colspan="2" align="center" >
                        <asp:Button ID="submit" runat="server" cssclass="form-control btn-success col-lg-4" Text="Submit" OnClick="submit_Click" style="color:white"/>
                    </td>
                </tr>              
               
                
            </table>
            <br />

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
                        <img src="<%#Eval("image") %>" alt="Service" style="width:150px;height:150px;" />
                    </td>
                    
                </tr>

                </ItemTemplate>
                <FooterTemplate>
                      </table>
                </FooterTemplate>
            </asp:Repeater>

            

               

               
          
        </div>
        </form>
   


    </asp:Content>


