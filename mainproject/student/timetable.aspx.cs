using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Reflection;
public partial class student_timetable : System.Web.UI.Page
{
    SqlConnection s;
    protected void Page_Load(object sender, EventArgs e)
    {
        string st = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        s = new SqlConnection(st);
        if(!IsPostBack)
        {
            plgrid.Visible = false;
            SqlCommand cmd = new SqlCommand("select distinct department from courses",s);
            s.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while(sdr.Read())
            {
                ddldepartment.Items.Add(sdr["department"].ToString());
            }
            s.Close();
        }
    }
    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlcourse.Items.Clear();
        ddlcourse.Items.Add("---Select Course---");
        SqlCommand cmd = new SqlCommand("select distinct course from courses where department='"+ddldepartment.SelectedItem.Text+"'", s);
        s.Open();
        SqlDataReader sdr = cmd.ExecuteReader();
        while (sdr.Read())
        {
            ddlcourse.Items.Add(sdr["course"].ToString());
        }
        s.Close();
    }
    protected void btnshowgrid_Click(object sender, EventArgs e)
    {
       plgrid.Visible = true;
       SqlDataAdapter sda = new SqlDataAdapter("select day,lectureno,timing,subject,classroom from studenttimetable where department='"+ddldepartment.SelectedItem.Text+"' and course='"+ddlcourse.SelectedItem.Text+"' and semster='"+ddlsemster.SelectedItem.Value+"' and section='"+ddlsection.SelectedItem.Value+"'",s);
       s.Open();
       DataTable dt = new DataTable();
       sda.Fill(dt);
       gvtimetable.DataSource = dt;
       gvtimetable.DataBind();
    }
    protected void btndownload_Click(object sender, EventArgs e)
    {

        PdfPTable pdftable = new PdfPTable(gvtimetable.HeaderRow.Cells.Count);
        foreach(TableCell headercell in gvtimetable.HeaderRow.Cells)
        {
            Font font = new Font();
            font.Color = new BaseColor(gvtimetable.HeaderStyle.ForeColor);
            PdfPCell pdfcell = new PdfPCell(new Phrase(headercell.Text, font));
            pdfcell.BackgroundColor = new BaseColor(gvtimetable.HeaderStyle.BackColor);
            pdftable.AddCell(pdfcell);
        }
        foreach(GridViewRow gridviewrow in gvtimetable.Rows)
        {
            foreach(TableCell tablecell in gridviewrow.Cells)
            {
                Font font = new Font();
                font.Color = new BaseColor(gvtimetable.RowStyle.ForeColor);
                PdfPCell pdfcell = new PdfPCell(new Phrase(tablecell.Text));
                //pdfcell.BackgroundColor = ;
                pdftable.AddCell(pdfcell);
            }
        }
        Document pdfdocument = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
        PdfWriter.GetInstance(pdfdocument, Response.OutputStream);
        pdfdocument.Open();
        pdfdocument.Add(pdftable);
        pdfdocument.Close();
        Response.ContentType = "application/pdf";
        Response.AppendHeader("content-disposition", "attachment;filename=Student_Timetable.pdf");
        Response.Write(pdfdocument);
        Response.Flush();
        Response.End();
    }
}