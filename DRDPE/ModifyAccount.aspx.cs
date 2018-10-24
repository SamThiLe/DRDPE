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
    public partial class ModifyAccount : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        private int customerId;
        private Guid userVerificationCode = Guid.NewGuid();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetAccountInfo();
            }
            //if (Request.Cookies["CheckingOut"].Value == "true")
            //{
            //    //CheckoutVersion Of Things
            //}
        }

        private void GetAccountInfo()
        {
            customerId = (int)Session["customerId"];
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    string productId = Request.QueryString["productId"];
                    cmd = new SqlCommand("getFullCustomerInfo", conn);
                    cmd.Parameters.Add("@customerId", SqlDbType.Int, 0).Value = customerId;
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    while (dr.Read())
                    {
                        txtFirstName.Text = dr["firstName"].ToString();
                        txtMiddleInitial.Text = dr["middleInitial"].ToString();
                        txtLastName.Text = dr["lastName"].ToString();
                        txtPhoneNumber.Text = dr["phone"].ToString();
                        txtEmail.Text = dr["email"].ToString();
                        txtStreetAddress.Text = dr["street"].ToString();
                        txtCity.Text = dr["city"].ToString();
                        txtProvince.Text = dr["stateProv"].ToString();
                        txtPostalCode.Text = dr["postalCode"].ToString();
                        txtCountry.Text = dr["country"].ToString();
                    }
                    if (!dr.HasRows)
                    {

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

        private bool ModifyCustomer()
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
                    cmd.Parameters.Add("@password", SqlDbType.NVarChar, 15).Value = txtPassword.Text;
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
    }
}