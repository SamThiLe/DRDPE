<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="DRDPE.ProductPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <asp:Repeater ID="rptProd" runat="server">
        <HeaderTemplate>
            <small class="text-muted"><a href='index.aspx' class="btn btn-outline-light">Back</a></small>
        </HeaderTemplate>
        <ItemTemplate>
            
            <h1><asp:Label runat="server"><%#Eval("productName")%></asp:Label><br /></h1>
            <asp:Image runat="server" Width="250" Height="250" ImageUrl ='<%#Eval("imageUrl")%>' /><br />
            <asp:Label ID="lblProductID" runat="server"><%#Eval("productId")%></asp:Label><br />
            <p>
                <h4>Category:</h4>
                <asp:Label runat="server"><%#Eval("productName")%></asp:Label>
            </p>
            <p>
                <h4>Price:</h4>
                <asp:Label runat="server"><%#Eval("price", "{0:c}")%></asp:Label>
            </p>
<%--            <p>
                <h4>Status:</h4>
                <asp:Label ID="chkStatus" runat="server" Enabled="false" Text='<%#Eval("statusCode")%>'></asp:Label>
            </p>--%>
            <!--
            <h4>Featured:</h4>
            <asp:checkbox ID="chkFeatured" runat="server" Enabled="false" Checked='<%#Eval("featured")%>' />
            -->
            <p>
                <h4>Brief Description:</h4>
                <asp:Label runat="server"><%#Eval("briefDescription")%></asp:Label>
            </p>
            <p>
                <h4>Full Description:</h4>
                <asp:Label runat="server"><%#Eval("fullDescription")%></asp:Label>
            </p>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
        <SeparatorTemplate>
        <hr />
        </SeparatorTemplate>
    </asp:Repeater>
    <asp:Button ID="btnAddToCart"  class="btn btn-outline-light" runat="server" Text="Add To Cart" OnClick="btnAddToCart_Click" /><br /><br />
</asp:Content>
