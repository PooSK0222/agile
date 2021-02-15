using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace js
{
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

        //void Page_PreInit(object sender, EventArgs e)
        //{
        //    if (Session["accountType"] != null)
        //    {
        //        if (Session["accountType"].ToString() == "customer")
        //        {
        //            MasterPageFile = "~/unitedMasterPage2.master";
        //        }
        //        else if (Session["accountType"].ToString() == "seller")
        //        {
        //            MasterPageFile = "~/unitedMasterPage3.master";

        //        }
        //    }
        //    else
        //    {
        //        MasterPageFile = "~/unitedMasterPage.master";
        //    }


        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            if (!IsPostBack) { 

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

                String customerId = custDataQ["customer_id"].ToString();
                //string customerId = "C00001";
                double total = 0;

            SqlCommand cmd = new SqlCommand("select *  from cart a, product b where a.customer_id = @customerId and a.product_id = b.product_id ", con);
            cmd.Parameters.AddWithValue("@customerId", customerId);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                       
                    total += double.Parse(reader["price"].ToString());

                    dt.Rows.Add(reader["product_id"].ToString(), reader["image"].ToString(), reader["name"].ToString(), reader["price"].ToString(), reader["date"].ToString(), reader["time"].ToString());
                }
            }

            rpt.DataSource = dt;
            rpt.DataBind();
            }

        }

        
        protected void del_ServerClick(object sender, EventArgs e)
        {
            try
            {
                
                var btn = (HtmlAnchor)sender;
                var item = (RepeaterItem)btn.NamingContainer;


                HiddenField hdf = item.FindControl("hdf") as HiddenField;

                String email = Session["currentUser"].ToString();

                string queryQ = "select * from customer where email = '" + email + "'";
                SqlCommand cmdQ = new SqlCommand(queryQ, con);
                SqlDataReader custDataQ = cmdQ.ExecuteReader();

                custDataQ.Read();

                String customer_id = custDataQ["customer_id"].ToString();
                //string customerId = "C00001";


                SqlCommand cmd = new SqlCommand("delete  from cart where product_id = @productId and customer_id = @customerId ", con);
                cmd.Parameters.AddWithValue("@productId", hdf.Value);
                cmd.Parameters.AddWithValue("@customerId", customer_id);
                cmd.ExecuteNonQuery();

                Page_Load(sender, e);



                Response.Write("<script>alert('Item Removed'); window.location.href=window.location.href;</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('Delete unsuccessful.') </script>");
            }
            

        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            

            Response.Redirect("orders.aspx");

        }
        protected void btnCheck_ServerClick(object sender, EventArgs e)
        {
            String ccDate = cDate.Text;

            int j = 0;
            string queryJ = "select * from order_detail where date = '"+ccDate+"'";
            SqlCommand cmdJ = new SqlCommand(queryJ, con);
            SqlDataReader dataJ = cmdJ.ExecuteReader();

            if (dataJ.HasRows)
            {
                while (dataJ.Read())
                {
                    j++;
                }
            }



            item_in_cart.InnerText = j.ToString();
        }
        protected void btnModify_ServerClick(object sender, EventArgs e)
        {
            try { 
            String email = Session["currentUser"].ToString();

            string queryQ = "select * from customer where email = '" + email + "'";
            SqlCommand cmdQ = new SqlCommand(queryQ, con);
            SqlDataReader custDataQ = cmdQ.ExecuteReader();

            custDataQ.Read();


            String customer_id = custDataQ["customer_id"].ToString();
            //string customerId = "C00001";

            var btn = (Button)sender;
            var item = (RepeaterItem)btn.NamingContainer;

            HiddenField hdf = item.FindControl("hdf") as HiddenField;
            TextBox inDate = item.FindControl("inDate") as TextBox;
            TextBox inTime = item.FindControl("inTime") as TextBox;
             

            SqlCommand cmd = new SqlCommand("update cart set date = @date, time = @time where product_id = @productId and customer_id = @customerId", con);
            cmd.Parameters.AddWithValue("@customerId", customer_id);
            cmd.Parameters.AddWithValue("@productId", hdf.Value);
            cmd.Parameters.AddWithValue("@date", inDate.Text);
            cmd.Parameters.AddWithValue("@time", inTime.Text);
            cmd.ExecuteNonQuery();

                //int j = 0;
                //string queryJ = "select * from orders";
                //SqlCommand cmdJ = new SqlCommand(queryJ, con);
                //SqlDataReader dataJ = cmdJ.ExecuteReader();

                //if (dataJ.HasRows)
                //{
                //    while (dataJ.Read())
                //    {
                //        j++;
                //    }
                //}



                //String total = j.ToString();

                Response.Write("<script>alert('Date Confirmed')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert('Modify unsuccessful.') </script>");
            }

        }
    
    }
}