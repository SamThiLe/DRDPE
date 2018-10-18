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
    public partial class NewAccount : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        private Guid userVerificationCode = Guid.NewGuid();
        protected void Page_Load(object sender, EventArgs e)
        {
            cvDateOfBirth.ValueToCompare = DateTime.Now.Date.AddYears(-19).ToString("d");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            AddCustomer();
            SendWelcomeEmail();
            Response.Redirect("Registered.aspx");
        }

        private bool AddCustomer()
        {
            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("insertCustomer", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = txtEmail.Text;
                    cmd.Parameters.Add("@username", SqlDbType.NVarChar, 15).Value = txtUserName.Text;
                    cmd.Parameters.Add("@password", SqlDbType.NVarChar, 15).Value = txtPassword.Text;
                    cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 50).Value = txtFirstName.Text;
                    cmd.Parameters.Add("@middleInitial", SqlDbType.Char, 1).Value = txtMiddleInitial.Text;
                    cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 50).Value = txtLastName.Text;
                    cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 10).Value = txtPhoneNumber.Text;
                    cmd.Parameters.Add("@verificationToken", SqlDbType.NVarChar, 50).Value = userVerificationCode.ToString();
                    
                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (ar > 0)
                    {
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                //logging

                EventLog log = new EventLog();

                log.Source = "Demo Error Log";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                return false;
            }
        }

        private void SendWelcomeEmail()
        {
            string verificationLink = "http://" + HttpContext.Current.Request.Url.Host + ":2443/Verify.aspx?token=" + userVerificationCode;

            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(txtEmail.Text);
                mailMessage.From = new MailAddress("admin@PastryEmporium.com");
                mailMessage.Subject = "Welcome to Pastry Emporium!";
                mailMessage.IsBodyHtml = true;
                mailMessage.Body = "<h2>Our dear client,</h2>" +
                    "<p>It's a pleasure to finally have you as a registered customer! All that's left is to verify your account with the link below.<br>" +
                    "<a href='" + verificationLink + "'>" + verificationLink + "</a><br>" +
                    "Not sure why you're seeing this? Disregard this email.</p>";
                SmtpClient smtpClient = new SmtpClient("localhost");
                smtpClient.Send(mailMessage);
                
            }
            catch (Exception ex)
            {
                //logging


            }
        }
    }
}