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
    <asp:Repeater ID="rptCust" runat="server">
        <HeaderTemplate>
            <div class="card-deck">
        </HeaderTemplate>
            <ItemTemplate>
                <div class="card" style="margin-bottom: 1em;">
                    <div class="card-body">
                        <h5 class="card-title"><asp:Label runat="server"><%#Eval("firstName")%> <%#Eval("middleInitial")%>. <%#Eval("lastName")%></asp:Label></h5>
                        <p class="card-text">
                            <br />
                            <asp:Label runat="server"><%#Eval("customerId")%></asp:Label><br />
                            <br />
                            <asp:Label runat="server"><%#Eval("email")%></asp:Label>
                            <br />
                            <asp:Label runat="server"><%#Eval("username")%></asp:Label>
                            <br />
                            <asp:Label runat="server"><%#Eval("phone")%></asp:Label>
                            <br />
                            <asp:Label runat="server"><%#Eval("verified")%></asp:Label>
                            <br />
                            <asp:Label runat="server"><%#Eval("archived")%></asp:Label>
                            <br />
                        </p>
                    </div>
                    <div class="card-footer">
                    </div>
                </div>
            </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
