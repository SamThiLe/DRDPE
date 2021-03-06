﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing.Imaging;
using System.Diagnostics;

namespace DRDPE
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            string catId = Server.UrlDecode(Request.QueryString["catId"]);
            string prodId = Server.UrlDecode(Request.QueryString["prodId"]);
            if (myMessage.Text == "")
            {
                HideError();
            }
            //btnSave.Visible = false;
            //productContainer.Style.Add("display", "none");
            
            if (!IsPostBack || (string)Session["changed"] == "yes")
            {
                FillProductStatusDDL();
                getCategoriesForDDL();
                getCategories();
                Session.Remove("changed");
            }
                
            if (!String.IsNullOrEmpty(catId))
            {
                productContainer.Style.Add("display", "none");
                rptProd.Visible = true;
                getProducts(Convert.ToInt16(catId));
            }
            if (!IsPostBack && !String.IsNullOrEmpty(prodId) && (string)Session["changed"] != "yes")
            {
                productContainer.Style.Remove("display");
                getProduct();
                rptProd.Visible = false;
            }
        }

        private void GetApprovedImages()
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    
                    cmd = new SqlCommand("getApprovedNotUsed", conn);
                    cmd.Parameters.AddWithValue("@ProdId", txtProduct.Text);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    if (dr.HasRows)
                    {
                        ddlImages.DataSource = dr;
                        ddlImages.DataTextField = "imageUrl";
                        ddlImages.DataValueField = "imageId";
                        ddlImages.DataBind();
                    }
                    else
                    {
                        ShowError("No rows found.");
                    }
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError(ex.Message);
            }
            finally
            {
                dr.Close();
            }
        }

        private void FillProductStatusDDL()
        {
            ddlProductStatus.DataSource = Enumeration.GetAll<ProductStatus>();
            ddlProductStatus.DataTextField = "Value";
            ddlProductStatus.DataValueField = "Key";
            ddlProductStatus.DataBind();
        }
        protected void Search_Click(object sender, EventArgs e)
        {
            TextBox txtSearch = Master.FindControl("txtSearch") as TextBox;
            if (txtSearch.Text.Trim() != string.Empty)
            {
                GetSearchResultsForProducts(txtSearch.Text);
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
                        ShowError("No rows found.");
                    }
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError(ex.Message);
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
                        rptProd.DataSource = dr;
                        rptProd.DataBind();
                    }
                    else
                    {
                        ShowError("No rows found.");
                    }
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError(ex.Message);
            }
            finally
            {
                dr.Close();
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
                ShowError("You may use up to 5 keywords.");
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
                        ShowError("No search results found.");
                        rptProd.DataSource = null;
                        rptProd.DataBind();
                        lblHeader.Text = "";
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError(ex.Message);
            }
        }
        private void getProduct()
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection cnn = new SqlConnection(cnnString))
                {
                    int productId = int.Parse(Request.QueryString["prodId"]);
                    cmd = new SqlCommand("getSingleProduct", cnn);
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cnn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                    while (dr.Read())
                    {
                        txtProduct.Text = dr["productId"].ToString();
                        txtProductName.Text = dr["productname"].ToString();
                        txtProductBriefDescription.Text = dr["briefDescription"].ToString();
                        txtProductFullDescription.Text = dr["fullDescription"].ToString();
                        ddlProductStatus.SelectedValue = dr["statusCode"].ToString();
                        txtProductPrice.Text = Convert.ToDecimal(dr["price"]).ToString("c");
                        chkProductFeatured.Checked = Convert.ToBoolean(dr["featured"]);
                        imgProd.ImageUrl = Convert.ToString(dr["imageUrl"]);
                        GetApprovedImages();
                        ddlImages.Items.FindByValue(dr["imageId"].ToString()).Selected = true;
                        ddlCat.Items.FindByValue(dr["categoryId"].ToString()).Selected = true;
                        btnCancel.Visible = false;
                        btnSave.Visible = false;
                        btnDelete.Visible = true;
                        btnUpdate.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError(ex.Message);
            }
            finally
            {
                dr.Close();
            }
        }
        protected void getCategoriesForDDL()
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
                        ddlCat.DataSource = dr;
                        ddlCat.DataTextField = "name";
                        ddlCat.DataValueField = "categoryId";
                        ddlCat.DataBind();
                        
                    }
                    else
                    {
                        ShowError("No rows found.");
                    }
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError(ex.Message);
            }
            finally
            {
                dr.Close();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            productContainer.Style.Add("display", "none");
            btnSave.Visible = false;
        }
        #region Update Product
        protected bool UpdateProduct()
        {
            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("updateProduct", conn);
                    cmd.Parameters.AddWithValue("@productId", txtProduct.Text);
                    cmd.Parameters.AddWithValue("@productName", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@briefDescription", txtProductBriefDescription.Text);
                    cmd.Parameters.AddWithValue("@fullDescription", txtProductFullDescription.Text);
                    cmd.Parameters.AddWithValue("@statusCode", ddlProductStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@price", txtProductPrice.Text);
                    cmd.Parameters.AddWithValue("@featured", chkProductFeatured.Checked);
                    cmd.Parameters.AddWithValue("@categoryId", ddlCat.SelectedValue);
                    cmd.Parameters.AddWithValue("@imageId", ddlImages.SelectedValue);
                    
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (ar > 0)
                    {
                        Session["added"] = "yes";
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError("Some fields were not validated. Please try again");
                return false;
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (UpdateProduct())
            {
                ShowError("Product Updated Successfuly");
                productContainer.Style.Add("display", "none");
                btnSave.Visible = false;
            }
        }
        #endregion
        #region Add Product
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            rptProd.Visible = false;
            productContainer.Style.Remove("display");
            txtProduct.Text = "";
            txtProductName.Text = "";
            txtProductBriefDescription.Text = "";
            txtProductFullDescription.Text = "";
            ddlProductStatus.SelectedIndex = -1;
            txtProductPrice.Text = "";
            chkProductFeatured.Checked = false;
            GetApprovedImages();
            ddlCat.SelectedIndex = -1;
            ImagePreview();
            btnCancel.Visible = true;
            btnSave.Visible = true;
            btnDelete.Visible = false;
            btnUpdate.Visible = false;
            
        }
        protected bool AddProduct()
        {
            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("insertProduct", conn);
                    cmd.Parameters.AddWithValue("@productName", txtProductName.Text);
                    cmd.Parameters.AddWithValue("@briefDescription", txtProductBriefDescription.Text);
                    cmd.Parameters.AddWithValue("@fullDescription", txtProductFullDescription.Text);
                    cmd.Parameters.AddWithValue("@statusCode", ddlProductStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@price", txtProductPrice.Text);
                    cmd.Parameters.AddWithValue("@featured", chkProductFeatured.Checked);
                    cmd.Parameters.AddWithValue("@categoryId", ddlCat.SelectedValue);
                    cmd.Parameters.AddWithValue("@imageId", ddlImages.SelectedValue);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (ar > 0)
                    {
                        Session["added"] = "yes";
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError("Some fields were not correct. Please try again");
                return false;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (AddProduct())
            {
                ShowError("Product Added Successfuly");
                productContainer.Style.Add("display", "none");
            }
        }
        #endregion
        #region Delete
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (DeleteProduct())
            {
                ShowError("Product deleted Successfuly");
                btnSave.Visible = false;
                productContainer.Style.Add("display", "none");

            }
                
        }
        private bool DeleteProduct()
        {
            int ar = 0;
            SqlCommand cmd = default(SqlCommand);

            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("deleteProduct", conn);
                    cmd.Parameters.AddWithValue("@ProductId", txtProduct.Text);
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (ar > 0)
                    {
                        Session["change"] = "yes";
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError(ex.Message);
                return false;
            }
        }
        #endregion
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

        protected void ddlImages_SelectedIndexChanged(object sender, EventArgs e)
        {
            ImagePreview();
        }

        private void ImagePreview()
        {
           
            try
            {
                imgProd.ImageUrl = ddlImages.SelectedItem.Text;
            }
            catch (Exception ex)
            {
                EventLog log = new EventLog();
                log.Source = "Pastry Emporium";
                log.WriteEntry(ex.Message, EventLogEntryType.Error);
                ShowError(ex.Message);
            }
        }
    }
}