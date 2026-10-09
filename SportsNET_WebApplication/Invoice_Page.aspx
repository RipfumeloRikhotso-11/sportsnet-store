<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Invoice_Page.aspx.cs" Inherits="SportsNET_WebApplication.Invoice_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    .invoice-card {
        width: 900px;
        margin: 30px auto;
        background-color: #f9f9f9;
        border: 2px solid grey;
        padding: 20px;
    }

    .invoice-header {
        background-color: #A8D38D;
        color: white;
        padding: 10px;
        text-align: center;
    }

    .invoice-header h1 {
        margin: 0;
        font-size: 24px;
    }

    .title-invoice {
        color: black;
        font-weight: bold;
        text-align: left;
        text-decoration: none !important;
    }

    .info-box {
        background-color: #A8D38D;
        border: 1px solid gray;
        padding: 10px;
        margin-top: 10px;
        text-align: left;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #f0f0f0;
        font-weight: bold;
    }

</style>


    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Invoices</h1>
        </div>
    </div>

    <asp:Repeater ID="rptInvoices" runat="server">
        <ItemTemplate>
            <div class="invoice-card">
                <div class="invoice-header">
                    <h1>Invoice <%# Eval("InvoiceID") %></h1>
                    <p>Date: <%# Eval("InvoiceDate") %></p>
                </div>
            
                <div class="title-invoice" >Billing Information</div>
                  <div class="info-box">
                    <%# Eval("BillingAddress") %>
                 </div>

                 <div class="title-invoice" >Shipping Information</div>
                <div class="info-box">
                    <%# Eval("ShippingAddress") %>
                </div>
                     <div class="title-invoice" >Order Summary</div>
                          <table>
                            <tr><th>Item</th><th>Qty</th><th>Price</th><th>Total</th></tr>
                            <asp:Repeater ID="rptItems" runat="server" DataSource='<%# Eval("Items") %>'>
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("ProductName") %></td>
                                        <td><%# Eval("Quantity") %></td>
                                        <td>R <%# Eval("Price") %></td>
                                        <td>R <%# Eval("Total") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
         
                          <div class="title-invoice" >Payment Details</div>
                            <div class="info-box">
                                <p>Delivery: R <%# Eval("Delivery") %></p>
                                <p>Discount: R <%#Eval("Discount") %></p>
                                <p>Shipping Fee: R <%#Eval("ShippingFee") %></p>
                                <p><strong>Grand Total: R <%# Eval("TotalAmount") %></strong></p>
                                <p>Method: <%# Eval("PaymentMethod") %><br /> Status: <%#Eval("Status") %><br /> Transaction Ref: <%# Eval("TransactionReference") %></p>
                            </div>
          
        </div>
        </ItemTemplate>
    </asp:Repeater>
    

</asp:Content>
