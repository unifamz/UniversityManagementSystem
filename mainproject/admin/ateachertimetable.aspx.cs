using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_ateachertimetable : System.Web.UI.Page
{
    SqlConnection s;
    //Button btnsubmit;
    TextBox tblecture;
    TextBox tbtiming;
    TextBox tbroom;
    TextBox tbclass;
    static int check = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
       
        if(!IsPostBack)
        {
            plassigntimetable.Visible = false;
            SqlCommand cmd = new SqlCommand("select distinct department from courses",s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while(sdr.Read())
            {
                ddldepartment.Items.Add(sdr["department"].ToString());
            }
            s.Close();
        }
        if (tbcreatetextboxes.Text.Trim()!=string.Empty)
        {
            for (int i = 1; i <= Convert.ToInt16(tbcreatetextboxes.Text); i++)
            {
                tblecture = new TextBox();
                tbtiming = new TextBox();
                tbroom = new TextBox();
                tbclass = new TextBox();
                tblecture.ID = "tblecture" + i.ToString();
                tblecture.CssClass = "form-control";

                tbtiming.ID = "tbtiming" + i.ToString();
                tbtiming.CssClass = "form-control";

                tbroom.ID = "tbroom" + i.ToString();
                tbroom.CssClass = "form-control";

                tbclass.ID = "tbclass" + i.ToString();
                tbclass.CssClass = "form-control";

                divlecture.Controls.Add(tblecture);
                divlecture.Controls.Add(new LiteralControl("<BR>"));

                divtiming.Controls.Add(tbtiming);
                divtiming.Controls.Add(new LiteralControl("<BR>"));

                divclass.Controls.Add(tbroom);
                divclass.Controls.Add(new LiteralControl("<BR>"));

                divclass1.Controls.Add(tbclass);
                divclass1.Controls.Add(new LiteralControl("<BR>"));
            }
        }
        else
        {
            check = 0;
        }
    }

    private string checkdataexist()
    {
        string value=null;
        SqlCommand cmd = new SqlCommand("select day from teachertimetable where teacherid='"+Convert.ToInt64(tbteacherid.Text)+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            value = sdr["day"].ToString();
        }
        s.Close();
        return value;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (checkdataexist()!=ddlday.SelectedItem.Text)
        {
            if (ddldepartment.SelectedItem.Text != "---Select Department---" && ddlcourse.SelectedItem.Text != "---Select Course---" && ddlday.SelectedItem.Text != "---Select Day---")
            {
                for (int i = 1; i <= Convert.ToInt16(ViewState["totaltextboxes"].ToString()); i++)
                {
                    TextBox tblecture1 = (TextBox)divlecture.FindControl("tblecture" + i.ToString());
                    TextBox tbtiming1 = (TextBox)divtiming.FindControl("tbtiming" + i.ToString());
                    TextBox tbroom1 = (TextBox)divclass.FindControl("tbroom" + i.ToString());
                    TextBox tbclass1 = (TextBox)divclass1.FindControl("tbclass" + i.ToString());
                    SqlCommand cmd = new SqlCommand("insert into teachertimetable(teacherid,name,department,course,day,lectureno,timing,roomno,class,subject) values('" + Convert.ToInt64(tbteacherid.Text) + "','" + lbname.Text + "','" + ddldepartment.SelectedItem + "','" + ddlcourse.SelectedItem + "','" + ddlday.SelectedItem + "','" + Convert.ToInt16(tblecture1.Text) + "','" + tbtiming1.Text + "','" + tbroom1.Text + "', '" + tbclass1.Text + "','"+tbsubject.Text+"')", s);
                    s.Open();
                    cmd.ExecuteNonQuery();
                    s.Close();
                }
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Submitted!!!')", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please select valid data!!!')", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Already Assign Time Table!!!')", true);
        }
    }
    
    protected void btncreate_Click(object sender, EventArgs e)
    {
        ViewState["totaltextboxes"] = Convert.ToInt16(tbcreatetextboxes.Text);
        divtextboxcreate.Visible = false;
        check = 1;
    }
    
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select name from register where id1='" + Convert.ToInt64(tbteacherid.Text) + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            lbname.Text = sdr["name"].ToString();
            plassigntimetable.Visible = true;
            
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Invalid teacher ID!!!')", true);
        }
        s.Close();
    }

    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlcourse.Items.Clear();
        ddlcourse.Items.Add("---Select Course---");
        SqlCommand cmd = new SqlCommand("select distinct course from courses where department='"+ddldepartment.SelectedItem.Text+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            ddlcourse.Items.Add(sdr["course"].ToString());
        }
        s.Close();
    }

    protected void ddlcourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlday.Items.Clear();
        ddlday.Items.Add("---Select Day---");
        string[] days = System.Globalization.DateTimeFormatInfo.CurrentInfo.DayNames;
        foreach(string s in days)
        {
            ddlday.Items.Add(s);
        }
    }
}