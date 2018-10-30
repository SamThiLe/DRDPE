<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCustomers.aspx.cs" Inherits="DRDPE.Admin.ManageCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="searchDiv" style="text-align: center" runat="server">
        <asp:RadioButtonList ID="RadioButtonList1" class="btn-group btn-group-toggle" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="0" Selected="True">CustomerID &emsp;</asp:ListItem>
            <asp:ListItem Value="1">Email Address &emsp;</asp:ListItem>
            <asp:ListItem Value="2">Phone Number</asp:ListItem>
        </asp:RadioButtonList>
            
        <br />
        <asp:TextBox ID="txtSearch" runat="server" type="text" class="form-control mr-sm-2  custom-search-box" style="display:inline;" placeholder="Search" name="q"></asp:TextBox>
        <asp:button id="btnSearch"  class="btn btn-outline-light my-2 my-sm-0" type="submit" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="false"></asp:button>
    </div>
    <div id="searchResults" runat="server">
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
                                <asp:Label runat="server">Phone: <%#Eval("phone")%></asp:Label>
                                <br />
                            </p>
                        </div>
                        <div class="card-footer">
                            <a href="ManageCustomers.aspx?id=<%#Eval("customerId") %>" class="btn btn-outline-light">Edit</a>
                        </div>
                    </div>
                </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
    <br />
    <div id="editCustomer" runat="server">
        




        <div class="row">
            <div class="col-md-6">
                <h2>Manage Customer</h2>
                <asp:ValidationSummary ID="valSummary" runat="server" HeaderText="Opps! Please fix the following errors" />
                <hr />
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="customerId">Customer ID</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="text" name="customerId" class="form-control" id="txtCustomerId" placeholder="Customer ID" disabled="true" />
                    </div>
                </div>            
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="name">Name</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="text" name="firstName" class="form-control" id="txtFirstName"
                               placeholder="First Name" />
                        <asp:TextBox runat="server" type="text" name="middleInitial" class="form-control" id="txtMiddleInitial" placeholder="Middle Initial" />
                        <asp:TextBox runat="server" type="text" name="lastName" class="form-control" id="txtLastName" placeholder="Last Name" />
                    </div>
                </div>            
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="username">Username</label>
            </div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="text" name="username" CssClass="form-control" ID="txtUserName" placeholder="Username" disabled="true" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUserName" ErrorMessage="Username is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="txtPhoneNumber">Phone Number</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="phone" name="txtPhoneNumber" class="form-control" id="txtPhoneNumber" placeholder="(123) 456-7890" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone number required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Incorrect format for Phone number" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">*</asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">E-Mail Address</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="text" name="email" class="form-control" id="txtEmail" placeholder="you@example.com" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-mail address is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Incorrect format for Email address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">Archived</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:CheckBox ID="chkArchived" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <asp:Button ID="btnUpdate" runat="server" type="submit" class="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
                <a href="ManageCustomers.aspx" class="btn btn-success">Cancel</a>
                <br />
                <br />
            </div>
        </div>









    </div>
</asp:Content>
