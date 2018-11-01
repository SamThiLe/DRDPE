<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DRDPE.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ MasterType virtualpath="~/PE.Master" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="rptCat" runat="server">
        <HeaderTemplate>
            <ul id="catList" class="nav nav-fill">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
            <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href='<%# Request.Url.LocalPath.ToString() + "?id="%><%#Eval("categoryId")%>'>
                <%#Eval("name")%></a>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
    
    <asp:Label ID="lblMessage" runat="server" Text="" EnableViewState="False"></asp:Label>
    <h3><asp:Label ID="lblHeader" runat="server" Text=""></asp:Label></h3>
      <br />

      <asp:Repeater ID="rptProd" runat="server">
      <HeaderTemplate>
          <div class="card-deck">
      </HeaderTemplate>
          <ItemTemplate>
              <div class="card" style="margin-bottom: 1em;">
                    <a href='ProductPage.aspx?productId=<%#Eval("productId") %>'>
                        <asp:Image runat="server" class="card-img-top"  ImageUrl ='<%#Eval("imageUrl")%>' />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title"><asp:Label runat="server"><%#Eval("productName")%></asp:Label></h5>
                        <p class="card-text">
                            <br />
                            <asp:Label runat="server"><%#Eval("productId")%></asp:Label><br />
                            <br />
                            <asp:Label runat="server"><%#Eval("price", "{0:c}")%></asp:Label>
                            <br />
                            <h4>Brief Description:</h4>
                            <asp:Label runat="server"><%#Eval("briefDescription")%></asp:Label>
                            <br />
                        </p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted"><a href='ProductPage.aspx?productId=<%#Eval("productId") %>' class="btn btn-outline-light">Product Page</a></small>
                    </div>
                </div>
            </ItemTemplate>
      <FooterTemplate>
          </div>
      </FooterTemplate>
      <SeparatorTemplate>
      </SeparatorTemplate>
    </asp:Repeater>
    <br />
</asp:Content>
