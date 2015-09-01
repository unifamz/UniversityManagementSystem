using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;

public partial class teacher_tassignment : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int day = 1; day < 32; day++)
            {
                ListItem li = new ListItem();
                li.Text = day.ToString();
                li.Value = day.ToString();
                ddlassignmentdate.Items.Add(li);
                ddlsubmissiondate.Items.Add(li);
            }
            DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
            for (int month = 1; month < 13; month++)
            {
                ListItem li = new ListItem();
                li.Text = dtfi.GetMonthName(month);
                li.Value = month.ToString();
                ddlassignmentmonth.Items.Add(li);
                ddlsubmissionmonth.Items.Add(li);
            }
            int thisYear = System.DateTime.Now.Year;
            int startYear = thisYear;
            for (int year = startYear; year > startYear - 5; year--)
            {
                ListItem li = new ListItem();
                li.Text = year.ToString();
                li.Value = year.ToString();
                ddlassignmentyear.Items.Add(li);
                ddlsubmissionyear.Items.Add(li);
            }
        }
    }

    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        gvshowlist.Visible = false;

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string filepath = flupassignment.PostedFile.FileName;
            string filename = Path.GetFileName(filepath);
            string ext = Path.GetExtension(filename);
            string content = string.Empty;
            if (!flupassignment.HasFile)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please select File!!!')", true);
            }
            else
            {
                switch (ext)
                {
                    case ".doc":
                        content = "application/vnd.ms-word";
                        break;
                    case ".docx":
                        content = "application/vnd.ms-word";
                        break;
                    case ".txt":
                        content = "application/Text";
                        break;
                    case ".excel":
                        content = "application/vnd.ms-excel";
                        break;
                    case ".jpg":
                        content = "image/jpg";
                        break;
                    case ".pdf":
                        content = "application/pdf";
                        break;
                    default:
                        ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Invalid extension file!!!')", true);
                        break;
                }
            }
            if (content != string.Empty)
            {
                Stream fs = flupassignment.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bt = br.ReadBytes((Int32)fs.Length);
                string ad = ddlassignmentdate.SelectedItem + "/" + ddlassignmentmonth.SelectedItem + "/" + ddlassignmentyear.SelectedItem;
                string sd = ddlsubmissiondate.SelectedItem + "/" + ddlsubmissionmonth.SelectedItem + "/" + ddlsubmissionyear.SelectedItem;
                if (Convert.ToInt16(ddlassignmentdate.SelectedValue) < Convert.ToInt16(ddlsubmissiondate.SelectedValue) || Convert.ToInt16(ddlassignmentmonth.SelectedValue) < Convert.ToInt16(ddlsubmissionmonth.SelectedValue) || Convert.ToInt16(ddlassignmentyear.SelectedValue)<= Convert.ToInt16(ddlsubmissionyear.SelectedValue))
                {
                    s.Open();
                    SqlCommand cmd = new SqlCommand("insert into assignment(number,subject,adate,submit,teacher,afile,filename,ext) values(@number,@subject,@adate,@submit,@teacher,@afile,@filename,@ext)", s);
                    cmd.Parameters.Add("@number", Convert.ToInt64(tbassignmentnumber.Text));
                    cmd.Parameters.Add("@subject", tbsubject.Text);
                    cmd.Parameters.Add("@adate", ad);
                    cmd.Parameters.Add("@submit", sd);
                    cmd.Parameters.Add("@teacher", tbteachername.Text);
                    cmd.Parameters.Add("@filename", SqlDbType.VarChar).Value = filename;
                    cmd.Parameters.Add("@afile", SqlDbType.VarBinary).Value = bt;
                    cmd.Parameters.Add("@ext", SqlDbType.VarChar).Value = content;
                    cmd.ExecuteNonQuery();
                    s.Close();
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfuly Upload Assignment!!!')", true);
                    //Response.Redirect("tassignment.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Submission Date must be smaller than Assignment Date!!!')", true);
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('" + ex.Message + "')", true);
        }
    }
    protected void gvshowlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        s.Open();
        SqlCommand cmd = new SqlCommand("delete  from assignment where id='" + gvshowlist.SelectedRow.Cells[1].Text + "'", s);
        cmd.ExecuteNonQuery();
        s.Close();
        Response.Redirect("tassignment.aspx");
    }
    protected void btngrid_Click(object sender, EventArgs e)
    {
        gvshowlist.Visible = true;
    }
}