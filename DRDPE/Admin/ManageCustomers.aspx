<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCustomers.aspx.cs" Inherits="DRDPE.Admin.ManageCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="txtSearch" runat="server" type="text" class="form-control mr-sm-2  custom-search-box" style="display:inline;" placeholder="Search" name="q"></asp:TextBox>
    <asp:button id="btnSearch"  class="btn btn-outline-light my-2 my-sm-0" type="submit" runat="server" Text="Search"></asp:button>
</asp:Content>
