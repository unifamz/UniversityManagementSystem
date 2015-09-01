using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class teacher_tdetails : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
            plsearch.Visible = false;
            plstudentlist.Visible = false;
        }
    }

    protected void btnteacher_Click(object sender, EventArgs e)
    {
        btnstudent.Visible = false;
        plsearch.Visible = true;
        ViewState["btnuser"] = btnteacher.Text;
    }

    protected void btnstudent_Click(object sender, EventArgs e)
    {
        btnteacher.Visible = false;
        plsearch.Visible = true;
        ViewState["btnuser"] = btnstudent.Text;
    }
}