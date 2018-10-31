<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UploadImage.aspx.cs" Inherits="DRDPE.Admin.UploadImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:FileUpload ID="uplPics" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" /><br />
    <br /><br />
    <asp:Image ID="imgProd" runat="server" Width="200" Height="200" ImageUrl ='<%#Eval("imageUrl")%>' />

    <br />
    <label>Image Name:</label>
    <br />
    <asp:TextBox ID="txtImgName" runat="server" Text=''></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Image Name is Required" ControlToValidate="txtImgName" ForeColor="Orange" ViewStateMode="Disabled" Display="Dynamic">*</asp:RequiredFieldValidator>
    <br />
    <label>Image Alt Text:</label>
    <br />
    <asp:TextBox ID="txtAltText" runat="server" Text=''></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Image Alt Text is Required" ControlToValidate="txtAltText" ForeColor="Orange" ViewStateMode="Disabled" Display="Dynamic">*</asp:RequiredFieldValidator>
    <br />
    <asp:Button id="btnChoseImage" runat="server" class="btn btn-outline-light my-sm-0 nav-fill" Text="Upload an Image" AutoPostBack="true"  OnClick="btnChoseImage_Click" />
</asp:Content>
