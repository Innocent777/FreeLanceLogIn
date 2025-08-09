using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace FreelanceFlow
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Redirect if already logged in
            // if (Session["UserLoggedIn"] != null && (bool)Session["UserLoggedIn"])
            //     Response.Redirect("Dashboard.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter both email and password.');", true);
                return;
            }
            string connect = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|FreeLanceDBMS.mdf;Integrated Security=True";
            // Connect to DB
            using (SqlConnection con = new SqlConnection(connect))
            {
                con.Open();

                string query = "SELECT Name, Surname FROM SignUpTable WHERE Email = @Email AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); // 🔒 In real apps, hash password

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read()) // If user found
                        {
                            string fullName = reader["Name"].ToString() + " " + reader["Surname"].ToString();

                            // Store in session
                            Session["UserEmail"] = email;
                            Session["UserName"] = fullName;
                            Session["UserLoggedIn"] = true;

                            // Redirect
                            Response.Redirect("Dashboard.aspx");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid email or password.');", true);
                        }
                    }
                }
            }
        }
    }
}
