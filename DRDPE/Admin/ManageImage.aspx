<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageImage.aspx.cs" Inherits="DRDPE.Admin.ManageImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">

   
            <div class="col-6">
                <div id="searchDiv" style="text-align: center" runat="server">
                    <label>Search for Images</label>
                    <br />
                    <asp:TextBox ID="txtSearch" runat="server" type="text" class="form-control mr-sm-2  custom-search-box" style="display:inline;" placeholder="Search" name="q"></asp:TextBox>
                    <asp:button id="btnSearch"  class="btn btn-outline-light my-2 my-sm-0" type="submit" runat="server" Text="Search" CausesValidation="false" OnClick="btnSearch_Click"></asp:button>
                </div>
                
            </div>
            <div class="col-6">
                <asp:FileUpload ID="uplPics" runat="server" /><br />
                <asp:Button id="btnChoseImage" runat="server" class="btn btn-outline-light my-sm-0 nav-fill" Text="Upload an Image" AutoPostBack="true"  CausesValidation="false" OnClick="btnChoseImage_Click" /><br /><br />
                <asp:Image ID="imgProd" runat="server" Width="200" Height="200" ImageUrl ='<%#Eval("imageUrl")%>' />
            </div>
        </div>
        <br />
        <asp:GridView ID="grvImages" runat="server" AutoGenerateColumns="False">
            <Columns>

            <asp:TemplateField HeaderText="Image Id">
                <ItemTemplate>
                    <span style="text-align: center">
                        <asp:Label ID="imageId" runat="server" Text='<%#Eval("imageId")%>'></asp:Label>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
                <asp:ImageField HeaderText="Image" DataImageUrlField='imageUrl' >
                    <ControlStyle Height="100px" Width="100px" />
                </asp:ImageField>  
            <asp:TemplateField HeaderText="Image Url">
                <ItemTemplate>
                    <span style="text-align: center">
                        <asp:Label ID="imageUrl" runat="server" Text='<%#Eval("imageUrl")%>'></asp:Label>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="uploadDate" HeaderText="Upload Date"></asp:BoundField>
                <asp:BoundField DataField="altText" HeaderText="Alternate Text"></asp:BoundField>
            <asp:TemplateField HeaderText="Uploader Id">
                <ItemTemplate>
                    <span style="text-align: center">
                        <asp:Label ID="lblAdminId" runat="server" Text='<%#Eval("uploadedBy")%>'></asp:Label>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
                <asp:BoundField DataField="email" HeaderText="Uploader Email"></asp:BoundField>
                <asp:TemplateField HeaderText="Is Approved">
                <ItemTemplate>
                    <span style="text-align: center">
                        <asp:CheckBox ID="CheckBox1" Enabled="false" Checked='<%#Eval("approved")%>' runat="server" />
                    </span>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Approve">
                <ItemTemplate>
                    <span style="text-align: center">
                        <asp:Button ID="btnApprove" runat="server" Text="Approve"  OnClick="BtnApprove_Click"/>
                    </span>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <span style="text-align: center">
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="BtnDelete_Click"  />
                    </span>
                </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
