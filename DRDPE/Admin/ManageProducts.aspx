<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="DRDPE.ManageProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="col1">
    <h3>Add a new item or select a category</h3>
    <asp:Repeater ID="rptCat" runat="server">
        <HeaderTemplate>
            <ul class="nav nav-fill">
        </HeaderTemplate>
            <ItemTemplate>
                <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
                    <a class="btn btn-outline-light my-sm-0 nav-fill" style="width:90%;" href='<%# Request.Url.LocalPath.ToString() + "?catId="%><%#Eval("categoryId")%>'> <%#Eval("name")%></a>
                </li>
            </ItemTemplate>
        <FooterTemplate>
            </ul>
            <ul class="nav nav-fill">
                <li class="nav-item bg-dark" style="padding-top:0.5%;padding-bottom:0.5%;">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Item" class="btn btn-outline-light my-sm-0 nav-fill" style="width:98%;"  OnClick="btnAdd_Click" PostBackUrl="~/Admin/ManageProducts.aspx" />
                </li>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
  </div>
    <asp:Label ID="lblMessage" runat="server" Text="" EnableViewState="False"></asp:Label>
    <h3><asp:Label ID="lblHeader" runat="server" Text=""></asp:Label></h3>
      <br />
      <asp:Repeater ID="rptProd" runat="server">
      <HeaderTemplate>
            <!-- Default panel contents -->
                <!-- List group -->
                <ul class="nav nav-fill">
      </HeaderTemplate>
          <ItemTemplate>
                <li class="nav-item bg-dark">
                    <a href='ManageProducts.aspx?prodId=<%#Eval("ProductId")%>'>
                        <asp:Label ID="lblProduct" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" Text='<%#Eval("productName")%>'></asp:Label>
                        </a>
                    </li>
          </ItemTemplate>
      <FooterTemplate>
          </ul>
      </FooterTemplate>
    </asp:Repeater>
    <div id="productContainer" class="panel panel-default" style="display:none;" runat="server">
              <!-- Default panel contents -->
              <div class="panel-heading"><h3>Selected Product</h3></div>
              <!-- List group -->
              
                    <label>Product Id:</label><br />
                    <asp:TextBox ID="txtProduct" runat="server" style="background-color:#c4c4c4" ReadOnly="true" Text='<%#Eval("productId")%>'></asp:TextBox>
                                    <br />
                    <label>Product Name:</label><br />
                    <asp:TextBox ID="txtProductName" runat="server" Text='<%#Eval("productName")%>'></asp:TextBox>
                                    <br />
                    <label>Brief Description:</label><br />
                    <asp:TextBox ID="txtProductBriefDescription" runat="server" TextMode="MultiLine" Height="150" Width="400" Text='<%#Eval("briefDescription")%>'></asp:TextBox>
                                    <br />
                    <label>Full Description:</label><br />
                    <asp:TextBox ID="txtProductFullDescription" TextMode="MultiLine" Height="150" Width="400" runat="server" Text='<%#Eval("fullDescription")%>'></asp:TextBox>
                                    <br />
                    <label>Status Code:</label><br />
                    <asp:TextBox ID="txtProductStatus" runat="server" Text='<%#Eval("statusCode")%>' />
                                    <br />
                    <label>Price:</label><br />
                    <asp:TextBox ID="txtProductPrice" runat="server" Text='<%#Eval("price", "{0:c}")%>'></asp:TextBox>
                                    <br />
                    <label>Featured:</label><br />
                    <asp:CheckBox ID="chkProductFeatured" runat="server" Checked='<%#Eval("featured")%>'/>
                                    <br />
                    <label>Category:</label><br />
                    <asp:DropDownList ID="ddlCat" runat="server" AppendDataBoundItems="true">
                        <asp:ListItem Value="--Select a Category--"></asp:ListItem>
                    </asp:DropDownList>
                                   <br /><br />
                    <asp:Image ID="imgProd" runat="server" Width="200" Height="200" ImageUrl ='../<%#Eval("imageUrl")%>' />
                    <br />
                    <asp:Button runat="server" class="btn btn-outline-light my-sm-0 nav-fill" Text="Upload an Image" /><br /><br />
                    <asp:Button ID="btnUpdate" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" Text="Update Item" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnDelete" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" Text="Delete Item" OnClick="btnDelete_Click" />
                    <br /><br />
                    <asp:Button ID="btnSave" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" Text="Save Item" OnClick="btnSave_Click" />
                    <asp:Button ID="btnCancel" class="btn btn-outline-light my-sm-0 nav-fill" runat="server" Visible="false" Text="Cancel" OnClick="btnCancel_Click" />
                    <br /><br />
            </div>
</asp:Content>
