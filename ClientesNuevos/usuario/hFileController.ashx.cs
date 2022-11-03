using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ClientesNuevos.App_Code
{
    /// <summary>
    /// Descripción breve de hFileController
    /// </summary>
    public class hFileController : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string IDcompania = context.Request["idcomp"].ToString();
            string Descripcion = context.Request["desc"].ToString();
            string fname = "";
            string strRsultado="";
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection files = context.Request.Files;

                HttpPostedFile file = files[0];
                //ddMMyyyy
                string fecha = DateTime.Now.Day.ToString() + "-" + DateTime.Now.Month.ToString() + "-" + DateTime.Now.Year.ToString();
                string link = @"~/Archivos/"+IDcompania;
                System.IO.Directory.CreateDirectory(link);

                fname = "/Archivos/usuario/" + fecha + "_" + Descripcion + "_" + file.FileName;
                file.SaveAs(context.Server.MapPath(fname));

                string ruta = fname.ToString();
                 //ruta = "Archivos/" + IDcompania + "/" + fecha + "_" + Descripcion + "_" + file.FileName;
                strRsultado = clsF14.Insertar_Documento(IDcompania,Descripcion, ruta, "revision");
                
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(strRsultado +" "+ fname.ToString());
        
    }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}