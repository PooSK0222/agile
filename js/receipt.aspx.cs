using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace js
{
    public partial class receipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

            con.Open();

            string guestid = Request.QueryString["gid"].ToString();

            string query = "select * from guest where guest_id = '" + guestid + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader custData = cmd.ExecuteReader();

            custData.Read();

            String seller_id = custData["seller_id"].ToString();

            TextBox1.Text = seller_id;

            String guest_id = custData["guest_id"].ToString();

            TextBox2.Text = guest_id;

            String date_added = custData["date_added"].ToString();

            TextBox3.Text = date_added;

            String payment_status = custData["payment_status"].ToString();

            TextBox4.Text = payment_status;


            String total_price = custData["total_price"].ToString();

            TextBox5.Text = total_price;



            con.Close();


        }


    }
}