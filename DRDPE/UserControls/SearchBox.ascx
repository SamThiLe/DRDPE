<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBox.ascx.cs" Inherits="DRDPE.UserControls.SearchBox" %>
<label>Any&nbsp;</label><asp:Checkbox ID="chkKeywords" runat="server" Checked="false"/>&emsp;
<asp:TextBox ID="txtSearch" runat="server" type="text" class="form-control mr-sm-2  custom-search-box" placeholder="Search" name="q"></asp:TextBox>
<asp:button id="btnSearch"  class="btn btn-outline-light my-2 my-sm-0" type="submit" runat="server" Text="Search"></asp:button>