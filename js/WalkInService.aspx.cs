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
    public partial class WalkInService : System.Web.UI.Page
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

            txt1.Text = seller_id;
            txt1.Enabled = false;

            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from guest";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            r4.DataSource = dt;
            r4.DataBind();

            string lastid = "G0000";

            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "select* from guest where guest_id like('G____') order by guest_id asc";
            cmd2.ExecuteNonQuery();
            DataTable dt2 = new DataTable();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(dt2);
            foreach (DataRow dr2 in dt2.Rows)
            {
                lastid = dr2["guest_id"].ToString();
            }


            lastid = lastid.Replace("G", "");
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


            txt2.Text = "G" + lastid.ToString();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            String email = Session["currentUser"].ToString();

            string queryQ = "select * from seller where email = '" + email + "'";
            SqlCommand cmdQ = new SqlCommand(queryQ, con);
            SqlDataReader custDataQ = cmdQ.ExecuteReader();

            custDataQ.Read();

            String seller_id = custDataQ["seller_id"].ToString();

            txt1.Text = seller_id;
            txt1.Enabled = false;
            try
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                //txt5.Text = "insert into guest values('" + txt2.Text + "','" + txt3.Text + "','" + txt4.Text + "','" + txt5.Text + "','" + txt6.Text + "','" + txt7.Text + "','" + ddl2.SelectedItem.ToString() + "','" + ddl1.SelectedItem.ToString() + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','" + seller_id + "')";

                cmd.CommandText = "insert into guest values('" + txt2.Text + "','" + txt3.Text + "','" + ddl3.SelectedItem.ToString() + "','" + txt4.Text + "','" + ddl1.SelectedItem.ToString() + "','" + txt5.Text + "','" + txt6.Text + "','" + txt7.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd") + "','" + DateTime.Now.ToString("h:mm:ss tt") + "','" + ddl2.SelectedItem.ToString() + "','" + seller_id + "','" + ddl5.SelectedItem.ToString() + "')";
                cmd.ExecuteNonQuery();



                Response.Write("<script>alert('Walk-in Service Booking Successfully'); window.location.href=window.location.href;</script>");

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message.ToString());
            }
        }
    }
}


