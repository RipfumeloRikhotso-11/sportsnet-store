<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="SportsNET_WebApplication.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .info{
            margin-left:100px;
        }
        .green-button {
        background-color: #A8D38D;
        color: black;
        border: none;
        border-radius: 10px;
        padding: 10px 20px;
        cursor: pointer;
        }
        .green-button:hover {
        background-color: #92BE76;
        }
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="info">
        
        <br /><br />
        <asp:Label runat="server" Text="Generate report:"></asp:Label>
        <asp:DropDownList ID="ddlReportType" runat="server">
            <asp:ListItem Text="-Select-" Value=""></asp:ListItem>
            <asp:ListItem Text="Sales" Value="Sales"></asp:ListItem>
            <asp:ListItem Text="Orders" Value="Orders"></asp:ListItem>
            <asp:ListItem Text="Customers" Value="Customers"></asp:ListItem>
        </asp:DropDownList>
        <br /><br />

        <asp:Label runat="server" Text="From:"></asp:Label>
         <asp:TextBox  ID="txtFromWhen" runat="server" TextMode="Date" placeholder="enter date"></asp:TextBox>
        <br /><br />

        <asp:Label runat="server" Text="To:"></asp:Label>
         <asp:TextBox  ID="txtToWhen" runat="server" TextMode="Date" placeholder="enter date"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnGenerate" runat="server"
        Text="Generate Report" CssClass="green-button" OnClick="btnGenerate_Click" />
    </div>
     
    </asp:Content>