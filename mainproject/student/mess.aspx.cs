using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
public partial class student_mess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbdate.Text = Session["date"].ToString();
        lbday.Text = Session["day"].ToString().ToUpper();
        lbbreakfast.Text="";
        lblunch.Text="";
        lbdinner.Text="";
        string[] breakfast = Session["breakfast"].ToString().Split('\n');
        string[] lunch= Session["lunch"].ToString().Split('\n');
        string[] dinner= Session["dinner"].ToString().Split('\n');
        StringBuilder sbbreakfast = new StringBuilder();
        StringBuilder sblunch = new StringBuilder();
        StringBuilder sbdinner = new StringBuilder();
        foreach(string breakfast1 in breakfast)
        {
            sbbreakfast.Append(breakfast1);
            sbbreakfast.Append("<br/>");
        }
        foreach(string lunch1 in lunch)
        {
            sblunch.Append(lunch1);
            sblunch.Append("<br/>");
        }
        foreach (string dinner1 in dinner)
        {
            sbdinner.Append(dinner1);
            sbdinner.Append("<br/>");
        }
        lblunch.Text = sblunch.ToString();
        lbdinner.Text = sbdinner.ToString();
        lbbreakfast.Text = sbbreakfast.ToString();
    }
}