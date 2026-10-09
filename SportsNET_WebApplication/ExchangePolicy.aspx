<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="ExchangePolicy.aspx.cs" Inherits="SportsNET_WebApplication.ExchangePolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .exchange-page { padding:40px; margin-left:220px; }
        .exchange-box { background:#f8f9fa; padding:25px; margin-bottom:20px; border-radius:8px; }
        .exchange-page input, .exchange-page select { padding:8px; width:300px; margin:6px 0; }
        .btn { padding:9px 18px; border:0; cursor:pointer; background:#A8D38D; }
        .error { color:red; display:block; }
        .success { color:green; display:block; font-weight:bold; }
    </style>
    <div class="exchange-page">
        <h1>Exchange Policy</h1>

        <div class="exchange-box">
            <h4>Exchange Request</h4>
            <p>Complete the form below to submit an exchange request.</p>

            <asp:Label ID="lblOrder" runat="server" Text="Order Number"></asp:Label><br />
            <asp:TextBox ID="txtOrderNumber" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvOrder" runat="server"
                ControlToValidate="txtOrderNumber" ErrorMessage="Order number is required."
                CssClass="error" Display="Dynamic" />

            <br />
            <asp:Label ID="lblReason" runat="server" Text="Reason"></asp:Label><br />
            <asp:DropDownList ID="ddlReason" runat="server">
                <asp:ListItem Value="">-- Select a reason --</asp:ListItem>
                <asp:ListItem>Wrong size</asp:ListItem>
                <asp:ListItem>Wrong item received</asp:ListItem>
                <asp:ListItem>Item damaged</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
            </asp:DropDownList>

            <br />
            <asp:RequiredFieldValidator ID="rfvReason" runat="server"
                ControlToValidate="ddlReason" InitialValue=""
                ErrorMessage="Please select a reason." CssClass="error" Display="Dynamic" />

            <br />
            <asp:CheckBox ID="chkCondition" runat="server"
                Text=" I confirm that the item is unused and in its original condition." />

            <br /><br />
            <asp:Button ID="btnExchange" runat="server" Text="Submit Exchange Request"
                CssClass="btn" OnClick="btnExchange_Click" />

            <asp:Label ID="lblExchangeResult" runat="server"></asp:Label>
        </div>

        <div class="exchange-box">
            <h4>Exchange Conditions</h4>
            <ul>
                <li>Keep your proof of purchase.</li>
                <li>The item should be unused and in its original condition.</li>
                <li>Contact SportsNET before returning the item.</li>
            </ul>
        </div>
    </div>
</asp:Content>
