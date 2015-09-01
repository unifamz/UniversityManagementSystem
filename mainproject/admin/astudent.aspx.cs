using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_astudent : System.Web.UI.Page
{
    SqlConnection s;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }
    protected void btnassignroll_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt64(tbroll.Text) != selectid())
            {
                if (tbpassword.Text.Trim() == tbretypepassword.Text.Trim())
                {
                    string name = tbfirstname.Text + " " + tbmiddlename.Text + " " + tblastname.Text;
                    SqlCommand cmd = new SqlCommand("insert into student(name,department,roll,password,course) values('" + name + "','" + ddldepartment.SelectedItem + "','" + Convert.ToInt64(tbroll.Text) + "','" + tbpassword.Text + "','"+ddlcourse.SelectedItem+"')", s);
                    s.Open();
                    cmd.ExecuteNonQuery();
                    s.Close();
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully submitted')", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Password not match!!!')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Student Roll No  already exists!!!')", true);
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('" + ex.Message + "')", true);
        }
    }
    private long selectid()
    {
        long roll = 0;
        //string rollshow = null, course=null;
        SqlCommand cmd = new SqlCommand("select roll from student where roll='"+Convert.ToInt64(tbroll.Text)+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            roll =Convert.ToInt64(sdr["roll"].ToString());
        }
        //if(rollshow==null&& )
        s.Close();
        return roll;
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
}