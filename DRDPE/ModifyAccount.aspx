<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="ModifyAccount.aspx.cs" Inherits="DRDPE.ModifyAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h5 id="errLabel" runat="server" ForeColor="Red"></h5>
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
                    <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" ControlToValidate="txtStreetAddress" ErrorMessage="Street address required." ForeColor="Red">*</asp:RequiredFieldValidator>
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
                        <asp:DropDownList ID="ddlStates" runat="server" CssClass="browser-default" style="display:none" >
                          <asp:ListItem Value="AL">Alabama</asp:ListItem>
                          <asp:ListItem Value="AK">Alaska</asp:ListItem>
                          <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                          <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                          <asp:ListItem Value="CA">California</asp:ListItem>
                          <asp:ListItem Value="CO">Colorado</asp:ListItem>
                          <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                          <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                          <asp:ListItem Value="DE">Delaware</asp:ListItem>
                          <asp:ListItem Value="FL">Florida</asp:ListItem>
                          <asp:ListItem Value="GA">Georgia</asp:ListItem>
                          <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                          <asp:ListItem Value="ID">Idaho</asp:ListItem>
                          <asp:ListItem Value="IL">Illinois</asp:ListItem>
                          <asp:ListItem Value="IN">Indiana</asp:ListItem>
                          <asp:ListItem Value="IA">Iowa</asp:ListItem>
                          <asp:ListItem Value="KS">Kansas</asp:ListItem>
                          <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                          <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                          <asp:ListItem Value="ME">Maine</asp:ListItem>
                          <asp:ListItem Value="MD">Maryland</asp:ListItem>
                          <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                          <asp:ListItem Value="MI">Michigan</asp:ListItem>
                          <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                          <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                          <asp:ListItem Value="MO">Missouri</asp:ListItem>
                          <asp:ListItem Value="MT">Montana</asp:ListItem>
                          <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                          <asp:ListItem Value="NV">Nevada</asp:ListItem>
                          <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                          <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                          <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                          <asp:ListItem Value="NY">New York</asp:ListItem>
                          <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                          <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                          <asp:ListItem Value="OH">Ohio</asp:ListItem>
                          <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                          <asp:ListItem Value="OR">Oregon</asp:ListItem>
                          <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                          <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                          <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                          <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                          <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                          <asp:ListItem Value="TX">Texas</asp:ListItem>
                          <asp:ListItem Value="UT">Utah</asp:ListItem>
                          <asp:ListItem Value="VT">Vermont</asp:ListItem>
                          <asp:ListItem Value="VA">Virginia</asp:ListItem>
                          <asp:ListItem Value="WA">Washington</asp:ListItem>
                          <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                          <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                          <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlProvices" runat="server" CssClass="browser-default">
                          <asp:ListItem Value="AL">Alberta</asp:ListItem>
                          <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                          <asp:ListItem Value="MN">Manitoba</asp:ListItem>
                          <asp:ListItem Value="ON">Ontario</asp:ListItem>
                          <asp:ListItem Value="QC">Quebec</asp:ListItem>
                          <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                          <asp:ListItem Value="NL">Newfoundland</asp:ListItem>
                          <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                          <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                          <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                          <asp:ListItem Value="YK">Yukon</asp:ListItem>
                          <asp:ListItem Value="NW">Northwest Territories</asp:ListItem>
                          <asp:ListItem Value="NT">Nunavut</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox runat="server" type="text" name="txtPostalCode" class="form-control" ID="txtPostalCode" placeholder="E1A 0K8" Width="0.05%" />
                        <asp:DropDownList runat="server" class="form-control" ID="ddlCountry"  AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                            <asp:ListItem Value="CA">Canada</asp:ListItem>
                          <asp:ListItem Value="US">USA</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>            
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Billing Postal code is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Incorrect format for Billing Postal Code" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]" >*</asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="revZip" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Incorrect format for Billing Zip" ForeColor="Red" ValidationExpression="[0-9][0-9][0-9][0-9][0-9]" Enabled="false">*</asp:RegularExpressionValidator>
            </div>
        </div>
    <div id="divShippingAddressChk" runat="server">
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
                        <asp:DropDownList ID="ddlShipState" runat="server" CssClass="browser-default" style="display:none" >
                          <asp:ListItem Value="AL">Alabama</asp:ListItem>
                          <asp:ListItem Value="AK">Alaska</asp:ListItem>
                          <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                          <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                          <asp:ListItem Value="CA">California</asp:ListItem>
                          <asp:ListItem Value="CO">Colorado</asp:ListItem>
                          <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                          <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                          <asp:ListItem Value="DE">Delaware</asp:ListItem>
                          <asp:ListItem Value="FL">Florida</asp:ListItem>
                          <asp:ListItem Value="GA">Georgia</asp:ListItem>
                          <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                          <asp:ListItem Value="ID">Idaho</asp:ListItem>
                          <asp:ListItem Value="IL">Illinois</asp:ListItem>
                          <asp:ListItem Value="IN">Indiana</asp:ListItem>
                          <asp:ListItem Value="IA">Iowa</asp:ListItem>
                          <asp:ListItem Value="KS">Kansas</asp:ListItem>
                          <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                          <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                          <asp:ListItem Value="ME">Maine</asp:ListItem>
                          <asp:ListItem Value="MD">Maryland</asp:ListItem>
                          <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                          <asp:ListItem Value="MI">Michigan</asp:ListItem>
                          <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                          <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                          <asp:ListItem Value="MO">Missouri</asp:ListItem>
                          <asp:ListItem Value="MT">Montana</asp:ListItem>
                          <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                          <asp:ListItem Value="NV">Nevada</asp:ListItem>
                          <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                          <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                          <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                          <asp:ListItem Value="NY">New York</asp:ListItem>
                          <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                          <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                          <asp:ListItem Value="OH">Ohio</asp:ListItem>
                          <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                          <asp:ListItem Value="OR">Oregon</asp:ListItem>
                          <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                          <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                          <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                          <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                          <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                          <asp:ListItem Value="TX">Texas</asp:ListItem>
                          <asp:ListItem Value="UT">Utah</asp:ListItem>
                          <asp:ListItem Value="VT">Vermont</asp:ListItem>
                          <asp:ListItem Value="VA">Virginia</asp:ListItem>
                          <asp:ListItem Value="WA">Washington</asp:ListItem>
                          <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                          <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                          <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlShipProv" runat="server" CssClass="browser-default">
                          <asp:ListItem Value="AL">Alberta</asp:ListItem>
                          <asp:ListItem Value="BC">British Columbia</asp:ListItem>
                          <asp:ListItem Value="MN">Manitoba</asp:ListItem>
                          <asp:ListItem Value="ON">Ontario</asp:ListItem>
                          <asp:ListItem Value="QC">Quebec</asp:ListItem>
                          <asp:ListItem Value="SK">Saskatchewan</asp:ListItem>
                          <asp:ListItem Value="NL">Newfoundland</asp:ListItem>
                          <asp:ListItem Value="NS">Nova Scotia</asp:ListItem>
                          <asp:ListItem Value="NB">New Brunswick</asp:ListItem>
                          <asp:ListItem Value="PE">Prince Edward Island</asp:ListItem>
                          <asp:ListItem Value="YK">Yukon</asp:ListItem>
                          <asp:ListItem Value="NW">Northwest Territories</asp:ListItem>
                          <asp:ListItem Value="NT">Nunavut</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox runat="server" type="text" name="txtPostalCode" class="form-control" ID="txtShipPostalCode" placeholder="E1A 0K8" Width="0.05%" />
                        <asp:DropDownList runat="server" class="form-control" ID="ddlShipCountry"  AutoPostBack="true" OnSelectedIndexChanged="ddlShipCountry_SelectedIndexChanged">
                            <asp:ListItem Value="CA">Canada</asp:ListItem>
                          <asp:ListItem Value="US">USA</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>            
            <div class="col-md-3">
                <asp:RequiredFieldValidator ID="rfvShipPostalCode" runat="server" ControlToValidate="txtShipPostalCode" ErrorMessage="Shipping Postal code is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revShipPostalCode" runat="server" ControlToValidate="txtShipPostalCode" ErrorMessage="Incorrect format for Shipping Postal Code" ForeColor="Red" ValidationExpression="[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJKLMNPRSTVWXYZ] ?[0-9][ABCEGHJKLMNPRSTVWXYZ][0-9]" >*</asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="revShipZip" runat="server" ControlToValidate="txtShipPostalCode" ErrorMessage="Incorrect format for Shipping Zip code" ForeColor="Red" ValidationExpression="[0-9][0-9][0-9][0-9][0-9]" Enabled="false">*</asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 field-label-responsive">
                <label for="txtAdditionalNotes">Additional Notes</label>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                        <asp:Textbox runat="server" type="text" name="txtAdditionalNotes" class="form-control" id="txtAdditionalNotes" placeholder="Optional"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <asp:Button ID="btnModify" runat="server" class="btn btn-success" Text="Confirm" OnClick="btnModify_Click" />
                <br />
                <br />
            </div>
        </div>
</asp:Content>
