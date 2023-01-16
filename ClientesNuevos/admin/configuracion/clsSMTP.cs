using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Xml.Linq;

namespace ClientesNuevos.admin.configuracion
{
    public class clsSMTP
    {
        public string Correo { get; set; }
        public string Remitente { get; set; }
        public string UsernameSMTP { get; set; }
        public string PasswordSMTP { get; set; }
        public string HostSMTP { get; set; }
        public string PuertoSMTP { get; set; }

        XDocument XDocument;
         string path = System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"App_Code/XMLsmtp.xml");

        public clsSMTP() { }

        public clsSMTP(string correo, string remitente, string usernameSMTP, string passwordSMTP, string hostSMTP, string puertoSMTP)
        {
            Correo = correo;
            Remitente = remitente;
            UsernameSMTP = usernameSMTP;
            PasswordSMTP = passwordSMTP;
            HostSMTP = hostSMTP;
            PuertoSMTP = puertoSMTP;
        }

        public string ActualizarInfo(string correo, string remitente, string usernameSMTP, string passwordSMTP, string hostSMTP, string puertoSMTP)
        {
            string res = "";
            try
            {
                XDocument = XDocument.Load(path);

                var items = (from item in XDocument.Descendants("datos")
                             where item.Element("id").Value == "0"
                             select item).ToList();
                foreach (var item in items)
                {
                    item.Element("correo").Value = correo;
                    item.Element("remitente").Value = remitente;
                    item.Element("UsernameSMTP").Value = usernameSMTP;
                    item.Element("PasswordSMTP").Value = passwordSMTP;
                    item.Element("HostSMTP").Value = hostSMTP;
                    item.Element("PuertoSMTP").Value = puertoSMTP;
                }

                XDocument.Save(path);
                res = "Datos actualizados";
            }
            catch (Exception ex)
            {
                res = ex.Message;
            }

            return res;
        }

        public Array ObtenerDatos()
        {
            XElement root = XElement.Load(path);
            var datos = from item in root.Descendants("datos")
                           select new
                           {
                               Correo = item.Element("correo").Value,
                               Remitente = item.Element("remitente").Value,
                               UsernameSMTP = item.Element("UsernameSMTP").Value,
                               PasswordSMTP = item.Element("PasswordSMTP").Value,
                               HostSMTP = item.Element("HostSMTP").Value,
                               PuertoSMTP = item.Element("PuertoSMTP").Value
                           };
            return datos.ToArray();
        }

        public List<clsSMTP> ObtenerObjeto()
        {
            List<clsSMTP> datos = new List<clsSMTP>();
            clsSMTP objSMTP;

            /*  */
            Array array = ObtenerDatos();
            string str="";
            string[] arreglo;
            char[] separators = new char[] {',','{','}','=' };
            foreach (Object i in array)
            {
                str += i;
            }
            arreglo = str.Split(separators, StringSplitOptions.RemoveEmptyEntries);

            objSMTP = new clsSMTP
            {
                Correo = arreglo[1].Trim(),
                HostSMTP = arreglo[9].Trim(),
                PuertoSMTP = arreglo[11].Trim(),
                Remitente = arreglo[3].Trim(),
                UsernameSMTP = arreglo[5].Trim(),
                PasswordSMTP = arreglo[7].Trim()
            };
            datos.Add(objSMTP);

            return datos;
        }
             
            
        
    }
}