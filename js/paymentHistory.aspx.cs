using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace js
{
    public partial class paymentHistory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

        void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["accountType"] != null)
            {
                if (Session["accountType"].ToString() == "customer")
                {
                    MasterPageFile = "~/unitedMasterPage2.master";
                }
                else if (Session["accountType"].ToString() == "seller")
                {
                    MasterPageFile = "~/unitedMasterPage3.master";

                }
            }
            else
            {
                MasterPageFile = "~/unitedMasterPage.master";
            }


        }

        protected void Page_Load(object sender, EventArgs e)
        {


            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();


            String email = Session["currentUser"].ToString();

            string queryQ = "select * from customer where email = '" + email + "'";
            SqlCommand cmdQ = new SqlCommand(queryQ, con);
            SqlDataReader custDataQ = cmdQ.ExecuteReader();

            custDataQ.Read();


            String customer_id = custDataQ["customer_id"].ToString();
            //string customerId = "C00001";


            SqlCommand cmd = new SqlCommand("select *  from orders a, payment b where a.customer_id = @customerId and a.order_id = b.order_id ", con);
            cmd.Parameters.AddWithValue("@customerId", customer_id);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rpt.DataSource = dt;
            rpt.DataBind();
        }
    }
}