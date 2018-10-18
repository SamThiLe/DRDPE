using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DRDPE
{
    public partial class ProductPage : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getProduct();
            }
            Button btn = Master.FindControl("btnSearch") as Button;
            btn.Click += new EventHandler(Search_Click);
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            TextBox txtSearch = Master.FindControl("txtSearch") as TextBox;
            string searchText = "index.aspx?Search=" + txtSearch.Text;
            Response.Redirect(searchText);
        }

        private void getProduct()
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    string productId = Request.QueryString["productId"];
                    cmd = new SqlCommand("getSingleProduct", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@productId", productId);
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);


                    if (dr.HasRows)
                    {
                        rptProd.DataSource = dr;
                        rptProd.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "no rows found";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            finally
            {
                dr.Close();
            }
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            
            int cartId;
            try
            {
                string productId = Request.QueryString["productId"];
                if (Request.Cookies["cartId"] != null)
                {
                    cartId = Convert.ToInt32(Request.Cookies["cartId"].Value);
                    UpdateCart(cartId, productId);
                }
                else
                {
                    InsertCart(productId);
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }
        private void InsertCart(string productId)
        {
            SqlConnection conn = new SqlConnection(cnnString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            SqlTransaction trans = null;
            trans = conn.BeginTransaction("CreateCart");

            cmd.Connection = conn;
            cmd.Transaction = trans;
            try
            {
                cmd.CommandText = "createCart";
                int cartID = (int)cmd.ExecuteScalar();

                cmd.CommandText = "getProductPrice";
                cmd.Parameters.AddWithValue("@prodId", productId);
                decimal price = (decimal)cmd.ExecuteScalar();

                cmd.CommandText = "createCartItem";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@cartId", cartID);
                cmd.Parameters.AddWithValue("@prodId", productId);
                cmd.Parameters.AddWithValue("@price", price);

                cmd.ExecuteNonQuery();

                trans.Commit();

                Response.Cookies["cartId"].Value = cartID.ToString();
                Response.Cookies["cartId"].Expires = DateTime.Now.AddDays(1);

                Response.Redirect("~/Cart.aspx?productId=" + productId);
            }
            catch (Exception ex)
            {
                lblMessage.Text = string.Format("Commit Exception Type: {0}", ex.GetType());
                lblMessage.Text += string.Format("  Message: {0}", ex.Message);

                // Attempt to roll back the transaction.
                try
                {
                    trans.Rollback("CreateCart");
                }
                catch (Exception ex2)
                {
                    lblMessage.Text = string.Format("Rollback Exception Type: {0}", ex2.GetType());
                    lblMessage.Text = string.Format("  Message: {0}", ex2.Message);
                }
            }
        }
        private void UpdateCart(int cartId, string productId)
        {
            SqlCommand cmd = default(SqlCommand);

            using (SqlConnection conn = new SqlConnection(cnnString))
            {
                cmd = new SqlCommand("updateCartItemQty", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@cartID", cartId);
                cmd.Parameters.AddWithValue("@prodID", Convert.ToInt32(productId));
                conn.Open();

                int numRows = cmd.ExecuteNonQuery();

                if (numRows != 0)
                {
                    Response.Redirect("~/Cart.aspx?productId=" + productId);
                }
                else
                {
                    throw new Exception("Item not added to cart.");
                }
                conn.Close();
            }
        }
    }
}