<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageCategories.aspx.cs" Inherits="DRDPE.ManageCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="#993300"></asp:Label>
    <h3>Product for Selected Catagory</h3>


    <asp:Repeater ID="rptCat" runat="server">
        <HeaderTemplate>
            <ul id="catList" class="nav nav-fill">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
                <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href='<%# Request.Url.LocalPath.ToString() + "?id="%><%#Eval("categoryId")%>'><%#Eval("name")%></a>
            </li>
        </ItemTemplate> 
        <FooterTemplate>
            </ul>
                <ul id="catList" class="nav nav-fill">
                    <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
                    <asp:Button runat="server" id="btnAddCategory" class="btn btn-outline-light my-sm-0 nav-fill" style="width:98%;" text="Add Category" OnClick="btnAddCategory_Click" CausesValidation="false"/>
                    </li>
                </ul>
        </FooterTemplate>
    </asp:Repeater>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <br />
    <div id="categoryUpdateContainer" style="display:none" runat="server">
        <label>Category Id:</label>
        <br />
        <asp:TextBox ID="txtCategoryIdUpdate" style="background-color:#c4c4c4" runat="server" Enabled="False" Text=''></asp:TextBox>
        <br />
        <label>Category Name:</label>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Category Name Required" ControlToValidate="txtCategoryNameUpdate" ForeColor="Orange">*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txtCategoryNameUpdate" runat="server" Text=''></asp:TextBox>
        <br />
        <label>Description:</label>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Category Description is Required" ControlToValidate="txtCatDescriptionUpdate" ForeColor="Orange">*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txtCatDescriptionUpdate" TextMode="MultiLine" Height="150" Width="400" runat="server" Text=""></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnCategoryUpdate" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" Text="Update Item" OnClick="btnCategoryUpdate_Click" />
        <asp:Button ID="btnCategoryDelete" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" Text="Delete Item" OnClick="btnCategoryDelete_Click" />
        <asp:Button ID="btnCategoryCancel" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" Text="Cancel" OnCommand="btnCancel_Command" CausesValidation="false" />
    </div>
    <div id="categoryAddContainer" style="display:none" runat="server">
        <asp:ValidationSummary ID="ValidationSummary2" runat="server"  ValidationGroup="addCat" />
        <br />
        <label>Category Name:</label>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Category Name is Required" ControlToValidate="txtCategoryNameAdd" ValidationGroup="addCat" ForeColor="Orange">*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txtCategoryNameAdd" runat="server" Text=''></asp:TextBox>
        <br />
        <label>Description:</label>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Category Description is Required" ControlToValidate="txtCategoryDescriptionAdd" ValidationGroup="addCat" ForeColor="Orange" >*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txtCategoryDescriptionAdd" Height="150" Width="400" TextMode="MultiLine" runat="server" Text='<%#Eval("description")%>'></asp:TextBox>
        <br />
        <br />
        <asp:Button runat="server" id="btnAdd" class="btn btn-outline-light my-sm-0 nav-fill" text="Add" OnClick="btnAdd_Click" ValidationGroup="addCat" />
        <asp:Button runat="server" id="btnCancel" class="btn btn-outline-light my-sm-0 nav-fill" text="Cancel" OnCommand="btnCancel_Command" CausesValidation="false"/>
    </div>
</asp:Content>
