<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderManagement.aspx.cs" Inherits="SportsNET_WebApplication.OrderManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .orderStatus {
            width: 90%;
            margin: 30px auto;
            padding:20px;
        }

        /* Filter buttons */
        .filterButtons {
            display: flex;
            justify-content: center;
            gap: 35px;
            margin-bottom: 35px;
        }

        .filterButtons button {
            width: 180px;
            padding: 14px;
            background-color: limegreen;
            border: 2px solid black;
            border-radius: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .filterButtons button:hover {
            background-color: #A8D38D;
        }

        /* Orders table */
        table {
          margin-left:10px;
          margin-right:10px;
          font-family: Arial, Helvetica, sans-serif;
          border-collapse: collapse;
          width: 100%;
        }

        td, th {
          border: 1px solid #ddd;
          padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2;}

        tr:hover {background-color: #ddd;}

        th {
          padding-top: 12px;
          padding-bottom: 12px;
          text-align: left;
          background-color: #04AA6D;
          color: white;
        }

        /* Buttons on the right */
        .orderActions {
            width: 180px;
            margin-left: 20px;
            padding:20px;
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
        .orderContent {
            display: flex;
            align-items: flex-start;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="orderStatus">

        <!-- FILTER BUTTONS -->
        <div class="filterButtons">

            <asp:Button ID="btnAll" runat="server" Text="All" CssClass="green-button" OnClick="btnAll_Click" />

            <asp:Button ID="btnPending" runat="server" Text="Pending" CssClass="green-button" OnClick="btnPending_Click" />

            <asp:Button ID="btnProcessing" runat="server" Text="Processing" CssClass="green-button" OnClick="btnProcessing_Click" />

            <asp:Button ID="btnShipping" runat="server" Text="Shipping" CssClass="green-button" OnClick="btnShipping_Click" />

            <asp:Button ID="btnDelivered" runat="server" Text="Delivered" CssClass="green-button" OnClick="btnDelivered_Click" />

        </div>


        <!-- TABLE + ACTION BUTTONS -->
        <div class="orderContent">

            <table>
      <tr>
        <th>Order ID</th>
        <th>Customer</th>
        <th>Order date</th>
        <th>Status</th>
          <th>Update</th>
      </tr>
      
        
        <asp:Repeater ID="rptOrders" runat="server">
            <ItemTemplate>
             <tr>
                <td><%# Eval("OrderID") %></td>
                <td><%# Eval("Username") %></td>
                <td><%# Eval("OrderDate") %></td>
                <td><asp:Label ID="lblStatus" runat="server"
                        Text='<%# Eval("OrderStatus") %>'>
                    </asp:Label></td>
                 <td>

                <asp:DropDownList ID="ddlStatus" runat="server" Visible="true">
                    <asp:ListItem Text="Change" Value=""> </asp:ListItem>
                    <asp:ListItem Text="Pending" Value="Pending"> </asp:ListItem>
                    <asp:ListItem Text="Processing" Value="Processing"> </asp:ListItem>
                    <asp:ListItem Text="Shipping" Value="Shipping"></asp:ListItem>
                    <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnEdit" runat="server"
                    Text="Edit" CssClass="green-button"
                    CommandArgument='<%# Eval("OrderID") %>'
                    OnClick="btnEdit_Click" />

            </td>
            </tr>
            </ItemTemplate>
        </asp:Repeater>
        </table >


            <!-- ACTION BUTTONS -->
            <div class="orderActions">

                <br /><br />

            </div>

        </div>

    </div>

</asp:Content>
