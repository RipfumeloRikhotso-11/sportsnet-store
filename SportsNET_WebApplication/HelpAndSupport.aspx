<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="HelpAndSupport.aspx.cs" Inherits="SportsNET_WebApplication.HelpAndSupport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .support-page { padding:40px; margin-left:220px; }
        .support-box { background:#f8f9fa; padding:25px; margin-bottom:20px; border-radius:8px; }
        .support-page select, .support-page input { padding:8px; margin:8px 0; }
        .support-page .btn { padding:9px 18px; border:0; cursor:pointer; background:#A8D38D; }
        .message { display:block; margin-top:15px; font-weight:bold; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="support-page">
        <h1>Help and Support</h1>

        <div class="support-box">
            <h4>What do you need help with?</h4>

            <asp:DropDownList ID="ddlHelpTopic" runat="server">
                <asp:ListItem Value="">-- Select a topic --</asp:ListItem>
                <asp:ListItem Value="order">Orders</asp:ListItem>
                <asp:ListItem Value="exchange">Exchanges</asp:ListItem>
                <asp:ListItem Value="size">Sizes</asp:ListItem>
                <asp:ListItem Value="delivery">Delivery</asp:ListItem>
                <asp:ListItem Value="contact">Contact Us</asp:ListItem>
            </asp:DropDownList>

            <br />
            <asp:Button ID="btnGetHelp" runat="server" Text="Get Help"
                CssClass="btn" OnClick="btnGetHelp_Click" />

            <asp:Label ID="lblHelp" runat="server" CssClass="message"></asp:Label>
        </div>
    </div>
</asp:Content>
