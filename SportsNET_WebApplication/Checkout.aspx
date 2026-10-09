<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SportsNET_WebApplication.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
        </div>
    </div>
    


    
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Recipient Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" placeholder="John" class="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Recipient Surname</label>
                            <asp:TextBox ID="txtLastName" runat="server" class="form-control" placeholder="Doe"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="example@email.com"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <asp:TextBox ID="txtNumber" runat="server" class="form-control" placeholder="+27 89 4576"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Street Address</label>
                            <asp:TextBox ID="txtStreet" runat="server" class="form-control" placeholder="123 Street"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Suburb</label>
                            <asp:TextBox ID="txtSuburb" runat="server" class="form-control" placeholder="123 Street"></asp:TextBox>
                        </div>
                        <!--Determine country through number-->
                        <div class="col-md-6 form-group">
                            <label>Country</label>
                            <asp:DropDownList ID="dpdCountry" runat="server">
                                <asp:ListItem>South Africa</asp:ListItem>
                                 <asp:ListItem>Nigeria</asp:ListItem>
                                <asp:ListItem>Botswana</asp:ListItem>
                                <asp:ListItem>Lesotho</asp:ListItem>
                                <asp:ListItem>Netherlands</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <asp:TextBox ID="txtCity" runat="server" class="form-control" placeholder="Johannessburg"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State/Province</label>
                            <asp:TextBox ID="txtProvince" runat="server" class="form-control" placeholder="Gauteng"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>ZIP/Postal Code</label>
                            <asp:TextBox ID="txtZIP" runat="server" class="form-control" placeholder="1234"></asp:TextBox>
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="custom-control custom-checkbox">
                                <asp:CheckBox ID="chShip" runat="server" ClientIDMode="Static" Text="Ship to different address" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse mb-4" id="shipping-address">
                    <h4 class="font-weight-semi-bold mb-4">Shipping Address</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <asp:TextBox ID="txtFN_Shipping" runat="server" class="form-control" placeholder="Sharon"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtLN_Shipping" runat="server" class="form-control" placeholder="Dory"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <asp:TextBox ID="txtEmail_Shipping" runat="server" class="form-control" placeholder="example@email.com"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <asp:TextBox ID="txtNumber_Shipping" runat="server" class="form-control" placeholder="+123 456 789"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Street Address</label>
                            <asp:TextBox ID="txtAddress1_Shipping" runat="server" class="form-control" placeholder="+123 456 789"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Suburb</label>
                            <asp:TextBox ID="txtAddress2_Shipping" runat="server" class="form-control" placeholder="123 Street"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Country</label>
                           <asp:DropDownList ID="dpdCountry_Shipping" runat="server">
                                <asp:ListItem>South Africa</asp:ListItem>
                                 <asp:ListItem>Nigeria</asp:ListItem>
                                <asp:ListItem>Botswana</asp:ListItem>
                                <asp:ListItem>Lesotho</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <asp:TextBox ID="txtCity_Shipping" runat="server" class="form-control" placeholder="Pretoria"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State/Province</label>
                            <asp:TextBox ID="txtProvince_Shipping" runat="server" class="form-control" placeholder="+123 456 789"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>ZIP/Postal Code</label>
                            <asp:TextBox ID="txtZIP_Shipping" runat="server" class="form-control" placeholder="1234"></asp:TextBox>
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
                            <h6 class="font-weight-medium">Delivery Fee</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="txtDelivery" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true"></asp:TextBox></h6>
                        </div>
                         <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Shipping Fee</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="shipping" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true" Text="R0"></asp:TextBox></h6>
                        </div>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Discount</h6>
                            <h6 class="font-weight-medium"><asp:TextBox ID="txtDiscount" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true"></asp:TextBox></h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold"><asp:TextBox ID="txtTotal" runat="server" BorderStyle="None" style="min-width:50px; max-width: 100px; width:auto;" ReadOnly="true"></asp:TextBox></h5>
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                                        
                    <div class="card-footer border-secondary bg-transparent">
                        <asp:Button ID="btnOrder" runat="server" Text="Place Order" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" style="background-color:#A8D38D; border-color:gray" OnClick="btnOrder_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
document.addEventListener("DOMContentLoaded", function () {
    const checkbox = document.getElementById("chShip");
    const collapseTarget = document.getElementById("shipping-address");
        checkbox.addEventListener("change", function () {
            if (checkbox.checked) {
                new bootstrap.Collapse(collapseTarget, { show: true });
                } else {
                    new bootstrap.Collapse(collapseTarget, { hide: true });
                }
            });
        });
</script>
</asp:Content>
