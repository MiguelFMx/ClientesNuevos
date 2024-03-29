﻿using System;
using System.Collections.Generic;
using System.Data;
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
            string nombre = "";
            string fname = "";
            string strRsultado="";
            DataTable dt = new DataTable();
            if (context.Request.Files.Count > 0)
            {

                dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE RFC='" + IDcompania + "'");
                if (dt.Rows.Count > 0)
                {
                    nombre = dt.Rows[0]["Nombre_comercial"].ToString().Trim();
                }
                HttpFileCollection files = context.Request.Files;

                HttpPostedFile file = files[0];
                //ddMMyyyy
                string fecha = DateTime.Now.ToString("dd-MM-yyyy-HH-mm-ss");
                string link = "\\Archivos\\"+nombre;

                //Checho si existe la carpeta del usuario
                if(!Directory.Exists(context.Server.MapPath(link)))
                {
                    DirectoryInfo di = System.IO.Directory.CreateDirectory(context.Server.MapPath(link));
                }

                //Ejemplo: 14-11-2022-10:19:30_F16
                fname = link+"\\" + fecha + "_" + Descripcion+file.FileName.Substring(file.FileName.Length-4,4);
                try
                {
                    string location = context.Server.MapPath(fname);
                    file.SaveAs(location);

                }
                catch (Exception ex)
                {

                    throw ex;
                }
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