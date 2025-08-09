using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace FreelanceFlow
{
    public partial class SignUp : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtName.Text.Trim();
                string surname = txtSurname.Text.Trim();
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text;
                string connect = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|FreeLanceDBMS.mdf;Integrated Security=True";
                // 1️⃣ Check if email already exists
                using (SqlConnection con = new SqlConnection(connect))
                {
                    con.Open();

                    string checkUserQuery = "SELECT COUNT(*) FROM SignUpTable WHERE Email = @Email";
                    using (SqlCommand checkCmd = new SqlCommand(checkUserQuery, con))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int count = (int)checkCmd.ExecuteScalar();
                        if (count > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email already registered!');", true);
                            return;
                        }
                    }

                    // 2️⃣ Insert new user
                    string insertQuery = "INSERT INTO SignUpTable (Name, Surname, Email, Password) VALUES (@Name, @Surname, @Email, @Password)";
                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Surname", surname);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password); // 🔒 Ideally, hash password

                        cmd.ExecuteNonQuery();
                    }
                }

                // 3️⃣ Save session & redirect
                Session["UserEmail"] = email;
                Session["UserName"] = name + " " + surname;
                Session["UserLoggedIn"] = true;

                Response.Redirect("LoginPage.aspx");
            }
        }
    }
}
