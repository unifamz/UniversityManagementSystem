using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class teacher_tattendence : System.Web.UI.Page
{
    SqlConnection s;
    static string department = null;
    static string course = null;
    static int section = 0;
    static string subject = null;
    static string day = null;
    static int lecture = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);

    }

    protected void btncheck_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select name from register where id1='"+Convert.ToInt64(tbteacherid.Text)+"' and password='"+tbpassword.Text+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            lbname.Text = sdr["name"].ToString();
        }
        s.Close();
    }
    
    protected void gvteacherlist_SelectedIndexChanged(object sender, EventArgs e)
    {
         department = gvteacherlist.SelectedRow.Cells[1].Text;
        course =System.Web.HttpUtility.HtmlDecode(gvteacherlist.SelectedRow.Cells[2].Text);
         section = Convert.ToInt16(gvteacherlist.SelectedRow.Cells[8].Text);
        subject=gvteacherlist.SelectedRow.Cells[3].Text;
        day=gvteacherlist.SelectedRow.Cells[4].Text;
        lecture=Convert.ToInt16(gvteacherlist.SelectedRow.Cells[5].Text);
        SqlDataAdapter sda = new SqlDataAdapter("select name,roll from student where department='"+department+"' and course='"+course+"' and section='"+section+"'",s);
        s.Open();
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvstudentlist.DataSource = dt;
        gvstudentlist.DataBind();
        s.Close();
    }

    protected void gvstudentlist_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(gvstudentlist.Columns.Count>0)
        {
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.Cells[3].Text = DateTime.Now.ToShortDateString();
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string present=null;
        string absent = null;
        foreach(GridViewRow gvrow in gvstudentlist.Rows)
        {
            if(gvrow.RowType==DataControlRowType.DataRow)
            {
                CheckBox cbrow = (gvrow.Cells[3].FindControl("cbattendence") as CheckBox);
                if(cbrow.Checked)
                {
                    present += gvrow.Cells[1].Text + ",";
                }
                else
                {
                    absent += gvrow.Cells[1].Text + ",";
                }
            }
        }
        if (getdate() == 0)
        {
            SqlCommand cmd = new SqlCommand("insert into studentattendence(Date,course,section,present,absent,teacherid,day,lectureno,subject) values('" + DateTime.Now.ToShortDateString() + "','" + course + "','" + section.ToString() + "','" + present + "','" + absent + "','"+Convert.ToInt64(tbteacherid.Text)+"','"+day+"','"+lecture+"','"+subject+"' )", s);
            s.Open();
            cmd.ExecuteNonQuery();
            s.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Today " + DateTime.Now.ToShortDateString() + " attendence is done!!!')", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Already attend on That date')", true);
        }
    }

    private int getdate()
    {
        int value = 0;
        SqlCommand cmd = new SqlCommand("select id from studentattendence where teacherid='"+Convert.ToInt64(tbteacherid.Text)+"' and subject='"+subject+"' and day='"+day+"' and lectureno='"+lecture+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            value = Convert.ToInt16(sdr["id"].ToString());
        }
        s.Close();
        return value;
    }

}