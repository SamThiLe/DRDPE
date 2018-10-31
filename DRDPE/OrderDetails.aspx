<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="DRDPE.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-2">
            <h3>Your Order</h3>
        </div>
        <div class="col-md-6">

        </div>
        <div class="col-md-2">
            <h3>Shipping Address</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <label runat="server">Order Status: </label>
        </div>
        <div class="col-md-3">
            <asp:Label runat="server" ID="lblOrderStatus"></asp:Label>
        </div>
    </div>    
    <div class="row">
        <div class="col-md-2">
            <label runat="server">Order Placed On: </label>
        </div>
        <div class="col-md-3">
            <asp:Label runat="server" ID="lblOrderDate"></asp:Label>
        </div>
    </div>    
    <div class="row">
        <div class="col-md-2">
            <label runat="server">Order Total:</label>
        </div>
        <div class="col-md-3">
            <asp:Label runat="server" ID="lblOrderTotal"></asp:Label>
        </div>
    </div>
</asp:Content>
