<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DRDPE.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
            <h2>User Login</h2>
            <hr />
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 field-label-responsive">
            <label for="username">Username</label>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <asp:TextBox runat="server" type="text" name="username" CssClass="form-control" ID="txtUserName" placeholder="Username" />
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
                    <asp:TextBox runat="server" type="password" name="password" CssClass="form-control" ID="txtPassword" placeholder="Password" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <asp:Button ID="btnLogin" runat="server" type="submit" class="btn btn-success" Text="Login" OnClick="btnLogin_Click" />
            <br />
            <br />
        </div>
    </div>
</asp:Content>
