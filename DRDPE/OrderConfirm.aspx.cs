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
        private Guid orderConfirmationCode = Guid.NewGuid();
        private string email="";
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
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
            lblCC.Text = orderConfirmationCode.ToString();

            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(email);
                mailMessage.From = new MailAddress("admin@PastryEmporium.com");
                mailMessage.Subject = "Pastry Emporium Order Confirmation: "+orderConfirmationCode;
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = "<h2>Our dear client,</h2>" +
                    "<p>Your Payment has been processed and you pasteries are on there way</p>" +
                    
                    "<a>View Your Order: " + orderConfirmationCode + "</a><br>" +
                    orderDetails +
                    "Not sure why you're seeing this? Disregard this email.</p>";
                SmtpClient smtpClient = new SmtpClient("localhost");
                smtpClient.Send(mailMessage);

            }
            catch (Exception ex)
            {

            }

        }
    }
}