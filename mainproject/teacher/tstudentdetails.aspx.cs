using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class teacher_tstudentdetails : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
    }

    protected void btnsearch_Click(object sender, EventArgs e)
    {
        try
        {
            if (tbroll.Text.Trim() != string.Empty && tbname.Text.Trim() == string.Empty)
            {
                plstudentlist.Visible = false;
                SqlCommand cmd = new SqlCommand("select * from student where roll='" + Convert.ToInt64(tbroll.Text) + "'", s);
                s.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    plgrid.Visible = true;
                    lbname.Text = sdr["name"].ToString();
                    lbrollshow.Text = sdr["roll"].ToString();
                    lbemail.Text = sdr["email"].ToString();
                    lbaddress.Text = sdr["address"].ToString();
                    lbstate.Text = sdr["state"].ToString();
                    lbcity.Text = sdr["city"].ToString();
                    lbpincode.Text = sdr["pincode"].ToString();
                    lbbirthday.Text = sdr["birthday"].ToString();
                    lbcontact.Text = sdr["phone"].ToString();
                    lbgender.Text = sdr["sex"].ToString();
                    lbdepartment.Text = sdr["department"].ToString();
                    lbcourse.Text = sdr["course"].ToString();
                    imgphoto.ImageUrl = "~/" + sdr["imagepath"].ToString();
                }
                else
                {
                    plgrid.Visible = false;
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Student detail not found by Roll number')", true);
                }
                s.Close();
            }
            else if (tbroll.Text.Trim() == string.Empty && tbname.Text.Trim() != string.Empty)
            {
                plgrid.Visible = false;
                SqlCommand cmd = new SqlCommand("select roll,name,email,phone from student where name like '%" + tbname.Text + "%'", s);
                s.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                if (ds == null)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Student detail not found by name')", true);
                }
                else
                {
                    plstudentlist.Visible = true;
                    gvstudentlist.DataSource = ds;
                    gvstudentlist.DataBind();
                }
                s.Close();
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please Only enter value on one textbox at a time!!!')", true);
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('" + ex.Message + "')", true);
        }
    }

    protected void gvstudentlist_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='black';";
            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='aquamarine';";
            e.Row.ToolTip = "click last column for selecting this row.";
        }
    }

    protected void gvstudentlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        long roll = Convert.ToInt64(gvstudentlist.SelectedRow.Cells[1].Text);
        plstudentlist.Visible = false;
        plgrid.Visible = true;
        SqlCommand cmd = new SqlCommand("select * from student where roll='" + roll + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            plgrid.Visible = true;
            lbname.Text = sdr["name"].ToString();
            lbrollshow.Text = sdr["roll"].ToString();
            lbemail.Text = sdr["email"].ToString();
            lbaddress.Text = sdr["address"].ToString();
            lbstate.Text = sdr["state"].ToString();
            lbcity.Text = sdr["city"].ToString();
            lbpincode.Text = sdr["pincode"].ToString();
            lbbirthday.Text = sdr["birthday"].ToString();
            lbcontact.Text = sdr["phone"].ToString();
            lbgender.Text = sdr["sex"].ToString();
            lbdepartment.Text = sdr["department"].ToString();
            lbcourse.Text = sdr["course"].ToString();
            imgphoto.ImageUrl = "~/" + sdr["imagepath"].ToString();
        }
        else
        {
            plgrid.Visible = false;
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Student detail not found')", true);
        }
        s.Close();
    }
}