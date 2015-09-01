using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class student_placementnews : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
            plform.Visible = false;
        }
        if(rbalreadyfillform.Checked==true)
        {
            Response.Redirect("~/student/placementnews1.aspx");
        }
        if(rbfillform.Checked==true)
        {
            plform.Visible = true;
        }
    }

    protected void btncheck_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("select name,email,phone,department,course from student where roll='" + Convert.ToInt64(tbrollno.Text) + "'", s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lbname.Text = sdr["name"].ToString();
                lbemail.Text = sdr["email"].ToString();
                lbcontact.Text = sdr["phone"].ToString();
                lbdepartment.Text = sdr["department"].ToString();
                lbcourse.Text = sdr["course"].ToString();
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('INvalid Roll Number')", true);
            }
            s.Close();
        }
        catch(Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('" + ex.Message + "')", true);
        }
    }

    private long checkstudent()
    {
        
        long value = 0;
        SqlCommand cmd = new SqlCommand("select rollno from acedemic where rollno='"+Convert.ToInt64(tbrollno.Text)+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            value = Convert.ToInt64(sdr["rollno"].ToString());
        }
        s.Close();
        return value;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (checkstudent() == 0)
        {
            if (tbgraduationbacklogs.Text.Trim() == string.Empty)
            {
                tbgraduationbacklogs.Text = "0";
            }
            if (tbpostgraduationbacklogs.Text.Trim() == string.Empty)
            {
                tbpostgraduationbacklogs.Text = "0";
            }
            if (tbpostgraduation.Text.Trim() != string.Empty)
            {
                SqlCommand cmd = new SqlCommand("insert into acedemic(name,rollno,email,phone,tenth,tweleve,graduation,postgraduation,gradback,postgradback,department) values('" + lbname.Text + "','" + Convert.ToInt64(tbrollno.Text) + "','" + lbemail.Text + "','" + Convert.ToInt64(lbcontact.Text) + "','" + Convert.ToInt64(tbtenth.Text) + "','" + Convert.ToInt64(tbtwelve.Text) + "','" + Convert.ToInt64(tbgraduation.Text) + "','" + Convert.ToInt64(tbpostgraduation.Text) + "','" + Convert.ToInt16(tbgraduationbacklogs.Text) + "','" + Convert.ToInt16(tbpostgraduationbacklogs.Text) + "','" + lbdepartment.Text + "')", s);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully submitted')", true);
                tbtenth.Text = "";
                tbtwelve.Text = "";
                tbgraduation.Text = "";
                tbgraduationbacklogs.Text = "";
                tbpostgraduation.Text = "";
                tbpostgraduationbacklogs.Text = "";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into acedemic(name,rollno,email,phone,tenth,tweleve,graduation,gradback,department,course) values('" + lbname.Text + "','" + Convert.ToInt64(tbrollno.Text) + "','" + lbemail.Text + "','" + Convert.ToInt64(lbcontact.Text) + "','" + Convert.ToInt64(tbtenth.Text) + "','" + Convert.ToInt64(tbtwelve.Text) + "','" + Convert.ToInt64(tbgraduation.Text) + "','" + Convert.ToInt64(tbgraduationbacklogs.Text) + "','" + lbdepartment.Text + "','"+lbcourse.Text+"')", s);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully submitted')", true);
                tbtenth.Text = "";
                tbtwelve.Text = "";
                tbgraduation.Text = "";
                tbgraduationbacklogs.Text = "";
                tbpostgraduation.Text = "";
                tbpostgraduationbacklogs.Text = "";
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Already inserted data!!!')", true);
        }
    }

}