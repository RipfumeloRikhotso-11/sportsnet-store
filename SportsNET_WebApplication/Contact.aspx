<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SportsNET_WebApplication.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Contact Us</h1>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Contact For Any Queries</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                        <div class="control-group">
                            <input type="text" class="form-control" id="name" placeholder="Your Name"
                                required="required" data-validation-required-message="Please enter your name" />
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Your Email" required="required" data-validation-required-message="Please enter your email"></asp:TextBox>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <asp:TextBox ID="subject" runat="server" CssClass="form-control" placeholder="Subject" required="required" data-validation-required-message="Please enter a subject"></asp:TextBox>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                            <textarea id="message" cols="20" rows="6" CssClass="form-control" placeholder="Message" required="required" data-validation-required-message="Please enter your message" style="width: 500px;"></textarea>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div>
                            <asp:Button ID="sendMessageButton" runat="server" Text="Send Message" CssClass="btn py-2 px-4" type="submit" style="background-color:#A8D38D;"/>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-5 mb-5">
                <h5 class="font-weight-semi-bold mb-3">Get In Touch</h5>
                <p>At SportNET we make sure to accomodate and eleviate any issues and/or help needed during your shopping process.
                    We strive to make the experience as easy and comfortable as possible. All communication is welcomed and answered swiftly.
                </p>
                <div class="d-flex flex-column mb-3">
                    <h5 class="font-weight-semi-bold mb-3">Store 1</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt mr-3"></i>58 Wilber Street, Johannessburg, South Africa</p>
                    <p class="mb-2"><i class="fa fa-envelope mr-3"></i>SportsNET@net.zo.za</p>
                    <p class="mb-2"><i class="fa fa-phone-alt mr-3"></i>+012 345 67890</p>
                </div>
                <div class="d-flex flex-column">
                    <h5 class="font-weight-semi-bold mb-3">Store 2</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt mr-3"></i>725 Springbok Avenue, Pretoria, South Africa</p>
                    <p class="mb-2"><i class="fa fa-envelope mr-3"></i>SportsNET@net.zo.za</p>
                    <p class="mb-0"><i class="fa fa-phone-alt mr-3"></i>+012 785 9874</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
</asp:Content>
