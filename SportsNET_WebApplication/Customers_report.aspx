<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Customers_report.aspx.cs" Inherits="SportsNET_WebApplication.Customers_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>

        div.users{
            margin-top:10px;
            width:400px;
            padding:20px;
            border: 3px solid #73AD21;
            border-radius:5px;
            margin-left:100px;
            font-family:'Lucida Sans';
        }
         div.graph{
            margin-left:100px;
            width: 600px;
            border:none;
        }
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

    </style>

    <div class="users">
        <h2>Total customers</h2>
        <br />
        <asp:Label ID="lblUsers" runat="server" Text=""></asp:Label>
    </div>

    
        <div class="graph">
            <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    
        <div id="myPlot" style="width:100%;max-width:700px"></div>

        <script>
            const xArray = <%= loggedJson %>;
            const yArray = <%= numLoggedJson %>;

            const data = [{
                x: xArray,
                y: yArray,
                type: "bar",
                orientation: "v",
                marker: { color: "lightgreen" }
            }];

            const layout = {
                title: "Number of customers logged in",
                xaxis: {
                    title: "Date"
                },
                yaxis: {
                    title: "Number of customers"
                }
            };

            Plotly.newPlot("myPlot", data, layout);
        </script>
        </div>

    <h4>A table representing the number of customers logged in</h4>
    <table>
      <tr>
        <th>Customer</th>
        <th>Email</th>
        <th>Logged In</th>
        <th>Logged out</th>
      </tr>
      
        <asp:Repeater ID="rptCustomers" runat="server">
        <ItemTemplate>
            <tr>
                <td><%# Eval("Username") %></td>
                <td><%# Eval("Email") %></td>
                <td><%# Eval("LoggedIn") %></td>
                
            </tr>
        </ItemTemplate>
    </asp:Repeater>
        </table>
</asp:Content>
