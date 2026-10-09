<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Signed.aspx.cs" Inherits="SportsNET_WebApplication.Signed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Signed Shirts</h1>
        </div>
    </div>
       
     <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Our Exclusive Signed Shirts for SuperFans</span></h2>
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
