<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="FreelanceFlow.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>FreelanceFlow - Home</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #ffffff;
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

    .main {
      display: flex;
      flex-wrap: wrap;
      height: auto;
    }

    .left-section {
      flex: 1;
      background-color: #1e3932;
      color: white;
      text-align: center;
      padding: 60px 30px;
    }

    .left-section h1 {
      font-size: 36px;
      margin-bottom: 20px;
    }

    .left-section .menu-btn {
      padding: 12px 30px;
      background-color: white;
      color: #1e3932;
      border: none;
      border-radius: 30px;
      font-weight: bold;
      cursor: pointer;
      font-size: 16px;
    }

    .right-section {
      flex: 1;
      position: relative;
      height: 300px;
      overflow: hidden;
      background-color: #f5f5f5;
    }

    .slider {
      position: absolute;
      width: 100%;
      height: 100%;
    }

    .slider img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      border-radius: 8px;
      transition: opacity 1s ease-in-out;
      position: absolute;
      top: 0;
      left: 0;
      opacity: 0;
    }

    .slider img.active {
      opacity: 1;
      z-index: 2;
    }

    .info-section {
      padding: 50px 30px;
      background-color: #ffffff;
      text-align: center;
    }

    .info-section h2 {
      font-size: 28px;
      margin-bottom: 15px;
      color: #1e3932;
    }

    .info-section p {
      font-size: 16px;
      color: #333;
      max-width: 800px;
      margin: auto;
    }

    .advert-section,
    .extra-advert {
      background-color: #1e3932;
      color: white;
      overflow: hidden;
      padding: 12px 0;
      margin-top: 10px;
    }

    .advert-container {
      width: 100%;
      white-space: nowrap;
      overflow: hidden;
      position: relative;
    }

    .scrolling-text {
      display: inline-block;
      padding-left: 100%;
      animation: scroll-left 20s linear infinite;
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

    @media (max-width: 768px) {
      .main {
        flex-direction: column;
      }

      .right-section {
        height: 200px;
      }
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">

    <!-- NAVIGATION -->
    <header>
      <h2>FreelanceFlow</h2>
      <div class="nav-right">
        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="asp-button" OnClick="btnLogin_Click" />
        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="asp-button" OnClick="btnSignUp_Click" />
      </div>
    </header>

    <!-- HERO SECTION -->
    <section class="main">
      <div class="left-section">
        <h1>FreelanceFlow</h1>
        <p>Connecting global talent with real-world opportunity.</p>
       
      </div>
      <div class="right-section">
        <div class="slider" id="slider">
          <img src="https://images.pexels.com/photos/3184357/pexels-photo-3184357.jpeg" class="active" alt="Remote Work" />
          <img src="https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg" alt="Collaboration" />
          <img src="https://images.pexels.com/photos/1181406/pexels-photo-1181406.jpeg" alt="Team Work" />
        </div>
      </div>
    </section>

    <!-- INFO SECTION -->
    <section class="info-section">
      <h2>About FreelanceFlow</h2>
      <p>
        FreelanceFlow is a platform designed to empower freelancers and businesses alike.
        Whether you're a designer, developer, writer, or marketer — our network connects
        you to clients seeking your skills. As a client, you can easily find top-tier freelance
        professionals ready to help you build, grow, and scale your vision.
      </p>
      <br />
      <p>
        🌎 Trusted by thousands worldwide<br />
        🚀 Fast hiring & smooth project delivery<br />
        💼 Built for freelancers, loved by teams
      </p>
    </section>

    <!-- SCROLLING ADVERT -->
    <section class="advert-section">
      <div class="advert-container">
        <div class="scrolling-text">
          🚀 Hire Top Freelancers Today | 💼 Post a Project for Free | 🌍 Work Remotely, Earn Globally | ✨ Build Your Dream Team on FreelanceFlow!
        </div>
      </div>
    </section>

    <!-- EXTRA ADVERTISEMENT -->
    <section class="extra-advert">
      <div class="advert-container">
        <div class="scrolling-text">
          📣 Freelancers Wanted: Sign Up & Start Earning! | 🛠️ Need Help? Find Verified Freelancers in Minutes | 🧑‍💻 Work Smart, Work Free with FreelanceFlow!
        </div>
      </div>
    </section>

  </form>

  <!-- SLIDER SCRIPT -->
  <script type="text/javascript">
      const images = document.querySelectorAll("#slider img");
      let current = 0;

      setInterval(() => {
          images[current].classList.remove("active");
          current = (current + 1) % images.length;
          images[current].classList.add("active");
      }, 5000);
  </script>
</body>
</html>
