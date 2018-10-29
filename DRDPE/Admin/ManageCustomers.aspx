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

    <asp:GridView ID="grvCustomers" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" PageSize="5" AutoGenerateEditButton="True" OnRowEditing="grvCustomers_RowEditing">
        <Columns>
            <asp:BoundField HeaderText="Customer ID" ReadOnly="True" DataField="customerId" />
            <asp:BoundField HeaderText="First Name" DataField="firstName" />
            <asp:BoundField HeaderText="Middle Initial" DataField="middleInitial" />
            <asp:BoundField HeaderText="Last Name" DataField="lastName" />
            <asp:BoundField HeaderText="Email" DataField="email" />
            <asp:BoundField HeaderText="Username" DataField="username" ReadOnly="True" />
            <asp:BoundField HeaderText="Phone" DataField="phone" />
            <asp:BoundField HeaderText="Verified" DataField="verified" ReadOnly="True" />
            <asp:BoundField HeaderText="Archived" DataField="archived" />
        </Columns>
    </asp:GridView>

    <asp:Repeater ID="rptCust" runat="server">
        <HeaderTemplate>
            <div class="card-deck">
        </HeaderTemplate>
            <ItemTemplate>
                <div class="card" style="margin-bottom: 1em;">
                    <div class="card-body">
                        <h5 class="card-title"><asp:Label runat="server"><%#Eval("firstName")%>&nbsp;<%#Eval("middleInitial")%>&nbsp;<%#Eval("lastName")%></asp:Label></h5>
                        <p class="card-text">
                            <br />
                            <asp:Label runat="server">Customer ID: <%#Eval("customerId")%></asp:Label>
                            <br />
                            <asp:Label runat="server">Email: <%#Eval("email")%></asp:Label>
                            <br />
                            <asp:Label runat="server">Username: <%#Eval("username")%></asp:Label>
                            <br />
                            <asp:Label runat="server">Phone: <%#Eval("phone")%></asp:Label>
                            <br />
                            <asp:Label runat="server">Verified: <%#Eval("verified")%></asp:Label>
                            <br />
                            <asp:Label runat="server">Archived: <%#Eval("archived")%></asp:Label>
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
