using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClientesNuevos.F14
{
    /// <summary>
    /// Descripción breve de FileUploadHandler
    /// </summary>
    public class FileUploadHandler : IHttpHandler
    {
        
        public void ProcessRequest(HttpContext context)
        {
            string IDcompania = context.Request["idcomp"].ToString();
            string Descripcion = context.Request["desc"].ToString();
            string codigo=context.Request["codigo"].ToString();
            string fname="";
            string strRsultado="";
            if (context.Request.Files.Count > 0)
            {
                HttpFileCollection files = context.Request.Files;
                
                    HttpPostedFile file = files[0];
                //ddMMyyyy
                string fecha = DateTime.Now.ToString("dd-MM-yyyy");
                fname = context.Server.MapPath("Archivos/usuario/" + fecha+"_"+Descripcion+"_"+file.FileName);
                file.SaveAs(fname);


                string ruta = fname.ToString();
                strRsultado = clsF14.Insertar_ProgramaSeguridad(IDcompania, Descripcion, codigo, ruta);
            }
            else
            {
               strRsultado = clsF14.Insertar_ProgramaSeguridad(IDcompania, Descripcion, codigo, "null");
            }


            context.Response.ContentType = "text/plain";
            context.Response.Write(strRsultado);
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