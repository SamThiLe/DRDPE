using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRDPE
{
    public partial class Registered : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "<h3>Thank you for registering. We have sent a verification link to the email you specified.</h3>";
        }
    }
}