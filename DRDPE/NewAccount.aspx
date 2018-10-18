<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="NewAccount.aspx.cs" Inherits="DRDPE.NewAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="row">
            <div class="col-md-6">
                <h2>Register New User</h2>
                <asp:ValidationSummary ID="valSummary" runat="server" HeaderText="Opps! Please fix the following errors" />
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
                               placeholder="First Name" />
                        <asp:TextBox runat="server" type="text" name="middleInitial" class="form-control" id="txtMiddleInitial" placeholder="Middle Initial (Optional)" />
                        <asp:TextBox runat="server" type="text" name="lastName" class="form-control" id="txtLastName" placeholder="Last Name"  />
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
                        <asp:TextBox runat="server" type="text" name="username" CssClass="form-control" ID="txtUserName"
                               placeholder="Username" />
                    </div>

                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUserName" ErrorMessage="Username is required" ForeColor="Red">*</asp:RequiredFieldValidator>
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
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
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
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Password confirmation required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="dateOfBirth">Date of Birth</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" class="form-control" id="txtDateOfBirth" TextMode="Date" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Date of Birth required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvDateOfBirth" runat="server" ErrorMessage="Need to be at least 16 years of age." ForeColor="Red" Operator="LessThan" ControlToValidate="txtDateOfBirth">*</asp:CompareValidator>
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
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ControlToValidate="txtStreetAddress" ErrorMessage="Street address required." ForeColor="Red">*</asp:RequiredFieldValidator>
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
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required." ForeColor="Red">*</asp:RequiredFieldValidator>
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
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvProvince" runat="server" ControlToValidate="txtProvince" ErrorMessage="Province is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Postal code is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="txtCountry" ErrorMessage="Country is required" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                               placeholder="(123) 456-7890" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone number required" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                               placeholder="you@example.com" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-mail address is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <asp:Button ID="btnRegister" runat="server" type="submit" class="btn btn-success" Text="Register" OnClick="btnRegister_Click" />
                <br />
                <br />
            </div>
        </div>
</asp:Content>
