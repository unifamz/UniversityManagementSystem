using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class teacher_ttimetable : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["teacher_name"] == null)
            Response.Redirect("~/login/login.aspx");
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if (!IsPostBack)
        {
            divname.Visible = false;
            divdepartment.Visible = false;
            divcourse.Visible = false;
            divsubject.Visible = false;
            plgrid.Visible = false;
        }
    }

    protected void btncheck_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select name,department,course,subject from teachertimetable where teacherid='" + Convert.ToInt64(tbteacherid.Text) + "'", s);
        s.Open();
        SqlDataReader sdr=cmd.ExecuteReader();
        if (sdr.Read())
        {
            divname.Visible = true;
            divdepartment.Visible = true;
            divcourse.Visible = true;
            divsubject.Visible = true;
            plgrid.Visible = true;
            lbname.Text = sdr["name"].ToString();
            lbdepartment.Text = sdr["department"].ToString();
            lbcourse.Text = sdr["course"].ToString();
            lbSubject.Text = sdr["subject"].ToString();
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Invalid Teacher Id')", true);
        }
    }
}