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
            //TextBox txtSearch = Master.FindControl("txtSearch") as TextBox;
            //if (txtSearch.Text.Trim() != string.Empty)
            //{
            //    GetSearchResultsForProducts(txtSearch.Text);
            //}
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
                    cmd = new SqlCommand("SELECT * FROM Products WHERE productId = @productId; ", conn);
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
                        //lblMessage.Text = "no rows found";
                    }
                }
            }
            catch (Exception ex)
            {
                //lblMessage.Text = ex.Message;
            }
            finally
            {
                dr.Close();
            }
        }
    }
}