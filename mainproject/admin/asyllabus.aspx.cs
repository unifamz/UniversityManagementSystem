using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_asyllabus : System.Web.UI.Page
{
    SqlConnection s;
    Label lbno;
    TextBox tbsubject;
    TextBox tbinternalmarks;
    TextBox tbexternalmarks;

    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if (!IsPostBack)
        {
            lbnumber.Visible = false;
            lbsubject.Visible = false;
            lbinternalmarks.Visible = false;
            lbexternalmarks.Visible = false;
            SqlCommand cmd = new SqlCommand("select distinct department from courses", s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                ddldepartment.Items.Add(sdr["department"].ToString());
            }
            s.Close();
        }
        if (tbtotalsubjects.Text.Trim() != string.Empty)
        {
            lbnumber.Visible = true;
            lbsubject.Visible = true;
            lbinternalmarks.Visible = true;
            lbexternalmarks.Visible = true;
            tbtotalsubjects.Enabled = false;
            btnclick.Enabled = false;
            for (int i = 1; i <= Convert.ToInt16(tbtotalsubjects.Text); i++)
            {
                lbno = new Label();
                tbsubject = new TextBox();
                tbinternalmarks = new TextBox();
                tbexternalmarks = new TextBox();

                lbno.ID = "lbno" + i.ToString();
                lbno.CssClass = "form-control";

                tbsubject.ID = "tbsubject" + i.ToString();
                tbsubject.CssClass = "form-control";

                tbinternalmarks.ID = "tbinternalmarks" + i.ToString();
                tbinternalmarks.CssClass = "form-control";

                tbexternalmarks.ID = "tbexternalmarks" + i.ToString();
                tbexternalmarks.CssClass = "form-control";

                divno.Controls.Add(lbno);
                divno.Controls.Add(new LiteralControl("<BR>"));

                divsubject.Controls.Add(tbsubject);
                divsubject.Controls.Add(new LiteralControl("<BR>"));

                divinternalmarks.Controls.Add(tbinternalmarks);
                divinternalmarks.Controls.Add(new LiteralControl("<BR>"));

                divexternalmarks.Controls.Add(tbexternalmarks);
                divexternalmarks.Controls.Add(new LiteralControl("<BR>"));
            }
        }
    }
    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlcourse.Items.Clear();
        ddlcourse.Items.Add("---Select Course---");
        SqlCommand cmd = new SqlCommand("select distinct course from courses where department='" + ddldepartment.SelectedItem.Text + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ddlcourse.Items.Add(sdr["course"].ToString());
        }
        s.Close();
    }
    protected void btnclick_Click(object sender, EventArgs e)
    {
        for(int i=1;i<=Convert.ToInt16(tbtotalsubjects.Text);i++)
        {
            Label lbno = (Label)divno.FindControl("lbno" + i.ToString());
            lbno.Text = "No." + i;
        }
    }

    private int checkdata(int i)
    {
        int value = 0;
        TextBox tbsubject1=(TextBox)divsubject.FindControl("tbsubject"+i.ToString());
        SqlCommand cmd = new SqlCommand("select subject_name from syllabus where department ='"+ddldepartment.SelectedItem.Text+"' and course='"+ddlcourse.SelectedItem.Text+"' and semster='"+Convert.ToInt16(tbsemester.Text)+"' and subject_name='"+tbsubject1.Text+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            value = 1;
        }
        s.Close();
        return value;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int a = 0;
        if (ddldepartment.SelectedIndex != 0 && ddlcourse.SelectedIndex != 0 && tbsemester.Text.Trim() != string.Empty && tbtotalsubjects.Text.Trim() != string.Empty)
        {
            for (int i = 1; i <= Convert.ToInt16(tbtotalsubjects.Text); i++)
            {
                TextBox tbsubject1 = (TextBox)divsubject.FindControl("tbsubject" + i.ToString());
                TextBox tbinternalmarks1 = (TextBox)divinternalmarks.FindControl("tbinternalmarks" + i.ToString());
                TextBox tbexternalmarks1 = (TextBox)divexternalmarks.FindControl("tbexternalmarks" + i.ToString());
                if (checkdata(i)==0)
                {
                    SqlCommand cmd = new SqlCommand("insert into syllabus(department,course,semster,subject_name,sessional_marks,internal_marks,external_marks) values('" + ddldepartment.SelectedItem + "','" + ddlcourse.SelectedItem.Text + "','" + Convert.ToInt16(tbsemester.Text) + "','" + tbsubject1.Text + "','"+Convert.ToInt16(tbsessionalmarks.Text)+"','"+Convert.ToInt16(tbinternalmarks1.Text)+"','"+Convert.ToInt16(tbexternalmarks1.Text)+"')", s);
                    s.Open();
                    cmd.ExecuteNonQuery();
                    s.Close();
                    a++;
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Already inserted!!!')", true);
                }
            }
            if (a != 0)
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Submitted!!!')", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please Fill all entries!!!')", true);
        }
    }
}
