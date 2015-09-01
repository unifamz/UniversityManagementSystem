using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class student_assignment : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
    }
    protected void gvassignment_SelectedIndexChanged(object sender, EventArgs e)
    {
        s.Open();
        SqlCommand cmd = new SqlCommand("select filename,ext,afile from assignment where id='" + gvassignment.SelectedRow.Cells[1].Text + "'", s);
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read())
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = sdr["ext"].ToString();
            Response.AddHeader("content-disposition", "attachment;filename=" + sdr["filename"].ToString());
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite((byte[])sdr["afile"]);
            Response.End();
        }
        s.Close();
        Response.Redirect("sassignment.aspx");
    }
    protected void btngridview_Click(object sender, EventArgs e)
    {
        gvassignment.Visible = true;
    }
}