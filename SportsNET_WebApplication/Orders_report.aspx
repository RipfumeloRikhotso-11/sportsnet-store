<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Orders_report.aspx.cs" Inherits="SportsNET_WebApplication.Orders_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .graph-container {
        display: flex;
        gap: 30px;
        margin-left: 25px;
        align-items: flex-start;
        }
        div.graph{
            margin-left:100px;
            width: 600px;
            border:none;
        }
        div.pie{
            width: 500px;
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
        .status-key {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin-top: 15px;
        }

        .key-color {
            display: inline-block;
            width: 12px;
            height: 12px;
            margin-right: 5px;
        }

        .pending {
            background-color: #b91d47;
        }

        .processing {
            background-color: #00aba9;
        }

        .shipping {
            background-color: #2b5797;
        }

        .delivered {
            background-color: #1e7145;
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
    <div class="graph-container">
        <div class="graph">
            <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    
        <div id="myPlot" style="width:100%;max-width:700px"></div>

        <script>
            const xArray = <%= datesJson %>;
            const yArray = <%= numJson %>;

            const data = [{
                x: xArray,
                y: yArray,
                type: "bar",
                orientation: "v",
                marker: { color: "lightgreen" }
            }];

            const layout = {
                title: "Number of orders received per day",
                xaxis: {
                    title: "Dates"
                },
                yaxis: {
                    title: "Number of orders"
                }
            };

            Plotly.newPlot("myPlot", data, layout);
        </script>
        </div>
        
        <div class="pie">

            <script src="https://cdn.jsdelivr.net/npm/chart.js@4.5.0"></script>
            
            
            <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
            <div class="status-key">
                <div><span class="key-color pending"></span> Pending</div>
                <div><span class="key-color processing"></span> Processing</div>
                <div><span class="key-color shipping"></span> Shipping</div>
                <div><span class="key-color delivered"></span> Delivered</div>
            </div>
        <script>
            
            const xValues = <%= statusJson %>;
            const yValues = <%= numJson %>;
            const statusColors = {
                "Pending": "#b91d47",
                "Processing": "#00aba9",
                "Shipping": "#2b5797",
                "Delivered": "#1e7145"
            };

            const pieColors = xValues.map(status => statusColors[status]);

            const ctx = document.getElementById('myChart');

            new Chart(ctx, {
                type: "pie",
                data: {
                    labels: xValues,
                    datasets: [{
                        backgroundColor: pieColors,
                        data: yValues
                    }]
                },
                options: {
                    radius:'70%' ,
                    plugins: {
                        legend: { display: false },
                        title: {
                            display: true,
                            text: "Current orders' statuses",
                            font: { size: 16 }
                        }
                    }
                }
            });
        </script>

        </div>
    

    </div>
    <br /><br />
    <h4>A table representing recent orders received and their statuses</h4>

    <table>
      <tr>
        <th>Order ID</th>
        <th>Customer</th>
        <th>Order date</th>
        <th>Status</th>
      </tr>
      
        <asp:Repeater ID="rptOrders" runat="server">
        <ItemTemplate>
            <tr>
                <td><%# Eval("OrderID") %></td>
                <td><%# Eval("Username") %></td>
                <td><%# Eval("OrderDate") %></td>
                <td><%# Eval("OrderStatus") %></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
        </table>
    
    <br /><br />
    <asp:Button ID="btnDownload" runat="server"
        Text="Download orders report" CssClass="green-button" OnClick="btnDownload_Click" />
    <br /><br />
</asp:Content>
