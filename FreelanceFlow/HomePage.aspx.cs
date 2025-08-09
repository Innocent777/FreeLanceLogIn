using System;
using System.Web;
using System.Web.UI;

namespace FreelanceFlow
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Any code you want to execute on every page load
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Redirect to login page
            Response.Redirect("LoginPage.aspx");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Redirect to signup page
            Response.Redirect("SignUpPage.aspx");
        }
    }
}
