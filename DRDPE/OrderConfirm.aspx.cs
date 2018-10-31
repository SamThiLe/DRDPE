using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRDPE
{
    public partial class OrderConfirm : System.Web.UI.Page
    {
        private string orderDetails = "";
        private string orderConfirmationCode;
        private string email="";
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            orderConfirmationCode = Session["authNumber"].ToString();
            if ((string)Session["order"] == "shipped")
            {
                GetAccountInfo();
                SendConfirmationEmail();
                lblMessage.Text = "<h2>Thank you for placing an order. Your confirmation Email Has been sent.</h2>";
            }
            else
            {
                lblMessage.Text = "<h2>There seems to be an issue with your PayPal.</h2>";
            }
        }
        private void GetAccountInfo()
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    string customerId = Session["CustomerId"].ToString();
                    cmd = new SqlCommand("getFullCustomerInfo", conn);
                    cmd.Parameters.AddWithValue("@customerId", customerId);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    while (dr.Read())
                    {
                        email = dr["email"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                dr.Close();
            }
        }
        private void SendConfirmationEmail()
        {
            lblCC.Text = orderConfirmationCode;
            Response.Cookies["cartId"].Value = "";
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                //data variables
                string orderTotal = "";

                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getOrderDetails", conn);
                    cmd.Parameters.AddWithValue("@authNumber", orderConfirmationCode);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    orderDetails = "<table><tr><th>Product</th><th>Quantity</th><th>Subtotal</th></tr>";
                    while (dr.Read())
                    {
                        orderDetails += "<tr><td>" + dr["productName"].ToString() + "</td><td>" + dr["qty"].ToString() + "</td><td>" + dr["ItemSubtotal"].ToString() + "</tr>";
                    }
                    orderDetails += "</table>";
                }

                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getOrderTotal", conn);
                    cmd.Parameters.AddWithValue("@authNumber", orderConfirmationCode);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    while (dr.Read())
                    {
                        orderTotal = dr["GrandTotal"].ToString();
                    }
                }

                //orderConfirmationCode
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(email);
                mailMessage.From = new MailAddress("admin@PastryEmporium.com");
                mailMessage.Subject = "Pastry Emporium Order Confirmation: "+orderConfirmationCode;
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = "<h2>Our dear client,</h2>" +
                    "<p>Your Payment has been processed and you pasteries are on there way</p>" +
                    "View Your Order: <a href='http://localhost:2443/OrderDetails.aspx?auth=" + orderConfirmationCode + "'>" + orderConfirmationCode + "</a><br />"
                    +
                    orderDetails
                    + 
                    "<br /> Order Total: "+ (Convert.ToDecimal(orderTotal)).ToString("c") +
                    "<br /><br /><hr>Not sure why you're seeing this? Disregard this email.</p>";
                SmtpClient smtpClient = new SmtpClient("localhost");
                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {

            }
        }
    }
}