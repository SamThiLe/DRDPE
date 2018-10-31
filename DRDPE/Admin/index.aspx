<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DRDPE.Admin.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul id="catList" class="nav nav-fill">
        <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
            <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href="ManageCategories.aspx">Manage Categories</a>
        </li>
        <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
            <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href="ManageProducts.aspx">Manage Products</a>
        </li>
        <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
            <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href="ManageCustomers.aspx">Manage Customers</a>
        </li>
        <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
            <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href="ManageImage.aspx">Manage Image Data</a>
        </li>
        <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
            <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href="UploadImage.aspx">Upload Image</a>
        </li>
    </ul>
</asp:Content>
