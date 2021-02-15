using System;
using System.Data;
using System.Data.SqlClient;

namespace js
{
    public partial class unitedMasterPage : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["accountType"] = null;
            Session["currentUser"] = null;
            Session["duplicateUser"] = null;

            con.Open();


            string customerId = Session["customerId"].ToString();
            //string customerId = "C00001";
            double total = 0;

            SqlCommand cmd = new SqlCommand("select *  from cart a, product b where a.customer_id = @customerId and a.product_id = b.product_id ", con);
            cmd.Parameters.AddWithValue("@customerId", customerId);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    total += double.Parse(reader["quantity"].ToString()) * double.Parse(reader["price"].ToString());
                }
            }
            reader.Close();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rpt.DataSource = dt;
            rpt.DataBind();

            lblTotal.InnerText = total.ToString();


        }
    }
}