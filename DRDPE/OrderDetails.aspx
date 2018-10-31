<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="DRDPE.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Your Order</h3>
    <label runat="server" id="lblForOrderStatus">Order Status: </label>
    <asp:Label runat="server" ID="lblOrderStatus"></asp:Label>
    <br />
    <label runat="server" id="lblForOrderDate">Order Placed On: </label>
    <asp:Label runat="server" ID="lblOrderDate"></asp:Label>
    <br />
    <label runat="server" id="lblForOrderTotal">Order Total: $</label>
    <asp:Label runat="server" ID="lblOrderTotal"></asp:Label>
</asp:Content>
