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
            linkLogin.Visible = !Convert.ToBoolean(Session["login"]);
            linkSignup.Visible = !Convert.ToBoolean(Session["login"]);
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
    }
}