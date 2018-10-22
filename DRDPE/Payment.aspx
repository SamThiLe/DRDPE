<%@ Page Title="" Language="C#" MasterPageFile="~/PE.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="DRDPE.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>

    <br />
    <span><b>Subtotal:</b></span>
    <asp:Label ID="lblGSubtotal" runat="server"></asp:Label>
    <br />
    <span><b>Shipping:</b></span>
    <asp:Label ID="lblShipping" runat="server"></asp:Label>
    <br />
    <span><b>Tax:</b></span>
    <asp:Label ID="lblTax" runat="server"></asp:Label>
    <br />
    <span><b>Total:</b></span>
    <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnAccept"  class="btn btn-outline-light" runat="server" Text="Accept" OnClick="btnUpdate_Click" />
</asp:Content>
