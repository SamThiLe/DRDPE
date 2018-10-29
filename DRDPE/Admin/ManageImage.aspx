<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageImage.aspx.cs" Inherits="DRDPE.Admin.ManageImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-3">
                <asp:FileUpload ID="uplPics" runat="server" /><br />
                <asp:Button id="btnChoseImage" runat="server" class="btn btn-outline-light my-sm-0 nav-fill" Text="Upload an Image" AutoPostBack="true"  CausesValidation="false" OnClick="btnChoseImage_Click" /><br /><br />
                <asp:Image ID="imgProd" runat="server" Width="200" Height="200" ImageUrl ='../<%#Eval("imageUrl")%>' />
            </div>
            <div class="col-9">
               
                <asp:GridView ID="grvImages" runat="server" AutoGenerateColumns="False">
                </asp:GridView>
            </div>
        </div>
    </div>
    
    
</asp:Content>
