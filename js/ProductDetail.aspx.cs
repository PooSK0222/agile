using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Diagnostics;

namespace js
{

    public partial class ProductDetail : System.Web.UI.Page
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
            
            con.Open();

            string productid = Request.QueryString["product_id"].ToString();
            //string productid = "P0005";

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from product where product_id='" + productid.ToString() + "'"; 
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                lblName.InnerText = reader["name"].ToString();
                lblCat.InnerText = reader["product_category"].ToString();
                lblDescription.InnerText = reader["description"].ToString();
                lblPrice.InnerText = reader["price"].ToString();
                img.Src = reader["image"].ToString();

                //    string order = Request.QueryString["order_id"].ToString();
                //SqlCommand cmd2 = con.CreateCommand();
                //cmd2.CommandType = CommandType.Text;

                //int h = 0;
                //string queryH = "select * from order where order_id='" + order.ToString() + "'";
                //SqlCommand cmdH = new SqlCommand(queryH, con);
                //SqlDataReader dataH = cmdH.ExecuteReader();
                //if (dataH.HasRows)
                //{
                //    while (dataH.Read())
                //    {
                //        h++;
                //    }

                //}
                //currenttime.InnerText = h.ToString();
                //}
            }
        }
        

        protected void btnAdd_ServerClick(object sender, EventArgs e)
        {
            

            //String email = Session["currentUser"].ToString();

            //string queryQ = "select * from customer where email = '" + email + "'";
            //SqlCommand cmdQ = new SqlCommand(queryQ, con);
            //SqlDataReader custDataQ = cmdQ.ExecuteReader();

            //custDataQ.Read();


            //String customer_id = custDataQ["customer_id"].ToString();

            try
            {
                String email = Session["currentUser"].ToString();

                string queryQ = "select * from customer where email = '" + email + "'";
                SqlCommand cmdQ = new SqlCommand(queryQ, con);
                SqlDataReader custDataQ = cmdQ.ExecuteReader();

                custDataQ.Read();


                String customer_id = custDataQ["customer_id"].ToString();

                string productid = Request.QueryString["product_id"].ToString();
                //string productid = "P0005";

                //string customerId = Session["currentUser"].ToString();
                //string customerId = "C00001";

                String empty = "";

                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                //SqlCommand cmd2 = new SqlCommand("insert into cart values (@customerId, @productid, @date, @time) ", con);
                SqlCommand cmd2 = new SqlCommand("insert into cart values (@customerId, @productid,'" + empty + "', '" + empty + "') ", con);
                cmd2.Parameters.AddWithValue("@productid", productid);
                cmd2.Parameters.AddWithValue("@customerId", customer_id);                
                //cmd2.Parameters.AddWithValue("@date", inDate.Value);
                //cmd2.Parameters.AddWithValue("@time", inTime.Value);
                cmd2.ExecuteNonQuery();

                Response.Write("<script>alert('Add to cart Successfully'); window.location.href=window.location.href;</script>");
            }
            catch(Exception ex)
            {
                Response.Write("<script language=javascript>alert(' Item exist in cart.') </script>");
            }

        }
        
        

    }
}