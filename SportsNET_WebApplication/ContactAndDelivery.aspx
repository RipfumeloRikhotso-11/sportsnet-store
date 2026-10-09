<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="ContactAndDelivery.aspx.cs" Inherits="SportsNET_WebApplication.ContactAndDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .contact-delivery-page { padding:40px; margin-left:220px; }
        .contact-delivery-box { background:#f8f9fa; padding:25px; margin-bottom:20px; border-radius:8px; }
        .contact-delivery-page input, .contact-delivery-page textarea { padding:8px; width:350px; margin:6px 0; }
        .contact-delivery-page select { padding:8px; width:300px; }
        .btn { padding:9px 18px; border:0; cursor:pointer; background:#A8D38D; }
        .error { color:red; display:block; }
        .success { color:green; display:block; font-weight:bold; }
        .message { display:block; margin-top:15px; font-weight:bold; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-delivery-page">
        <h1>Contact and Delivery Details</h1>

        <div class="contact-delivery-box">
            <h4>Contact Us</h4>

            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label><br />
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server"
                ControlToValidate="txtName" ErrorMessage="Name is required."
                CssClass="error" Display="Dynamic" />

            <br />
            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label><br />
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                ControlToValidate="txtEmail" ErrorMessage="Email is required."
                CssClass="error" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                ControlToValidate="txtEmail"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                ErrorMessage="Enter a valid email address."
                CssClass="error" Display="Dynamic" />

            <br />
            <asp:Label ID="lblSubject" runat="server" Text="Subject"></asp:Label><br />
            <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvSubject" runat="server"
                ControlToValidate="txtSubject" ErrorMessage="Subject is required."
                CssClass="error" Display="Dynamic" />

            <br />
            <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label><br />
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="6"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMessage" runat="server"
                ControlToValidate="txtMessage" ErrorMessage="Message is required."
                CssClass="error" Display="Dynamic" />

            <br /><br />
            <asp:Button ID="btnSend" runat="server" Text="Send Message"
                CssClass="btn" OnClick="btnSend_Click" />

            <asp:Label ID="lblResult" runat="server"></asp:Label>
        </div>

        <div class="contact-delivery-box">
            <h4>Delivery Information</h4>

            <p>Select your delivery option:</p>

            <asp:DropDownList ID="ddlDelivery" runat="server">
                <asp:ListItem Value="">-- Select delivery option --</asp:ListItem>
                <asp:ListItem Value="standard">Standard Delivery</asp:ListItem>
                <asp:ListItem Value="express">Express Delivery</asp:ListItem>
                <asp:ListItem Value="collection">Collection</asp:ListItem>
            </asp:DropDownList>

            <br /><br />
            <asp:Button ID="btnDelivery" runat="server" Text="Show Delivery Information"
                CssClass="btn" OnClick="btnDelivery_Click" />

            <asp:Label ID="lblDelivery" runat="server" CssClass="message"></asp:Label>
        </div>

        <div class="contact-delivery-box">
            <h4>Delivery Conditions</h4>
            <ul>
                <li>Customers must provide accurate delivery and contact details.</li>
                <li>Delivery times may vary depending on location and availability.</li>
                <li>Customers should check their order details before confirming a purchase.</li>
                <li>Delivery problems should be reported to SportsNET support as soon as possible.</li>
            </ul>

            <asp:CheckBox ID="chkConditions" runat="server"
                Text=" I have read and understand the delivery conditions." />

            <br /><br />
            <asp:Button ID="btnAccept" runat="server" Text="Accept Conditions"
                CssClass="btn" OnClick="btnAccept_Click" />

            <asp:Label ID="lblConditions" runat="server" CssClass="message"></asp:Label>
        </div>
    </div>
</asp:Content>
