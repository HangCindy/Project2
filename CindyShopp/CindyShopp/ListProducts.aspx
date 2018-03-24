<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ListProducts.aspx.cs" Inherits="CindyShopp.ListProducts" %>
<asp:Content ID="ctListProducts" ContentPlaceHolderID="phHome" runat="server">
    <section id="slider">
        <!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-6">
                                    <h1><span>CINDY</span>-SHOPP</h1>
                                    <h2>Come to Cindy and make decision</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/home/s9.jpg" height="380" width="450" class="girl img-responsive" alt="" />
                                    <img src="images/home/sale20.png" height="100" width="100" class="pricing" alt="" />
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>CINDY</span>-SHOPP</h1>
                                    <h2>Come to Cindy and make decision</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/home/IX.jpg" height="380" width="450" class="girl img-responsive" alt="" />
                                    <img src="images/home/sale20.png" height="100" width="100" class="pricing" alt="" />
                                </div>
                            </div>

                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>CINDY</span>-SHOPP</h1>
                                    <h2>Come to Cindy and make decision</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/home/op5.jpg" height="380" width="450" class="girl img-responsive" alt="" />
                                    <img src="images/home/sale20.png" height="100" width="100" class="pricing" alt="" />
                                </div>
                            </div>

                        </div>

                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--/slider-->

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
                    <div class="features_items">
                        <!--features_items-->
                        <h2 class="title text-center">Features Items</h2>
                        <asp:Repeater ID="rptFeatureProducts" runat="server" OnItemCommand="rptFeatureProducts_ItemCommand">
                            <ItemTemplate>
                                <div class="col-sm-4">
                                    <div class="product-image-wrapper">
                                        <div class="single-products">
                                            <div class="productinfo text-center">
                                                <a href='/ProductDetail.aspx?pid=<%# Eval("ProductID") %>'>
                                                    <img src="<%# Eval("ImagePath") %>" alt="" /> 
                                                </a>
                                                <h2>
                                                    <font color="black" size="3"> <%# Eval("ProductName") %> </font>
                                                </h2>
                                                <h2>$<%# Eval("UnitPrice") %></h2>
                                                <p><%# Eval("Information") %></p>
                                                <asp:LinkButton ID="btnAddToCart" CommandName="Add" CommandArgument='<%# Eval("ProductID") %>' class="btn btn-default add-to-cart" Text="<i class='fa fa-shopping-cart'></i> Add to cart" runat="server" />
                                            </div>
                                        </div>
                                        <div class="choose">
                                            <ul class="nav nav-pills nav-justified">
                                                <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                                <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                    <!--feature-item-->
                </div>
            </div>
        </div>
    </section>
</asp:Content>
