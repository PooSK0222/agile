using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace js
{
    public partial class OrderDetailPage : System.Web.UI.Page
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
            String orderID = Session["sessOrderID"].ToString();
            String customerID = Session["id"].ToString();

            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

            con.Open();

            string getCustomerQuery = "select * from customer where customer_id = '" + customerID + "'";
            SqlCommand getCustomercmd = new SqlCommand(getCustomerQuery, con);
            SqlDataReader CustomerData = getCustomercmd.ExecuteReader();

            string getOrderQuery = "select o.totalAmount, od.order_qty from orders o, order_detail od where od.order_id = o.order_id AND o.order_id = '" + orderID + "'";
            SqlCommand getOrdercmd = new SqlCommand(getOrderQuery, con);
            SqlDataReader orderData = getOrdercmd.ExecuteReader();

            while (CustomerData.Read())
            {
                lblAddress.Text = CustomerData["address"].ToString() + ", " + CustomerData["postal"].ToString() + ", " + CustomerData["city"].ToString() + ", " + CustomerData["state"].ToString();
            }

            int quantity = 0;
            while (orderData.Read())
            {
                lblTotalAmount.Text = "RM " + orderData["totalAmount"].ToString();
                quantity += (int)orderData["order_qty"];
            }

            lblTotalQuantity.Text = quantity + " Products";

            con.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrdersHistory.aspx");
        }
    }
}