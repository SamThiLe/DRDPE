<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UploadImage.aspx.cs" Inherits="DRDPE.Admin.UploadImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-6">
        <asp:FileUpload ID="uplPics" runat="server" /><br />
        <asp:Button id="btnChoseImage" runat="server" class="btn btn-outline-light my-sm-0 nav-fill" Text="Upload an Image" AutoPostBack="true"  CausesValidation="false" OnClick="btnChoseImage_Click" /><br /><br />
        <asp:Image ID="imgProd" runat="server" Width="200" Height="200" ImageUrl ='<%#Eval("imageUrl")%>' />
    </div>
</asp:Content>
