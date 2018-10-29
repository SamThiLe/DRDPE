using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
            Label myMessage = Master.FindControl("lblMessage") as Label;
            SqlDataAdapter da = default(SqlDataAdapter);
            SqlCommand cmd = default(SqlCommand);
            DataSet ds = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("searchCustomer", conn);
                    cmd.Parameters.AddWithValue("@choice", RadioButtonList1.SelectedValue);
                    cmd.Parameters.AddWithValue("@searchText", txtSearch.Text);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds);
                    if (ds != null)
                    {
                        grvCustomers.DataSource = ds;
                        grvCustomers.DataBind();
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
        }

        protected void grvCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvCustomers.EditIndex = e.NewEditIndex;
            grvCustomers.DataBind();
        }
    }

}