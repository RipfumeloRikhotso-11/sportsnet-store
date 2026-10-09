<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="SportsNET_WebApplication.Shop" MaintainScrollPositionOnPostback="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
.overridecustom-checkbox {
    margin:0;
    display: inline-flex;
    align-items: center;   
    cursor: pointer;
}

.overridecustom-checkbox input[type="checkbox"] {
     
    margin-left:0;
    background-color:darkseagreen;
    width: 18px;          
    height: 18px;          
    margin-right: 8px;     
}

.overridecustom-checkbox label {
    margin: 0;             
    font-size: 16px;       
    line-height: 18px;   
}
    </style>

    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by price(in Rands)</h5>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                             <asp:CheckBox ID="chRange1" runat="server" Text="0-1400" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chRange1_CheckedChanged"/>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                             <asp:CheckBox ID="chRange2" runat="server" Text="1400-2800" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chRange2_CheckedChanged"/>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                             <asp:CheckBox ID="chRange3" runat="server" Text="2800-4200" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chRange3_CheckedChanged"/>
                        </div>
                    </>
                </div>
                <!-- Price End -->
                
                 
                <div class="border-bottom mb-4 pb-6">
                    <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="chAll" runat="server" Text="All" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chAll_CheckedChanged"/>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="chkB" runat="server" Text="Black" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chkB_CheckedChanged"/>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="chkR" runat="server" Text="Red" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chkR_CheckedChanged"/>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="chkW" runat="server" Text="White" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chkW_CheckedChanged"/>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <asp:CheckBox ID="chkBl" runat="server" Text="Blue" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chkBl_CheckedChanged"/>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3"">
                            <asp:CheckBox ID="chkG" runat="server" Text="Green" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chkG_CheckedChanged"/>
                        </div>
                       <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3"">
                            <asp:CheckBox ID="chkY" runat="server" Text="Yellow" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chkY_CheckedChanged"/>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3"">
                            <asp:CheckBox ID="chkGr" runat="server" Text="Grey" CssClass="overridecustom-checkbox" AutoPostBack="true" OnCheckedChanged="chkGr_CheckedChanged"/>
                        </div>
                </div>               
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search by name">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                    </div>
                                </div>
                            
                            <div class="dropdown ml-4">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                            Sort by
                                        </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <asp:LinkButton ID="AtoZ" runat="server" CssClass="dropdown-item" CommandArgument="AZ" OnCommand="AtoZ_Command">A - Z</asp:LinkButton>
                                     <asp:LinkButton ID="ZtoA" runat="server" CssClass="dropdown-item" CommandArgument="ZA" OnCommand="ZtoA_Command">Z - A</asp:LinkButton>
                                    
                                </div>
                            </div>
                        </div>
                    </div>

                    <asp:Repeater ID="Rpt1" runat="server" OnItemDataBound="Rpt1_ItemDataBound">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src=<%#Eval("ImageURL") %> alt="" style="object-fit: cover; width: 100%; height: 400px;">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3" style="min-height: 120px; display: flex; flex-direction: column; justify-content: center; text-align: center;">
                                <h6 class="mb-3"><%#Eval("ProductName") %></h6>
                                <div class="d-flex justify-content-center">
                                    <h6><asp:Label ID="lblPrice" runat="server" Text="" ></asp:Label></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-center bg-light border">
                                    <div class="d-flex align-items-center">
                               <i class="fas fa-eye mr-1" style="color:#AEDCAE;"></i>
                                   <a style="color:darkslategrey"  href='About_Page.aspx?ProductID=<%# Eval("ProductID") %>'  >
                                       View Details
                                   </a>
                            </div>
                            </div>
                        </div>
                    </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    
                    
                    <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center mb-3">
                            <li class="page-item disabled">

                              <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                              </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                              <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                              </a>
                            </li>
                          </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->
</asp:Content>
