using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class admin_ateacher : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        GridView1.Visible = false;
    }
    protected void btngridview_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }
    protected void btnteacherid_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt64(tbteacherid.Text) != selectid())
            {
                if (tbpassword.Text.Trim() == tbretypepassword.Text.Trim())
                {
                    string name = tbfirstname.Text + " " + tbmiddlename.Text + " " + tblastname.Text;
                    SqlCommand cmd = new SqlCommand("insert into register(name,designation,id1,password) values('" + name + "','" + ddldesignation.SelectedItem + "','" + Convert.ToInt64(tbteacherid.Text) + "','" + tbpassword.Text + "')", s);
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
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Teacher ID already exists!!!')", true);
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
        SqlCommand cmd = new SqlCommand("select id1 from register where id1='" + Convert.ToInt64(tbteacherid.Text) + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            roll = Convert.ToInt64(sdr["id1"].ToString());
        }
        //if(rollshow==null&& )
        s.Close();
        return roll;
    }
}