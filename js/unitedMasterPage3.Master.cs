using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class unitedMasterPage3 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] != null)
            {
                String email = Session["currentUser"].ToString();

                SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");


                con.Open();

                string query = "select * from customer where email = '" + email + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader custData = cmd.ExecuteReader();

                string query2 = "select * from seller where email = '" + email + "'";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                SqlDataReader sellerData = cmd2.ExecuteReader();

                custData.Read();
                sellerData.Read();

                String name = sellerData["name"].ToString();

                nameLabel.Text = name;
                emailLabel.Text = email;



                con.Close();
                custData.Close();
            }
            else
            {
                nameLabel.Text = "";
                emailLabel.Text = "";
            }



        }
    }
}