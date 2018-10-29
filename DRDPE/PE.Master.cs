using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRDPE
{
    public partial class PE : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["login"]))
            {
                linkLogout.Style.Remove("Display");
                linkAccountInfo.Style.Remove("Display");
            }
            else
            {
                linkLogout.Style.Add("Display", "none");
                linkAccountInfo.Style.Add("Display", "none");
            }
            linkLogin.Visible = !Convert.ToBoolean(Session["login"]);
            linkSignup.Visible = !Convert.ToBoolean(Session["login"]);
            if (Session["login"] != null)
            {
                lblLoggedInAs.Text = "[Logged in as " + Session["username"] + "]";
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text.Trim() != string.Empty)
            {
                GetSearchResultsForProducts(txtSearch.Text);
            }
        }
        private void GetSearchResultsForProducts(string searchString)
        {
            Response.Redirect("~/index.aspx?SearchStr="+searchString+"&any="+chkKeywords.Checked);
        }

        protected void linkLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("customerId");
            Session.Remove("login");
            Response.Redirect("Login.aspx");
        }

        protected void linkAccountInfo_Click(object sender, EventArgs e)
        {
            if(Response.Cookies["CheckingOut"] != null)
            {
                Response.Cookies["CheckingOut"].Value = "";
            }
            Response.Redirect("ModifyAccount.aspx");
        }
    }
}