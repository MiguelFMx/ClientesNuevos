using ClientesNuevos.App_Code;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using MailKit;
using MailKit.Net;
using MimeKit.Text;
using MimeKit;
using MailKit.Net.Smtp;

namespace ClientesNuevos.admin
{
    /// <summary>
    /// Descripción breve de wsReportes
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsReportes : System.Web.Services.WebService
    {

        public class ListaCorreo
        {
            public string Nombre { get; set; }
            public string Puesto { get; set; }
            public string Correo { get; set; }
            public string OP { get; set; }
            public string RFC { get; set; }
            public string Compania { get; set; }

        }
        [WebMethod]
        public List<ListaCorreo> GetCorreosOP()
        {
            List<ListaCorreo> correos = new List<ListaCorreo>();
            correos = ContadorOP();
            return correos;
        }



        protected List<ListaCorreo> ContadorOP()
        {
            DataTable dtComp = new DataTable();
            DataTable dtDoc = new DataTable();
            DataTable dtActDoc = new DataTable();
            DataTable dtContacto = new DataTable();
            int cantidad = 0;
            string lapso = "";

            List<ListaCorreo> lstCorreo = new List<ListaCorreo>();
            ListaCorreo objC;

            //Selecciono el archivo que quiero comparar en este caso OP(opinion positiva)
            dtActDoc = clsHerramientaBD.Existe("SELECT * FROM Act_Docs WHERE Documento='OP'");

            //Se encontro, obtengo la cantidad de mes/anios 
            if (dtActDoc.Rows.Count > 0)
            {
                cantidad = Convert.ToInt32(dtActDoc.Rows[0]["cantidad"].ToString());
                lapso = dtActDoc.Rows[0]["lapso"].ToString();

            }

            //obtengo las empresas registradas
            dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE Estatus='activo'");
            if (dtComp.Rows.Count > 0)
            {
                //Recorro la tabla
                for (int i = 0; i < dtComp.Rows.Count; i++)
                {
                    //obtengo RFC
                    string id = dtComp.Rows[i]["ID_compania"].ToString();

                    //Checo si el tipo de persona no es extranjero
                    if (dtComp.Rows[i]["Tipo_persona"].ToString() != "2")
                    {
                        //Veo si esta registrada la opinion positiva en la tabla de documentos.
                        dtDoc = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE Documento='Opinion positiva' AND ID_compania='" + id + "'");
                        
                        //si count es mayor a 0, significa que si esta registrado
                        if (dtDoc.Rows.Count > 0)
                        {
                            string mesA = DateTime.Now.ToString("MM");
                            string anioA = DateTime.Now.ToString("yyyy");
                            //08/12/2022
                            int mesDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(3, 2));
                            int anioDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(6, 4));
                            int diaDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(0, 2));

                            DateTime FechaRegistrada = new DateTime(anioDoc, mesDoc, diaDoc);
                            DateTime fechaActualizacion = DateTime.Now.Date;


                            dtContacto = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE ID_compania = '" + id + "' AND (Tipo='Comp' OR Tipo='Fra')");

                            switch (lapso)
                            {
                                case "mensual": //year, month, day
                                                //si es la fecha actual es mayor que la fecha del documento significa que esta actualizado
                                    FechaRegistrada = FechaRegistrada.AddMonths(cantidad);
                                    if (FechaRegistrada.Month == fechaActualizacion.Month)
                                    {
                                        for (int index = 0; index < dtContacto.Rows.Count; index++)
                                        {
                                            objC = new ListaCorreo
                                            {
                                                RFC = dtContacto.Rows[index]["ID_compania"].ToString(),
                                                Correo = dtContacto.Rows[index]["Correo"].ToString(),
                                                OP = "si",
                                                Nombre = dtContacto.Rows[index]["Nombre"].ToString(),
                                                Puesto = dtContacto.Rows[index]["Puesto"].ToString(),
                                                Compania = dtComp.Rows[index]["Nombre_comercial"].ToString()
                                            };
                                            lstCorreo.Add(objC);
                                        }

                                    }
                                    break;
                                case "anual":
                                    FechaRegistrada = FechaRegistrada.AddYears(cantidad);
                                    if (FechaRegistrada.Year == fechaActualizacion.Year)
                                    {
                                        for (int index = 0; index < dtContacto.Rows.Count; index++)
                                        {
                                            objC = new ListaCorreo
                                            {
                                                RFC = dtContacto.Rows[index]["ID_compania"].ToString(),
                                                Correo = dtContacto.Rows[index]["Correo"].ToString(),
                                                OP = "si",
                                                Nombre = dtContacto.Rows[index]["Nombre"].ToString(),
                                                Puesto = dtContacto.Rows[index]["Puesto"].ToString()
                                            };
                                            lstCorreo.Add(objC);
                                        }
                                    }
                                    break;
                            }
                        }
                        else
                        {
                            dtContacto = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE ID_compania = '" + id + "' AND (Tipo='Comp' OR Tipo='Fra')");
                            dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_compania ='" + id + "'");
                            for (int index = 0; index < dtContacto.Rows.Count; index++)
                            {
                                objC = new ListaCorreo
                                {
                                    RFC = dtContacto.Rows[index]["ID_compania"].ToString(),
                                    Correo = dtContacto.Rows[index]["Correo"].ToString(),
                                    OP = "no",
                                    Nombre = dtContacto.Rows[index]["Nombre"].ToString(),
                                    Puesto = dtContacto.Rows[index]["Puesto"].ToString(),
                                    Compania = dtComp.Rows[0]["Nombre_comercial"].ToString()

                                };
                                lstCorreo.Add(objC);
                            }

                        }
                    }
                }
            }
            return lstCorreo;
        }

        [WebMethod]
        public string EnviarCorreos(string[] Info, string asunto, string cuerpo)
        {
            string result = "";

            if (Info.Length > 0)
            {
                for (int i = 0; i < Info.Length; i++)
                {
                    string[] separado = Info[i].Split(';');
                    string correo = separado[0];
                    string remitente = separado[1];

                    result += EnviarCorreo(correo, remitente, asunto, cuerpo)+",";
                   
                    
                }
                result = "Correo enviado a " + result;
            }
            else
            {
                result = "x";
            }

            return result;
        }



        [WebMethod]
        public string EnviarCorreo(string correo, string remitente, string subject, string cuerpo)
        {
            //Metodo para enviar correo por medio de MailKit
            MimeMessage message = new MimeMessage();
            message.From.Add(new MailboxAddress("No Re:Hungaros.", "postmaster@hungaros.com"));
            message.To.Add(new MailboxAddress(remitente, correo));

            message.Subject = subject;
            message.Body = new TextPart(TextFormat.Plain)
            {
                Text = cuerpo
            };
            SmtpClient client = new SmtpClient();
            try
            {
                client.Connect("mailc76.carrierzone.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
                client.Authenticate("postmaster@hungaros.com", "Hungaro5.Mai1!");
                client.Send(message);
                client.Disconnect(true);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

            return correo;
        }

    }
}
