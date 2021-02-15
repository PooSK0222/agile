using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace js
{
    public partial class AccountSwitching : System.Web.UI.Page
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

            String email = Session["currentUser"].ToString();
            String accountType = Session["accountType"].ToString();


            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");


            con.Open();

            string query = "select * from customer where email = '" + email + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader custData = cmd.ExecuteReader();

            string query2 = "select * from seller where email = '" + email + "'";
            SqlCommand cmd2 = new SqlCommand(query2, con);
            SqlDataReader sellerData = cmd2.ExecuteReader();

            custData.Read();
            sellerData.Read();

            emailLabel.Text = email;

            if (custData.HasRows && sellerData.HasRows)
            {
                if (accountType == "customer")
                {
                    Session["accountType"] = "seller";
                    String switching_success = "Account Switching Succesfully \\n\\nSwtich from CUSTOMER >>>>> ADMIN !!!";
                    Response.Write("<script language='javascript'>window.alert('" + switching_success + "');window.location='AdminProfile.aspx';</script>");

                }
                else if (accountType == "seller")
                {
                    Session["accountType"] = "customer";
                    String switching_success = "Account Switching Succesfully \\n\\nSwtich from ADMIN >>>>> CUSTOMER !!!";
                    Response.Write("<script language='javascript'>window.alert('" + switching_success + "');window.location='userProfile.aspx';</script>");
                }
            }
            else
            {
                if (custData.HasRows)
                {
                    String name = custData["name"].ToString();
                    nameLabel.Text = name;
                    submit.Text = "Create ADMIN Account !";
                    submit.OnClientClick = @"return confirm('Are you sure you want create a new ADMIN Account ?');";


                }
                else if (sellerData.HasRows)
                {
                    String name = sellerData["name"].ToString();
                    nameLabel.Text = name;
                    submit.Text = "Create CUSTOMER Account !";
                    submit.OnClientClick = @"return confirm('Are you sure you want create a new CUSTOMER Account ?');";

                }
            }

            con.Close();
        }

        protected void create_acc_click(object sender, EventArgs e)
        {
            String email = Session["currentUser"].ToString();
            String accountType = Session["accountType"].ToString();


            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");


            con.Open();

            string query3 = "select * from customer where email = '" + email + "'";
            SqlCommand cmd3 = new SqlCommand(query3, con);
            SqlDataReader custData = cmd3.ExecuteReader();

            string query4 = "select * from seller where email = '" + email + "'";
            SqlCommand cmd4 = new SqlCommand(query4, con);
            SqlDataReader sellerData = cmd4.ExecuteReader();

            custData.Read();
            sellerData.Read();

            if (custData.HasRows)
            {
                string query5 = "select top 1 * from seller order by seller_id desc";
                SqlCommand cmd5 = new SqlCommand(query5, con);
                SqlDataReader id_data = cmd5.ExecuteReader();

                id_data.Read();

                String CustomerID = id_data["seller_id"].ToString();
                String Customer_Number_Str = CustomerID.Substring(1, 5);
                int Customer_Number = int.Parse(Customer_Number_Str);
                Customer_Number++;

                if (Customer_Number < 10)
                {
                    CustomerID = "S0000" + Customer_Number;
                }
                else if (Customer_Number < 100)
                {
                    CustomerID = "S000" + Customer_Number;
                }
                else if (Customer_Number < 1000)
                {
                    CustomerID = "S00" + Customer_Number;
                }
                else if (Customer_Number < 10000)
                {
                    CustomerID = "S0" + Customer_Number;
                }
                else
                {
                    CustomerID = "S" + Customer_Number;
                }


                String name = custData["name"].ToString();
                String password = custData["password"].ToString();
                String gender = custData["gender"].ToString();
                String contactNo = custData["contactNo"].ToString();
                String birthdate = custData["birthdate"].ToString();
                String register_date = custData["register_date"].ToString();
                String address = custData["address"].ToString();
                String postal = custData["postal"].ToString();
                String city = custData["city"].ToString();
                String state = custData["state"].ToString();
                String ActivationCode = custData["address"].ToString();
                String EmailConfirmed = "yes";

                SqlCommand cmd6 = con.CreateCommand();
                cmd6.CommandType = System.Data.CommandType.Text;
                cmd6.CommandText = "INSERT INTO seller VALUES ('" + CustomerID + "','" + name + "','" + email + "','" + password + "','" + gender + "','" + contactNo + "','" + birthdate + "','" + register_date + "','" + address + "','" + postal + "','" + city + "','" + state + "','" + ActivationCode + "','" + EmailConfirmed + "')";
                cmd6.ExecuteNonQuery();



                String success_msg = "Congratulation ! ADMIN Account of " + email + " has been succesfully created! \\n\\nYou can now switch account from CUSTOMER to ADMIN !";
                Response.Write("<script language='javascript'>window.alert('" + success_msg + "');window.location='homepage.aspx';</script>");






            }
            else if (sellerData.HasRows)
            {
                string query7 = "select top 1 * from customer order by customer_id desc";
                SqlCommand cmd7 = new SqlCommand(query7, con);
                SqlDataReader id_data = cmd7.ExecuteReader();

                id_data.Read();

                String CustomerID = id_data["customer_id"].ToString();
                String Customer_Number_Str = CustomerID.Substring(1, 5);
                int Customer_Number = int.Parse(Customer_Number_Str);
                Customer_Number++;

                if (Customer_Number < 10)
                {
                    CustomerID = "C0000" + Customer_Number;
                }
                else if (Customer_Number < 100)
                {
                    CustomerID = "C000" + Customer_Number;
                }
                else if (Customer_Number < 1000)
                {
                    CustomerID = "C00" + Customer_Number;
                }
                else if (Customer_Number < 10000)
                {
                    CustomerID = "C0" + Customer_Number;
                }
                else
                {
                    CustomerID = "C" + Customer_Number;
                }


                String name = sellerData["name"].ToString();
                String password = sellerData["password"].ToString();
                String gender = sellerData["gender"].ToString();
                String contactNo = sellerData["contactNo"].ToString();
                String birthdate = sellerData["birthdate"].ToString();
                String register_date = sellerData["register_date"].ToString();
                String address = sellerData["address"].ToString();
                String postal = sellerData["postal"].ToString();
                String city = sellerData["city"].ToString();
                String state = sellerData["state"].ToString();
                String ActivationCode = sellerData["address"].ToString();
                String EmailConfirmed = "yes";

                SqlCommand cmd8 = con.CreateCommand();
                cmd8.CommandType = System.Data.CommandType.Text;
                cmd8.CommandText = "INSERT INTO customer VALUES ('" + CustomerID + "','" + name + "','" + email + "','" + password + "','" + gender + "','" + contactNo + "','" + birthdate + "','" + register_date + "','" + address + "','" + postal + "','" + city + "','" + state + "','" + ActivationCode + "','" + EmailConfirmed + "')";
                cmd8.ExecuteNonQuery();



                String success_msg = "Congratulation ! CUSTOMER Account of " + email + " has been succesfully created! \\n\\nYou can now switch account from ADMIN to CUSTOMER !";
                Response.Write("<script language='javascript'>window.alert('" + success_msg + "');window.location='homepage.aspx';</script>");



            }
        }




    }


}