<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FreelanceFlow.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FreelanceFlow - Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #ffffff;
            color: #333;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 32px;
            border-bottom: 1px solid #ddd;
        }

        .nav-right {
            display: flex;
            gap: 10px;
        }

        .asp-button {
            background-color: black;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        .asp-button:hover {
            background-color: #333;
        }

        .login-container {
            max-width: 450px;
            margin: 60px auto;
            padding: 40px;
            background-color: #f9f9f9;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #1e3932;
            margin-bottom: 20px;
            font-size: 28px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #1e3932;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .btn-login {
            background-color: #1e3932;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 20px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        .btn-login:hover {
            background-color: #162a25;
        }

        .extra-links {
            margin-top: 20px;
            font-size: 14px;
        }

        .extra-links a {
            color: #0056b3;
            text-decoration: none;
        }

        .extra-links a:hover {
            text-decoration: underline;
        }

        .advert-section {
            background-color: #1e3932;
            color: white;
            overflow: hidden;
            padding: 12px 0;
            margin-top: 40px;
            text-align: center;
        }

        .scrolling-text {
            animation: scroll-left 20s linear infinite;
            white-space: nowrap;
            font-weight: bold;
            font-size: 16px;
        }

        @keyframes scroll-left {
            0% {
                transform: translateX(0%);
            }
            100% {
                transform: translateX(-100%);
            }
        }

        @media (max-width: 500px) {
            .login-container {
                padding: 30px 20px;
                margin: 40px 16px;
            }
            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- NAVIGATION -->
        <header>
            <h2 style="color:#1e3932;">FreelanceFlow</h2>
        </header>

        <!-- LOGIN FORM -->
        <div class="login-container">
            <h1>Welcome Back</h1>
            <p style="color: #555;">Log in to access your projects and clients.</p>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" 
                             type="text" TabIndex="1"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter your password" 
                             TextMode="Password" TabIndex="2"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn-login" OnClick="btnLogin_Click" />

            <div class="extra-links">
                <p><a href="ForgotPassword.aspx">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot password?</asp:HyperLink>
                    </a></p>
                <p>Don't have an accunt? <a href="ForgotPassword.aspx">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SignUpPage.aspx">Sign up here</asp:HyperLink>
                    </a></p>
            </div>
        </div>

        <!-- SCROLLING ADVERTISEMENT -->
        <section class="advert-section">
            <div class="scrolling-text">
                🚀 Hire Top Freelancers Today | 💼 Post a Project for Free | 🌍 Work Remotely, Earn Globally | ✨ Build Your Dream Team on FreelanceFlow!
            </div>
        </section>
    </form>
</body>
</html>