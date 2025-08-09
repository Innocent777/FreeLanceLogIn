<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FreelanceFlow.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FreelanceFlow - Dashboard</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        /* Reset & Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            transition: background-color 0.8s ease-in-out;
            min-height: 100vh;
            color: #333;
        }

        /* Header */
        header {
            background-color: #1e3932;
            color: white;
            padding: 15px 30px;
            font-size: 22px;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        /* Layout */
        .container {
            display: flex;
            min-height: calc(100vh - 60px);
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background-color: #ffffff;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            padding: 20px 15px;
            position: fixed;
            top: 60px;
            left: 0;
            height: calc(100vh - 60px);
            overflow-y: auto;
            z-index: 10;
        }

        .user-info {
            text-align: center;
            padding: 15px;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            color: #1e3932;
        }

        .user-info .name {
            font-weight: bold;
            font-size: 16px;
        }

        .user-info .role {
            font-size: 14px;
            color: #007BFF;
        }

        .sidebar a {
            display: block;
            padding: 12px 15px;
            margin-bottom: 5px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #1e3932;
            color: white;
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 30px;
            margin-left: 240px;
            margin-right: 300px;
        }

        .welcome-section {
            background-color: #e8f5e9;
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 30px;
            border-left: 5px solid #4CAF50;
        }

        .welcome-title {
            font-size: 20px;
            color: #1e3932;
            margin: 0 0 10px;
        }

        .welcome-desc {
            font-size: 15px;
            color: #555;
            line-height: 1.6;
        }

        /* Get Started Section */
        .get-started {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .get-started h3 {
            color: #1e3932;
            margin: 0 0 15px;
            font-size: 18px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
        }

        .steps ol {
            line-height: 1.8;
            color: #444;
            padding-left: 20px;
        }

        .highlight-box {
            background-color: #f0f8ff;
            border-left: 4px solid #1e90ff;
            padding: 14px;
            margin: 20px 0;
            border-radius: 0 8px 8px 0;
            font-size: 14px;
            font-style: normal;
        }

        .get-started button {
            background: #1e3932;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .get-started button:hover {
            background: #162a25;
        }

        /* Tools Panel */
        .tools-section {
            width: 300px;
            padding: 20px;
            position: fixed;
            top: 60px;
            right: 0;
            height: calc(100vh - 60px);
            overflow-y: auto;
            font-size: 14px;
            color: #333;
        }

        .tool-card {
            background-color: #ffffff;
            padding: 18px;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: -2px 2px 10px rgba(0,0,0,0.05);
            border-left: 4px solid #1e3932;
        }

        .tool-card h3 {
            margin: 0 0 12px;
            color: #1e3932;
            font-size: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .tool-card ul {
            list-style: none;
        }

        .action-link {
            display: block;
            padding: 10px 12px;
            margin: 6px 0;
            background-color: #f8f9fa;
            color: #1e3932;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: background 0.2s;
        }

        .action-link:hover {
            background-color: #e9f5e9;
            font-weight: 500;
        }

        .tool-card.stats {
            background-color: #e8f5e9;
            border-left-color: #4CAF50;
        }

        .tool-card.stats p {
            margin: 8px 0;
            font-size: 14px;
            color: #2e7d32;
        }

        .tool-card.tip {
            background-color: #fff8e1;
            border-left-color: #FFB300;
            color: #5d4037;
        }

        .tool-card.tip p {
            font-size: 14px;
            line-height: 1.5;
        }

        /* Responsive Design */
        @@media (max-width: 1200px) {
            .tools-section {
                width: 250px;
            }
            .main-content {
                margin-right: 250px;
            }
        }

        @@media (max-width: 992px) {
            .sidebar {
                width: 220px;
            }
            .main-content {
                margin-left: 220px;
            }
        }

        @@media (max-width: 768px) {
            .sidebar, .main-content, .tools-section {
                margin: 0;
                width: 100%;
                position: static;
                height: auto;
            }

            .container {
                flex-direction: column;
            }

            .main-content {
                padding: 20px;
            }

            header {
                font-size: 20px;
            }
        }

        @@media (max-width: 480px) {
            header {
                font-size: 18px;
                padding: 12px 16px;
            }

            .welcome-section, .get-started, .tool-card {
                padding: 16px;
            }

            .get-started button {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            FreelanceFlow Dashboard
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" NavigateUrl="~/LoginPage.aspx">Logout</asp:HyperLink>
        </header>

        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <div class="user-info">
                    <div class="name"><asp:Label ID="lblUserName" runat="server" /></div>
                    <div class="role"><asp:Label ID="lblUserRole" runat="server" /></div>
                </div>

                <asp:Panel ID="pnlClientMenu" runat="server">
                    <a href="#" class="active">Home</a>
                    <a href="#">Client</a>
                    <a href="#">Freelancer</a>
                    <a href="#">Admin</a>
                    <a href="#">Profile</a>
                </asp:Panel>

                <asp:Panel ID="pnlFreelancerMenu" runat="server">
                    &nbsp;
                </asp:Panel>

                <asp:Panel ID="pnlAdminMenu" runat="server">
                    &nbsp;</asp:Panel>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <!-- Client Welcome -->
                <asp:Panel ID="pnlWelcomeClient" runat="server">
                    <div class="welcome-section">
                        <h2 class="welcome-title">Welcome, <asp:Label ID="lblWelcomeName" runat="server" />! 👋</h2>
                        <p class="welcome-desc">
                            As a <strong>Client</strong>, you can explore a diverse pool of talented freelancers to bring your ideas to life. 
                            Post your project, find the perfect match, and collaborate with skilled professionals across the globe.
                        </p>
                    </div>

                    <div class="get-started">
                        <h3>🚀 Let’s Get Started</h3>
                        <div class="steps">
                            <ol>
                                <li><strong>Post Your Project</strong> – Describe what you need, set a budget, and invite bids.</li>
                                <li><strong>Review Freelancers</strong> – Browse profiles, portfolios, and client ratings.</li>
                                <li><strong>Hire & Collaborate</strong> – Chat, share files, and track progress in one place.</li>
                            </ol>
                        </div>
                        <div class="highlight-box">
                            💡 Tip: Projects with clear titles and descriptions receive 3x more bids!
                        </div>
                        <button>➕ Post a New Project</button>
                    </div>
                </asp:Panel>

                <!-- Freelancer Welcome -->
                <asp:Panel ID="pnlWelcomeFreelancer" runat="server">
                    <div class="welcome-section">
                        <h2 class="welcome-title">Welcome, <asp:Label ID="lblWelcomeFreelancer" runat="server" />! 🚀</h2>
                        <p class="welcome-desc">
                            As a <strong>Freelancer</strong>, this is your stage to shine! Showcase your skills, build your portfolio, 
                            and connect with clients looking for your expertise.
                        </p>
                    </div>

                    <div class="get-started">
                        <h3>🎯 Grow Your Career</h3>
                        <div class="steps">
                            <ol>
                                <li><strong>Complete Your Profile</strong> – Add skills, experience, and work samples.</li>
                                <li><strong>Apply to Jobs</strong> – Find projects that match your expertise.</li>
                                <li><strong>Win Projects</strong> – Impress clients with your proposals and deliver great work.</li>
                            </ol>
                        </div>
                        <div class="highlight-box">
                            💡 Tip: Active profiles get 5x more job invitations!
                        </div>
                        <button>📝 Update Your Profile</button>
                    </div>
                </asp:Panel>
            </div>

            <!-- Tools Panel -->
            <div class="tools-section">
                <div class="tool-card">
                    <h3>🚀 Quick Actions</h3>
                    <ul>
                        <li><a href="#" class="action-link">Post a New Project</a></li>
                        <li><a href="#" class="action-link">Browse Freelancers</a></li>
                        <li><a href="#" class="action-link">View Messages</a></li>
                        <li><a href="#" class="action-link">Edit Profile</a></li>
                    </ul>
                </div>

                <div class="tool-card stats">
                    <h3>📊 Your Stats</h3>
                    <p><strong>Projects Posted:</strong> 3</p>
                    <p><strong>Hires Made:</strong> 2</p>
                    <p><strong>Avg. Rating:</strong> ⭐ 4.9</p>
                </div>

                <div class="tool-card tip">
                    <h3>💡 Pro Tip</h3>
                    <p>Clear project descriptions attract better freelancers. Include budget, timeline, and skills needed!</p>
                </div>
            </div>
        </div>

        <!-- Background Color Changer -->
        <script>
            const bgColors = [
                '#f8f9fa', // Light gray
                '#e3f2fd', // Light blue
                '#e8f5e9', // Light green
                '#fff8e1', // Light yellow
                '#f3e5f5', // Light purple
                '#ffebee'  // Light red
            ];

            let colorIndex = 0;

            function changeBackgroundColor() {
                document.body.style.backgroundColor = bgColors[colorIndex];
                colorIndex = (colorIndex + 1) % bgColors.length;
                setTimeout(changeBackgroundColor, 3000); // Every 3 seconds
            }

            // Start on page load
            window.onload = function () {
                changeBackgroundColor();
            };
        </script>
    </form>
</body>
</html>