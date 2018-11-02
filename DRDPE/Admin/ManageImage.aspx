<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageImage.aspx.cs" Inherits="DRDPE.Admin.ManageImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="searchDiv" style="text-align: center" runat="server">
        <label>Search for Images</label>
        <br />
        <asp:TextBox ID="txtSearch" runat="server" type="text" class="form-control mr-sm-2  custom-search-box" style="display:inline;" placeholder="Search" name="q"></asp:TextBox>
        <asp:button id="btnSearch"  class="btn btn-outline-light my-2 my-sm-0" type="submit" runat="server" Text="Search" CausesValidation="false" OnClick="btnSearch_Click"></asp:button>
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
            <ItemStyle Wrap="False" />
        </asp:TemplateField>
            <asp:ImageField HeaderText="Image" DataImageUrlField='imageUrl' >
                <ControlStyle Height="140px" Width="140px" />
                <ItemStyle Wrap="False" />
            </asp:ImageField>  
        <asp:TemplateField HeaderText="Image Url">
            <ItemTemplate>
                <span style="text-align: center">
                    <asp:Label ID="imageUrl" runat="server" Text='<%#Eval("imageUrl")%>'></asp:Label>
                </span>
            </ItemTemplate>
            <ItemStyle Wrap="False" />
        </asp:TemplateField>
        <asp:BoundField DataField="uploadDate" HeaderText="Upload Date">
            <ItemStyle Wrap="False" />
            </asp:BoundField>
        <asp:TemplateField HeaderText="Image Name">
            <ItemTemplate>
                <span style="text-align: center">
                    <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("imageName")%>'></asp:TextBox>
                </span>
            </ItemTemplate>
            <ItemStyle Wrap="False" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Alternate Text">
            <ItemTemplate>
                <span style="text-align: center">
                    <asp:TextBox ID="txtAltText" runat="server" Text='<%#Eval("altText")%>'></asp:TextBox>
                </span>
            </ItemTemplate>
            <ItemStyle Wrap="False" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Uploader Id">
            <ItemTemplate>
                <span style="text-align: center">
                    <asp:Label ID="lblAdminId" runat="server" Text='<%#Eval("uploadedBy")%>'></asp:Label>
                </span>
            </ItemTemplate>
            <ItemStyle Wrap="False" />
        </asp:TemplateField>
            <asp:BoundField DataField="email" HeaderText="Uploader Email">
            <ItemStyle Wrap="False" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Is Approved">

            <ItemTemplate>
                <span style="text-align: center">
                    <asp:CheckBox ID="CheckBox1" Enabled="false" Checked='<%#Eval("approved")%>' runat="server" />
                </span>
            </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Active">
                <ItemTemplate>
                    <span style="text-align: center">
                        <asp:CheckBox ID="chkActive" Checked='<%#Eval("active")%>' runat="server" />
                    </span>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Modify">
            <ItemTemplate>
                <span style="text-align: center">
                        <asp:Button ID="btnApprove" class="btn btn-outline-light my-sm-0 nav-fill" Width="100%" runat="server" Text="Approve"  OnClick="BtnApprove_Click"/>
                        <asp:Button ID="btnUpdate" class="btn btn-outline-light my-sm-0 nav-fill" Width="100%" runat="server" Text="Update" OnClick="BtnUpdate_Click"  />
                        <asp:Button ID="btnDelete" class="btn btn-outline-light my-sm-0 nav-fill" Width="100%" runat="server" Text="Delete" OnClick="BtnDelete_Click"  />
                </span>
            </ItemTemplate>
                <ItemStyle Wrap="True" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
