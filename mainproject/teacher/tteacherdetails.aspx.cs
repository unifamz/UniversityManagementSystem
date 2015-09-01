using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class teacher_tteacherdetails : System.Web.UI.Page
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
            if (tbteacherid.Text.Trim() != string.Empty && tbname.Text.Trim() == string.Empty)
            {
                plteacherlist.Visible = false;
                SqlCommand cmd = new SqlCommand("select * from register where id1='" + Convert.ToInt64(tbteacherid.Text) + "'", s);
                s.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    plgrid.Visible = true;
                    lbname.Text = sdr["name"].ToString();
                    lbteacheridshow.Text = sdr["id1"].ToString();
                    lbemail.Text = sdr["email"].ToString();
                    lbaddress.Text = sdr["address"].ToString();
                    lbstate.Text = sdr["state"].ToString();
                    lbcity.Text = sdr["city"].ToString();
                    lbpincode.Text = sdr["pincode"].ToString();
                    lbbirthday.Text = sdr["birthday"].ToString();
                    lbcontact.Text = sdr["phone"].ToString();
                    lbgender.Text = sdr["sex"].ToString();
                    lbdesignation.Text = sdr["designation"].ToString();
                    imgphoto.ImageUrl = "~/" + sdr["imagepath"].ToString();
                }
                else
                {
                    plgrid.Visible = false;
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Teacher detail not found by Teacher ID')", true);
                }
                s.Close();
            }
            else if (tbteacherid.Text.Trim() == string.Empty && tbname.Text.Trim() != string.Empty)
            {
                plgrid.Visible = false;
                SqlCommand cmd = new SqlCommand("select id1,name,email,phone from register where name like '%" + tbname.Text + "%'", s);
                s.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(ds);
                if (ds == null)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Teacher detail not found by name')", true);
                }
                else
                {
                    plteacherlist.Visible = true;
                    gvteacherlist.DataSource = ds;
                    gvteacherlist.DataBind();
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
        long id = Convert.ToInt64(gvteacherlist.SelectedRow.Cells[1].Text);
        plteacherlist.Visible = false;
        plgrid.Visible = true;
        SqlCommand cmd = new SqlCommand("select * from register where id1='" + id + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            plgrid.Visible = true;
            lbname.Text = sdr["name"].ToString();
            lbteacheridshow.Text = sdr["id1"].ToString();
            lbemail.Text = sdr["email"].ToString();
            lbaddress.Text = sdr["address"].ToString();
            lbstate.Text = sdr["state"].ToString();
            lbcity.Text = sdr["city"].ToString();
            lbpincode.Text = sdr["pincode"].ToString();
            lbbirthday.Text = sdr["birthday"].ToString();
            lbcontact.Text = sdr["phone"].ToString();
            lbgender.Text = sdr["sex"].ToString();
            lbdesignation.Text = sdr["designation"].ToString();
            imgphoto.ImageUrl = "~/" + sdr["imagepath"].ToString();
        }
        else
        {
            plgrid.Visible = false;
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Teacher detail not found')", true);
        }
        s.Close();
    }
}