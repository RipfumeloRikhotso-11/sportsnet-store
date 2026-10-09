<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="registerPage.aspx.cs" Inherits="SportsNET_WebApplication.registerPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .register-container { font-family: Arial; max-width: 400px; margin: 50px auto; background-color: #ededed; border-radius: 10px; padding: 35px 40px;}
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn {  color: black; padding: 10px 20px; border: none; cursor: pointer; background-color: #A8D38D !important }
        .btn:hover { background-color: #92be76 !important}
        .link { margin-top: 15px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="register-container">
   
        <h2>Register</h2>

        <div class="form-group">
            <label>First Name</label>
            <asp:TextBox ID="myname" runat="server" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Surname</label>
            <asp:TextBox ID="mysurname" runat="server" ></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="myemail" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="forceemailentry" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="myemail" runat="server">

            </asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>Phone Number</label>
            <asp:TextBox ID="myphonenum" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="mypassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="forcepasswordentry" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="mypassword" runat="server">

            </asp:RequiredFieldValidator>
        </div>

        
        <asp:Button ID="mybutton" runat="server" Text="Create Account" CssClass="btn" OnClick="mybutton_Click" />

        <div class="link">
            Already have an account? <a href="loginPage.aspx">Login here</a>
        </div>

        <asp:Label ID="lblMessage" runat="server" Visible="false" Text="Label"></asp:Label>

        <br />
        
        </div>
</asp:Content>

