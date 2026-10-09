<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="SportsNET_WebApplication.EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .form-card{
            background-color: #ededed;
            max-width: 600px;
            margin: 40px auto;
            padding: 40px 45px;
            border-radius: 12px;
        }
        .form-card h1{
            font-size: 38px;
            font-weight: 500;
            color: #222222;
            margin-bottom: 25px;
            margin-top: 0;
            text-align: center;
        }
        .form-group{
            margin-bottom: 20px;
        }
        .form-card label{
            display: block;
            font-size: 16px;
            color: #555555;
            margin-bottom: 8px;
            font-weight: 400;
        }
        .form-control-custom{
            width: 100%;
            padding: 10px 12px;
            background-color: #ffffff;
            border-radius: 8px;
            font-size: 15px;
            color: #333333;
            box-sizing: border-box;
            border: 1px solid #777777;
        }
        .form-control-custom:focus{
            outline: none;
            border-color: #7ab730;
        }
        .btn-submit{
            background-color: #A8D38D;
            color: #222222;
            font-size: 18px;
            font-weight: bold;
            padding: 12px 0;
            border: none;
            border-radius: 8px;
            width: 100%;
            margin-top: 10px;
        }
        .btn-submit:hover {
            background-color: #92cb92;
        }

        .status-message {
            font-weight: bold;
            font-size: 15px;
            margin-bottom: 15px;
            display: block;
        }
        .ddl-custom{
            width: 320px;
            height: 40px;
            padding: 6px 32px 6px 16px;
            background-color: #ffffff;
            border-radius: 8px; 
            font-size: 15px;
            font-weight: 600;
            color: #333333;
            text-align: center;
            padding-right: 35px;
            box-sizing: border-box;
            cursor: pointer;
        }
        .ddl-custom:focus {
                outline: none;
                border-color: #7ab730;
         }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-card">
        <h1>EDIT PRODUCT</h1>
        <asp:Label ID="lblMessage" runat="server" CssClass="status-message" Text="Label" Visible="false" ></asp:Label>

        <div class="form-group">
            <label>Product Name:</label>
            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control-custom"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control-custom"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Brand:</label>
            <asp:TextBox ID="txtBrand" runat="server" CssClass="form-control-custom"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Category:</label>
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="ddl-custom"></asp:DropDownList>
        </div>
        
        <div class="form-group">
            <label>Supplier:</label>
                <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="ddl-custom"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Image URL:</label>
            <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control-custom"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>History:</label>
            <asp:TextBox ID="txtHistory" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control-custom"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Colour:</label>
            <asp:TextBox ID="txtColour" runat="server" CssClass="form-control-custom"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:CheckBox ID="chkIsSigned" runat="server" Text=" Signed Jersey"/>
        </div>

        <div class="form-group">
            <label>Size:</label>
            <asp:DropDownList ID="ddlSize" runat="server" CssClass="ddl-custom" AutoPostBack="true" OnSelectedIndexChange="ddlSize_SelectedIndexChanged"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Price:</label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control-custom"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Stock Quantity:</label>
            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control-custom"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnEditProduct" runat="server" Text="Save Changes" CssClass="btn-submit" OnClick="btnEditProduct_Click"/>
        </div>

        <div class="form-group">
            <asp:Button ID="btnDeleteProduct" runat="server" Text="Delete Product" CssClass="btn-submit" OnClick="btnDeleteProduct_Click"/>
        </div>
    </div>
</asp:Content>
