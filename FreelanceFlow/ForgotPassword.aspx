<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="FreelanceFlow.ForgotPassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password - FreelanceFlow</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
            width: 350px;
        }
        .inputBox {
            margin-bottom: 15px;
        }
        .inputBox label {
            display: block;
            font-weight: bold;
        }
        .inputBox input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            background: #1e3932;
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background: #162a25;
        }
        .message {
            margin-top: 15px;
            font-weight: bold;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Reset Password</h2>

            <div class="inputBox">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Enter your email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" />
            </div>

            <div class="inputBox">
                <label>New Password</label>
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" Placeholder="Enter new password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtNewPassword" ErrorMessage="Password is required" ForeColor="Red" />
            </div>

            <div class="inputBox">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Placeholder="Confirm new password"></asp:TextBox>
                <asp:CompareValidator ID="cvPassword" runat="server"
                    ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword"
                    ErrorMessage="Passwords do not match" ForeColor="Red" />
            </div>

            <asp:Button ID="btnReset" runat="server" CssClass="btn" Text="Reset Password" OnClick="btnReset_Click" />

            <div class="message">
                <asp:Label ID="lblMessage" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
