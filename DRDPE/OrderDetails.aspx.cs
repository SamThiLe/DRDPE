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
                    TableRow tableHead = new TableRow();
                    TableCell header1 = new TableCell();
                    TableCell header2 = new TableCell();
                    TableCell header3 = new TableCell();
                    header1.Text = "<b>Product</b>&emsp;";
                    header2.Text = "<b>Quantity</b>&emsp;";
                    header3.Text = "<b>Subtotal</b>";
                    tableHead.Cells.Add(header1);
                    tableHead.Cells.Add(header2);
                    tableHead.Cells.Add(header3);
                    tblItems.Rows.Add(tableHead);
                    while (dr.Read())
                    {
                        TableRow row = new TableRow();
                        TableCell cell1 = new TableCell();
                        TableCell cell2 = new TableCell();
                        TableCell cell3 = new TableCell();
                        cell1.Text = dr["productName"].ToString();
                        cell2.Text = dr["qty"].ToString();
                        cell3.Text = dr["ItemSubtotal"].ToString();
                        row.Cells.Add(cell1);
                        row.Cells.Add(cell2);
                        row.Cells.Add(cell3);
                        tblItems.Rows.Add(row);

                        lblOrderStatus.Text = ((OrderStatus)(Convert.ToInt32(dr["orderStatus"]))).ToString();
                        lblOrderDate.Text = DateTime.Parse(dr["orderDate"].ToString()).ToString();
                        lblStreetAddress.Text = dr["street"].ToString();
                        lblCity.Text = dr["city"].ToString();
                        lblProvPostCount.Text = dr["stateProv"] + ", " + dr["postalCode"] + ", " + dr["country"];
                    }
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