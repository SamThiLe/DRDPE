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

namespace DRDPE.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        private int adminId;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (CustomerLogin())
            {
                Session["adminLogin"] = true;
                Session["adminId"] = adminId;
                loginContainer.Style.Add("display", "none");
                lblSuccess.Text = "<h3>Login succesful. Redirecting...</h3>";


                Response.Redirect("~/admin/index.aspx");
            }
            else
            {
                lblSuccess.Text = "<h3>Login unsuccessful. No existing user with those matching credentials.</h3>";
            }
        }
        private bool CustomerLogin()
        {
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("loginAdmin", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = txtUserName.Text;
                    cmd.Parameters.Add("@password", SqlDbType.NVarChar, 15).Value = txtPassword.Text;
                    using (conn)
                    {
                        conn.Open();
                        adminId = (int)cmd.ExecuteScalar();
                        conn.Close();
                    }
                    if (adminId > 0)
                    {
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                
                ////logging
                //EventLog log = new EventLog();

                //log.Source = "Demo Error Log";
                //log.WriteEntry(ex.Message, EventLogEntryType.Error);
                return false;
            }
        }
    }
}