﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRDPE.Admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            if (myMessage.Text == "")
            {
                HideError();
            }
        }

        #region ErrorMessage
        private void ShowError(string msg)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            myMessage.Text = msg;
            System.Web.UI.HtmlControls.HtmlGenericControl myError = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("errorMessage");
            myError.Style.Remove("Display");
        }
        private void HideError()
        {
            System.Web.UI.HtmlControls.HtmlGenericControl myError = (System.Web.UI.HtmlControls.HtmlGenericControl)Master.FindControl("errorMessage");
            myError.Style.Add("Display", "none");
        }
        #endregion
    }
}