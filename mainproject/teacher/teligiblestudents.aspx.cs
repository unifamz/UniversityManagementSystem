using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class teacher_teligiblestudents : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        
        if(!IsPostBack)
        {
            plgrid.Visible = false;
            SqlCommand cmd = new SqlCommand("select distinct department from courses",s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while(sdr.Read())
            {
                ddldepartment.Items.Add(sdr["department"].ToString());
                
            }
            s.Close();
        }
    }
    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddldepartment.SelectedItem.Text != "---Select Department---")
        {
            ddlcourse.Items.Clear();
            ddlcourse.Items.Add("---Select Course---");
            SqlCommand cmd = new SqlCommand("select distinct course from courses where department='" + ddldepartment.SelectedItem.Text + "'", s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                ddlcourse.Items.Add(sdr["course"].ToString());
            }
            s.Close();
        }
    }
    protected void btnshowlist_Click(object sender, EventArgs e)
    {
        plgrid.Visible = true;
        SqlDataAdapter sda = new SqlDataAdapter("select name,rollno,email,phone,tenth,tweleve,graduation,gradback,department,course from acedemic where tenth>='"+Convert.ToInt64(tbtenth.Text)+"' and tweleve>='"+Convert.ToInt64(tbtweleve.Text)+"' and graduation>='"+Convert.ToInt64(tbgraduationpercentage.Text)+"' and gradback<='"+Convert.ToInt16(tbbacklogs.Text)+"' and department='"+ddldepartment.SelectedItem.Text+"' and course='"+ddlcourse.SelectedItem.Text+"'",s);
        s.Open();
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvlist.DataSource = dt;
        gvlist.DataBind();
        s.Close();
    }
}