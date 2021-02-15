using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace js
{
    public partial class DuplicateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["duplicateUser"] != null)
            {
                String email = Session["duplicateUser"].ToString();                

                SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");


                con.Open();



                string query = "select * from customer where email = '" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader custData = cmd.ExecuteReader();

                custData.Read();

                String name = custData["name"].ToString();

                nameLabel.Text = name;
                emailLabel.Text = email;

                con.Close();


                //Response.Write("<script>alert('"+ name +"')</script>");
                //Response.Write("<script>alert('ASDASDS')</script>");
            }
            else if(Session["duplicateUser"] == null)
            {
                Response.Redirect("homepage.aspx");
            }



        }

        protected void Buyer_Click(object sender, EventArgs e)
        {
            Session["accountType"] = "customer";
            Session["currentUser"] = Session["duplicateUser"];
            Session["duplicateUser"] = null;
            Response.Redirect("userProfile.aspx");

        }

        protected void Admin_Click(object sender, EventArgs e)
        {
            Session["accountType"] = "seller";
            Session["currentUser"] = Session["duplicateUser"];
            Session["duplicateUser"] = null;
            Response.Redirect("AdminProfile.aspx");



        }


    }



}