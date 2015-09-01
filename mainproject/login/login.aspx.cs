using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class login_login : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        divlogin.Visible = false;
        divusers.Visible = false;
        if (!IsPostBack)
            Session["teacher_name"] = null; 
    }

    protected void btnlogin_Click1(object sender, EventArgs e)
    {
        try
        {
            if (FormsAuthentication.Authenticate(tbid.Text, tbpassword.Text))
            {
                //FormsAuthentication.RedirectFromLoginPage("sunny", false);
                Response.Redirect("~/starting/home.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Wrong username and password')", true);
            }
            if (ViewState["login"].ToString() == "admin")
            {
                SqlCommand cmd = new SqlCommand("select name from admin where id1='" + Convert.ToInt16(tbid.Text) + "' and password='" + tbpassword.Text + "'", s);
                s.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    Session["admin_name"] = sdr["name"].ToString();
                    Response.Redirect("~/admin/adashboard.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('ID or password not correct!!')", true);
                }
                s.Close();
            }
            else
            {
                if (ViewState["userlogin"].ToString() == "teacher")
                {
                    string email = null;
                    SqlCommand cmd = new SqlCommand("select name,email from register where id1='" + Convert.ToInt16(tbid.Text) + "' and password='" + tbpassword.Text + "'", s);
                    s.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        Session["teacher_name"] = sdr["name"].ToString();
                        email = sdr["email"].ToString();
                        if (email != null)
                            Response.Redirect("~/teacher/tdashboard.aspx");
                        else
                            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please Register to get access!!!", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('ID or password not correct!!')", true);
                    }
                    s.Close();
                }
                else if(ViewState["userlogin"].ToString()=="student")
                {
                    string email = null;
                    SqlCommand cmd = new SqlCommand("select name,email from student where roll='" + Convert.ToInt64(tbid.Text) + "' and password='" + tbpassword.Text + "'", s);
                    s.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        Session["student_name"] = sdr["name"].ToString();
                        email = sdr["email"].ToString();
                        if (email != null)
                            Response.Redirect("~/student/sdashboard.aspx");
                        else
                            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please Register to get access!!!", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Roll No. or password not correct!!')", true);
                    }
                    s.Close();
                }
                else
                {
                    string email = null;
                    SqlCommand cmd = new SqlCommand("select name,email from warden where warden_id='" + Convert.ToInt64(tbid.Text) + "' and password='" + tbpassword.Text + "'", s);
                    s.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        Session["warden_name"] = sdr["name"].ToString();
                        email = sdr["email"].ToString();
                        if (email != null)
                            Response.Redirect("~/warden/wdashboard.aspx");
                        else
                            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please Register to get access!!!", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Warden ID or password not correct!!')", true);
                    }
                    s.Close();
                }
            }
        }
        catch(Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('" + ex.Message + "')", true);
        }
    }

    protected void btnteacher_Click(object sender, EventArgs e)
    {
        divlogin.Visible = true;
        tbid.ToolTip = "Teacher ID";
        lbid.Text = "Teacher ID:-";
        btnstudent.Visible = false;
        btnwarden.Visible = false;
        divusers.Visible = true;
        ViewState["userlogin"]="teacher";
        //tbemail.Attributes.Add("onfocus", "clearText(this,'" + "Teacher ID" + "')");
        //tbemail.Text = "Teacher ID";
    }

    protected void btnstudent_Click(object sender, EventArgs e)
    {
        divlogin.Visible = true;
        lbid.Text = "Student Roll No. :-";
        tbid.ToolTip = "Student Roll No.";
        btnteacher.Visible = false;
        btnwarden.Visible = false;
        divusers.Visible = true;
        ViewState["userlogin"]="student";
    } 
    
    protected void btnwarden_Click(object sender, EventArgs e)
    {
        divlogin.Visible = true;
        lbid.Text = "Warden ID:-";
        tbid.ToolTip = "Warden ID";
        btnteacher.Visible = false;
        btnstudent.Visible = false;
        divusers.Visible = true;
        ViewState["userlogin"] = "Warden";
    }

    protected void btnadmin_Click(object sender, EventArgs e)
    {
        divlogin.Visible = true;
        btnuser.Visible = false;
        ViewState["login"] = "admin";
    }

    protected void btnuser_Click(object sender, EventArgs e)
    {
        divusers.Visible = true;
        btnadmin.Visible = false;
        ViewState["login"] = "user";
    }

}