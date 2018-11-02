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
            string addressId = "";
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
                        cell3.Text = Convert.ToDecimal(dr["ItemSubtotal"]).ToString("c");
                        row.Cells.Add(cell1);
                        row.Cells.Add(cell2);
                        row.Cells.Add(cell3);
                        tblItems.Rows.Add(row);

                        lblOrderStatus.Text = ((OrderStatus)(Convert.ToInt32(dr["orderStatus"]))).ToString();
                        lblOrderDate.Text = DateTime.Parse(dr["orderDate"].ToString()).ToString();
                        lblStreetAddress.Text = dr["street"].ToString();
                        lblCity.Text = dr["city"].ToString();
                        lblProvPostCount.Text = dr["stateProv"] + ", " + dr["postalCode"] + ", " + dr["country"];
                        addressId = dr["addressId"].ToString();
                    }
                    conn.Close();
                    cmd = new SqlCommand("getOrderTotal", conn);
                    cmd.Parameters.Add("@authNumber", SqlDbType.NVarChar, 50).Value = authNumber;
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    decimal subTotal = 0m;
                    while (dr.Read())
                    {
                         subTotal = Convert.ToDecimal(dr["GrandTotal"]);
                    }
                    decimal shippingCost = 0m;
                    decimal orderTotal = 0m;
                    decimal taxRate = 0.15m;
                    decimal taxAmount = 0m;

                    if (subTotal <= 35)
                    {
                        shippingCost = 7.00m;

                    }
                    else if (subTotal <= 75)
                    {
                        shippingCost = 12.00m;
                    }
                    else if (subTotal > 75)
                    {
                        shippingCost = 0m;
                    }

                    taxAmount = ((subTotal + shippingCost) * taxRate);
                    orderTotal = subTotal + taxAmount + shippingCost;
                    lblOrderTotal.Text = orderTotal.ToString("c");
                    conn.Close();
                    cmd = new SqlCommand("checkBillingReturnBilling", conn);
                    cmd.Parameters.Add("@addressId", SqlDbType.Int, 0).Value = Convert.ToInt32(addressId);
                    cmd.CommandType = CommandType.StoredProcedure;
                    conn.Open();
                    dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            lblBillStreetAddress.Text = dr["street"].ToString();
                            lblBillCity.Text = dr["city"].ToString();
                            lblBillProvPostCount.Text = dr["stateProv"].ToString() + ", " + dr["postalCode"].ToString() + ", " + dr["country"];
                        }
                    }
                    else
                    {
                        headerBilling.Visible = false;
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