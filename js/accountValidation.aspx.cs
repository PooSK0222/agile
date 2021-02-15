using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace js
{
    public partial class accountValidation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();

                SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");



                con.Open();


                string query = "select * from customer where ActivationCode = '" + activationCode + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader custData = cmd.ExecuteReader();


                string query2 = "select * from seller where ActivationCode = '" + activationCode + "'";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                SqlDataReader sellerData = cmd2.ExecuteReader();

                custData.Read();
                sellerData.Read();


                if (custData.HasRows)
                {
                    String email_address = custData["email"].ToString();
                    String confirmed = "yes";

                    SqlCommand cmd3 = con.CreateCommand();
                    cmd3.CommandType = System.Data.CommandType.Text;
                    cmd3.CommandText = "UPDATE customer SET ActivationCode = '', EmailConfirmed = '" + confirmed + "' WHERE email = '" + email_address + "'";
                    cmd3.ExecuteNonQuery();

                    String success_msg = "Congratulation, your account " + email_address + " has been successfully activated. \\nYou can now login to your account !\\n\\n THANK YOU !";
                    Response.Write("<script language='javascript'>window.alert('" + success_msg + "');window.location='signIn.aspx';</script>");



                }
                else if (sellerData.HasRows)
                {

                    String email_address = sellerData["email"].ToString();
                    String confirmed = "yes";

                    SqlCommand cmd4 = con.CreateCommand();
                    cmd4.CommandType = System.Data.CommandType.Text;
                    cmd4.CommandText = "UPDATE seller SET ActivationCode = '', EmailConfirmed = '" + confirmed + "' WHERE email = '" + email_address + "'";
                    cmd4.ExecuteNonQuery();

                    String success_msg = "Congratulation, your account " + email_address + " has been successfully activated. \\nYou can now login to your account !\\n\\n THANK YOU !";
                    Response.Write("<script language='javascript'>window.alert('" + success_msg + "');window.location='signIn.aspx';</script>");

                }
                else
                {
                    String msg = "This link has expired and be no longer valid !! \\n\\n Kindly contact our customer service if you need further assistance\\n\\nThank You.   ";
                    Response.Write("<script language='javascript'>window.alert('" + msg + "');window.location='signIn.aspx';</script>");

                }



            }

        }


    }
}