<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="TermsAndConditions.aspx.cs" Inherits="SportsNET_WebApplication.TermsAndConditions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .terms-page { padding:40px; margin-left:220px; }
        .terms-box { background:#f8f9fa; padding:25px; margin-bottom:20px; border-radius:8px; }
        .terms-box h3 { margin-top:20px; }
        .terms-box h3:first-child { margin-top:0; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="terms-page">
        <h1>Terms and Conditions</h1>

        <div class="terms-box">
            <h3>Website Use</h3>
            <p>Users must provide accurate information and must not misuse the website, interfere with its operation, or use it for unlawful purposes.</p>

            <h3>Products and Orders</h3>
            <p>Product descriptions, images, prices and availability are presented in good faith but may change. An order is subject to availability and successful processing.</p>

            <h3>Delivery Fee</h3>
            <p>Free delivery applies to orders when the final payable amount after discounts is R1 350</p>

            <h3>Payments</h3>
            <p>Customers are responsible for providing accurate billing and payment information. Orders may be subject to verification.</p>

            <h3>Delivery</h3>
            <p>Delivery is subject to the destination, courier availability and the delivery information supplied by the customer. Delays outside SportsNET's reasonable control may occur.</p>

            <h3>Exchanges</h3>
            <p>Exchanges are handled in accordance with the SportsNET Exchange Policy and applicable consumer-protection requirements.</p>

            <h3>Intellectual Property</h3>
            <p>Website content, branding, graphics and other materials may not be reproduced or used without appropriate permission.</p>

            <h3>Changes to These Terms</h3>
            <p>SportsNET may update these terms when necessary. The current version published on the website will apply to future use and orders, subject to applicable law.</p>

            <h3>Contact</h3>
            <p>Questions about these terms can be sent to <a href="mailto:sportsNet@business.co.za">sportsNet@business.co.za</a>.</p>
        </div>
    </div>
</asp:Content>
