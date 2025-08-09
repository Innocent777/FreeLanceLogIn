using System;
using System.Configuration;
using System.Data.SqlClient;

namespace FreelanceFlow
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void btnReset_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string newPassword = txtNewPassword.Text;

            string connect = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|FreeLanceDBMS.mdf;Integrated Security=True";
            // Connect to DB
            using (SqlConnection conn = new SqlConnection(connect))
            {
                conn.Open();

                // Check if email exists
                string checkQuery = "SELECT COUNT(*) FROM SignUpTable WHERE Email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    int count = (int)checkCmd.ExecuteScalar();

                    if (count == 0)
                    {
                        lblMessage.Text = "Email not found.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }

                // Update password
                string updateQuery = "UPDATE SignUpTable SET Password = @Password WHERE Email = @Email";
                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                {
                    updateCmd.Parameters.AddWithValue("@Password", newPassword); // 🔒 Recommend hashing
                    updateCmd.Parameters.AddWithValue("@Email", email);

                    int rows = updateCmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        lblMessage.Text = "Password updated successfully.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        Response.Redirect("LoginPage.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Error updating password.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
