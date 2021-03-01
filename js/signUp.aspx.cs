using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace js
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["accountType"] != null)
            {
                Response.Redirect("homepage.aspx");
            }

        }



        protected void Register_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");



            String email_address = email.Value;


            con.Open();


            string query = "select * from customer where email = '" + email_address + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader custData = cmd.ExecuteReader();

            string query2 = "select * from seller where email = '" + email_address + "'";
            SqlCommand cmd2 = new SqlCommand(query2, con);
            SqlDataReader sellerData = cmd2.ExecuteReader();

            custData.Read();
            sellerData.Read();


            if (custData.HasRows || sellerData.HasRows)
            {
                errorMsg.InnerText = "THIS EMAIL HAS BEEN REGISTERED WITH US ! ";
                con.Close();
            }
            else
            {
                String CustomerID = "";

                String accountType = Request.Form["acctype"].ToString();
                String fullName = fullname.Value;

                String userPassword = password.Value;
                String userGender = Request.Form["gender"].ToString();
                String phoneNo = phone.Value;
                String reg_date = DateTime.Now.ToString("dd-MM-yyyy");
                String bd = birthdate.Value;

                String bd_year = bd.Substring(0, 4);
                String bd_month = bd.Substring(5, 2);
                String bd_day = bd.Substring(8, 2);

                String birthday = bd_day + "-" + bd_month + "-" + bd_year;

                String cust_seller;
                if (accountType == "customer")
                    cust_seller = "customer_id";
                else
                    cust_seller = "seller_id";



                string query3 = "select top 1 * from " + accountType + " order by " + cust_seller + " desc";
                SqlCommand cmd3 = new SqlCommand(query3, con);
                SqlDataReader id_data = cmd3.ExecuteReader();

                id_data.Read();

                CustomerID = id_data[cust_seller].ToString();
                String Customer_Number_Str = CustomerID.Substring(1, 5);
                int Customer_Number = int.Parse(Customer_Number_Str);
                Customer_Number++;

                if (accountType == "customer")
                {

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


                }
                else if (accountType == "seller")
                {
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

                }


                String empty = "";

                SqlCommand cmd4 = con.CreateCommand();
                cmd4.CommandType = System.Data.CommandType.Text;
                cmd4.CommandText = "INSERT INTO " + accountType + " VALUES ('" + CustomerID + "','" + fullName + "','" + email_address + "','" + userPassword + "','" + userGender + "','" + phoneNo + "','" + birthday + "','" + reg_date + "','" + empty + "','" + empty + "','" + empty + "','" + empty + "','" + empty + "','" + empty + "')";
                cmd4.ExecuteNonQuery();
                con.Close();


                String success_msg = "Account Email : " + email_address + " Has Been Successfully Registered.\\n\\nAn Email has been sent to you, please activate your account from the link to perform first time login !";
                SendEmail();
                Response.Write("<script language='javascript'>window.alert('" + success_msg + "');window.location='signIn.aspx';</script>");



            }



        }

        public void SendEmail() 
        {
            String email_address = email.Value;
            String fullName = fullname.Value;
            String accountType = Request.Form["acctype"].ToString();
            String emailConfirm = "no";


            string activationCode = Guid.NewGuid().ToString();

            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "UPDATE " + accountType + " SET ActivationCode = '"+ activationCode +"' , EmailConfirmed = '" + emailConfirm +"' WHERE email = '" + email_address + "'" ;
            cmd.ExecuteNonQuery();

            con.Close();


            using (MailMessage mm = new MailMessage("carwash2u.noreply@gmail.com", email_address))
            {
                mm.Subject = "[CarWash2U Account Activation]";

                string body = "Hello " + fullName + ",";
                body += "<br /><br />Congratulation! Your CarWash2U account has been successfully created.";
                body += "<br /><br />To complete the process, please click on the link to verify your email address.";
                body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("signUp.aspx", "accountValidation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
                body += "<br /><br />";
                body += "<br /><br /><br /> CarWash2U ";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("carwash2u.noreply@gmail.com", "CarWash2U789");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }





        }
    }
}
