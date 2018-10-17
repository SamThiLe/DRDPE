<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="DRDPE.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMessage" runat="server" Text="" EnableViewState="False"></asp:Label>
    <asp:GridView ID="grvCart" runat="server" Font-Names="Verdana" BorderColor="Black"
        DataKeyNames="qty"
        GridLines="Vertical"
        CellPadding="4" Font-Size="12pt" ShowFooter="True" HeaderStyle-CssClass="CartListHead"
        FooterStyle-CssClass="CartListFooter"
        RowStyle-CssClass="CartListItem"
        AlternatingRowStyle-CssClass="CartListItemAlt"
        AutoGenerateColumns="False">
        <FooterStyle CssClass="CartListFooter"></FooterStyle>
        <HeaderStyle CssClass="CartListHead"></HeaderStyle>
        <AlternatingRowStyle CssClass="CartListItemAlt"></AlternatingRowStyle>
        <Columns>
          <asp:TemplateField HeaderText="Product&#160;ID">
            <ItemTemplate>
             <asp:Label ID="ProductID" runat="server" 
               Text='<%# Eval("ProductId")%>'>
              </asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="productName" HeaderText="Product Name"></asp:BoundField>
          <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
              <asp:TextBox ID="Quantity" runat="server" MaxLength="3"
                Text='<%# Eval("Qty")%>' Width="40px" />
            </ItemTemplate>
          </asp:TemplateField>
          <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="{0:c}"></asp:BoundField>

           <asp:TemplateField HeaderText="Subtotal">
                <ItemTemplate>
                    <asp:Label ID="lblSubtotal" runat="server" Text='<%# Bind("ItemSubtotal", "{0:c}") %>'></asp:Label>
                </ItemTemplate>
           </asp:TemplateField>
          <asp:TemplateField HeaderText="Remove">
            <ItemTemplate>
              <span style="text-align: center">
                <asp:CheckBox ID="Remove" runat="server" />
              </span>
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
    <RowStyle CssClass="CartListItem"></RowStyle>
      </asp:GridView>
    <span><b>Total:</b></span>
    <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
    <asp:Label ID="lblTest" runat="server"></asp:Label>

    <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update Cart" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" OnClick="btnContinue_Click"  />
    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" />
</asp:Content>
