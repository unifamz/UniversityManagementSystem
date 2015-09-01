using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class teacher_tsessional : System.Web.UI.Page
{
    SqlConnection s;
    static string subject = null;
    static int i = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
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
        SqlCommand cmd = new SqlCommand("select distinct course from courses where department='"+ddldepartment.SelectedItem.Text+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            ddlcourse.Items.Add(sdr["course"].ToString());
        }
        s.Close();
    }

    private string getteachername()
    {
        SqlCommand cmd = new SqlCommand("select subject from teachertimetable where name='"+Session["teacher_name"].ToString()+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            subject=sdr["subject"].ToString();
            ViewState["subject"] = subject.Replace(' ','_');

        }
        else
        {
            subject = null;
        }
        s.Close();
        return subject;
    }

    protected void btnshow_Click(object sender, EventArgs e)
    {
        if (ddldepartment.SelectedIndex != 0 && ddlcourse.SelectedIndex != 0 && ddlsemster.SelectedIndex != 0 && ddlsection.SelectedIndex != 0)
        {
            plgrid.Visible = true;
            bindgrid();
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please fill all details!!!')", true);
        }
    }

    private void bindgrid()
    {
        SqlCommand cmd = new SqlCommand("select name from student where department='" + ddldepartment.SelectedItem.Text + "' and course='" + ddlcourse.SelectedItem.Text + "' and semster='" + ddlsemster.SelectedItem.Value + "' and section='" + ddlsection.SelectedItem.Value + "'", s);
        s.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        s.Close();
        gvsessional.DataSource = dt;
        gvsessional.DataBind();
        
    }
    
    protected void tbinternal_textchanged(object sender,EventArgs e)
    {
        //for (int i = 0; i < gvsessional.Rows.Count; i++)
       
        int count = gvsessional.Rows.Count;
        if(i<count)
        {
            TextBox tbmarks = (TextBox)gvsessional.Rows[i].Cells[2].FindControl("tbinternal");
            double marks =Convert.ToDouble(tbmarks.Text);
           // int marks = Convert.ToInt16(gvsessional.Rows[i].FindControl("ContentPlaceHolder1_gvsessional_tbinternal_'"+i+"'"));
            Label lbpercent = (Label)gvsessional.Rows[i].Cells[3].FindControl("lbpercent");
            lbpercent.Text = ((marks / Convert.ToDouble(tbtotalmarks.Text))*100).ToString("0.00");
            double percent = Convert.ToDouble(lbpercent.Text); 
            if (Convert.ToInt32(percent) >= 40)
            {
                Label lbstatus = (Label)gvsessional.Rows[i].Cells[4].FindControl("lbstatus");
                lbstatus.Text = "Pass";
            }
            else
            {
                Label lbstatus = (Label)gvsessional.Rows[i].Cells[4].FindControl("lbstatus");
                lbstatus.Text = "Fail";
            }
            i++;
        }
        else
        {
            i = 0;
        }
    }

    protected void gvsessional_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       // bindgrid();
        if (e.Row.RowType == DataControlRowType.Header)
            e.Row.Cells[2].Text = getteachername()+"/"+tbtotalmarks.Text;
        //if(e.Row.RowType==DataControlRowType.DataRow)
        //{
        //    TextBox tbmarks=(TextBox)g
        //}
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
        }
    }

    private void addcolumn()
    { 
        SqlCommand cmd = new SqlCommand("alter table sessionalmarks add "+ViewState["subject"].ToString()+" int null",s);
        s.Open();
        cmd.ExecuteNonQuery();
        s.Close();
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        i = 0;
        SqlCommand cmd = new SqlCommand("select * from sessionalmarks",s);
        s.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        
        if(Convert.ToBoolean(dt.Rows[0].Table.Columns[ViewState["subject"].ToString()]))
        {
            s.Close();
            addcolumn();
        }
        else
        s.Close();
    }
}