using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Globalization;
using System.Data.SqlClient;
using System.IO;

public partial class starting_registeration : System.Web.UI.Page
{
    SqlConnection s;
    static int j = 1;

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int day = 1; day < 32; day++)
            {
                ListItem li = new ListItem();
                li.Text = day.ToString();
                li.Value = day.ToString();
                ddldate.Items.Add(li);
            }
            DateTimeFormatInfo dtfi = new DateTimeFormatInfo();
            for (int month = 1; month < 13; month++)
            {
                ListItem li = new ListItem();
                li.Text = dtfi.GetMonthName(month);
                li.Value = month.ToString();
                ddlmonth.Items.Add(li);
            }
            int thisYear = System.DateTime.Now.Year;
            int startYear = thisYear - 16;
            for (int year = startYear; year > startYear - 100; year--)
            {
                ListItem li = new ListItem();
                li.Text = year.ToString();
                li.Value = year.ToString();
                ddlyear.Items.Add(li);
            }
        }
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
            tbpassword.Enabled = true;                                              
            divmain.Visible = false;
            updatecaptcha();
        }
    }

    protected void btnregenerate_Click(object sender, EventArgs e)
    {
        updatecaptcha();
    }

    private void updatecaptcha()
    {
        Random rand = new Random();
        string combination = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<6;i++)
        {
            sb.Append(combination[rand.Next(combination.Length)]);
            Session["captcha"] = sb.ToString();
            ViewState["captchavalue"] = Session["captcha"].ToString();
            imgcaptcha.ImageUrl = "captcha.aspx?" + DateTime.Now.Ticks.ToString();
        }
        if (j == 1)
        {
            ViewState["captchavalue"] = Session["captcha"].ToString();
            j++;
        }
    }

    protected void btnteacher_Click(object sender, EventArgs e)
    {
        divmain.Visible = true;
        lbid.Text = "Teacher ID:-";
        divdesignation.Visible = true;
        divcourse.Style.Add("display", "none");
        lbdesignation.Text = "Designation:-";
        ViewState["userregister"]="teacher";
        ddldesignation.Items.Clear();
        ddldesignation.Items.Add("---Select Designation---");
        ddldesignation.Items.Add("Teacher");
        ddldesignation.Items.Add("Dean");
        ddldesignation.Items.Add("Hod");
        ddldesignation.Items.Add("Principal");
        ddldesignation.Items.Add("Director");
        divsection.Style.Add("display", "none");
    }

    protected void btnstudent_Click(object sender, EventArgs e)
    {
        divcourse.Style.Add("display", "inline");
        divsection.Style.Add("display", "inline");
        divmain.Visible = true;
        divcourse.Visible = true;
        divdesignation.Visible = true;
        lbid.Text = "Student Roll No.:-";   
        ViewState["userregister"]="student";
        lbdesignation.Text = "Department:-";
        ddldesignation.Items.Clear();
        ddldesignation.Items.Add("---Select Department---");
        SqlCommand cmd = new SqlCommand("select distinct department from courses",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            ddldesignation.Items.Add(sdr["department"].ToString());
        }
        s.Close();
    }

    protected void btnwarden_Click(object sender, EventArgs e)
    {
        divsection.Style.Add("display", "none");
        divmain.Visible = true;
        lbid.Text = "Warden ID:-";
        ViewState["userregister"] = "warden";
        divdesignation.Visible = false;
        divcourse.Style.Add("display", "none");
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("~") + "images/" + filename);
                string imagepath = "images/" + filename;
                string birth = ddldate.SelectedItem + "/" + ddlmonth.SelectedItem + "/" + ddlyear.SelectedItem;
                if (tbemail.Text.Trim().Contains('@') && tbemail.Text.Trim().Contains('.'))
                {
                    if (ViewState["captchavalue"].ToString() == tbcaptcha.Text.Trim())
                    {
                        if (ViewState["userregister"].ToString() == "teacher")
                        {
                            if (lbnameshow.Text != string.Empty)
                            {
                                SqlCommand cmd = new SqlCommand("update register set email='" + tbemail.Text + "',phone='" + Convert.ToInt64(tbmobile.Text) + "',sex='" + ddlgender.SelectedItem + "',birthday='" + birth + "',address='" + tbaddress.Text + "', state='" + tbstate.Text + "', city='" + tbcity.Text + "', imagepath='" + imagepath + "',pincode='" + Convert.ToInt64(tbpincode.Text) + "' where id1='" + Convert.ToInt64(tbid.Text) + "'", s);
                                s.Open();
                                cmd.ExecuteNonQuery();
                                s.Close();
                                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Registered:-" + lbnameshow.Text + "')", true);
                                tbpassword.Enabled = true;
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please enter valid Teacher ID.!!!! ')", true);
                            }
                        }
                        else if (ViewState["userregister"].ToString() == "student")
                        {
                           
                            if (lbnameshow.Text != string.Empty)
                            {
                                SqlCommand cmd = new SqlCommand("update student set email='" + tbemail.Text + "',phone='" + Convert.ToInt64(tbmobile.Text) + "',sex='" + ddlgender.SelectedItem + "',birthday='" + birth + "',address='" + tbaddress.Text + "', state='" + tbstate.Text + "', city='" + tbcity.Text + "', imagepath='" + imagepath + "', pincode='" + Convert.ToInt64(tbpincode.Text) + "', semster='"+Convert.ToInt16(tbsemster.Text)+"', section='"+lbsectionshow.Text+"' where roll='" + Convert.ToInt64(tbid.Text) + "'", s);
                                s.Open();
                                cmd.ExecuteNonQuery();
                                s.Close();
                                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Registered:-" + lbnameshow.Text + "')", true);
                                tbpassword.Enabled = true;
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please enter valid roll No.!!!! ')", true);
                            }
                        }
                        else
                        {
                            if (lbnameshow.Text != string.Empty)
                            {
                                SqlCommand cmd = new SqlCommand("update warden set email='" + tbemail.Text + "',phone='" + Convert.ToInt64(tbmobile.Text) + "',sex='" + ddlgender.SelectedItem + "',birthday='" + birth + "',address='" + tbaddress.Text + "', state='" + tbstate.Text + "', city='" + tbcity.Text + "', imagepath='" + imagepath + "', pincode='" + Convert.ToInt64(tbpincode.Text) + "' where warden_id='" + Convert.ToInt64(tbid.Text) + "'", s);
                                s.Open();
                                cmd.ExecuteNonQuery();
                                s.Close();
                                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully Registered:-" + lbnameshow.Text + "')", true);
                                tbpassword.Enabled = true;
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please enter valid roll No.!!!! ')", true);
                            }
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Captcha not match !')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Email ID not correct format!')", true);
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('" + ex.Message + "')", true);
        }
    }

    private void getrangeroll()
    {
        string range = null;
        SqlCommand cmd = new SqlCommand("select rangeroll,section from sectionroll where department='" + ddldesignation.SelectedItem.Text + "'and course='" + ddlcourse.SelectedItem.Text + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            range = sdr["rangeroll"].ToString();
            string[] rollchar = range.Split('-');
            long startroll = Convert.ToInt64(rollchar[0]);
            long endroll = Convert.ToInt64(rollchar[1]);
            if (Convert.ToInt64(tbid.Text) >= startroll && Convert.ToInt64(tbid.Text) <= endroll)
            {
                lbsectionshow.Text = sdr["section"].ToString();
            }
        }
        s.Close();
    }

    protected void btncheck_Click(object sender, EventArgs e)
    {
        if (tbpassword.Text.Trim() != string.Empty && tbid.Text.Trim() != string.Empty )
        {
            if (ViewState["userregister"].ToString() == "student")
            {
                if (ddldesignation.SelectedItem.Text != "---Select Department---" && ddlcourse.SelectedItem.Text != "---Select Course---")
                {
                    SqlCommand cmd = new SqlCommand("select name from student where roll='" + Convert.ToInt64(tbid.Text) + "' and department='" + ddldesignation.SelectedItem + "' and password='" + tbpassword.Text + "' and course='" + ddlcourse.SelectedItem + "'", s);
                    s.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        lbnameshow.Text = sdr["name"].ToString();
                        
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Student Roll No. not exists!!!')", true);
                    }
                    s.Close();
                    getrangeroll();
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please fill all entries')", true);
                }
            }
            else if (ViewState["userregister"].ToString() == "teacher")
            {
                if (ddldesignation.SelectedValue != "0")
                {
                    SqlCommand cmd = new SqlCommand("select name from register where id1='" + Convert.ToInt64(tbid.Text) + "' and designation='" + ddldesignation.SelectedItem + "' and password='" + tbpassword.Text + "'", s);
                    s.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        lbnameshow.Text = sdr["name"].ToString();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Teacher ID not exists!!!')", true);
                    }
                    s.Close();
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please fill all entries')", true);
                }
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select name from warden where warden_id='" + Convert.ToInt64(tbid.Text) + "' and password='" + tbpassword.Text + "'", s);
                s.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    lbnameshow.Text = sdr["name"].ToString();
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Warden ID not exists!!!')", true);
                }
                s.Close();
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please fill all entries')", true);
        }
        if(lbnameshow.Text!=string.Empty)
        {
            tbpassword.Enabled = false;
        }
        else
        {
            tbpassword.Enabled = true;
        }
    }

    protected void ddldesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlcourse.Items.Clear();
        ddlcourse.Items.Add("---Select Course---");
        SqlCommand cmd = new SqlCommand("select distinct course from courses where department='"+ddldesignation.SelectedItem.Text+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            ddlcourse.Items.Add(sdr["course"].ToString());
        }
        s.Close();
    }

}