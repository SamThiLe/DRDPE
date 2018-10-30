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
    public partial class Cart : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack && Request.Cookies["cartId"] != null)
                {
                    string cartID = Request.Cookies["cartId"].Value;
                    GetCart(cartID);
                    calculateGrandTotal();
                }
                else if (Request.Cookies["cartId"] == null)
                {
                    lblMessage.Text = "Cart is empty.";
                }
            }
            catch (Exception ex)
            {
                //if (ex.Message == "Object reference not set to an instance of an object.")
                //{
                //    lblMessage.Text = "Cart is empty.";
                //}
                //else
                //{
                    lblMessage.Text = ex.Message;
                //}
                
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
            decimal shipping = 0m;
            bool casey = true;
            switch (casey)
            {
                case true when (total <= 35m):
                    shipping =7m;
                    break;
                case true when (total > 35m && total <75):
                    shipping = 12m;
                    break;
            }
            lblShipping.Text = shipping.ToString("c");
            total += shipping;
            decimal tax = (total * 0.15m);
            lblTax.Text = tax.ToString("c");
            decimal gTotal = tax + total;
            lblGrandTotal.Text = gTotal.ToString("c");
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

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            bool LoggedIn = Convert.ToBoolean(Session["login"]);
            if (LoggedIn && Request.Cookies["cartId"] != null)
            {
                Response.Cookies["CheckingOut"].Value = "true";
                Response.Redirect("~/ModifyAccount.aspx");
            }
            else
            {
                Response.Redirect("~/Login.aspx?CO=1");
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string cartId = Request.Cookies["cartId"].Value;
                int count = grvCart.Rows.Count;
                for (int i = 0; i < count; i++)
                {
                    TextBox qty = (TextBox)grvCart.Rows[i].FindControl("Quantity");
                    string Quantity = qty.Text;
                    CheckBox chkDelete = (CheckBox)grvCart.Rows[i].FindControl("Remove");
                    Label lblProdId = (Label)grvCart.Rows[i].FindControl("ProductID");
                    string prodId = lblProdId.Text;
                    if (chkDelete.Checked || Quantity=="0")
                    {
                        RemoveCartItem(cartId, prodId);
                    }
                    else
                    {
                        UpdateCarItemQuantity(cartId, Quantity, prodId);
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            Response.Redirect("~/Cart.aspx");
        }

        private void UpdateCarItemQuantity(string cartId, string Quantity, string prodId)
        {
            SqlCommand cmd = default(SqlCommand);
            using (SqlConnection conn = new SqlConnection(cnnString))
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "updateCartItemQty";
                cmd.Parameters.AddWithValue("@cartID", cartId);
                cmd.Parameters.AddWithValue("@prodID", prodId);
                cmd.Parameters.AddWithValue("@qty", Quantity);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void RemoveCartItem(string cartId, string prodId)
        {
            SqlCommand cmd = default(SqlCommand);
            using (SqlConnection conn = new SqlConnection(cnnString))
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "deleteCartItem";
                cmd.Parameters.AddWithValue("@cartID", cartId);
                cmd.Parameters.AddWithValue("@prodID", prodId);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}