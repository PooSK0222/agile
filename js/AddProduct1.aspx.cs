using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class AddProduct1 : System.Web.UI.Page
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

            String email = Session["currentUser"].ToString();

            string queryQ = "select * from seller where email = '" + email + "'";
            SqlCommand cmdQ = new SqlCommand(queryQ, con);
            SqlDataReader custDataQ = cmdQ.ExecuteReader();

            custDataQ.Read();

            String seller_id = custDataQ["seller_id"].ToString();

            TextBox1.Text = seller_id;
            TextBox1.Enabled = false;

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from product";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            r3.DataSource = dt;
            r3.DataBind();

            string lastid = "P0000";

            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "select* from product where product_id like('P____') order by product_id asc";
            cmd2.ExecuteNonQuery();
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(dt2);
            foreach (DataRow dr2 in dt2.Rows)
            {
                lastid = dr2["product_id"].ToString();
            }


            lastid = lastid.Replace("P", "");
            lastid = Convert.ToString(Convert.ToInt32(lastid) + 1);


            if (lastid.Length.ToString() == "1")
            {
                lastid = "000" + lastid.ToString();
            }
            if (lastid.Length.ToString() == "2")
            {
                lastid = "00" + lastid.ToString();
            }
            if (lastid.Length.ToString() == "3")
            {
                lastid = "0" + lastid.ToString();
            }


            TextBox2.Text = "P" + lastid.ToString();




        }

        protected void submit_Click(object sender, EventArgs e)
        {
            String email = Session["currentUser"].ToString();

            string queryQ = "select * from seller where email = '" + email + "'";
            SqlCommand cmdQ = new SqlCommand(queryQ, con);
            SqlDataReader custDataQ = cmdQ.ExecuteReader();

            custDataQ.Read();

            String seller_id = custDataQ["seller_id"].ToString();

            TextBox1.Text = seller_id;
            TextBox1.Enabled = false;
            try
            {
                f1.SaveAs(Request.PhysicalApplicationPath + "/product_image/" + f1.FileName.ToString());
                string filepath = "product_image/" + f1.FileName.ToString();

                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "insert into product values('" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + filepath.ToString() + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','" + DropDownList1.SelectedItem.ToString() + "','" + seller_id + "')";
                cmd.ExecuteNonQuery();



                Response.Write("<script>alert('New Car Wash Service Inserted Successfully'); window.location.href=window.location.href;</script>");

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }
    }
}