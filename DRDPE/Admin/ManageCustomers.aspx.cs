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
    public partial class ManageCustomers : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            if (myMessage.Text == "")
            {
                HideError();
            }
            editCustomer.Style.Add("Display", "none");
            string id = Request.QueryString["id"];
            if (!IsPostBack && !string.IsNullOrEmpty(id))
            {
                searchResults.Style.Add("Display", "none");
                searchDiv.Style.Add("Display", "none");
                editCustomer.Style.Remove("Display");
                getCustomer(id);
            }
        }
        #region ErrorMessage
        private void ShowError()
        {
            System.Web.UI.HtmlControls.HtmlGenericControl myError = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("errorMessage");
            myError.Style.Remove("Display");
        }
        private void HideError()
        {
            System.Web.UI.HtmlControls.HtmlGenericControl myError = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("errorMessage");
            myError.Style.Add("Display", "none");
        }
        #endregion

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            HideError();
            Label myMessage = Master.FindControl("lblMessage") as Label;
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("searchCustomer", conn);
                    cmd.Parameters.AddWithValue("@choice", RadioButtonList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@searchText", txtSearch.Text);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    if (dr.HasRows)
                    {
                        rptCust.DataSource = dr;
                        rptCust.DataBind();
                    }
                    else
                    {
                        ShowError();
                        myMessage.Text = "No rows found.";
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError();
                myMessage.Text = ex.Message.ToString();
            }
            searchResults.Style.Remove("Display");
        }

        private void getCustomer(string id)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getFullCustomerInfo", conn);
                    cmd.Parameters.Add("@customerId", SqlDbType.Int, 0).Value = id;
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    while (dr.Read())
                    {
                        txtCustomerId.Text = dr["customerId"].ToString();
                        txtFirstName.Text = dr["firstName"].ToString();
                        txtMiddleInitial.Text = dr["middleInitial"].ToString();
                        txtLastName.Text = dr["lastName"].ToString();
                        txtPhoneNumber.Text = dr["phone"].ToString();
                        txtEmail.Text = dr["email"].ToString();
                        txtUserName.Text = dr["username"].ToString();
                        if (Convert.ToInt32(dr["archived"]) == 1)
                        {
                            chkArchived.Checked = true;
                        }
                        else
                        {
                            chkArchived.Checked = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError();
                myMessage.Text = ex.Message.ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    string id = Request.QueryString["id"];
                    cmd = new SqlCommand("updateCustomerAdmin", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@customerId", SqlDbType.Int, 0).Value = id;
                    cmd.Parameters.Add("@firstName", SqlDbType.NVarChar, 50).Value = txtFirstName.Text;
                    cmd.Parameters.Add("@middleInitial", SqlDbType.Char, 1).Value = txtMiddleInitial.Text;
                    cmd.Parameters.Add("@lastName", SqlDbType.NVarChar, 50).Value = txtLastName.Text;
                    cmd.Parameters.Add("@phone", SqlDbType.NVarChar, 14).Value = txtPhoneNumber.Text;
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = txtEmail.Text;
                    if (chkArchived.Checked)
                    {
                        ar = 1;
                    }
                    else
                    {
                        ar = 0;
                    }
                    cmd.Parameters.Add("@archived", SqlDbType.Bit, 1).Value = ar;
                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    searchDiv.Style.Remove("Display");
                    ShowError();
                    myMessage.Text = "Update Successful";
                }
            }
            catch (Exception ex)
            {
                //logging

                EventLog log = new EventLog();

                log.Source = "Demo Error Log";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
            }
        }
    }
}