using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing.Imaging;
using System.Drawing;
using System.Drawing.Drawing2D;
public partial class starting_captcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        int height = 30;
        int width = 100;
        Bitmap bm = new Bitmap(width, height);
        RectangleF rectf = new RectangleF(10, 5, 0, 0);
        Graphics g = Graphics.FromImage(bm);
        g.Clear(Color.White);
        g.SmoothingMode = SmoothingMode.AntiAlias;
        g.InterpolationMode = InterpolationMode.HighQualityBicubic;
        g.PixelOffsetMode = PixelOffsetMode.HighQuality;
        g.DrawString(Session["captcha"].ToString(), new Font("Thaoma", 12, FontStyle.Italic), Brushes.Green, rectf);
        g.DrawRectangle(new Pen(Color.Red),1,1,width-2,height-2);
        g.Flush();
        Response.ContentType = "image/jpeg";
        bm.Save(Response.OutputStream, ImageFormat.Jpeg);
        g.Dispose();
        bm.Dispose();
    }
}