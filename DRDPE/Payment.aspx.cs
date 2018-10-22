using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRDPE
{
    public partial class Payment : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string cartID = Request.Cookies["cartId"].Value;
                    GetCart(cartID);
                    calculateGrandTotal();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        private void GetCart(string cartID)
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);

            using (SqlConnection conn = new SqlConnection(cnnString))
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "getCartItems";
                cmd.Parameters.AddWithValue("@cartID", cartID);
                cmd.CommandType = CommandType.StoredProcedure;

                conn.Open();
                dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                if (dr.HasRows)
                {
                    grvCart.DataSource = dr;
                    grvCart.DataBind();
                }
                else
                {
                    throw new Exception("No Details Found");
                }
                dr.Close();
            }
        }
        private void calculateGrandTotal()
        {
            decimal total = 0m;
            int count = grvCart.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                Label lblSubtotal = (Label)grvCart.Rows[i].FindControl("lblSubtotal");
                total += Convert.ToDecimal(lblSubtotal.Text.Substring(1));
            }
            lblGSubtotal.Text = total.ToString("c");
            decimal tax = (total * 0.15m);
            lblTax.Text = tax.ToString("c");
            decimal gTotal = tax + total;
            lblGrandTotal.Text = gTotal.ToString("c");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}