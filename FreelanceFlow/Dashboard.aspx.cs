using System;
using System.Web.UI;

namespace FreelanceFlow
{
    public partial class Dashboard : Page
    {
        // In real app: get from Session, Database, or ASP.NET Identity
        private string GetUserName() => Session["Username"]?.ToString() ;
        private string GetUserRole() => Session["Role"]?.ToString() ?? "Client" ?? "Freelancer" ?? "Admin";

        protected void Page_Load(object sender, EventArgs e)
        {
            string userName = GetUserName();
            string userRole = GetUserRole();

            // Set labels
            lblUserName.Text = userName;
            lblUserRole.Text = userRole;
            lblWelcomeName.Text = userName;
            lblWelcomeFreelancer.Text = userName;

            // Show role-based content
            ConfigureRoleUI(userRole);
        }

        private void ConfigureRoleUI(string role)
        {
            // Hide all
            pnlClientMenu.Visible = false;
            pnlFreelancerMenu.Visible = false;
            pnlAdminMenu.Visible = false;
            pnlWelcomeClient.Visible = false;
            pnlWelcomeFreelancer.Visible = false;

            switch (role.ToLower())
            {
                case "client":
                    pnlClientMenu.Visible = true;
                    pnlWelcomeClient.Visible = true;
                    break;

                case "freelancer":
                    pnlFreelancerMenu.Visible = true;
                    pnlWelcomeFreelancer.Visible = true;
                    break;

                case "admin":
                    pnlAdminMenu.Visible = true;
                    // Optionally add admin welcome panel
                    break;

                default:
                    // Fallback
                    pnlClientMenu.Visible = true;
                    pnlWelcomeClient.Visible = true;
                    break;
            }
        }

        protected void lblLogout_Click(object sender, EventArgs e)
        {
            // Clear session
            Session.Clear();
            Session.Abandon();

            // Redirect to login
            Response.Redirect("Login.aspx"); // Create this page later
        }
    }
}