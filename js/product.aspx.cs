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
    public partial class product : System.Web.UI.Page
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

            if (Request.QueryString["category"] == null)
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from product";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                r1.DataSource = dt;
                r1.DataBind();
            }
            else
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "select * from product where product_category='" + Request.QueryString["category"].ToString() + "'";
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                r1.DataSource = dt;
                r1.DataBind();
            }

                
        }
    }
}