<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCustomers.aspx.cs" Inherits="DRDPE.Admin.ManageCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Value="0">CustomerID</asp:ListItem>
            <asp:ListItem Value="1">Email Address</asp:ListItem>
            <asp:ListItem Value="2">Phone Number</asp:ListItem>
        </asp:RadioButtonList>
        <asp:TextBox ID="txtSearch" runat="server" type="text" class="form-control mr-sm-2  custom-search-box" style="display:inline;" placeholder="Search" name="q"></asp:TextBox>
        <asp:button id="btnSearch"  class="btn btn-outline-light my-2 my-sm-0" type="submit" runat="server" Text="Search" OnClick="btnSearch_Click"></asp:button>
    </div>
    <asp:Repeater ID="rptCust" runat="server">
        <HeaderTemplate>
            <ul class="nav nav-fill">
        </HeaderTemplate>
            <ItemTemplate>
                <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
                    <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href='<%# Request.Url.LocalPath.ToString() + "?catId="%><%#Eval("categoryId")%>'> <%#Eval("name")%></a>
                </li>
            </ItemTemplate>
        <FooterTemplate>
            </ul>
            <ul class="nav nav-fill">
                <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Item" class="btn btn-outline-light my-sm-0 nav-fill" style="width:98%;" PostBackUrl="~/Admin/ManageCustomers.aspx" CausesValidation="false" />
                </li>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
