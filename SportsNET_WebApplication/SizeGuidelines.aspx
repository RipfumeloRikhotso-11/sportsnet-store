<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="SizeGuidelines.aspx.cs" Inherits="SportsNET_WebApplication.SizeGuidelines" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .size-page { padding:40px; margin-left:220px; }
        .size-box { background:#f8f9fa; padding:25px; margin-bottom:20px; border-radius:8px; }
        .size-page select { padding:8px; width:250px; }
        .btn { padding:9px 18px; border:0; cursor:pointer; background:#A8D38D; }
        .size-table { width:100%; border-collapse:collapse; margin-top:15px; }
        .size-table th,.size-table td { border:1px solid #ddd; padding:10px; }
        .size-table th { background:#A8D38D; }
        .message { display:block; margin-top:15px; font-weight:bold; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="size-page">
        <h1>Size Guidelines</h1>

        <div class="size-box">
            <h4>Find a Size Guide</h4>
            <asp:DropDownList ID="ddlSizeType" runat="server">
                <asp:ListItem Value="">-- Select product type --</asp:ListItem>
                <asp:ListItem Value="jersey">Football Jerseys</asp:ListItem>
                <asp:ListItem Value="signed">Signed Shirts</asp:ListItem>
            </asp:DropDownList>

            <br /><br />
            <asp:Button ID="btnSizeGuide" runat="server" Text="Show Size Guide"
                CssClass="btn" OnClick="btnSizeGuide_Click" />

            <asp:Label ID="lblSizeMessage" runat="server" CssClass="message"></asp:Label>

            <asp:Panel ID="pnlSizeGuide" runat="server" Visible="false">
                <table class="size-table">
                    <tr>
                        <th>Size</th>
                        <th>General Guide</th>
                    </tr>
                    <tr><td>Small (S)</td><td>Smaller fit</td></tr>
                    <tr><td>Medium (M)</td><td>Regular fit</td></tr>
                    <tr><td>Large (L)</td><td>Larger fit</td></tr>
                    <tr><td>Extra Large (XL)</td><td>Extra-large fit</td></tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
