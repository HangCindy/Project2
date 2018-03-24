<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="CindyShopp.ShoppingCart" EnableEventValidation="false" %>

<asp:Content ID="ctShoppingCart" ContentPlaceHolderID="phHome" runat="server">
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
                <asp:Label ID="lbNoCart" runat="server" Font-Bold="true" Font-Size="X-Large" ForeColor="#006600" CssClass="StrongText"></asp:Label>
            </div>
            <div class="table-responsive cart_info">
                <asp:GridView ID="gvCart" CssClass="table table-condensed" GridLines="None" OnRowUpdating="gvCart_RowUpdating" ClientIDMode="Static" OnRowCancelingEdit="gvCart_RowCancelingEdit" OnRowDeleting="gvCart_RowDeleting" runat="server" AutoGenerateColumns="False" OnRowEditing="gvCart_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="Item" ItemStyle-CssClass="cart_product">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="col-sm-4 hidden-xs">
                                        <asp:Image ID="imageProduct" ImageUrl='<%# Eval("Image") %>' Width="120" Height="120"  runat="server" />
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:HiddenField ID="hdID" Value='<%# Eval("ID") %>' runat="server"/>
                                        <h4><%# Eval("Name") %></h4>
                                        <p>ID: <%# Eval("ID") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <ItemStyle CssClass="cart_product"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Price", "{0:#,###,###,###}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quatity">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtQuantity" Text='<%# Eval("Quantity") %>' min="1" TextMode="Number" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbQuantity" Text='<%# Eval("Quantity") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnUpdate" Text="<i class='fa fa-edit'></i>" OnClientClick="" CausesValidation="false" runat="server" CommandName="UpdateQuantity" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-info btn-sm" />
                                <asp:LinkButton ID="btnRemove" Text="<i class='fa fa-trash'></i>" CausesValidation="false" runat="server" CommandName="Remove" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-danger btn-sm" />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Total">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Amount", "{0:#,###,###,###}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="lbtUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </div>
        </div>
    </section>
    <!--/#cart_items-->
</asp:Content>
