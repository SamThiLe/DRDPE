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
    public partial class ManageCategories : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string catId = Server.UrlDecode(Request.QueryString["Id"]);
            if (!IsPostBack || (string)Session["changed"] == "yes")
            {
                getCategories();
                Session.Remove("changed");
            }
            if (!IsPostBack&&!String.IsNullOrEmpty(catId)&&(string)Session["changed"] != "yes")
            {
                GetCategory(Convert.ToInt16(catId));
                categoryAddContainer.Style.Add("Display", "none");
            }
        }
        #region Methods
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
        protected void GetCategory(int catId)
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getSingleCategory", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryId", catId);
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            categoryUpdateContainer.Style.Remove("Display");
                            txtCategoryIdUpdate.Text = dr["categoryId"].ToString();
                            string tempName = dr["name"].ToString();
                            txtCategoryNameUpdate.Text = tempName;
                            txtCatDescriptionUpdate.Text = dr["description"].ToString();
                        }
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
        protected bool AddCategory()
        {
            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("insertCategory", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar, 20).Value = txtCategoryNameAdd.Text;
                    cmd.Parameters.Add("@description", SqlDbType.VarChar, 8000).Value = txtCategoryDescriptionAdd.Text;
                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (ar > 0)
                    {
                        Session["added"] = "yes";
                        getCategories();
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
                return false;
            }
        }
        protected bool UpdateCategory()
        {
            string catDes = txtCatDescriptionUpdate.Text;

            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("updateCategory", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@categoryId", SqlDbType.Int, 20).Value = int.Parse(txtCategoryIdUpdate.Text);
                    cmd.Parameters.Add("@name", SqlDbType.VarChar, 20).Value = txtCategoryNameUpdate.Text;
                    cmd.Parameters.Add("@description", SqlDbType.VarChar, 8000).Value = catDes;
                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (ar > 0)
                    {
                        Session["added"] = "yes";
                        getCategories();
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
                return false;
            }
        }
        private bool DeleteSelectedCategory()
        {
            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("deleteCategory", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@categoryId", SqlDbType.Int, 20).Value = int.Parse(txtCategoryIdUpdate.Text);
                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (ar > 0)
                    {
                        Session["change"] = "yes";
                        getCategories();
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: All Products must be removed before this Category can be deleted";
                return false;
            }
        }
        protected void ClearForm()
        {
            txtCategoryNameAdd.Text = "";
            txtCategoryDescriptionAdd.Text = "";
            txtCategoryIdUpdate.Text = "";
            txtCategoryNameUpdate.Text = "";
            txtCatDescriptionUpdate.Text = "";
        }
        #endregion

        #region Events
        protected void btnAddCategory_Click(object sender, EventArgs e)
            {
                ClearForm();
                categoryUpdateContainer.Style.Add("Display", "none");
                categoryAddContainer.Style.Remove("Display");
            }
        protected void btnCancel_Command(object sender, CommandEventArgs e)
        {
            ClearForm();
            categoryAddContainer.Style.Add("Display", "none");
            categoryUpdateContainer.Style.Add("Display", "none");
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (AddCategory())
                lblMessage.Text = "Category Added Successfuly";
        }
        protected void btnCategoryDelete_Click(object sender, EventArgs e)
        {
            if(DeleteSelectedCategory())
                lblMessage.Text = "Category deleted Successfuly";
        }
        #endregion
        protected void btnCategoryUpdate_Click(object sender, EventArgs e)
        {
            if (UpdateCategory())
                lblMessage.Text = "Category updated Successfuly";
        }
    }
}