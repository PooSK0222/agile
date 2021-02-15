using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace js
{
    public partial class ShoppingCart : System.Web.UI.Page
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
            //String email = "abc@gmail.com";
            String email = Session["currentUser"].ToString();
            String accountType = Session["accountType"].ToString();
            //accountType == "customer" / "seller"


            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

            con.Open();

            string getCustomerQuery = "select * from customer where email = '" + email + "'";
            SqlCommand getCustomercmd = new SqlCommand(getCustomerQuery, con);
            SqlDataReader CustomerData = getCustomercmd.ExecuteReader();

            while (CustomerData.Read())
            {
                Session["id"] = CustomerData["customer_id"].ToString();
                lblAddress.Text = CustomerData["address"].ToString() + ", " + CustomerData["postal"].ToString() + ", " + CustomerData["city"].ToString() + ", " + CustomerData["state"].ToString();
            }

            String customerID = Session["id"].ToString();
            //txtCust.Text = customerID;
            //txtCust.Enabled = false;

            String getCustomerCartQuery = "SELECT* from cart c, product p where p.product_id = c.product_id AND c.customer_id = '" + customerID + "'";
            SqlCommand getCustomerCartcmd = new SqlCommand(getCustomerCartQuery, con);

            SqlDataReader getCartData = getCustomerCartcmd.ExecuteReader();

            if (getCartData.HasRows)
            {
                double price = 0;
                double totalAmount = 0;
                int totalQTY = 0;

                while (getCartData.Read())
                {
                    int quantity = (int)getCartData["quantity"];
                    double.TryParse(getCartData["price"].ToString(), out price);
                    totalAmount += (price * quantity);
                    totalQTY += quantity;
                }

                lblTotalQuantity.Text = "" + totalQTY + " Products";
                lblTotalAmount.Text = "RM " + totalAmount;
            }
            else
            {
                lblEmptyCartMsg.Text = "Currently there is no item inside your cart.";
                lblEmptyCartMsg.Visible = true;
                lblTotalQuantity.Text = "No products";
                lblTotalAmount.Visible = false;
            }

            con.Close();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            String customerID = Session["id"].ToString();
            String productID = txtProduct.Text;
            Boolean counter = false;


            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

            con.Open();

            String getCustomerCartQuery = "SELECT * from cart where customer_id = '" + customerID + "'";
            SqlCommand getCustomerCartcmd = new SqlCommand(getCustomerCartQuery, con);

            SqlDataReader getCartData = getCustomerCartcmd.ExecuteReader();

            if (productID != "")
            {
                String checkProductQuery = "SELECT * from product where product_id = '" + productID + "'";
                SqlCommand checkProductcmd = new SqlCommand(checkProductQuery, con);

                SqlDataReader getProduct = checkProductcmd.ExecuteReader();

                if (getProduct.HasRows)
                {
                    while (getCartData.Read())
                    {
                        if (getCartData["product_id"].ToString().Equals(productID))
                        {
                            int quantity = (int)getCartData["quantity"];
                            quantity += 1;

                            String updateQuantityQuery = "Update cart SET quantity = " + quantity + " WHERE customer_id = '" + getCartData["customer_id"] + "' AND product_id = '" + getCartData["product_id"] + "'";
                            SqlCommand updatecmd = new SqlCommand(updateQuantityQuery, con);

                            updatecmd.ExecuteNonQuery();

                            counter = true;
                        }
                    }

                    if (!counter)
                    {
                        String insertCartQuery = "INSERT INTO cart VALUES('" + customerID + "', '" + productID + "', 1)";
                        SqlCommand insertCartcmd = new SqlCommand(insertCartQuery, con);

                        insertCartcmd.ExecuteNonQuery();
                    }
                    con.Close();
                    Response.Redirect("ShoppingCart.aspx");
                }
                else
                {
                    System.Windows.Forms.MessageBox.Show("There is no item " + productID + " in our product list", "No Item Found");
                    con.Close();
                }
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Please add one product into cart", "No Item to Add");
                con.Close();
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            String customerID = Session["id"].ToString();
            int orderCount = 0;


            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB;
                                                    AttachDbFilename = |DataDirectory|unitedDB.mdf;
                                                    Integrated Security = True;
                                                    MultipleActiveResultSets = True");

            con.Open();

            String getCustomerCartQuery = "SELECT * from cart c, product p where p.product_id = c.product_id AND c.customer_id = '" + customerID + "'";
            SqlCommand getCustomerCartcmd = new SqlCommand(getCustomerCartQuery, con);
            SqlDataReader getCartData = getCustomerCartcmd.ExecuteReader();
            double price = 0;
            double totalAmount = 0;

            if (getCartData.HasRows)
            {
                String getOrderQuery = "SELECT * FROM orders";
                SqlCommand getOrdercmd = new SqlCommand(getOrderQuery, con);
                SqlDataReader getOrderData = getOrdercmd.ExecuteReader();

                while (getOrderData.Read())
                {
                    orderCount++;
                }
                String orderID = "O" + String.Format("{0:00000}", orderCount + 1);

                while (getCartData.Read())
                {
                    int quantity = (int)getCartData["quantity"];
                    double.TryParse(getCartData["price"].ToString(), out price);
                    totalAmount += (price * quantity);
                }

                String insertOrderQuery = "INSERT INTO orders VALUES('" + orderID + "', " + totalAmount + ", '" + customerID + "')";
                SqlCommand insertOrdercmd = new SqlCommand(insertOrderQuery, con);

                insertOrdercmd.ExecuteNonQuery();


                String getCustomerCartQuery2 = "SELECT * from cart c, product p where p.product_id = c.product_id AND c.customer_id = '" + customerID + "'";
                SqlCommand getCustomerCartcmd2 = new SqlCommand(getCustomerCartQuery2, con);
                SqlDataReader getCartData2 = getCustomerCartcmd2.ExecuteReader();

                while (getCartData2.Read())
                {
                    String orderDetailQuery = "INSERT INTO order_detail VALUES('" + orderID + "', '" + getCartData2["product_id"] + "', " + getCartData2["quantity"] + ", " + getCartData2["price"] + ")";
                    SqlCommand orderDetailcmd = new SqlCommand(orderDetailQuery, con);
                    orderDetailcmd.ExecuteNonQuery();
                }

                String deleteCartQuery = "DELETE FROM cart WHERE customer_id = '" + customerID + "'";
                SqlCommand deletecartcmd = new SqlCommand(deleteCartQuery, con);
                deletecartcmd.ExecuteNonQuery();

                con.Close();

                Response.Redirect("ShoppingCart.aspx");
            }
            else
            {
                System.Windows.Forms.MessageBox.Show("Place order failed. There is no item in shopping cart", "No Item in Shopping Cart");
                con.Close();

                Response.Redirect("ShoppingCart.aspx");
            }

        }

    }
}