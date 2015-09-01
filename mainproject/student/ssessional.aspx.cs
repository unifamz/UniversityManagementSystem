using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class student_ssessional : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
            pldetails.Visible = false;
        }
    }
    protected void btnshow_Click(object sender, EventArgs e)
    {
        pldetails.Visible = true;
        SqlCommand cmd = new SqlCommand("select name,department,course,semster from student where roll='"+Convert.ToInt64(tbroll.Text)+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            lbname.Text = sdr["name"].ToString();
            lbdepartment.Text = sdr["department"].ToString();
            lbcourse.Text = sdr["course"].ToString();
            lbsemester.Text = sdr["semster"].ToString();
            
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Invalid Roll No.')!!!", true);
        }
        s.Close();
        if(lbsemester.Text!=string.Empty)
        {
            bindgrid();
        }
    }

    private void bindgrid()
    {
        SqlCommand cmd = new SqlCommand("select subject_name,sessional_marks from syllabus where semster='"+lbsemester.Text+"' and department='"+lbdepartment.Text+"' and course='"+lbcourse.Text+"'",s);
        s.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvmarks.DataSource = dt;
        gvmarks.DataBind();
        s.Close();
        binddata();
    }

    private void binddata()
    { 
        for(int i=0;i<gvmarks.Rows.Count;i++)
        {
            string subject = gvmarks.Rows[i].Cells[1].Text.Replace(' ','_');
            SqlCommand cmd = new SqlCommand("select distinct "+subject+" from sessionalmarks where roll='"+tbroll.Text+"'",s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if(sdr.Read())
            {
                Label lbmarks = (Label)gvmarks.Rows[i].Cells[3].FindControl("lbmarks");
                lbmarks.Text = sdr["" + subject + ""].ToString();
            }
            s.Close();
        }
    }
    protected void gvmarks_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}
