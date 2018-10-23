<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="OrderConfirm.aspx.cs" Inherits="DRDPE.OrderConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <asp:Label runat="server"> Confirmation Code</asp:Label>
    <br />
    <asp:Label ID="lblCC" runat="server"></asp:Label>
</asp:Content>
