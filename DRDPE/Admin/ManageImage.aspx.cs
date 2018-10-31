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
                    if(ApproveImage(imageId, imageUrl, i))
                        MoveImage(imageUrl);
                }
            }
            ReloadGrid();
        }
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            Button myButton = (Button)sender;
            int count = grvImages.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                if ((Button)grvImages.Rows[i].FindControl("btnDelete") == myButton)
                {
                    Label lblId = (Label)grvImages.Rows[i].FindControl("imageId");
                    string imageId = lblId.Text;
                    if (ImageNotInUse(imageId))
                        DeleteImage(imageId);
                    else
                        ShowError("Error: Cannot delete an image that is in use");
                }
            }
            ReloadGrid();
        }

        private void DeleteImage(string imageId)
        {
            SqlCommand cmd = default(SqlCommand);
            int ar;
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("deleteImage", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@imageId", imageId);
                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    if (ar > 0)
                    {
                        ShowError("ImageDeleted");
                        ReloadGrid();
                    }
                    else
                    {
                        ShowError("Image was not deleted please contact your Admin");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }

        private bool ImageNotInUse(string imageId)
        {
            SqlCommand cmd = default(SqlCommand);
            string ar;
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("checkImageInUse", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@imageId", imageId);
                    using (conn)
                    {
                        conn.Open();
                        ar = cmd.ExecuteScalar().ToString();
                        conn.Close();
                    }
                    if (ar == "1")
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
                return false;
            }
        }

        private void ReloadGrid()
        {
            if(txtSearch.Text == "")
            {
                grvImages.DataSource = null;
                grvImages.DataBind();
                GetImages();
            }
            else
            {
                SearchImages();
            }
            
        }

        private bool ApproveImage(string imageId,string imageUrl,int row)
        {
            Label lblId = (Label)grvImages.Rows[row].FindControl("lblAdminId");
            if (Session["AdminId"].ToString()==lblId.Text)
            {
                ShowError("You can approve an Image you uploaded yourself");
                return false;
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
                        
                        cmd.Parameters.AddWithValue("@newURL", "../" + imageUrl.Substring(12));
                        cmd.Parameters.AddWithValue("@imageId", imageId);
                        cmd.Parameters.AddWithValue("@adminId", Session["adminId"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        conn.Close();
                        ShowError(ex.Message);
                        return false;
                    }
                }
            }
        }

        private void MoveImage(string imageUrl)
        {

            //D:\School\Server Side Web Dev\5. Project DRD\DRDPE\DRDPE\DRDPE\tempImages
            //"D:\\School\\Server Side Web Dev\\5. Project DRD\\DRDPE\\DRDPE\\DRDPE\\admin\\tempImages\\q54x9bbai7v11.jpg"

            string strCurrentPath = Server.MapPath(imageUrl.Substring(1));
            string strDestinationPath = Server.MapPath("../"+ imageUrl.Substring(12));
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchImages();
        }

        private void SearchImages()
        {
            grvImages.DataSource = null;
            grvImages.DataBind();
            HideError();
            Label myMessage = Master.FindControl("lblMessage") as Label;
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("searchImages", conn);
                    cmd.Parameters.AddWithValue("@searchText", txtSearch.Text);
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
                        ShowError("No Images found.");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowError(ex.Message);
            }
        }
    }
}