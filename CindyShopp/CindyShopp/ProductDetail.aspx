<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="CindyShopp.ProductDetail" %>

<asp:Content ID="ctProductDetail" ContentPlaceHolderID="phHome" runat="server">

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Category</h2>
                        <div class="panel-group category-products" id="accordian">
                            <!--category-productsr-->
                            <asp:Repeater ID="rptCategory" runat="server" OnItemDataBound="rptCategory_ItemDataBound">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdParentID" Value='<%# Eval("CateID") %>' runat="server" />
                                    <div class="pnCate panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordian" href="#<%# Eval("CateID") %>">
                                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                    <a href='/ListProducts.aspx?cid=<%# Eval("CateID") %>'><%# Eval("CateName") %></a>
                                                </a>
                                            </h4>
                                        </div>
                                        <div id='<%# Eval("CateID") %>' class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <ul>
                                                    <asp:Repeater ID="rptChilds" runat="server">
                                                        <ItemTemplate>
                                                            <li><a href='/ListProducts.aspx?cid=<%# Eval("CateID") %>'><%# Eval("CateName") %></li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                        <!--/category-products-->

                        <%--<div class="price-range">
                            <!--price-range-->
                            <h2>Price Range</h2>
                            <div class="well text-center">
                                <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2"><br />
                                <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                            </div>
                        </div>
                        <!--/price-range-->--%>

                        <div class="shipping text-center">
                            <!--shipping-->
                            <img src="images/home/qc.jpg" height="340" width="280" alt="" />
                        </div>
                        <!--/shipping-->

                    </div>
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="product-details">
                        <!--product-details-->
                            
                                <div class="col-sm-5">
                                    <div class="view-product">
                                        <img src="<%# Eval("ImagePath") %>" alt="" />
                                    </div>

                                </div>
                                <div class="col-sm-7">
                                    <div class="product-information">
                                        <!--/product-information-->
                                        <img src="images/product-details/new.jpg" class="newarrival" alt="" />
                                        <h2><%# Eval("ProductName") %></h2>
                                        <p><%# Eval("ProductID") %></p>
                                        <img src="images/product-details/rating.png" alt="" />
                                        <span>VND <%# Eval("UnitPrice") %></span>
                                        <p><b>Availability:</b> In Stock</p>
                                        <p><b>Introduction:</b> <%# Eval("Introduction") %></p>
                                        <asp:LinkButton ID="btnAddToCart" CommandName="Add" CommandArgument='<%# Eval("ProductID") %>' class="btn btn-default add-to-cart" Text="<i class='fa fa-shopping-cart'></i> Add to cart" runat="server" />
                                        <a href="">
                                            <img src="images/product-details/share.png" class="share img-responsive" alt="" /></a>
                                    </div>
                                    <!--/product-information-->
                                </div>
                            
                    </div>
                    <!--feature-item-->
                </div>
            </div>
        </div>
    </section>
    <!--/product-details-->
</asp:Content>
