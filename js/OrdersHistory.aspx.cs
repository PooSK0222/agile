using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace js
{
    public partial class OrdersHistory : System.Web.UI.Page
    {
        void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["accountType"] == null)
            {
                Response.Redirect("homepage.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //String email = "abc@gmail.com";
            String email = Session["currentUser"].ToString();
            String accountType = Session["accountType"].ToString();
            //accountType == "customer" / "seller"


            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");
            con.Open();

            string getCustomerQuery = "select * from customer where email = '" + email + "'";
            SqlCommand getCustomercmd = new SqlCommand(getCustomerQuery, con);
            SqlDataReader CustomerData = getCustomercmd.ExecuteReader();

            while (CustomerData.Read())
            {
                Session["id"] = CustomerData["customer_id"].ToString();
            }

            con.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            String orderID = row.Cells[1].Text;

            Session["sessOrderID"] = orderID;
            Response.Redirect("OrderDetailPage.aspx");
        }
    }
}