using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class student_bookrooms : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if (!IsPostBack)
        {
            divblock.Visible = false;
            divfloor.Visible = false;
            divside.Visible = false;
            divroom.Visible = false;
            plshowpatner.Visible = false;
            divroombooked.Visible = false;
            divbtnroombooked.Visible = false;
            btnroomsrelated.Visible = false;
        }
    }

    private void getblock()
    {
        ddlblock.Items.Clear();
        ddlblock.Items.Add("---Select Block---");
        SqlCommand cmd = new SqlCommand("select distinct block from hostel where [hostel]='" + ViewState["gender"].ToString() + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ddlblock.Items.Add(sdr["block"].ToString());
        }
        s.Close();
    }

    private void getfloor()
    {
        ddlfloor.Items.Clear();
        ddlfloor.Items.Add("---Select Floor---");
        SqlCommand cmd = new SqlCommand("select distinct [floor] from hostel where block='" + ddlblock.SelectedItem + "' and  [hostel]='" + ViewState["gender"].ToString() + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ddlfloor.Items.Add(sdr["floor"].ToString());
        }
        s.Close();
    }

    private void getside()
    {
        ddlside.Items.Clear();
        ddlside.Items.Add("---Select Side---");
        SqlCommand cmd = new SqlCommand("select side1 from hostel union select side2 from hostel where [floor]='" + ddlfloor.SelectedItem + "' and  [hostel]='" + ViewState["gender"].ToString() + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ddlside.Items.Add(sdr["side1"].ToString());
        }
        s.Close();
        getsidevalues();
    }

    private void getsidevalues()
    {
        SqlCommand cmd = new SqlCommand("select side1,side2 from hostel where [hostel]='" + ViewState["gender"].ToString() + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            ViewState["side1"] = sdr["side1"].ToString();
            ViewState["side2"] = sdr["side2"].ToString();
        }
        s.Close();
    }

    private void getroom()
    {
        ddlroom.Items.Clear();
        ddlroom.Items.Add("---Select Room Number---");
        if (ddlside.SelectedItem.Text == ViewState["side1"].ToString())
        {
            SqlCommand cmd = new SqlCommand("select starting1,ending1 from hostel where [hostel]='" + ViewState["gender"].ToString() + "' and block='" + ddlblock.SelectedItem.Text + "' and [floor]='" + ddlfloor.SelectedItem.Text + "'", s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                for (int i = Convert.ToInt16(sdr["starting1"].ToString()); i <= Convert.ToInt16(sdr["ending1"].ToString()); i++)
                {
                    ddlroom.Items.Add(i.ToString());
                }
            }
            s.Close();
            
        }
        else
        {
            SqlCommand cmd = new SqlCommand("select starting2,ending2 from hostel where [hostel]='" + ViewState["gender"].ToString() + "' and block='" + ddlblock.SelectedItem.Text + "' and [floor]='" + ddlfloor.SelectedItem.Text + "'", s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                for (int i = Convert.ToInt16(sdr["starting2"].ToString()); i <= Convert.ToInt16(sdr["ending2"].ToString()); i++)
                {
                    ddlroom.Items.Add(i.ToString());
                }
            }
            s.Close();
        }
        
    }

    protected void btncheck_Click(object sender, EventArgs e)
    {
        ViewState["password"] = tbpassword.Text;
        SqlCommand cmd = new SqlCommand("select sex,name from student where roll='" + Convert.ToInt64(tbrollno.Text) + "' and password='" + tbpassword.Text + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            lbname.Text = sdr["name"].ToString();
            ViewState["gender"] = sdr["sex"].ToString();
            plloginafter.Visible = true;
            divblock.Visible = true;
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Invalid Roll Number or Password!!!')", true);
        }
        s.Close();
        if (ViewState["gender"].ToString() == "Male")
        {
            ViewState["gender"] = "Boys Hostel";
            getblock();
        }
        else
        {
            ViewState["gender"] = "Girls Hostel";
            getblock();
        }
    }

    protected void ddlblock_SelectedIndexChanged(object sender, EventArgs e)
    {
        divfloor.Visible = true;
        getfloor();
    }

    protected void ddlfloor_SelectedIndexChanged(object sender, EventArgs e)
    {
        divside.Visible = true;
        getside();
    }

    protected void ddlside_SelectedIndexChanged(object sender, EventArgs e)
    {
        getroom();
        btnroomsrelated.Visible = true;
    }
    protected void ddlroom_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("select roll,name,department,state,city,imagepath from student where room='" +Convert.ToInt16(ddlroom.SelectedItem.Text) + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            plshowpatner.Visible = true;
            lbpatnerrollshow.Text = sdr["roll"].ToString();
            lbpatnernameshow.Text = sdr["name"].ToString();
            lbpatnerdepartmentshow.Text = sdr["department"].ToString();
            lbpartnerstateshow.Text = sdr["state"].ToString();
            lbpatnercityshow.Text = sdr["city"].ToString();
            imgphoto.ImageUrl = "~/" + sdr["imagepath"].ToString();
            btnnext.Visible = true;
            btnnext.Text = "Next >>";
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('This room is vacant!!!')", true);
        }
        s.Close();
    }
    protected void btnnext_Click(object sender, EventArgs e)
    {
        int a=1;
        SqlCommand cmd = new SqlCommand("select roll,name,department,state,city,imagepath from student where room='" + ddlroom.SelectedItem.Text + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            if (a == 2)
            {
                plshowpatner.Visible = true;
                lbpatnerrollshow.Text = sdr["roll"].ToString();
                lbpatnernameshow.Text = sdr["name"].ToString();
                lbpatnerdepartmentshow.Text = sdr["department"].ToString();
                lbpartnerstateshow.Text = sdr["state"].ToString();
                lbpatnercityshow.Text = sdr["city"].ToString();
                imgphoto.ImageUrl = "~/" + sdr["imagepath"].ToString();
                a = 5;
                btnnext.Visible = true;
                btnnext.Text = "<< Previous";
            }
            a++;
        }
        if(a!=6)
        {
            
            //ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('No partner in this room!!!')", true);
            //string jquery = "$(document).ready(function ()  $(\"#btnhide\").click(function (e) {$(\"#ContentPlaceHolder1_plshowpatner\").hide(2000);e.preventDefault();e.stopPropagation();return false;})})";
            //ClientScript.RegisterStartupScript(Page.GetType(), "hidepanel", "hidepanel()", true);
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "HidePanel()", true);
        }
        s.Close();
    }

    public void getvacantrooms()
    {
        ddlroombooked.Items.Clear();
        ddlroombooked.Items.Add("Room you want to be booked...just Select room number!!!");
        int firstvalue = Convert.ToInt16(ddlroom.Items[1].Value);
        //int firstvalue = ddlroom.Items[0].Value;
        int lastvalue = Convert.ToInt16(ddlroom.Items[ddlroom.Items.Count - 1].Value);

        SqlCommand cmd = new SqlCommand("select room from allotrooms where room>='" + firstvalue + "' and room<='" + lastvalue + "' and allot<'" + 2 + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ddlroombooked.Items.Add(sdr["room"].ToString());
        }
        s.Close();
    }
    protected void btnroomstatus_Click(object sender, EventArgs e)
    {
        divroombooked.Visible = false;
        divbtnroombooked.Visible = false;
        divroom.Visible = true;
        getroom();
    }
    protected void btnbookedroom_Click(object sender, EventArgs e)
    {
        divroom.Visible = false;
        divroombooked.Visible = true;
        divbtnroombooked.Visible = true;
        getvacantrooms();

        //ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", " HidePanelonroombookedclick()", true);
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (ddlroombooked.SelectedValue != "0")
        {
            getselectedroom();
            if (ViewState["studentbookedroom"].ToString()== string.Empty)
            {
                //ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "confirm('Do You want to really booked Room No.-" + ddlroombooked.SelectedItem + "')",true);  
                SqlCommand cmd = new SqlCommand("update student set room='" + ddlroombooked.SelectedItem + "', hostel='" + ViewState["gender"].ToString() + "', block='" + ddlblock.SelectedItem + "', floor='" + ddlfloor.SelectedItem + "', view1='" + ddlside.SelectedItem + "' where roll='" + Convert.ToInt64(tbrollno.Text) + "' and password='" + ViewState["password"] + "'", s);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
                insertallotroomtable();
                divblock.Visible = false;
                divfloor.Visible = false;
                divside.Visible = false;
                divroom.Visible = false;
                plshowpatner.Visible = false;
                divroombooked.Visible = false;
                divbtnroombooked.Visible = false;
                btnroomsrelated.Visible = false;
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('You have already booked a Room Number"+ViewState["studentbookedroom"].ToString()+"...if you want to change room then please contact to warden!!!!");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please select any room from list for booking!!!')", true);
        }
    }

    private void getselectedroom()
    {

        SqlCommand cmd = new SqlCommand("select room from student where roll='" + Convert.ToInt64(tbrollno.Text) + "' and password='" + ViewState["password"] + "'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            ViewState["studentbookedroom"] =sdr["room"].ToString();
            
        }
       
        s.Close();
        
    }

    private void insertallotroomtable()
    {
        int allotroom=getvaluefromallotroomtable();
        if (allotroom < 2)
        {
            if (allotroom == 0)
            {
                SqlCommand cmd = new SqlCommand("update allotrooms set allot='" + 1 + "', student1='" + lbname.Text + "', roll1='" + Convert.ToInt64(tbrollno.Text) + "' where room='" + Convert.ToInt16(ddlroombooked.SelectedItem.Text) + "'", s);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("update allotrooms set allot='"+2+"', student2='"+lbname.Text+"', roll2='"+Convert.ToInt64(tbrollno.Text)+"' where room='"+Convert.ToInt16(ddlroombooked.SelectedItem.Text)+"'", s);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
            }
        }
    }

    private int getvaluefromallotroomtable()
    {
        int allotroom = 0;
        SqlCommand cmd = new SqlCommand("select allot from allotrooms where room='"+Convert.ToInt16(ddlroombooked.SelectedItem.Text)+"'",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        if(sdr.Read())
        {
            allotroom = Convert.ToInt16(sdr["allot"].ToString());
        }
        s.Close();
        return allotroom;
        
    }
}