using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;

public partial class login_forgotpassword : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("spresetpassword",s);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@email", tbemail.Text);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            if(Convert.ToBoolean(sdr["returncode"]))
            {
                sendpassreset(sdr["email"].ToString(),sdr["username"].ToString(),sdr["uniqueid"].ToString());
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('An email with instruction to reset your password is sent to your registered email')",true);
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Email ID not found')", true);
            }
        }
    }

    private void sendpassreset(string toemail,string username,string uniqueid)
    {
        MailMessage mm = new MailMessage("soravsingh1994@gmail.com", toemail);
        StringBuilder sb = new StringBuilder();
        sb.Append("Dear" + username + ",<br/><br/>");
        sb.Append("Please click on following link to reset your password");
        sb.Append("<br/>");
        sb.Append("http://localhost/universityschema/login/forgotpassword.aspx?uid=" + uniqueid);
        sb.Append("<br/><br/>");
        sb.Append("<b>Sorav Kumar singh</b>");
        mm.IsBodyHtml = true;
        mm.Body = sb.ToString();
        mm.Subject = "Reset your Password";
        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.Credentials = new System.Net.NetworkCredential()
        {
            UserName="soravsingh1994@gmail.com",
            Password="sunny1994"
        };
        smtp.EnableSsl = true;
        smtp.Send(mm);
    }
}