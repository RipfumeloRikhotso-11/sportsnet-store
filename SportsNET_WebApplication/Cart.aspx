<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SportsNET_WebApplication.Cart"  MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 35px;
        }
    </style>
</asp:Content>
    
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0" id="tblProducts">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <td class="auto-style1">Products</td>
                            <td class="auto-style1">Price</td>
                            <td class="auto-style1">Quantity</td>
                            <td class="auto-style1">Size</td>
                            <td class="auto-style1">Colour</td>
                            <td class="auto-style1">Total</td>
                            <td class="auto-style1">Remove</td>
                        </tr>
                    </thead>
                    <asp:Repeater ID="rptCartItems" runat="server" OnItemCommand="rptCartItems_ItemCommand">
                        <ItemTemplate>
                            <tr class="align-middle" id="Cartrow">
                                <td class="align-middle"><img src="<%#Eval("ImageURL") %>" alt="" style="width: 50px;"></td>
                                <td class="align-middle">R<%#Eval("Price") %></td>
                                <td class="align-middle">
                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-prepared">

                                        <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="btn btn-sm btn-minus" CommandArgument='<%# Eval("VariantID") %>'  CommandName="Decrease" style="background-color:#AEDCAE; font-weight:800" />
                                    </div> 
                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control form-control-sm bg-secondary text-center" Text='<%#Eval("Quantity") %>' ReadOnly="true" ></asp:TextBox>
                                      
                                    <div class="input-group-prepared"> 
                                        <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="btn btn-sm btn-plus" style="background-color:#AEDCAE; font-weight:800"  CommandArgument='<%#Eval("VariantID") %>' CommandName="Increase" />
                                   </div>
                                   </div>
                                </td>
                                <td class="align-middle"><%#Eval("ProductSize") %></td>
                                 <td class="align-middle"><%#Eval("Colour") %></td>
                                <td class="align-middle">R<%#Eval("Total") %></td>
                                <td class="align-middle"><asp:Button ID="btnRemove" runat="server" Text="x" CssClass="btn btn-sm" style="background-color:#AEDCAE; font-weight:800"  CommandArgument='<%#Eval("VariantID") %>' CommandName="Remove"/></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>

            <div class="col-lg-4">
               <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">
                                <asp:TextBox ID="Subtotal" runat="server" BorderStyle="None" style="min-width:50px; max-width: 200px; width:auto;" ReadOnly="true"></asp:TextBox></h6>
                        </div>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Delivery Fee</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="Delivery" runat="server" BorderStyle="None" style="min-width:50px; max-width: 200px; width:auto;" ReadOnly="true"></asp:TextBox></h6>
                        </div>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Shipping Fee</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="Shipping" runat="server" BorderStyle="None" style="min-width:50px; max-width: 200px; width:auto;" ReadOnly="true" Text="R0"></asp:TextBox></h6>
                        </div>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Discount</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="txtDiscount" runat="server" BorderStyle="None" style="min-width:50px; max-width: 200px; width:auto;" ReadOnly="true" Text="Applied at payment if eligible" TextMode="MultiLine" Rows ="2"></asp:TextBox></h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold"><asp:TextBox ID="Total" runat="server" BorderStyle="None" style="min-width:50px; max-width: 200px; width:auto;" ReadOnly="true"></asp:TextBox></h5>
                        </div>
                        <p style="font-size:small">Totals are eligible to <b>change</b> according to <b>discounts</b> that may be added at checkout.
                           <b>Final totals displayed at payment are permanent.</b>
                        </p>
                        <asp:Button ID="Checkout" runat="server" Text="Proceed To Checkout" style="background-color:#AEDCAE" CssClass="btn btn-block my-3 py-3" OnClick="Checkout_Click" />
                    </div>
                </div>
            </div>
     </div>
    </div>
    
</asp:Content>

