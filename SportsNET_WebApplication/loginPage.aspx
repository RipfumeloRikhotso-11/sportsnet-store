<%@ Page Title="" Language="C#" MasterPageFile="~/Customer_Master.Master" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="SportsNET_WebApplication.loginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .login-container { font-family: Arial; max-width: 400px; margin: 50px auto; background-color: #ededed; border-radius: 10px; padding: 35px 40px;}
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; }
        input { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { color: black; padding: 10px 20px; border: none; cursor: pointer; background-color: #A8D38D !important}
        .btn:hover { background-color: #92be76 !important}
        .link { margin-top: 15px; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="login-container">
    <h2>Login</h2>

        <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="myemail" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="forceemailentry" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="myemail" runat="server">

            </asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>Password</label>
             <asp:TextBox ID="mypassword" runat="server" TextMode="Password"></asp:TextBox>

            <asp:RequiredFieldValidator ID="forcepasswordentry" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="mypassword" runat="server">

            </asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>User Type</label>
            <asp:DropDownList ID="ddlUserType" runat="server">
            <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
            <asp:ListItem Text="Administrator" Value="Administrator"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:Button ID="loginbtn" runat="server" Text="Login" CssClass="btn" OnClick="loginbtn_Click" />

        <div class="link">
            Don't have an account? <a href="registerPage.aspx">Register here</a>
        </div>

        <asp:Label ID="loginMessage" runat="server" Visible="false" ForeColor="Red" Text="Label"></asp:Label>

        <br />
        </div>
</asp:Content>
