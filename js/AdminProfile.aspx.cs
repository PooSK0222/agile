using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace js
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["accountType"] == null || Session["accountType"].ToString() != "seller" )
            {
                Response.Redirect("homepage.aspx");
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            submit.OnClientClick = @"return confirm('Are you sure you want to change password ?');";


            if (Session["accountType"].ToString() == "seller" && Session["currentUser"] != null)
            {
                String email = Session["currentUser"].ToString();

                SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");


                con.Open();

                string query = "select * from seller where email = '" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader custData = cmd.ExecuteReader();

                custData.Read();

                String name = custData["name"].ToString();
                String contactNo = custData["contactNo"].ToString();
                String birthdate = custData["birthdate"].ToString();
                String register_date = custData["register_date"].ToString();

                nameHeader.Text = name;
                nameLabel.Text = name;
                emailLabel.Text = email;
                phoneLabel.Text = contactNo;
                birthdateLabel.Text = birthdate;
                dateJoinedLabel.Text = register_date;

                FeedDateJoined.Text = register_date;

                edit_email.Text = email;
                edit_name.Text = name;

                custData.Close();
                con.Close();


            }

        }

        protected void ChangePass_Click(object sender, EventArgs e)
        {
            String accType = Session["accountType"].ToString();
            String email = Session["currentUser"].ToString();
            String new_password = password.Value;




            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = C:\Users\skpoo\Desktop\Online Car Wash Booking System\Web Assignment\webassg\WebApplication1\WebApplication1\App_Data\unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");
            con.Open();





            SqlCommand cmd = con.CreateCommand();
            SqlDataReader duplicateData = null;

            if (accType == "customer")
            {
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "SELECT * FROM seller WHERE email = '" + email + "'";
                duplicateData = cmd.ExecuteReader();
                duplicateData.Read();
            }
            else if(accType == "seller"){
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "SELECT * FROM customer WHERE email = '" + email + "'";
                duplicateData = cmd.ExecuteReader();
                duplicateData.Read();
            }


            if (duplicateData.HasRows)
            {
                SqlCommand cmd2 = con.CreateCommand();
                cmd2.CommandType = System.Data.CommandType.Text;
                cmd2.CommandText = "UPDATE customer SET password = '" + new_password + "' WHERE email = '" + email + "'";
                cmd2.ExecuteNonQuery();


                SqlCommand cmd3 = con.CreateCommand();
                cmd3.CommandType = System.Data.CommandType.Text;
                cmd3.CommandText = "UPDATE seller SET password = '" + new_password + "' WHERE email = '" + email + "'";
                cmd3.ExecuteNonQuery();

            }
            else
            {
                SqlCommand cmd4 = con.CreateCommand();
                cmd4.CommandType = System.Data.CommandType.Text;
                cmd4.CommandText = "UPDATE " + accType + " SET password = '" + new_password + "' WHERE email = '" + email + "'";
                cmd4.ExecuteNonQuery();

            }


            con.Close();

            String success_msg = "Password Changed Succesfully !!!\\nPlease LogIn Again With Your New Password ! ";
            Response.Write("<script language='javascript'>window.alert('" + success_msg + "');window.location='LogOut.aspx';</script>");

        }


      
    }
}