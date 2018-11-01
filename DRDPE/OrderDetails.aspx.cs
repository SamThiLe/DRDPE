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
                    dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    string orderDetails = "<tr><th>Product</th><th>Quantiy&emsp;</th><th>Subtotal</th></tr>";
                    while (dr.Read())
                    {
                        orderDetails += "<tr><td>" + dr["productName"].ToString() + "&emsp;</td><td>" + dr["qty"].ToString() + "&emsp;</td><td>" + dr["ItemSubtotal"].ToString() + "</tr>";
                        
                        lblOrderStatus.Text = ((OrderStatus)(Convert.ToInt32(dr["orderStatus"]))).ToString();
                        lblOrderDate.Text = DateTime.Parse(dr["orderDate"].ToString()).ToString();
                        lblStreetAddress.Text = dr["street"].ToString();
                        lblCity.Text = dr["city"].ToString();
                        lblProvPostCount.Text = dr["stateProv"] + ", " + dr["postalCode"] + ", " + dr["country"];
                    }
                    tblItems.InnerText += orderDetails;
                    conn.Close();
                    cmd = new SqlCommand("getOrderTotal", conn);
                    cmd.Parameters.Add("@authNumber", SqlDbType.NVarChar, 50).Value = authNumber;
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    while (dr.Read())
                    {
                        lblOrderTotal.Text = (Convert.ToDecimal(dr["GrandTotal"]).ToString("c"));
                    }
                }
            }
            catch (Exception Kowalski)
            {

            }
            finally
            {
                dr.Close();
            }
        }
    }
}