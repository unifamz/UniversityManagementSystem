using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class student_attendence : System.Web.UI.Page
{
    SqlConnection s;
    static int a = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
            gvattendence.Visible = true;
        }
    }

    private int getsection()
    {
        int section = 0;
        SqlCommand cmd = new SqlCommand("select section,semster,department,course from student where roll='"+Convert.ToInt64(tbroll.Text)+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            section = Convert.ToInt16(sdr["section"].ToString());
            ViewState["semster"]=sdr["semster"].ToString();
            ViewState["department"]=sdr["department"].ToString();
            ViewState["course"]=sdr["course"].ToString();
        }
        s.Close();
        return section;
    }
    string datecolumn=null;
    protected void btnshow_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select Date,present from studentattendence where section='" + getsection().ToString() + "' and subject='" + ddlsubject.SelectedItem.Text + "' and Date>='" +Convert.ToDateTime(tbstartdate.Text) + "' and Date<='" +Convert.ToDateTime(tbenddate.Text) + "'", s);
        s.Open();
        DataTable ds = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        gvattendence.DataSource = ds;
        gvattendence.DataBind();
        s.Close();
    }

    protected void tbroll_TextChanged(object sender, EventArgs e)
    {
        getsection();
        SqlCommand cmd = new SqlCommand("select subject from studenttimetable where semster='" + Convert.ToInt16(ViewState["semster"].ToString()) + "' and department='" + ViewState["department"].ToString() + "' and course='" + ViewState["course"].ToString() + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ddlsubject.Items.Add(sdr["subject"].ToString());
        }
        s.Close();
    }
    protected void gvattendence_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            Label lbdate = (Label)e.Row.Cells[1].FindControl("lbdate");
            lbdate.Text = Convert.ToDateTime(lbdate.Text).ToString("MM/dd/yyyy");
            Label lblPresent = (Label)e.Row.Cells[2].FindControl("lblpresent");
            RadioButton rbPresent = (RadioButton)e.Row.Cells[2].FindControl("rbpresent");
            RadioButton rbabsent = (RadioButton)e.Row.Cells[3].FindControl("rbabsent");
            string strPresent=lblPresent.Text;
            if (strPresent.Contains(tbroll.Text.Trim())){
                rbPresent.Checked = true;
                rbabsent.Checked=false;
            }
            else{
                rbabsent.Checked = true;
                rbPresent.Checked = false;
            }
            
        }
    }
}