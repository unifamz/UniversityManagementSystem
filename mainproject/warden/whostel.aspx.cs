using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class warden_whostel : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if (!IsPostBack)
        {
            divtotalblocks.Visible = false;
            divblockno.Visible = false;
            plblock.Visible = false;
        }
    }

    protected void btnboyshostel_Click(object sender, EventArgs e)
    {
        divtotalblocks.Visible = true;
        ViewState["hostelboysorgirls"] = btnboyshostel.Text;
    }

    protected void btngirlshostel_Click(object sender, EventArgs e)
    {
        divtotalblocks.Visible = true;
        ViewState["hostelboysorgirls"] = btngirlshostel.Text;
    }

    protected void btncheck_Click(object sender, EventArgs e)
    {
        if (tbtotalblocks.Text.Trim() != string.Empty)
        {
            tbtotalblocks.Enabled = false;
            btnsubmit.Enabled = false;
            divblockno.Visible = true;
            lbblockno.Text = "Block 1";
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('please enter total blocks!!!')", true);
        }
    }

    protected void btntotalfloor_Click(object sender, EventArgs e)
    {
        if (tbtotalfloors.Text.Trim() != string.Empty)
        {
            tbtotalfloors.Enabled = false;
            plblock.Visible = true;
            lbblockshow.Text = lbblockno.Text;
            lbfloorshow.Text = "Floor 1";
            btntotalfloor.Enabled = false;
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Please enter total floors!!!')", true);
        }
    }

    static int a = 1, backtoinitialfloor = 0, backtoinitialblock = 0;

    private int checkmultiplevalues(int srf)
    {
        int returnvalue = 0;
        SqlCommand cmd = new SqlCommand("select ending2 from hostel",s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while(sdr.Read())
        {
            int dbero = Convert.ToInt16(sdr["ending2"].ToString());
            if(srf>dbero)
            {
                returnvalue = 1;
            }
            else
            {
                returnvalue = 2;
            }
        }
        if(returnvalue==0)
        {
            returnvalue = 3;
        }
        s.Close();
        return returnvalue;
    }

    protected void btnsubmit1_Click(object sender, EventArgs e)
    {
        insertroomtable();
        int srf = Convert.ToInt16(tbstartroomfront.Text.Trim());
        int erf = Convert.ToInt16(tbendroomfront.Text.Trim());
        int sro = Convert.ToInt16(tbstartroomopposite.Text.Trim());
        int ero = Convert.ToInt16(tbendroomopposite.Text.Trim());
        int returnvalue = checkmultiplevalues(srf);
        if (returnvalue == 1 || returnvalue == 3)
        {
            if (ero > sro && sro > erf && erf > srf)
            {
                string[] floorget = lbfloorshow.Text.Split(' ');
                int floorget1 = Convert.ToInt16(floorget[1]);
                string[] blockget = lbblockshow.Text.Split(' ');
                int blockget1 = Convert.ToInt16(blockget[1]);
                if (a == 1)
                {
                    backtoinitialfloor = floorget1;
                    backtoinitialblock = blockget1;
                    a++;
                }
                SqlCommand cmd = new SqlCommand("insert into hostel(hostel,block,floor,side1,starting1,ending1,side2,starting2,ending2) values('" + ViewState["hostelboysorgirls"].ToString() + "','" + lbblockshow.Text + "','" + lbfloorshow.Text + "','" + lbfrontside.Text + "','" + Convert.ToInt16(tbstartroomfront.Text) + "','" + Convert.ToInt16(tbendroomfront.Text) + "','" + lboppositeside.Text + "','" + Convert.ToInt16(tbstartroomopposite.Text) + "','" + Convert.ToInt16(tbendroomopposite.Text) + "')", s);
                s.Open();
                cmd.ExecuteNonQuery();
                s.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully insert details of FLoor=" + floorget1 + "')", true);
                insertroomtable();
                tbstartroomfront.Text = "";
                tbendroomfront.Text = "";
                tbstartroomopposite.Text = "";
                tbendroomopposite.Text = "";
                if (floorget1 < Convert.ToInt16(tbtotalfloors.Text))
                {
                    floorget1++;
                    lbfloorshow.Text = "Floor " + floorget1.ToString();
                }
                else
                {
                    floorget1 = backtoinitialfloor;
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('all floors of " + lbblockshow.Text + " inserted')", true);
                    if (blockget1 < Convert.ToInt16(tbtotalblocks.Text))
                    {
                        blockget1++;
                        lbblockno.Text = "Block " + blockget1.ToString();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('all Blocks inserted')", true);
                    }
                    plblock.Visible = false;
                    btntotalfloor.Enabled = true;
                    tbtotalfloors.Enabled = true;
                    if (lbblockshow.Text == "Block 3" && lbfloorshow.Text == "Floor 3")
                    {
                        divtotalblocks.Visible = false;
                        divblockno.Visible = false;
                        plblock.Visible = false;
                        tbtotalblocks.Enabled = true;
                        btnsubmit.Enabled = true;
                        tbtotalfloors.Enabled = true;
                        btntotalfloor.Enabled = true;
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Allotment of rooms are not in correct order')", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('These Rooms are already inserted!!!')", true);
        }
    }

    private void insertroomtable()
    {
       // for (int i = Convert.ToInt16(tbstartroomfront.Text); i <= Convert.ToInt16(tbendroomopposite.Text); i++)
        for(int i=101;i<=640;i++)
        {
            SqlCommand cmd = new SqlCommand("insert into allotrooms(room) values('"+i+"')",s);
            s.Open();
            cmd.ExecuteNonQuery();
            s.Close();
        }
    }
}