using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data;

public partial class teacher_tplacementnews : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        lbdate.Text = System.DateTime.Now.Date.ToShortDateString();
        if (!IsPostBack)
        {
           plcondition.Visible = false;
            SqlCommand cmd = new SqlCommand("select distinct department from courses", s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                lbdepartment.Items.Add(sdr["department"].ToString());
            }
            s.Close();
        }
        if (rbyes.Checked == true)
        {
            plcondition.Visible = true;
        }
        if (rbno.Checked == true)
        {
            plcondition.Visible = false;
        }
    }

    protected void lbdepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbcourse.Items.Clear();
        //lbcourse.Items.Add("---Select Course---");
        foreach (ListItem item in lbdepartment.Items)
        {
            if (item.Selected)
            {
                SqlCommand cmd = new SqlCommand("select distinct course from courses where department='" + item + "'", s);
                s.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    lbcourse.Items.Add(sdr["course"].ToString());
                }
                s.Close();
            }
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string department = "";
        string course = "";
        foreach (ListItem lidepartment in lbdepartment.Items)
        {
            if (lidepartment.Selected)
            {
                department += lidepartment.Text + ",";
            }
        }
        foreach (ListItem licourse in lbcourse.Items)
        {
            if (licourse.Selected)
            {
                course += licourse.Text + ",";
            }
        }
        string filepath = fudocument.PostedFile.FileName;
        string filename = Path.GetFileName(filepath);
        string ext = Path.GetExtension(filename);
        string content = string.Empty;
        if (!fudocument.HasFile)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('please Select File!!!')", true);
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
                    content = "application/vnd.msexcel";
                    break;
                case ".jpg":
                    content = "image/jpg";
                    break;
                case ".pdf":
                    content = "application/pdf";
                    break;
                default:
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Invalid Extension Name')", true);
                    break;
            }
        }
        if (content != string.Empty)
        {
            Stream fs = fudocument.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            Byte[] bt = br.ReadBytes((Int32)fs.Length);
            SqlCommand cmd = new SqlCommand("insert into placement(department,course,title,pdate,information,ten,tweleve,pext,graduation,backlog,companydate,pdocument,pfilename) values(@department,@course,@title,@pdate,@information,@ten,@tweleve,@pext,@graduation,@backlog,@companydate,@pdocument,@pfilename)", s);
            cmd.Parameters.Add("@department", department);
            cmd.Parameters.Add("@course", course);
            cmd.Parameters.Add("@title", tbtitle.Text);
            cmd.Parameters.Add("@pdate", lbdate.Text);
            cmd.Parameters.Add("@information", tbinformation.Text);
            cmd.Parameters.Add("@ten", Convert.ToInt16(tbtenth.Text));
            cmd.Parameters.Add("@tweleve", Convert.ToInt16(tbtweleve.Text));
            cmd.Parameters.Add("@pext", SqlDbType.VarChar).Value = content;
            cmd.Parameters.Add("@graduation", Convert.ToInt16(tbgraduation.Text));
            cmd.Parameters.Add("@backlog", Convert.ToInt16(tbbacklogs.Text));
            cmd.Parameters.Add("@companydate", clplacementdate.SelectedDate.ToString());
            cmd.Parameters.Add("@pdocument", SqlDbType.Binary).Value = bt;
            cmd.Parameters.Add("@pfilename", SqlDbType.VarChar).Value = filename;
            s.Open();
            cmd.ExecuteNonQuery();
            s.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Submitted!!!')", true);
        }
    }

}