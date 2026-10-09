<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="About_Page.aspx.cs" Inherits="SportsNET_WebApplication.About_Page"  MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
.size-list label {
    margin-right: 15px; 
    margin-bottom: 5px;
    padding: 5px 15px;
    cursor: pointer;
    border:none;
}
.size-list input:checked + label {
    background: white;
    border-color: white;
}
</style>
    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                    
                            <div class="carousel-item active">
                            <asp:Image ID="imgProduct" runat="server" CssClass="w-100 h-100" alt="Image" />
                                 
                        </div>
                      
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                        <h3 class="font-weight-semi-bold">
                            <asp:TextBox ID="txtName" runat="server" BorderStyle="none" width="900px"></asp:TextBox>

                        </h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(50 Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">
                            <asp:Label ID="lblPrice" runat="server" Text="From R"></asp:Label>

                </h3>
                <p class="mb-4">
                    <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label></p>
                
                <div class="d-flex align-items-center mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
                   <asp:RadioButtonList ID="rbSize" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="size-list d-flex flex-wrap">
                       <asp:ListItem></asp:ListItem>
                </asp:RadioButtonList>
                </div>


                <div class="d-flex align-items-center mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
                            <asp:RadioButtonList ID="rbColour" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="size-list d-flex flex-wrap">
                       <asp:ListItem></asp:ListItem>
                </asp:RadioButtonList>
                </div>

                <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        
                        <div class="input-group-btn">
                           
                            <asp:Button ID="BtnMinus" runat="server" Text="-" CssClass="btn btn-sm btn-minus" style="background-color:#AEDCAE; font-weight:800" OnClick="BtnMinus_Click"/>
                       
                                </div>
                       <asp:TextBox ID="txtQty" runat="server" CssClass="form-control form-control-sm bg-secondary text-center" Text="0" ></asp:TextBox>
                        <div class="input-group-btn">
                            <asp:Button ID="BtnPlus" runat="server" Text="+" CssClass="btn btn-sm btn-plus" style="background-color:#AEDCAE; font-weight:800" OnClick="BtnPlus_Click"/>
                        </div>
                    </div>
                        <asp:Button ID="BtnCart" runat="server" Text="Add to cart" OnClick="BtnCart_Click" style="background-color:#A8D38D; color:white; border-color:#A8D38D"/>
                    </div>

                <div class="d-flex pt-2">
                    <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="https://www.facebook.com/">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="https://x.com/?lang=en-za">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="https://www.linkedin.com/login/">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="https://www.bing.com/ck/a?!&&p=2aea50ea2bdc5c37f12a1ed307385343db14a20f7d98375d95880c7aa0322c3cJmltdHM9MTc4OTUxNjgwMA&ptn=3&ver=2&hsh=4&fclid=064fb245-ab41-661c-2774-a703aad06718&psq=pinterest&u=a1aHR0cHM6Ly93d3cucGludGVyZXN0LmNvbS8">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>

                </div>

                
            </div>


        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">History Information</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews </a>
                </div>
                <div class="tab-content">


                    <div class="tab-pane fade show active" id="tab-pane-1">
                                <h4 class="mb-3">Product Description</h4>
                                
                                    <asp:TextBox ID="txtDescription" runat="server" BorderStyle="none" Width="900px" TextMode="MultiLine"  Rows ="5"></asp:TextBox> 
                       
                    </div>

                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">History Information</h4>
                        
                        <p><asp:TextBox ID="txtHistory" runat="server" BorderStyle="none" Width="900px" TextMode="MultiLine"  Rows ="5"></asp:TextBox> </p>
                        
                    </div>

                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="mb-4">1 review</h4>
                                <asp:Repeater ID="rptReview" runat="server">
                                    <ItemTemplate>
                                        <div class="media mb-4">

                                   <asp:Image ID="imgReviewer" runat="server" CssClass="img-fluid mr-3 mt-1" style="width: 45px;" />
                                    <div class="media-body">
                                        <h6><%#Eval("FirstName") %> <%#Eval("LastName") %><small> - <i><%#Eval("ReviewDate") %></i></small></h6>
                                        <div class="text-primary mb-2" imageurl="img/user.jpg">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                        <p><%#Eval("Comment") %></p>
                                    </div>
                                </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="col-md-6">
                                <h4 class="mb-4">Leave a review</h4>
                                <small>Your email address will not be published. Required fields are marked * Only logged in users can leave a review</small>
                                <div class="d-flex my-3">
                                    <p class="mb-0 mr-2">Your Rating * :</p>

                                    <asp:DropDownList ID="drdStars" runat="server">
                                        <asp:ListItem>1</asp:ListItem>
                                         <asp:ListItem>2</asp:ListItem>
                                         <asp:ListItem>3</asp:ListItem>
                                         <asp:ListItem>4</asp:ListItem>
                                         <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                               
                                    <div class="form-group">
                                        <asp:Label ID="lblmessage" runat="server"  for="message">Your Review *</asp:Label>
                                        <asp:TextBox ID="comment" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                    
                                    <div class="form-group">
                                        <asp:Label ID="lblemail" runat="server"  for="email">Your Email *</asp:Label>
                                         <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                                        
                                    </div>
                                    <div class="form-group mb-0">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit Review" OnClick="btnSubmit_Click" style="background-color:#A8D38D; color:white; border-color:#A8D38D"/>
                                        
                                    </div>
                                <asp:Label ID="lblreviewAdded" runat="server"></asp:Label>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- Shop Detail End -->


    <!-- Products Start -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                    <asp:Repeater ID="rptShow5" runat="server">
                        <ItemTemplate>
                            <div class="card product-item border-0">
                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                            <img class="img-fluid w-100" src='<%#Eval("ImageURL") %>' < alt="">
                        </div>
                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                            <h6 class="text-truncate mb-3"><%#Eval("ProductName") %></h6>
                            <div class="d-flex justify-content-center">
                                <h6><asp:Label ID="lblPrice" runat="server" Text="" ></asp:Label></h6><h6 class="text-muted ml-2"></h6>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-center bg-light border">
                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye mr-1" style="color:#A8D38D"></i>View Detail</a>
                            
                        </div>
                    </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->
</asp:Content>
