using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class admin_acourses : System.Web.UI.Page
{
    SqlConnection s;
    static int section = 2;

    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if (!IsPostBack)
            plroll.Visible = false;
    }

    private int getcourse()
    {
        int value = 0;
        SqlCommand cmd = new SqlCommand("select id from courses where course='" + tbcourse.Text + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            value = Convert.ToInt16(sdr["id"].ToString());
        }
        s.Close();
        return value;
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (section > Convert.ToInt16(tbsections.Text))
        {
            if (getcourse() == 0)
            {
                SqlCommand cmd = new SqlCommand("insert into courses(department,course,seats,section,studentssection)  values('" + tbdepartment.Text + "','" + tbcourse.Text + "','" + Convert.ToInt16(tbtotalseats.Text) + "','" + Convert.ToInt16(tbsections.Text) + "','" + Convert.ToInt16(lbstudentpersection1.Text) + "')", s);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Submitted')", true);
                section = 2;
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Already insert seats for " + tbcourse.Text + "!!!')", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('First insert Roll No Range of all sections')", true);
        }
    }

    protected void btnshowgrid_Click(object sender, EventArgs e)
    {

    }

    protected void btnlistshow_Click(object sender, EventArgs e)
    {
        // plgridview.Visible = true;
    }

    private int matchdata()
    {
        int value = 0;
        SqlCommand cmd = new SqlCommand("select section from courses where department='"+tbdepartment.Text+"' and course ='"+tbcourse.Text+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            value = Convert.ToInt16(sdr["section"].ToString());
        }
        s.Close();
        return value;
    }

    protected void btninsert_Click(object sender, EventArgs e)
    {
        if (matchdata() == 0)
        {
            SqlCommand cmd = new SqlCommand("insert into sectionroll(department,course,section,rangeroll) values('" + tbdepartment.Text + "','" + tbcourse.Text + "','" + lblsection.Text + "','" + tbrangeroll.Text + "')", s);
            s.Open();
            cmd.ExecuteNonQuery();
            s.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Insert Roll No Range of " + tbrangeroll.Text + "')", true);
            tbrangeroll.Text = "";
            if (section <= Convert.ToInt16(tbsections.Text))
            {
                lblsection.Text = section.ToString();
                section++;
            }
            else
            {
                plroll.Visible = false;
                
            }
        }
        else
        {
            plroll.Visible = false;
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Already Inserted Range roll no.!!!')", true);
        }
    }

    protected void tbsections_TextChanged(object sender, EventArgs e)
    {
        lblsection.Text = "1";
        lbstudentpersection1.Text = (Convert.ToInt16(tbtotalseats.Text) / Convert.ToInt16(tbsections.Text)).ToString();
        plroll.Visible = true;
    }

    protected void gvlist_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType==DataControlRowType.DataRow)
        {
            s.Open();
            GridView gv = (GridView)e.Row.FindControl("gvchildlist");
            string department = e.Row.Cells[1].Text;
            string course = System.Web.HttpUtility.HtmlDecode(e.Row.Cells[2].Text);
            SqlCommand cmd = new SqlCommand("select section,rangeroll from sectionroll where department='"+department+"' and course='"+course+"'",s);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            s.Close();
            gv.DataSource = ds;
            gv.DataBind();
        }
    }

}
