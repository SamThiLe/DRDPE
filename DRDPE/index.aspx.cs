using DRDPE.UserControls;
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
    public partial class index : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string catId = Server.UrlDecode(Request.QueryString["Id"]);
            string searchText = Server.UrlDecode(Request.QueryString["Search"]);

            if (!IsPostBack)
            {
                getCategories();
                getFeatured();
            }

            if (!string.IsNullOrEmpty(searchText))
            {
                
                GetSearchResultsForProducts(searchText);
            }

            if (!String.IsNullOrEmpty(catId))
            {
                getProducts(Convert.ToInt16(catId));
            }
            Button btn = Master.FindControl("btnSearch") as Button;
            btn.Click += new EventHandler(Search_Click);
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            TextBox txtSearch = Master.FindControl("txtSearch") as TextBox;
            if (txtSearch.Text.Trim() != string.Empty)
            {
                GetSearchResultsForProducts(txtSearch.Text);
            }
        }

        private void GetSearchResultsForProducts(string searchString)
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);

            searchString = searchString.Replace(System.Convert.ToChar(" "), System.Convert.ToChar(";"));
            searchString = searchString.Replace(System.Convert.ToChar(","), System.Convert.ToChar(";"));

            string[] keywords = searchString.Split(System.Convert.ToChar(";"));

            if (keywords.Count() > 5)
            {
                lblMessage.Text = "You may use up to 5 keywords.";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    if ((Master.FindControl("chkKeywords") as CheckBox).Checked == true)
                    {
                        cmd = new SqlCommand("KeywordSearchProductsAny", conn);
                    }
                    else
                    {
                        cmd = new SqlCommand("KeywordSearchProductsAll", conn);
                    }

                    cmd.CommandType = CommandType.StoredProcedure;
                    for (int i = 0; i < keywords.Count(); i++)
                    {
                        cmd.Parameters.AddWithValue("@Word" + (i + 1).ToString(), keywords[i].ToString());
                    }
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (dr.HasRows)
                    {
                        rptProd.DataSource = dr;
                        rptProd.DataBind();
                        lblHeader.Text = "Search results for \"" + (Master.FindControl("txtSearch") as TextBox).Text + "\"";
                    }
                    else
                    {
                        lblMessage.Text = "No search results found.";
                        rptProd.DataSource = null;
                        rptProd.DataBind();
                        lblHeader.Text = "";
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        private void getFeatured()
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getFeatured", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (dr.HasRows)
                    {
                        lblHeader.Text = "Featured Product";
                        rptProd.DataSource = dr;
                        rptProd.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No rows found.";
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

        protected void getCategories()
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getCategories", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (dr.HasRows)
                    {
                        rptCat.DataSource = dr;
                        rptCat.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No rows found.<br>";
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
        protected void getProducts(int catId)
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getProducts", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@category", catId);
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (dr.HasRows)
                    {
                        lblHeader.Text = "Products From Category";
                        rptProd.DataSource = dr;
                        rptProd.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No rows found.<br>";
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
    }
}