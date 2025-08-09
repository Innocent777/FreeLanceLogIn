<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpPage.aspx.cs" Inherits="FreelanceFlow.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FreelanceFlow - Sign Up</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f4f8;
            background-image: linear-gradient(135deg, #ffffff, #e6f7ff);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
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

        .signup-container {
            max-width: 500px;
            width: 90%;
            margin: 40px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #1e3932;
            margin-bottom: 10px;
            font-size: 28px;
            text-align: center;
        }

        p.subtitle {
            text-align: center;
            color: #555;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #1e3932;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #1e3932;
            outline: none;
        }

        .btn-signup {
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
            transition: background-color 0.3s ease;
        }

        .btn-signup:hover {
            background-color: #162a25;
        }

        .extra-links {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #555;
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
            margin-top: auto;
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
            .signup-container {
                padding: 30px 20px;
                margin: 30px 16px;
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

        <!-- SIGN-UP FORM -->
        <div class="signup-container">
            <h1>Create Account</h1>
            <p class="subtitle">Join thousands of freelancers and clients today.</p>

            <div class="form-group">
                <label for="txtName">First Name</label>
                <asp:TextBox ID="txtName" runat="server" placeholder="Enter your first name" TabIndex="1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                    ErrorMessage="First name is required." Display="Dynamic" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="txtSurname">Last Name</label>
                <asp:TextBox ID="txtSurname" runat="server" placeholder="Enter your last name" TabIndex="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSurname" runat="server" ControlToValidate="txtSurname"
                    ErrorMessage="Last name is required." Display="Dynamic" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" TextMode="Email" TabIndex="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is required." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="Invalid email format." Display="Dynamic" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" placeholder="Create a password" TextMode="Password" TabIndex="4"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Password is required." Display="Dynamic" ForeColor="Red" />
                <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$"
                    ErrorMessage="Password must be 8+ chars with uppercase, lowercase, number, and symbol."
                    Display="Dynamic" ForeColor="Red" />
            </div>

            <div class="form-group">
                <label for="txtConfirmPassword">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm your password" TextMode="Password" TabIndex="5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirmPassword"
                    ErrorMessage="Please confirm your password." Display="Dynamic" ForeColor="Red" />
                <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword"
                    ControlToCompare="txtPassword" Operator="Equal" Type="String"
                    ErrorMessage="Passwords do not match." Display="Dynamic" ForeColor="Red" />
            </div>

            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn-signup" OnClick="btnSignUp_Click" />

            <div class="extra-links">
                Already have an account?&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoginPage.aspx">Log in here</asp:HyperLink>
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