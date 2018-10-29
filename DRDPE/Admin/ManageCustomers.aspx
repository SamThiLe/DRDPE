<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCustomers.aspx.cs" Inherits="DRDPE.Admin.ManageCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <!--
        <div class="form-check-inline">
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="optradio" value="0" checked />Customer ID &emsp;
            </label>
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="optradio" value="1" />Email Address &emsp;
            </label>
            <label class="form-check-label">
            <input type="radio" class="form-check-input" name="optradio" value="2" />Phone Number
            </label>
        </div>
        -->
        
        <asp:RadioButtonList ID="RadioButtonList1" class="btn-group btn-group-toggle" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="0" Selected="True">CustomerID &emsp;</asp:ListItem>
            <asp:ListItem Value="1">Email Address &emsp;</asp:ListItem>
            <asp:ListItem Value="2">Phone Number</asp:ListItem>
        </asp:RadioButtonList>
            
        <br />
        <asp:TextBox ID="txtSearch" runat="server" type="text" class="form-control mr-sm-2  custom-search-box" style="display:inline;" placeholder="Search" name="q"></asp:TextBox>
        <asp:button id="btnSearch"  class="btn btn-outline-light my-2 my-sm-0" type="submit" runat="server" Text="Search" OnClick="btnSearch_Click"></asp:button>
    </div>

</asp:Content>
