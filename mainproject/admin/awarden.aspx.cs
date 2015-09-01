using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_awarden : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
    }
    protected void btnwardesubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (selectid() != Convert.ToInt64(tbwardenid.Text))
            {
                if (tbpassword.Text.Trim() == tbretypepassword.Text.Trim())
                {
                    string name = tbfirstname.Text + " " + tbmiddlename.Text + " " + tblastname.Text;
                    SqlCommand cmd = new SqlCommand("insert into warden(warden_id,name,password) values('" + Convert.ToInt64(tbwardenid.Text) + "','" + name + "','" + tbpassword.Text + "')", s);
                    s.Open();
                    cmd.ExecuteNonQuery();
                    s.Close();
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully submitted name=" + name + "')", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Password not match!!!')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Warden ID already exsits!!!')", true);
            }
        }
        catch(Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('" + ex.Message + "')", true);
        }   
    }

    private long selectid()
    {
        long wardenid = 0;
        //string rollshow = null, course=null;
        SqlCommand cmd = new SqlCommand("select warden_id from warden where warden_id='" + Convert.ToInt64(tbwardenid.Text) + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            wardenid = Convert.ToInt64(sdr["warden_id"].ToString());
        }
        //if(rollshow==null&& )
        s.Close();
        return wardenid;
    }
}