<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="NewAccount.aspx.cs" Inherits="DRDPE.NewAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="row">
            <div class="col-md-6">
                <h2>Register New User</h2>
                <hr />
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
                               placeholder="First Name" autofocus />
                        <asp:TextBox runat="server" type="text" name="middleInitial" class="form-control" ID="txtMiddleInitial" placeholder="Middle Initial (Optional)" />
                        <asp:TextBox runat="server" type="text" name="lastName" class="form-control" ID="txtLastName" placeholder="Last Name"  />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="username">Username</label>
            </div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="text" name="username" CssClass="form-control" ID="txtUserName"
                               placeholder="Username" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">Password</label>
            </div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="password" name="password" CssClass="form-control" ID="txtPassword"
                               placeholder="Password" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">Confirm Password</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="password" name="password-confirmation" class="form-control"
                               id="txtConfirmPassword" placeholder="Password"  />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="dateOfBirth">Date of Birth</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" class="form-control" type="date" id="txtDateOfBirth" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="txtStreetAddress">Street Address</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="text" name="txtStreetAddress" class="form-control" id="txtStreetAddress"
                               placeholder="1234 Mountain Rd."  />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="txtCity">City</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="text" name="txtCity" class="form-control" id="txtCity"
                               placeholder="Moncton"  />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">Province, Postal Code, Country</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="text" name="txtProvince" class="form-control" id="txtProvince"
                               placeholder="NB" />
                        <asp:TextBox runat="server" type="text" name="txtPostalCode" class="form-control" ID="txtPostalCode" placeholder="E1A 0K8" Width="0.05%" />
                        <asp:TextBox runat="server" type="text" name="txtCountry" class="form-control" ID="txtCountry" placeholder="Canada"  />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="txtPhoneNumber">Phone Number</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="phone" name="txtPhoneNumber" class="form-control" id="txtPhoneNumber"
                               placeholder="(123) 456-7890" autofocus />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">E-Mail Address</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="text" name="email" class="form-control" id="txtEmail"
                               placeholder="you@example.com" autofocus />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <button type="submit" class="btn btn-success"> Register</button>
                <br />
                <br />
            </div>
        </div>
</asp:Content>
