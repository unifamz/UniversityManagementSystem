using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_astudenttimetable : System.Web.UI.Page
{
    SqlConnection s;
    static int i = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
            
            pltimetable.Visible = false;
            SqlCommand cmd = new SqlCommand("select distinct department from courses",s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while(sdr.Read())
            {
                ddldepartment.Items.Add(sdr["department"].ToString());
            }
            s.Close();
        }
        if(ddlday.SelectedValue!="0")
        {
            lblectureno.Text = i.ToString();
            i++;
            pltimetable.Visible = true ;
        }
    }

    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlcourse.Items.Clear();
        ddlcourse.Items.Add("---Select Course---");
        SqlCommand cmd = new SqlCommand("select distinct course from courses where department='"+ddldepartment.SelectedItem.Text+"'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ddlcourse.Items.Add(sdr["course"].ToString());
        }
        s.Close();
    }

    protected void btninsert_Click(object sender, EventArgs e)
    {
        if (i <= Convert.ToInt16(tbtotallectures.Text))
        {
            if (getstudenttimetable() == 0)
            {
                if (getclassroom() == 0)
                {
                    SqlCommand cmd = new SqlCommand("insert into studenttimetable(department,course,semster,section,day,lectureno,timing,subject,classroom) values('" + ddldepartment.SelectedItem + "','" + ddlcourse.SelectedItem + "','" + ddlsemster.SelectedItem.Value + "','" + ddlsection.SelectedItem.Value + "','" + ddlday.SelectedItem + "','" + Convert.ToInt16(lblectureno.Text) + "','" + tbtiming.Text + "','" + tbsubject.Text + "','" + tbclassroom.Text + "')", s);
                    s.Open();
                    cmd.ExecuteNonQuery();
                    s.Close();
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Inserted timetable of " + ddlday.SelectedItem.Text + "!!!')", true);
                    //tblectureno.Text = "";
                    lblectureno.Text = i.ToString();
                    tbsubject.Text = "";
                    tbclassroom.Text = "";
                    tbtiming.Text = "";
                    i++;
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Already Assigned classroom at " + tbtiming.Text + "...please choose another class!!!')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Already Submitted timetable of " + ddlday.SelectedItem.Text + "!!!')", true);
            }
        }
    }

    private int getstudenttimetable()
    {
        int value = 0;
        SqlCommand cmd = new SqlCommand("select id from studenttimetable where course='"+ddlcourse.SelectedItem.Text+"' and semster='"+ddlsemster.SelectedItem.Text+"' and section='"+ddlsection.SelectedItem.Text+"' and day='"+ddlday.SelectedItem.Text+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            value = Convert.ToInt16(sdr["id"].ToString());
        }
        s.Close();
        return value;
    }

    private int getclassroom()
    {
        int value = 0;
        SqlCommand cmd = new SqlCommand("select id from studenttimetable where timing='"+tbtiming.Text+"' and classroom='"+tbclassroom.Text+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            value =Convert.ToInt16(sdr["id"].ToString());
        }
        s.Close();
        return value;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (i > Convert.ToInt16(tbtotallectures.Text))
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Submitted Whole week timetable!!!')", true);
            ddldepartment.SelectedItem.Value = "0";
            ddlcourse.SelectedItem.Value = "0";
            ddlday.SelectedItem.Value = "0";
            ddlsemster.SelectedItem.Value = "0";
            ddlsection.SelectedItem.Value = "0";
            pltimetable.Visible = false;
        }
        else
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please insert all lectures of day"+ddlday.SelectedItem.Text+"!!!')", true);
    }

}