<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="SportsNET_WebApplication.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .payment-section {
    display: none;
    margin-top: 10px;
  }

    </style>


    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Payment</h1>
        </div>
    </div>

    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">

                    <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Payment</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="creditcrd" value="Credit Card">
                                <label class="custom-control-label" for="creditcrd">Credit Card</label>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="paypal" value="PayPal">
                                <label class="custom-control-label" for="paypal">PayPal</label>
                            </div>
                        </div>

                        <div class="">
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" name="payment" id="banktransfer" value="Bank Transfer">
                                <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                            </div>
                        </div>
                    </div>
                </div>

                    <div id="CreditCardSection" class="payment-section">
                    <h4 class="font-weight-semi-bold mb-4">Your card details</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Card Holder Name</label>
                            <asp:TextBox ID="txtHolder" runat="server" placeholder="John" class="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 form-group">
                            <label>Card Number</label>
                            <asp:TextBox ID="txtCardNo" runat="server" class="form-control" ></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Expiry Date</label>
                            <asp:TextBox ID="txtExpire" runat="server" class="form-control" placeholder="26/07"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>CVC</label>
                            <asp:TextBox ID="txtCVC" runat="server" class="form-control"></asp:TextBox>
                        </div>
                    </div>
                    </div>

                    <div id="paypalSection" class="payment-section">
                    <h4 class="font-weight-semi-bold mb-4">Your paypal details</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>PayPal Email</label>
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="John" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Expiry Date</label>
                            <asp:TextBox ID="TextBox4" runat="server" class="form-control" placeholder="26/07"></asp:TextBox>
                        </div>
                    </div>
                    </div>

                    <div id="bankTransferSection" class="payment-section">
                    <h4 class="font-weight-semi-bold mb-4">Your Bank details</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Account Holder</label>
                            <asp:TextBox ID="txtAccHolder" runat="server" placeholder="John" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Your Bank</label>
                            <asp:TextBox ID="txtBank" runat="server" placeholder="John" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Account Number</label>
                            <asp:TextBox ID="txtAccountNo" runat="server" class="form-control" placeholder="26/07"></asp:TextBox>
                        </div>
                    </div>
                    </div>


                </div>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">Products</h5>
                        <div class="d-flex justify-content-between">

                            <table class="table table-sm" style="color:darkslategrey">
                                <th> Product Name</th>
                                <th> Quantity</th>
                                <th> Total</th>
                            <asp:Repeater ID="rptCartItems" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("ProductName") %></td>
                                        <td><%#Eval("Quantity") %></td>
                                        <td class="text-end">R<%# Eval("Total") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>

                        </div>
                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="txtSubtotal" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true"></asp:TextBox></h6>
                        </div>
                        
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Discount</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="txtDiscount" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true" Text="Applied at payment if eligible"></asp:TextBox></h6>
                        </div>

                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Delivery Fee</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="txtDelivery" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true"></asp:TextBox></h6>
                        </div>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Shipping Fee</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="txtShipping" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true" Text="R0"></asp:TextBox></h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold"><asp:TextBox ID="txtTotal" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true" placeholder="R10 000"></asp:TextBox></h5>
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                                        
                    <div class="card-footer border-secondary bg-transparent">
                        <asp:Button ID="btnPay" runat="server" Text="Proceed to Pay" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" style="background-color:#A8D38D; border-color:gray" OnClick="btnPay_Click"/>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

    <script>
  
  const radios = document.querySelectorAll('input[name="payment"]');
  const sections = {
    creditcrd: document.getElementById("CreditCardSection"),
    paypal: document.getElementById("paypalSection"),
    banktransfer: document.getElementById("bankTransferSection")
  };

  radios.forEach(radio => {
    radio.addEventListener("change", function() {
      
      Object.values(sections).forEach(sec => sec.style.display = "none");
      
      if (sections[this.id]) {
        sections[this.id].style.display = "block";
      }
    });
  });
</script>
</asp:Content>
