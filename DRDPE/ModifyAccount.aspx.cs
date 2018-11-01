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
            Response.Cookies["addressOutput"].Value = "";
            if(Session["login"] == null)
            {
                Response.Redirect("index.aspx");
            }
            if (!IsPostBack)
            {
                divShippingAddressChk.Style.Add("Display", "None");
                customerId = Convert.ToInt32(Session["customerId"]);

                GetAccountInfo();
                rfvShipStreetAddress.Enabled = false;
                rfvShipCity.Enabled = false;
                rfvShipPostalCode.Enabled = false;
                revShipPostalCode.Enabled = false;
                revShipZip.Enabled = false;
                
            }
            if (!IsPostBack && Request.QueryString["CO"] == "1")
            {
                customerId = Convert.ToInt32(Session["customerId"]);

                divShippingAddressChk.Style.Remove("Display");
                rfvShipStreetAddress.Enabled = false;
                rfvShipCity.Enabled = false;
                rfvShipPostalCode.Enabled = false;
                revShipPostalCode.Enabled = false;
                revShipZip.Enabled = false;
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
                        txtPassword.Text = dr["password"].ToString();
                        txtConfirmPassword.Text = dr["password"].ToString();
                        txtPhoneNumber.Text = dr["phone"].ToString();
                        txtEmail.Text = dr["email"].ToString();
                        txtStreetAddress.Text = dr["street"].ToString();
                        txtCity.Text = dr["city"].ToString();
                        ddlProvices.Text = dr["stateProv"].ToString();
                        txtPostalCode.Text = dr["postalCode"].ToString();
                        ddlCountry.Text = dr["country"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                //Error logging
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                errLabel.InnerText = "There was a problem saving your changes. Please reload the page or contact the web administrator via the following link" + Environment.NewLine + "<a href='mailto:admin@pastryemporium.com'>admin@pastryemporium.com</a>";
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
                    cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 14).Value = txtPhoneNumber.Text;
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
                //Error logging
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                errLabel.InnerText = "There was a problem saving your changes. Please reload the page or contact the web administrator via the following link" + Environment.NewLine + "<a href='mailto:admin@pastryemporium.com'>admin@pastryemporium.com</a>";
                return false;
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            customerId = Convert.ToInt32(Session["customerId"]);
            UpdateAccount();
            UpdateAddress();
            if (!chkSameAsBilling.Checked)
            {
                AddAddress();
                Response.Redirect("Payment.aspx");
            }
            else if(Request.QueryString["CO"] == "1")
            {
                Response.Redirect("Payment.aspx");
            }
            Response.Redirect("index.aspx");
        }

        private void UpdateAccount()
        {
            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("updateCustomer", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@customerId", SqlDbType.Int, 16).Value = customerId;
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = txtEmail.Text;
                    cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 50).Value = txtLastName.Text;
                    cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 14).Value = txtPhoneNumber.Text;

                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                //Error logging
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                errLabel.InnerText = "There was a problem saving your changes. Please reload the page or contact the web administrator via the following link" + Environment.NewLine + "<a href='mailto:admin@pastryemporium.com'>admin@pastryemporium.com</a>";
            }
        }

        private void UpdateAddress()
        {
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("updateAddress", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@customerId", SqlDbType.Int, 0).Value = customerId;
                    cmd.Parameters.Add("@street", SqlDbType.NVarChar, 50).Value = txtStreetAddress.Text;
                    cmd.Parameters.Add("@city", SqlDbType.NVarChar, 50).Value = txtCity.Text;
                    if (ddlCountry.SelectedIndex == 0)
                    {
                        cmd.Parameters.Add("@stateProv", SqlDbType.NVarChar, 15).Value = ddlProvices.SelectedItem.ToString();
                    }
                    else
                    {
                        cmd.Parameters.Add("@stateProv", SqlDbType.NVarChar, 15).Value = ddlStates.SelectedItem.ToString();
                    }
                    cmd.Parameters.Add("@country", SqlDbType.NVarChar, 20).Value = ddlCountry.SelectedItem.ToString();
                    cmd.Parameters.Add("@postalCode", SqlDbType.NVarChar, 10).Value = txtPostalCode.Text;
                    cmd.Parameters.Add("@addressOutput", SqlDbType.Int, 0).Direction = ParameterDirection.Output;

                    using (conn)
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        Response.Cookies["addressOutput"].Value = cmd.Parameters["@addressOutput"].Value.ToString();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                //Error logging
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                errLabel.InnerText = "There was a problem saving your changes. Please reload the page or contact the web administrator via the following link" + Environment.NewLine + "<a href='mailto:admin@pastryemporium.com'>admin@pastryemporium.com</a>";
            }
        }
        
        private void AddAddress()
        {
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("insertAddress", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@customerId", SqlDbType.Int, 0).Value = customerId;
                    cmd.Parameters.Add("@street", SqlDbType.NVarChar, 50).Value = txtShipStreetAddress.Text;
                    cmd.Parameters.Add("@city", SqlDbType.NVarChar, 50).Value = txtShipCity.Text;
                    if (ddlCountry.SelectedIndex == 0)
                    {
                        cmd.Parameters.Add("@stateProv", SqlDbType.NVarChar, 15).Value = ddlShipProv.SelectedItem.ToString();
                    }
                    else
                    {
                        cmd.Parameters.Add("@stateProv", SqlDbType.NVarChar, 15).Value = ddlShipState.SelectedItem.ToString();
                    }
                    cmd.Parameters.Add("@country", SqlDbType.NVarChar, 20).Value = ddlShipCountry.SelectedItem.ToString();
                    cmd.Parameters.Add("@postalCode", SqlDbType.NVarChar, 10).Value = txtShipPostalCode.Text;
                    cmd.Parameters.Add("@additionalNo", SqlDbType.NVarChar, 50).Value = txtAdditionalNotes.Text;
                    cmd.Parameters.Add("@addressOutput", SqlDbType.Int, 0).Direction = ParameterDirection.Output;

                    using (conn)
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        Response.Cookies["addressOutput"].Value = cmd.Parameters["@addressOutput"].Value.ToString();
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                //Error logging
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                errLabel.InnerText = "There was a problem saving your changes. Please reload the page or contact the web administrator via the following link" + Environment.NewLine + "<a href='mailto:admin@pastryemporium.com'>admin@pastryemporium.com</a>";
            }
        }

        protected void chkSameAsBilling_CheckedChanged(object sender, EventArgs e)
        {
            if (!chkSameAsBilling.Checked)
            {
                ddlCountry.SelectedIndex = 0;
                ddlShipCountry.SelectedIndex = 0;
                divShippingAddress.Style.Remove("display");
                rfvShipStreetAddress.Enabled = true;
                rfvShipCity.Enabled = true;
                rfvShipPostalCode.Enabled = true;

                rfvStreetAddress.Enabled = true;
                rfvCity.Enabled = true;
                rfvPostalCode.Enabled = true;
                revPostalCode.Enabled = true;
                revZip.Enabled = false;
            }
            else
            {
                ddlCountry.SelectedIndex = 0;
                ddlShipCountry.SelectedIndex = 0;
                divShippingAddress.Style.Add("display", "none");
                rfvShipStreetAddress.Enabled = false;
                rfvShipCity.Enabled = false;
                rfvShipPostalCode.Enabled = false;
                revShipZip.Enabled = false;
                revShipPostalCode.Enabled = false;

                rfvStreetAddress.Enabled = true;
                rfvCity.Enabled = true;
                rfvPostalCode.Enabled = true;
                revPostalCode.Enabled = true;
                revZip.Enabled = false;
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCountry.SelectedIndex == 1)
            {
                ddlProvices.Style.Add("Display", "none");
                ddlStates.Style.Remove("Display");
                revPostalCode.Enabled = false;
                revZip.Enabled = true;
            }
            else
            {
                ddlStates.Style.Add("Display", "none");
                ddlProvices.Style.Remove("Display");
                revZip.Enabled = false;
                revPostalCode.Enabled = true;
            }
        }

        protected void ddlShipCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlShipCountry.SelectedIndex == 1)
            {
                ddlShipProv.Style.Add("Display", "none");
                ddlShipState.Style.Remove("Display");
                revShipPostalCode.Enabled = false;
                revShipZip.Enabled = true;
            }
            else
            {
                ddlShipState.Style.Add("Display", "none");
                ddlShipProv.Style.Remove("Display");
                revShipZip.Enabled = false;
                revShipPostalCode.Enabled = true;

            }
        }
    }
}