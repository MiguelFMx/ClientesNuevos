using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos
{
    public partial class Viewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            byte[] FileBuffer = (byte[]) Session["buffer"];
            Context.Response.ContentType = "application/pdf";
            Context.Response.AddHeader("content-length", FileBuffer.Length.ToString());
            Context.Response.BinaryWrite(FileBuffer);
        }
    }
}