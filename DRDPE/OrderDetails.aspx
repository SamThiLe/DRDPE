<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="DRDPE.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-3">
            <h3>Your Order</h3>
            <label runat="server">Order Status: </label>
            <asp:Label runat="server" ID="lblOrderStatus"></asp:Label><br />
            <label runat="server">Order Placed On: </label>
            <asp:Label runat="server" ID="lblOrderDate"></asp:Label><br />
            <label runat="server">Order Total:</label>
            <asp:Label runat="server" ID="lblOrderTotal"></asp:Label>
        </div>
        <div class="col-md-4">

        </div>
        <div class="col-md-3">
            <h3>Shipping Address</h3>
            <asp:Label runat="server" ID="lblStreetAddress"></asp:Label><br />
            <asp:Label runat="server" ID="lblCity"></asp:Label><br />
            <asp:Label runat="server" ID="lblProvPostCount"></asp:Label>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
            <h3>Items</h3>
            <asp:Table runat="server" ID="tblItems">
            </asp:Table>
        </div>
        <div class="col-md-4">

        </div>
        <div class="col-md-3">
            <h3 runat="server" id="headerBilling">Billing Address</h3>
            <asp:Label runat="server" ID="lblBillStreetAddress"></asp:Label><br />
            <asp:Label runat="server" ID="lblBillCity"></asp:Label><br />
            <asp:Label runat="server" ID="lblBillProvPostCount"></asp:Label>
        </div>
    </div>
</asp:Content>
