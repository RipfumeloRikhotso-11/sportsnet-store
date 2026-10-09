<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="SportsNET_WebApplication.Sales" %>
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
        div.revenue{
            margin-top:10px;
            width:400px;
            padding:20px;
            border: 3px solid #73AD21;
            border-radius:5px;
            margin-left:100px;
            font-family:'Lucida Sans';
        }
        div.revenue-graph{
            
            margin-left:100px;
            width: 600px;
            border:none;
        }
        div.sales-graph{
            margin-left:25px;
            border:none;
            width:600px;
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

    <div class="revenue">
    <h2>Revenue</h2>
    <br />
    <asp:Label ID="lblRevenue" runat="server"></asp:Label>
</div>
    <div class="graph-container">
            <div class="revenue-graph">
                <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

                <div id="myPlot1" style="width:100%;max-width:700px"></div>

                <script>
                    const dateArray = <%= datesJson %>;
                    const salesArray = <%= salesJson %>;

                    const fromDate = "<%= fromDate %>";
                    const toDate = "<%= toDate %>";

                    const revenueData = [{
                        x: dateArray,
                        y: salesArray,
                        mode: "lines"
                    }];

                    const revenueLayout = {
                        xaxis: {
                            range: [fromDate, toDate],
                            title: "Time"
                        },
                        yaxis: {
                            title: "Revenue"
                        },
                        title: "Revenue Over Time"
                    };

                    Plotly.newPlot("myPlot1", revenueData, revenueLayout);
                </script>
            </div>


            <div class="sales-graph">

                <div id="myPlot" style="width:100%;max-width:700px"></div>

                <script>
                    const quantityArray = <%= QuantitiesJson %>;
                    const productNamesArray = <%= ProductNamesJson %>;

                    const salesData = [{
                        x: quantityArray,
                        y: productNamesArray,
                        type: "bar",
                        orientation: "h",
                        marker: {
                            color: "rgba(255,0,0,0.6)"
                        }
                    }];

                    const salesLayout = {
                        title: "Sales Progress"
                    };

                    Plotly.newPlot("myPlot", salesData, salesLayout);
                </script>

            </div>
        </div>

    <br /><br />

    <h4>A table representing product sales.</h4>
    <table>
      <tr>
        <th>Product</th>
        <th>Quantity</th>
        <th>Unit Price</th>
        <th>Sales</th>
        <th>Date</th>
      </tr>
      
        <asp:Repeater ID="rptSales" runat="server">
        <ItemTemplate>
            <tr>
                <td><%# Eval("ProductName") %></td>
                <td><%# Eval("Quantity") %></td>
                <td>R<%# Eval("UnitPrice", "{0:F2}") %></td>
                <td>R<%# Eval("Sales", "{0:F2}") %></td>
                <td><%# Eval("OrderDate", "{0:yyyy/MM/dd}") %></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>

</table>
    <br /><br />
    <asp:Button ID="btnDownload" runat="server"
        Text="Download sales report" CssClass="green-button" OnClick="btnDownload_Click" />
    <br /><br />
</asp:Content>
