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
    public partial class ManageImage : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;

            if (!IsPostBack)
            {
                GetImages();
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
                    string stringPath = Server.MapPath("~/tempImages") + "\\" + uplPics.FileName;
                    string strContentType = uplPics.PostedFile.ContentType;

                    System.Drawing.Image img = System.Drawing.Image.FromStream(uplPics.PostedFile.InputStream);
                    bool imgSaved = false;
                    if (ImageFormat.Jpeg.Equals(img.RawFormat) || ImageFormat.Gif.Equals(img.RawFormat) || ImageFormat.Bmp.Equals(img.RawFormat) || ImageFormat.Png.Equals(img.RawFormat) || ImageFormat.Tiff.Equals(img.RawFormat))
                    {
                        imgSaved = SaveImage(stringPath);
                        myMessage.Text = "Image Saved";
                    }
                    else
                    {
                        ShowError();
                        myMessage.Text = "Not a Valid Image";
                    }
                }
                else
                {
                    ShowError();
                    myMessage.Text = "The File Is Too Big";
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.ToLower() == "Parameter is not valid.")
                {
                    ShowError();
                    myMessage.Text = "Oh no, thats not a valid image";
                }
                else
                {
                    ShowError();
                    myMessage.Text = ex.Message;
                }
            }
        }

        private bool SaveImage(string strPath)
        {
            Label myMessage = Master.FindControl("lblMessage") as Label;

            if (File.Exists(strPath))
            {
                myMessage.Text = "File Already Exists... try again!";
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
                    cmd.CommandType = CommandType.StoredProcedure;
                    try
                    {
                        conn.Open();
                        int ar = cmd.ExecuteNonQuery();
                        conn.Close();
                        
                        return true;
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                        myMessage.Text = ex.Message;
                    }
                }
                return false;
            }
        }
    }
}