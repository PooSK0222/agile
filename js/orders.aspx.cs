using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace js
{
    public partial class orders : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

        List<Order> orderList = new List<Order>();

        

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (con.State == ConnectionState.Open)
            //{
            //    con.Close();
            //}
            con.Open();

            DataTable dt = new DataTable();
            dt.Columns.Add("pid");
            dt.Columns.Add("image");
            dt.Columns.Add("name");
            dt.Columns.Add("price");
            dt.Columns.Add("date");
            dt.Columns.Add("time");


            String email = Session["currentUser"].ToString();

            string queryQ = "select * from customer where email = '" + email + "'";
            SqlCommand cmdQ = new SqlCommand(queryQ, con);
            SqlDataReader custDataQ = cmdQ.ExecuteReader();

            custDataQ.Read();


            String customer_id = custDataQ["customer_id"].ToString();
            //string customerId = "C00001";
            double total = 0;

            SqlCommand cmd = new SqlCommand("select *  from cart a, product b where a.customer_id = @customerId and a.product_id = b.product_id ", con);
            cmd.Parameters.AddWithValue("@customerId", customer_id);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    Order o = new Order(reader["product_id"].ToString(), reader["date"].ToString(), reader["time"].ToString());

                    orderList.Add(o);


               
                    total += double.Parse(reader["price"].ToString());

                    dt.Rows.Add(reader["product_id"].ToString(), reader["image"].ToString(), reader["name"].ToString(), reader["price"].ToString(), reader["date"].ToString(), reader["time"].ToString());
                }
            }

            lblTotal.Text = total.ToString();

            rpt.DataSource = dt;
            rpt.DataBind();

            con.Close();

        }

        

        protected void del_ServerClick(object sender, EventArgs e)
        {
            String email = Session["currentUser"].ToString();

            string queryQ = "select * from customer where email = '" + email + "'";
            SqlCommand cmdQ = new SqlCommand(queryQ, con);
            SqlDataReader custDataQ = cmdQ.ExecuteReader();

            custDataQ.Read();


            String customer_id = custDataQ["customer_id"].ToString();
            //string customerId = "C00001";

            var btn = (HtmlAnchor)sender;
            var item = (RepeaterItem)btn.NamingContainer;


            HiddenField hdf = item.FindControl("hdf") as HiddenField;
            HtmlGenericControl lblQty = item.FindControl("lblQty") as HtmlGenericControl;

            


            SqlCommand cmd = new SqlCommand("delete  from cart where product_id = @productId and customer_id = @customerId ", con);
            cmd.Parameters.AddWithValue("@productId", hdf.Value);
            cmd.Parameters.AddWithValue("@customerId", customer_id);
            cmd.ExecuteNonQuery();

            Page_Load(sender, e);
        }

     
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Session["orderList"] = orderList;
            Session["totalOrder"] = double.Parse(lblTotal.Text);

            Response.Redirect("payment.aspx"); 
        }
    }
}