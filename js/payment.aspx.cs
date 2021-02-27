using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI; 
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace js
{
    public partial class payment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");
        

       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();

            rblPaymentType.SelectedIndex = 0;
          
            lblTotalAmount.Text ="Total: RM "+ Session["totalOrder"].ToString();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            String cardName = txtNameCard.Text;
            String cardCvv = txtCVV.Text;
            String cardExp = txtExpirationDate.Text;
            String cardNumber = txtCardNo.Text;
            String cardType = rblPaymentType.SelectedValue.ToString();

            if (cardName.Equals("") || cardCvv.Equals("") || cardExp.Equals("") || cardNumber.Equals(""))

            {
                Response.Write("<script language=javascript>alert('Please fill in fields.');window.location='payment.aspx';</script>");
            }
            else
            {

           
            List<Order> orderList = (List<Order>)Session["orderList"];

            double total = double.Parse(Session["totalOrder"].ToString());
            DateTime now = DateTime.Now;

                String email = Session["currentUser"].ToString();

                string queryQ = "select * from customer where email = '" + email + "'";
                SqlCommand cmdQ = new SqlCommand(queryQ, con);
                SqlDataReader custDataQ = cmdQ.ExecuteReader();

                custDataQ.Read();

                String customer_id = custDataQ["customer_id"].ToString();
                //string customerId = "C00001";

                String orderId = "";

            SqlCommand cmd = new SqlCommand("select * from orders order by order_id desc", con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                if (reader.Read())
                {
                    orderId = reader["order_id"].ToString();
                    double num = double.Parse(orderId.Substring(1, 5));
                    num += 1;
                    orderId = "O" + num;
                }

            }
            else
                orderId = "O10001";
            reader.Close();

            SqlCommand cmd2 = new SqlCommand("insert into orders values(@orderId,@total,@customerId)", con);
            cmd2.Parameters.AddWithValue("@orderId", orderId);
            cmd2.Parameters.AddWithValue("@total", total);
            cmd2.Parameters.AddWithValue("@customerId", customer_id);
            cmd2.ExecuteNonQuery();

            foreach (Order orders in orderList)
            {
                SqlCommand cmd3 = new SqlCommand("insert into order_detail values(@orderId,@productId,@date,@time)", con);
                cmd3.Parameters.AddWithValue("@orderId", orderId);
                cmd3.Parameters.AddWithValue("@productId", orders.productId);
                cmd3.Parameters.AddWithValue("@date", orders.date);
                cmd3.Parameters.AddWithValue("@time", orders.time);
                cmd3.ExecuteNonQuery();
            }

            String paymentId = "";
            SqlCommand cmd4 = new SqlCommand("select * from payment order by payment_id desc", con);
            SqlDataReader reader2 = cmd4.ExecuteReader();
            if (reader2.HasRows)
            {
                if (reader2.Read())
                {
                    paymentId = reader2["payment_id"].ToString();
                    double num = double.Parse(paymentId.Substring(1, 5));
                    num += 1;
                    paymentId = "Z" + num;
                }

            }
            else
                paymentId = "Z10001";
            reader2.Close();

           
             

            SqlCommand cmd5 = new SqlCommand("insert into payment values(@paymentId,@total,@date,@time,@cardNumber,@cardType,@orderId)", con);
            cmd5.Parameters.AddWithValue("@paymentId", paymentId);
            cmd5.Parameters.AddWithValue("@total", total);
            cmd5.Parameters.AddWithValue("@date", now.ToString("dd/MM/yyyy"));
            cmd5.Parameters.AddWithValue("@time", now.ToString("HH:mm:ss"));
            cmd5.Parameters.AddWithValue("@cardNumber", cardNumber);
            cmd5.Parameters.AddWithValue("@cardType", cardType);
            cmd5.Parameters.AddWithValue("@orderId", orderId);
            cmd5.ExecuteNonQuery();

            SqlCommand cmd6 = new SqlCommand("delete from cart where customer_id = @customerId", con);
            cmd6.Parameters.AddWithValue("@customerId", customer_id);
            cmd6.ExecuteNonQuery();


                
                using (MailMessage mm = new MailMessage("carwash2u.noreply@gmail.com", email))
                {
                    

                    mm.Subject = "[CarWash2U Receipt]";

                    string body = "Dear Customer";
                    body += "<br /><br />Thank your for your payment of RM" + total + " on " + now.ToString("dd/MM/yyyy");
                    body += "<br /><br />Hope you enjoy our service soon";
                    body += "<br /><br />Email Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: " + email;
                    body += "<br /><br />Your Order ID is " + orderId;
                    body += "<br /><br /><br />";
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

                String success = "An receipt has been sent to " + email + " !\\nKindly check your email to check your receipt !";
                Response.Write("<script language='javascript'>window.alert('" + success + "');window.location='homepage.aspx';</script>");

                //Response.Write("<script language=javascript>alert('Order successful.');window.location='homepage.aspx';</script>");

            }
            Response.Write("<script language=javascript>alert('Payment Fail<br/> Please check your internet connection') </script>");
        }
        }
    }
