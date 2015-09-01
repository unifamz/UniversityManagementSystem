using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class student_filecomplaint : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        lbcomplaintdateshow.Text = DateTime.Now.ToLongDateString();
        if (!IsPostBack)
        {
            gvcomplaintlist.Visible = false;
        }
    }
    protected void btnshow_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select name from student where roll='"+Convert.ToInt64(tbroll.Text)+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            lbnameshow.Text = sdr["name"].ToString();
        }
        s.Close();
    }
    protected void btnshowgrid_Click(object sender, EventArgs e)
    {
        gvcomplaintlist.Visible = true;
      //  SqlCommand cmd = new SqlCommand("select complaintfulfill,completiondate from complaint",s);
      //  s.Open();
      //  SqlDataReader sdr = cmd.ExecuteReader();
      //for(int i=0;i<sdr.VisibleFieldCount;i++)
      //{
      //    TextBox cf = (TextBox)gvcomplaintlist.Rows[i].Cells[5].FindControl("tbcomplaintfullfill");
      //    cf.Text = sdr["complaintfulfill"].ToString();
      //}
      //s.Close();
    }
    protected void gvcomplaintlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        //for (int i = 0; i < gvcomplaintlist.Rows.Count; i++)
        
          
            TextBox tbcomplaintfulfill = (TextBox)gvcomplaintlist.SelectedRow.Cells[5].FindControl("tbcomplaintfullfill");
            TextBox tbcompletiondate = (TextBox)gvcomplaintlist.SelectedRow.Cells[6].FindControl("tbcompletiondate");
            string description = Convert.ToString(gvcomplaintlist.SelectedRow.Cells[4].Text);
            if (tbcomplaintfulfill.Text.Trim() != string.Empty && tbcompletiondate.Text.Trim() != string.Empty || tbcomplaintfulfill.Text.Trim() == string.Empty && tbcompletiondate.Text.Trim() == string.Empty)
            {
                if (tbcomplaintfulfill.Text.Trim() == "yes" || tbcomplaintfulfill.Text.Trim() == "YES" || tbcomplaintfulfill.Text.Trim() == "no" || tbcomplaintfulfill.Text.Trim() == "NO")
                {
                    SqlCommand cmd = new SqlCommand("update complaint set complaintfulfill='" + tbcomplaintfulfill.Text + "', completiondate='" + tbcompletiondate.Text + "' where description='" + description + "'", s);
                    s.Open();
                    cmd.ExecuteNonQuery();
                    s.Close();
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please insert only yes or no in complaint fulfill')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please insert Complaint fulfill column or completion date column of complaint details='" + gvcomplaintlist.SelectedRow.Cells[4].Text + "'!!!!')", true);
            }

            


        
    }
}