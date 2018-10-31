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
    public partial class OrderDetails : System.Web.UI.Page
    {
        private string cnnString = ConfigurationManager.ConnectionStrings["cnn"].ConnectionString;
        private string authNumber = HttpContext.Current.Request.QueryString["auth"];
        protected void Page_Load(object sender, EventArgs e)
        {
            GetOrderDetails();
        }

        private void GetOrderDetails()
        {
            SqlDataReader dr = default(SqlDataReader);
            SqlCommand cmd = default(SqlCommand);
            try
            {
                using (SqlConnection conn = new SqlConnection(cnnString))
                {
                    cmd = new SqlCommand("getOrderDetails", conn);
                    cmd.Parameters.Add("@authNumber", SqlDbType.NVarChar, 50).Value = authNumber;
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    while (dr.Read())
                    {
                        lblOrderStatus.Text = ((OrderStatus)(Convert.ToInt32(dr["orderStatus"]))).ToString();
                        lblOrderDate.Text = Convert.ToDateTime(dr["orderDate"]).ToString("dd/MM/yyyy");
                    }
                    dr.Close();
                    cmd = new SqlCommand("getOrderTotal", conn);
                    cmd.Parameters.Add("@authNumber", SqlDbType.NVarChar, 50).Value = authNumber;
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    while (dr.Read())
                    {
                        lblOrderTotal.Text = dr["GrandTotal"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                dr.Close();
            }
        }
    }
}