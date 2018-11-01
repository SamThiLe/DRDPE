using System;
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
    public partial class UploadImage : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;
            if (myMessage.Text == "")
            {
                HideError();
            }
        }
        protected void btnChoseImage_Click(object sender, EventArgs e)
        {
            try
            {
                int intSizeLimit = 1048576;
                if (uplPics.HasFile == true)
                {
                    string strPath = Server.MapPath("~/Admin/tempImages") + "\\" + uplPics.FileName;

                    string strContentType = uplPics.PostedFile.ContentType;

                    System.Drawing.Image img = System.Drawing.Image.FromStream(uplPics.PostedFile.InputStream);
                    bool imgSaved = false;
                    if (ImageFormat.Jpeg.Equals(img.RawFormat))
                    {
                        imgSaved = SaveImage(strPath,".jpg");
                        
                    }else if (ImageFormat.Gif.Equals(img.RawFormat))
                    {
                        imgSaved = SaveImage(strPath, ".gif");
                    }
                    else if (ImageFormat.Bmp.Equals(img.RawFormat))
                    {
                        imgSaved = SaveImage(strPath, ".bmp");
                    }
                    else if (ImageFormat.Png.Equals(img.RawFormat))
                    {
                        imgSaved = SaveImage(strPath, ".png");
                    }
                    else if (ImageFormat.Tiff.Equals(img.RawFormat))
                    {
                        imgSaved = SaveImage(strPath, ".tiff");
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
        private bool SaveImage(string strPath, string extension)
        {
            if (File.Exists(strPath))
            {
                ShowError("File Already Exists... try again!");
                return false;
            }
            else
            {
                uplPics.SaveAs(Server.MapPath("~/Admin/tempImages/" + txtImgName.Text + extension));
                imgProd.ImageUrl = "~/Admin/tempImages/" + txtImgName.Text+extension;
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
                    cmd.Parameters.AddWithValue("@imageName", txtImgName.Text);
                    cmd.Parameters.AddWithValue("@altText", txtAltText.Text);
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