﻿using System;
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
                if (!IsPostBack)
                {
                    string cartID = Request.Cookies["cartId"].Value;
                    GetCart(cartID);
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

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Checkout.aspx");
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            

            int count = grvCart.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                TextBox qty = (TextBox)grvCart.Rows[i].Cells[3].FindControl("Quantity");
                string Quantity = qty.Text;

                Label lblProdId = (Label)grvCart.Rows[i].Cells[0].FindControl("ProductID");
                string prodId = lblProdId.Text;

                SqlDataReader dr = default(SqlDataReader);
                SqlCommand cmd = default(SqlCommand);
                string cartId = Request.Cookies["cartId"].Value;

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
        }
    }
}