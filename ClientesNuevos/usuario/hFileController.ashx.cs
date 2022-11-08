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
                string fecha = DateTime.Now.ToString("dd-MM-yyyy");
                string link = "/Archivos/"+IDcompania;

                //Checho si existe la carpeta del usuario
                if(!Directory.Exists(context.Server.MapPath(link)))
                {
                    DirectoryInfo di = System.IO.Directory.CreateDirectory(context.Server.MapPath(link));
                }

                fname = link+"/" + fecha + "_" + Descripcion + "_" + file.FileName;
                file.SaveAs(context.Server.MapPath(fname));

                //Guardo la ruta completa para ser alamacenada en la base de datos
                string ruta = fname.ToString();

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