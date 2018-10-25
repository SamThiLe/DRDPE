<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageImage.aspx.cs" Inherits="DRDPE.Admin.ManageImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FileUpload ID="uplPics" runat="server" /><br />
    <asp:Button id="btnChoseImage" runat="server" class="btn btn-outline-light my-sm-0 nav-fill" Text="Upload an Image" AutoPostBack="true"  CausesValidation="false" OnClick="btnChoseImage_Click" /><br /><br />
    <asp:Image ID="imgProd" runat="server" Width="200" Height="200" ImageUrl ='../<%#Eval("imageUrl")%>' />
</asp:Content>
