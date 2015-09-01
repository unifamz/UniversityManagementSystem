using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class warden_wroomstatus : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
            plgrid.Visible = false;
            plenterroom.Visible = false;
        }
    }
    protected void btnspecificroom_Click(object sender, EventArgs e)
    {
        plenterroom.Visible = true;
        lbroomfrom.Text = "Room No.:-";
        lbroomto.Visible = false;
        tbroomto.Visible = false;
        plgrid.Visible = false;
        ViewState["roombuttonclick"] = btnspecificroom.Text;
    }
    protected void btnrangeroom_Click(object sender, EventArgs e)
    {
        plenterroom.Visible = true;
        lbroomto.Visible = true;
        tbroomto.Visible = true;
        lbroomfrom.Text = "Room No.(FROM):-";
        lbroomto.Text = "Room No.(TO):-";
        plgrid.Visible = false;
        ViewState["roombuttonclick"] = btnrangeroom.Text;
    }
    protected void btnallrooms_Click(object sender, EventArgs e)
    {
        gvroomstatus.PageIndex = 1;
        plenterroom.Visible = false;
        plgrid.Visible = true;
        gvroomstatus.DataSource = SqlDataSource1;
        gvroomstatus.DataBind();
        ViewState["roombuttonclick"] = btnallrooms.Text;
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if(ViewState["roombuttonclick"].ToString()==btnspecificroom.Text)
            {
                plgrid.Visible = true;
                gvroomstatus.DataSource = SqlDataSource3;
                gvroomstatus.DataBind();
            }
            else 
            {
                gvroomstatus.PageIndex = 1;
                plgrid.Visible = true;
                gvroomstatus.DataSource = SqlDataSource2;
                gvroomstatus.DataBind();
            }
        }
        catch(Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert(" + ex.Message.ToString() + ")", true);
        }
    }
    protected void gvroomstatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        gvroomstatus.PageIndex = e.NewPageIndex;
        if (ViewState["roombuttonclick"].ToString() == btnallrooms.Text)
        {
            
            getrooms();

        }
        else
        {
            
            getrangerooms();
        }
    }
    private void getrooms()
    {
        
            plgrid.Visible = true;
            gvroomstatus.DataSource = SqlDataSource1;
            gvroomstatus.DataBind();
        
    }
    private void getrangerooms()
    {
        plgrid.Visible = true;
        gvroomstatus.DataSource = SqlDataSource2;
        gvroomstatus.DataBind();
    }
}