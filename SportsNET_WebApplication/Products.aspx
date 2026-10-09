
<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="SportsNET_WebApplication.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="header-carousel" class="carousel slide" data-ride="carousel" style="width:900px; margin:0 auto">
                    <div class="carousel-inner">
                        <div class="carousel-item active" style="height: 410px; ">
                            <img class="img-fluid" src="https://th.bing.com/th/id/R.a9d3e0a45acc78f190abdab434e772a1?rik=vD5XB3eIVKc4BQ&riu=http%3a%2f%2fenglandfootballonline.com%2fimages%2fUniforms%2fEngUnif2022APromo.jpg&ehk=RCpGegvCKBHM47CViRvIlgGPXF%2fFd%2bAG1OSx0iyTNtM%3d&risl=&pid=ImgRaw&r=0" alt="Image" style="max-width: 100%; height:fit-content; display: block; margin: 0 auto;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Latest Soccer T-Shirts</h3>
                                    <a href="Shop.aspx" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item" style="height: 410px;">
                            <img class="img-fluid" src="https://image-cdn.hypb.st/https://hypebeast.com/image/2024/06/06/jamaica-new-football-kit-release-adidas-0.jpg?fit=max&cbr=1&q=90&w=1125&h=750" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">Get Free Shipping On All Orders</h4>
                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                    <a href="Shop.aspx" class="btn btn-light py-2 px-3">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n2"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n2"></span>
                        </div>
                    </a>
                </div>
    <!-- Navbar End -->


    <!-- Featured Start-->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check m-0 mr-3" style="color:#A8D38D"></h1>
                    <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast m-0 mr-2" style="color:#A8D38D"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt m-0 mr-3" style="color:#A8D38D"></h1>
                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume m-0 mr-3" style="color:#A8D38D"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
   
    <!-- Offer Start-->
    
    <div class="container-fluid offer pt-5 ">
        <div class="row justify-content-center px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                    <img src="https://cxsports.io/wp-content/uploads/2022/10/Erling-Haaland-Manchester-City-Profile.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">Get Free Delivery on orders R 1 350 and more</h5>
                        <h1 class="mb-4 font-weight-semi-bold">T-Shirt Collection</h1>
                        <a href="Shop.aspx" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
       
     <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Support Your Favourite Teams</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
             <asp:Repeater ID="RptProducts" runat="server" OnItemDataBound="RptProducts_ItemDataBound">
             <ItemTemplate>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        <img class="img-fluid w-100" src=<%#Eval("ImageURL") %> alt="" style="object-fit: cover; width: 100%; height: 400px; ">
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3" style="min-height: 120px; display: flex; flex-direction: column; justify-content: center; text-align: center;">
                        <h6 class="mb-3"><%#Eval("ProductName") %></h6>
                        <div class="d-flex justify-content-center">
                           <h6><asp:Label ID="lblPrice" runat="server" Text="" ></asp:Label></h6>
                        </div>
                    </div>
                    <div class="card-footer d-flex justify-content-center bg-light border">
                                    <div class="d-flex align-items-center">
                               <i class="fas fa-eye mr-1" style="color:#AEDCAE;"></i>
                                   <a style="color:darkslategrey"  href='About_Page.aspx?ProductID=<%# Eval("ProductID") %>'  >
                                       View Details
                                   </a>
                            </div>
                            </div>
                </div>
            </div>
                 </ItemTemplate>
        </asp:Repeater>
            </div>
         </div>
</asp:Content>
