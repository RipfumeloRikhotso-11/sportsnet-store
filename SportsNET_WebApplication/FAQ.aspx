<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="SportsNET_WebApplication.FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .faq-page { padding:40px; margin-left:220px; }
        .faq-box { background:#f8f9fa; padding:20px; margin-bottom:12px; border-radius:8px; }
        .faq-button { padding:10px; width:100%; text-align:left; border:0; background:#A8D38D; cursor:pointer; font-weight:bold; }
        .answer { padding:15px; background:white; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Frequently Asked Questions</h1>

        <div class="faq-box">
            <asp:Button ID="btnFAQ1" runat="server" Text="How do I place an order?"
                CssClass="faq-button" OnClick="btnFAQ1_Click" />
            <asp:Panel ID="pnlFAQ1" runat="server" Visible="false" CssClass="answer">
                Browse the products, choose the required options, add the item to your cart and continue to checkout.
            </asp:Panel>
        </div>

        <div class="faq-box">
            <asp:Button ID="btnFAQ2" runat="server" Text="Can I exchange an item?"
                CssClass="faq-button" OnClick="btnFAQ2_Click" />
            <asp:Panel ID="pnlFAQ2" runat="server" Visible="false" CssClass="answer">
                Yes. Please complete the exchange request on the Exchange Policy page and follow the exchange conditions.
            </asp:Panel>
        </div>

        <div class="faq-box">
            <asp:Button ID="btnFAQ3" runat="server" Text="How do I choose the correct size?"
                CssClass="faq-button" OnClick="btnFAQ3_Click" />
            <asp:Panel ID="pnlFAQ3" runat="server" Visible="false" CssClass="answer">
                Use the Size Guidelines page and check the information provided for the specific product.
            </asp:Panel>
        </div>

        <div class="faq-box">
            <asp:Button ID="btnFAQ4" runat="server" Text="How can I contact SportsNET?"
                CssClass="faq-button" OnClick="btnFAQ4_Click" />
            <asp:Panel ID="pnlFAQ4" runat="server" Visible="false" CssClass="answer">
                Use the Contact page to submit an enquiry.
            </asp:Panel>
        </div>

        <div class="faq-box">
            <asp:Button ID="btnFAQ5" runat="server" Text="How does delivery work?"
                CssClass="faq-button" OnClick="btnFAQ5_Click" />
            <asp:Panel ID="pnlFAQ5" runat="server" Visible="false" CssClass="answer">
                Delivery depends on the selected delivery option, location and product availability.
            </asp:Panel>
        </div>
    </div>
</asp:Content>
