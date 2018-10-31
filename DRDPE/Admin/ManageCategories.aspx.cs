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
            Label myMessage = Master.FindControl("lblMessage") as Label;
            if (myMessage.Text == "")
            {
                HideError();
            }
            
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
            Label myMessage = Master.FindControl("lblMessage") as Label;
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
                        ShowError();
                        myMessage.Text = "No Categories found.";
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError();
                myMessage.Text = ex.Message;
            }
            finally
            {
                dr.Close();
            }
        }
        protected void GetCategory(int catId)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
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
                        ShowError();
                        myMessage.Text = "No rows found.<br>";
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError();
                myMessage.Text = ex.Message;
            }
            finally
            {
                dr.Close();
            }
        }
        protected bool AddCategory()
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
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
                    SqlParameter sqlP = new SqlParameter();
                    
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
                ShowError();
                myMessage.Text = ex.Message.ToString();
                return false;
            }
        }
        protected bool UpdateCategory()
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
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
                ShowError();
                myMessage.Text = ex.Message;
                return false;
            }
        }
        private bool DeleteSelectedCategory()
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
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
                ShowError();
                myMessage.Text = "Error: All Products must be removed before this Category can be deleted";
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
            Label myMessage = Master.FindControl("lblMessage") as Label;
            if (AddCategory())
            {
                ShowError();
                myMessage.Text = "Category Added Successfuly";
            }
                
        }
        protected void btnCategoryDelete_Click(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            if (DeleteSelectedCategory())
            {
                ShowError();
                myMessage.Text = "Category deleted Successfuly";
            }
                
        }
        #endregion
        protected void btnCategoryUpdate_Click(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            if (UpdateCategory())
            {
                ShowError();
                myMessage.Text = "Category updated Successfuly";
            }
                
        }
        #region ErrorMessage
        private void ShowError()
        {
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