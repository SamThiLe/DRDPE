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
        private string moreOrderDetails = "";
        private List<decimal> itemTotals = new List<decimal>();
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
                decimal subTotal = 0m;
                DateTime orderDate = new DateTime();
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getOrderDetails", conn);
                    cmd.Parameters.AddWithValue("@authNumber", orderConfirmationCode);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    orderDetails = "";
                    while (dr.Read())
                    {
                        orderDetails += "<tr><td>" + dr["productName"].ToString() + "&emsp;</td><td>" + dr["qty"].ToString() + "</td><td>" + dr["ItemSubtotal"].ToString() + "</tr>";
                        orderDate = Convert.ToDateTime(dr["dateCreated"]);
                    }
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
                        subTotal = Convert.ToDecimal(dr["GrandTotal"]);
                    }
                }

                decimal shippingCost = 0m;
                decimal orderTotal = 0m;
                decimal taxRate = 0.15m;
                decimal taxAmount = 0m;

                if (subTotal <= 35)
                {
                    shippingCost = 7.00m;

                }
                else if (subTotal <= 75)
                {
                    shippingCost = 12.00m;
                }
                else if (subTotal > 75)
                {
                    shippingCost = 0m;
                }
                
                taxAmount = ((subTotal + shippingCost) * taxRate);
                orderTotal = subTotal + taxAmount + shippingCost;

                //orderConfirmationCode
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(email);
                mailMessage.From = new MailAddress("admin@PastryEmporium.com");
                mailMessage.Subject = "Pastry Emporium Order Confirmation: "+orderConfirmationCode;
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = "<h2>Our dear client,</h2>" +
                    "<p>Your Payment has been processed and you pasteries are on there way</p>" +
                    "View Your Order: <a href='http://localhost:2443/OrderDetails.aspx?auth=" + orderConfirmationCode + "'>" + orderConfirmationCode + "</a><br /><br />"
                    +
                    "<table><tr><th>Product&emsp;</th><th>Quantity&emsp;</th><th>Subtotal&emsp;</th></tr>"
                    +
                    "<br /> Order Date: " + orderDate.ToString("yyyy/MM/dd") + "<br /><br />"
                    +
                    orderDetails
                    +
                    "</table>"
                    +
                    "<br /> <table><tr><td>Subtotal:</td> <td>" + subTotal.ToString("c") + "</td></tr>" +
                    "<tr><td> Shipping: </td><td>" + shippingCost.ToString("c") + "</td></tr>" +
                    "<tr><td> Tax: </td><td>" + taxAmount.ToString("c") + " </td></tr> "  +
                    "<tr><td> Total </td><td>" + orderTotal.ToString("c") + " </td></tr> </table>" +
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