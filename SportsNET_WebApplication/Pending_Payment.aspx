<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Pending_Payment.aspx.cs" Inherits="SportsNET_WebApplication.Pending_Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
  .spinner {
    color: #AEDCAE;
    border: 6px solid #f3f3f3;
    border-top: 6px solid #3498db;
    border-radius: 50%;
    width: 60px;
    height: 60px;
    animation: spin 1s linear infinite;
    margin: 20px auto;
  }
  @keyframes spin { 100% { transform: rotate(360deg); } }
</style>

<div id="payment-pending" style="text-align:center; padding:40px;">
  <h2>Processing your payment…</h2>
  <p>Please wait while we confirm your transaction.<br> Do not refresh or close this page.</p>
  <div class="spinner"></div>
   <asp:Label ID="lblPending" runat="server" style="font-weight:800" Text="Order "></asp:Label>
   <asp:Label ID="lblTotal" runat="server"  style="font-weight:800" Text="Total: R"></asp:Label>
</div>

    <script>
        var orderId = '<%= Session["OrderID"] %>';
  setTimeout(function() {
    window.location.href = "Invoice_Page.aspx?orderId=" + orderId;
  }, 5000);
</script>

</asp:Content>
