using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class warden_wmess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Session["breakfast"] = "";
            Session["lunch"] = "";
            Session["dinner"] = "";
                int date = System.DateTime.Now.Day;
                int month = System.DateTime.Now.Month;
                int year = System.DateTime.Now.Year;
                string date1 = date + "/" + month + "/" + year;
                string day = System.DateTime.Now.DayOfWeek.ToString().ToUpper();
                string[] breakfast = tbbreakfast.Text.Split('\n');
                string[] lunch = tblunch.Text.Split('\n');
                string[] dinner = tbdinner.Text.Split('\n'); 
                if (tbdate.Text == date1 && tbday.Text.ToUpper() == day)
                {
                    Session["date"] = tbdate.Text;
                    Session["day"] = tbday.Text;
                    foreach (string breakfast1 in breakfast)
                    {
                        Session["breakfast"] =Session["breakfast"].ToString()+ breakfast1+Environment.NewLine;
                    }
                    foreach (string lunch1 in lunch)
                    {
                        Session["lunch"] = Session["lunch"].ToString() + lunch1 + Environment.NewLine;
                    }
                    foreach (string dinner1 in dinner)
                    {
                        Session["dinner"] = Session["dinner"].ToString() + dinner1 + Environment.NewLine;
                    }
                    ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Successfully submit!!!')", true);
                }
                else
                {
                     ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('Today is not date or day as you input or wrong format')",true);
                }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "clientscript", "alert('"+ex.Message+"')", true);
        }
    }
}