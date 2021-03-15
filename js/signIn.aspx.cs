using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace js
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["accountType"] != null)
            {
                Response.Redirect("homepage.aspx");
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string inputEmail = Request.Form["email"];
            string inputPassword = Request.Form["password"];

            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");


            con.Open();


            string query = "select * from customer where email = '" + inputEmail + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader custData = cmd.ExecuteReader();

            string query2 = "select * from seller where email = '" + inputEmail + "'";
            SqlCommand cmd2 = new SqlCommand(query2, con);
            SqlDataReader sellerData = cmd2.ExecuteReader();

            custData.Read();
            sellerData.Read();

            String custPassword = "";
            String sellerPassword = "";

            Boolean account_verified = false;


            if (custData.HasRows)
            {
                custPassword = custData["password"].ToString();
                if (custData["EmailConfirmed"].ToString() == "yes")
                {
                    account_verified = true;
                }

            }
            else if (sellerData.HasRows)
            {
                sellerPassword = sellerData["password"].ToString();
                if (sellerData["EmailConfirmed"].ToString() == "yes")
                {
                    account_verified = true;
                }
            }
            else if (custData.HasRows && sellerData.HasRows)
            {
                custPassword = custData["password"].ToString();
                sellerPassword = sellerData["password"].ToString();

                //at this stage, account_verified directly assign to true. Because user can only own 2 account when they successfully log in to one existing account and apply for second account type.
                account_verified = true;
            }



            if (custData.HasRows || sellerData.HasRows)
            {
                //Bring user to duplicate account page do decide whether login as buyer or seller
                if ((custData.HasRows && sellerData.HasRows) && (inputPassword == custPassword))
                {
                    if (account_verified)
                    {
                        Session["duplicateUser"] = inputEmail;
                        Response.Redirect("DuplicateAccount.aspx");
                    }
                }
                else if (!custData.HasRows && inputPassword == sellerPassword)
                {
                    if (account_verified)
                    {
                        //Log in to Seller panel
                        Session["accountType"] = "seller";
                        Session["currentUser"] = inputEmail;
                        Response.Redirect("AdminProfile.aspx");
                    }
                }
                else if (!sellerData.HasRows && inputPassword == custPassword)
                {
                    if (account_verified)
                    {
                        //Log in to Customer Panel
                        Session["accountType"] = "customer";
                        Session["currentUser"] = inputEmail;
                        Response.Redirect("userProfile.aspx");
                    }

                }
                else
                {
                    errorSpace.Visible = true;
                    errorMsg.Visible = true;
                    errorMsg.Text = "The password that you've entered is incorrect.";
                    account_verified = true;
                }
            }
            else
            {
                errorSpace.Visible = true;
                errorMsg.Visible = true;
                errorMsg.Text = "The email " + inputEmail + " that you've entered doesn't match any account.";
                account_verified = true;
            }


            if (!account_verified)
            {
                String access_denied = "Access Denied !!! \\nYour account " + inputEmail + " is not yet verify. Kindly head to your mailbox and verify your UNITED account through the email we sent you before.";
                Response.Write("<script language='javascript'>window.alert('" + access_denied + "');window.location='signIn.aspx';</script>");
            }

           
            con.Close();



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");


            con.Open();

            String email = hfNum.Value;


            string query = "select * from customer where email = '" + email  + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader custData = cmd.ExecuteReader();

            string query2 = "select * from seller where email = '" + email + "'";
            SqlCommand cmd2 = new SqlCommand(query2, con);
            SqlDataReader sellerData = cmd2.ExecuteReader();

            custData.Read();
            sellerData.Read();

            if(custData.HasRows || sellerData.HasRows)
            {
                String password = "";
                String fullName = "";
                if (custData.HasRows)
                {
                    password = custData["password"].ToString();
                    fullName = custData["name"].ToString();

                }else if (sellerData.HasRows)
                {
                    password = sellerData["password"].ToString();
                    fullName = sellerData["name"].ToString();

                }

                using (MailMessage mm = new MailMessage("carwash2u.noreply@gmail.com", email))
                {
                    mm.Subject = "[CarWash2U Password Retrieval]";

                    string body = "Dear " + fullName + ",";
                    body += "<br /><br />We have received a request to reset the password associated with this e-mail address. If you made this request, please follow the instructions below.";
                    body += "<br /><br />It's easy to forget things! Following your password reset, please find below your login details.";
                    body += "<br /><br />Email Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " + email;
                    body += "<br />Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : " + password;
                    body += "<br /><br />Please note that this action totally performed by our system and do not involve any participation of our personnel.";
                    body += "<br /><br /><br />THANK YOU !";
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

                String success = "An email has been sent to " + email + " !\\nKindly check your email to retrieve the password !";
                Response.Write("<script language='javascript'>window.alert('" + success + "');window.location='signIn.aspx';</script>");



            }
            else
            {

                String access_denied = "Error !!!\\nEmail " + email + " not found !";
                Response.Write("<script language='javascript'>window.alert('" + access_denied + "');window.location='signIn.aspx';</script>");
            }



        }



    }

}
