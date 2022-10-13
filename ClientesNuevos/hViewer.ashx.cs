using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;

namespace ClientesNuevos
{
    /// <summary>
    /// Descripción breve de hViewer
    /// Controlador que permite abrir archivos pdf en la misma ventana
    /// </summary>
    public class hViewer : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string url = context.Request["url"].ToString();
            string FilePath = @url;
            WebClient wClient = new WebClient();
            Byte[] FileBuffer = wClient.DownloadData(FilePath);

            if (FileBuffer != null)
            {
                context.Response.ContentType = "application/pdf";
                context.Response.AddHeader("content-length", FileBuffer.Length.ToString());
                context.Response.BinaryWrite(FileBuffer);
            }
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