using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRDPE
{
    public partial class Verify : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string token = Server.UrlDecode(Request.QueryString["token"]);
            if (GetVerificationTokenFromDB(token))
            {
                lblMessage.Text = "<h2>Thank you for verifying your account. Start shopping now!</h2>";
            }
            else
            {
                lblMessage.Text = "<h2>There seems to be an issue with your link.</h2>";
            }
        }

        private bool GetVerificationTokenFromDB(string token)
        {
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using(SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("verifyToken", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@verificationToken", SqlDbType.NVarChar, 50).Value = token.ToString();
                    cmd.Parameters.Add("@result", SqlDbType.Int);
                    cmd.Parameters["@result"].Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd.ExecuteScalar();
                    int retval = (int)cmd.Parameters["@result"].Value;

                    if (retval == 1)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch(Exception ex)
            {
                //logging
                EventLog log = new EventLog();

                log.Source = "Demo Error Log";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                return false;
            }
        }
    }
}