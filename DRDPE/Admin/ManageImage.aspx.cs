﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DRDPE.Admin
{
    public partial class ManageImage : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            if (myMessage.Text == "")
            {
                HideError();
            }
            if (!IsPostBack)
            {
                GetImages();
            }
        }
        private void GetImages()
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            using (SqlConnection conn = new SqlConnection(cnnString))
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "getAllImages";
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                if (dr.HasRows)
                {
                    grvImages.DataSource = dr;
                    grvImages.DataBind();
                }
                else
                {
                    throw new Exception("No Details Found");
                }
                dr.Close();
            }
        }
        protected void btnChoseImage_Click(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            try
            {
                int intSizeLimit = 1048576;
                if (uplPics.HasFile == true)
                {
                    string stringPath = Server.MapPath("~/Admin/tempImages") + "\\" + uplPics.FileName;
                    
                    string strContentType = uplPics.PostedFile.ContentType;

                    System.Drawing.Image img = System.Drawing.Image.FromStream(uplPics.PostedFile.InputStream);
                    bool imgSaved = false;
                    if (ImageFormat.Jpeg.Equals(img.RawFormat) || ImageFormat.Gif.Equals(img.RawFormat) || ImageFormat.Bmp.Equals(img.RawFormat) || ImageFormat.Png.Equals(img.RawFormat) || ImageFormat.Tiff.Equals(img.RawFormat))
                    {
                        imgSaved = SaveImage(stringPath);
                    }
                    else
                    {
                        ShowError("Not a Valid Image");
                    }
                }
                else
                {
                    ShowError("Please select a file");
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.ToLower() == "Parameter is not valid.")
                {
                    ShowError("Oh no, thats not a valid image");
                }
                else
                {
                    ShowError(ex.Message);
                }
            }
        }
        protected void BtnApprove_Click(object sender, EventArgs e)
        {
            Button myButton = (Button)sender;
            int count = grvImages.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                if ((Button)grvImages.Rows[i].FindControl("btnApprove")==myButton)
                {
                    Label lblId = (Label)grvImages.Rows[i].FindControl("imageId");
                    string imageId = lblId.Text;
                    Label lblImgUrl = (Label)grvImages.Rows[i].FindControl("imageUrl");
                    string imageUrl = lblImgUrl.Text;
                    MoveImage(imageUrl);
                    ApproveImage(imageId, imageUrl, i);
                    
                }
            }
        }
        private void ApproveImage(string imageId,string imageUrl,int row)
        {
            Label lblId = (Label)grvImages.Rows[row].FindControl("lblAdminId");
            if (Session["AdminId"].ToString()==lblId.Text)
            {
                ShowError("You can approve an Image you uploaded yourself");
            }
            else
            {
                SqlCommand cmd = default(SqlCommand);
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    try
                    {
                        cmd = new SqlCommand();
                        cmd.Connection = conn;
                        cmd.CommandText = "approveImage";
                        
                        cmd.Parameters.AddWithValue("@newURL", imageUrl);
                        cmd.Parameters.AddWithValue("@imageId", imageId);
                        cmd.Parameters.AddWithValue("@adminId", Session["adminId"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                        ShowError(ex.Message);
                    }
                }
            }
        }

        private void MoveImage(string imageUrl)
        {
            //D:\School\Server Side Web Dev\5. Project DRD\DRDPE\DRDPE\DRDPE\tempImages
            //"D:\\School\\Server Side Web Dev\\5. Project DRD\\DRDPE\\DRDPE\\DRDPE\\admin\\tempImages\\q54x9bbai7v11.jpg"

            string strCurrentPath = Server.MapPath(imageUrl.Substring(2));
            string strDestinationPath = Server.MapPath("/images" + imageUrl.Substring(12));
            if (!System.IO.File.Exists(strDestinationPath))
            {
                System.IO.File.Move(strCurrentPath, strDestinationPath);
                ShowError("Image Moved successfully");
            }
            else
            {
                ShowError("A file with That name already Exists");
            }
        }

        private bool SaveImage(string strPath)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;

            if (File.Exists(strPath))
            {
                ShowError("File Already Exists... try again!");
                return false;
            }
            else
            {
                uplPics.SaveAs(strPath);
                myMessage.Text = "File upload to:" + strPath;
                imgProd.ImageUrl = "~/tempImages/" + uplPics.FileName;
                int intLength = uplPics.FileName.Length;
                int intRem = intLength - 4;
                string strNoExtension = uplPics.FileName.Substring(0, intLength - 3);
                imgProd.AlternateText = strNoExtension;
                imgProd.Visible = true;

                SqlCommand cmd = default(SqlCommand);
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("insertImage", conn);
                    cmd.Parameters.AddWithValue("@imageUrl", imgProd.ImageUrl);
                    cmd.Parameters.AddWithValue("@altText", strNoExtension);
                    cmd.Parameters.AddWithValue("@uploadedBy", Session["adminId"]);
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        conn.Open();
                        int ar = cmd.ExecuteNonQuery();
                        conn.Close();
                        ShowError("Image Saved");
                        return true;
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                        ShowError(ex.Message);
                    }
                }
                return false;
            }
        }

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
    }
}