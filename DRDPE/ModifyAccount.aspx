<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="ModifyAccount.aspx.cs" Inherits="DRDPE.ModifyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
            <div class="col-md-6">
                <h2>ModifyInfo </h2>
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
                        <asp:TextBox runat="server" type="text" class="form-control" id="txtFirstName" ReadOnly="true"/>
                        <asp:TextBox runat="server" type="text" class="form-control" id="txtMiddleInitial" ReadOnly="true"/>
                        <asp:TextBox runat="server" type="text" class="form-control" id="txtLastName"/>
                    </div>
                </div>            
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="password">Password</label>
            </div>
            <div class="col-md-6">
                <div class="form-group has-danger">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="password" name="password" CssClass="form-control" ID="txtPassword" />
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
                               id="txtConfirmPassword"/>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Password confirmation required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match" ForeColor="Red">*</asp:CompareValidator>
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
                        <asp:Textbox runat="server" type="text" name="email" class="form-control" id="txtEmail" />
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
                    
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-group mb-2 mr-sm-2 mb-sm-0"><label for="lblAddressType">Billing Address:</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStreetAddress" ErrorMessage="Street address required." ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
            </div>
    <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="txtStreetAddress">Street Address</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="text" name="txtStreetAddress" class="form-control" id="txtStreetAddress" />
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
                        <asp:Textbox runat="server" type="text" name="txtCity" class="form-control" id="txtCity"  />
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
                        <asp:TextBox runat="server" type="text" name="txtProvince" class="form-control" id="txtProvince" />
                        <asp:TextBox runat="server" type="text" name="txtPostalCode" class="form-control" ID="txtPostalCode" Width="0.05%" />
                        <asp:TextBox runat="server" type="text" name="txtCountry" class="form-control" ID="txtCountry" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvProvince" runat="server" ControlToValidate="txtProvince" ErrorMessage="Province is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Postal code is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="txtCountry" ErrorMessage="Country is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Incorrect format for Postal Code" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]">*</asp:RegularExpressionValidator>
            </div>
        </div>
            <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">Shipping Address Same As Billing</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:CheckBox ID="chkSameAsBilling" runat="server" Checked="true" OnCheckedChanged="chkSameAsBilling_CheckedChanged" AutoPostBack="True" />
                    </div>
                </div>
            </div>
        </div>
    <div id="divShippingAddress" runat="server" style="display:none;">
        <div class="row">
                <div class="col-md-3 field-label-responsive">
                    
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-group mb-2 mr-sm-2 mb-sm-0"><label for="lblAddressType">Shipping Address:</label>
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
                        <asp:Textbox runat="server" type="text" name="txtShipStreetAddress" class="form-control" id="txtShipStreetAddress" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvShipStreetAddress" runat="server" ControlToValidate="txtShipStreetAddress" ErrorMessage="Street address required." ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="txtCity">City</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="text" name="txtShipCity" class="form-control" id="txtShipCity"  />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvShipCity" runat="server" ControlToValidate="txtShipCity" ErrorMessage="City is required." ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="email">Province, Postal Code, Country</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:TextBox runat="server" type="text" name="txtShipProvince" class="form-control" id="txtShipProvince" />
                        <asp:TextBox runat="server" type="text" name="txtShipPostalCode" class="form-control" ID="txtShipPostalCode" Width="0.05%" />
                        <asp:TextBox runat="server" type="text" name="txtShipCountry" class="form-control" ID="txtShipCountry" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvShipProvince" runat="server" ControlToValidate="txtShipProvince" ErrorMessage="Province is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvShipPostalCode" runat="server" ControlToValidate="txtShipPostalCode" ErrorMessage="Postal code is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rfvShipCountry" runat="server" ControlToValidate="txtShipCountry" ErrorMessage="Country is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revShipPostalCode" runat="server" ControlToValidate="txtShipPostalCode" ErrorMessage="Incorrect format for Postal Code" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]">*</asp:RegularExpressionValidator>
            </div>
        </div>
    </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <asp:Button ID="btnModify" runat="server" type="submit" class="btn btn-success" Text="Confirm" OnClick="btnModify_Click" />
                <br />
                <br />
            </div>
        </div>
</asp:Content>
