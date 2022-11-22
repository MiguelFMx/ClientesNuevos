using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ClientesNuevos.admin.consulta
{
    /// <summary>
    /// Descripción breve de wsConsultas
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsConsultas : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }

        public class Registros
        {
            public string ID_compania { get; set; }
            public string Nombre_comp { get; set; }
            public string Nombre_comercial { get; set; }
            public string Tipo_persona { get; set; }
            public string Fecha_registro { get; set; }
            public string Estatus { get; set; }
        }

        [WebMethod]
        public List<Registros> Obtener_registros(string status)
        {
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM  Table_compania WHERE Estatus = '"+status+"'");
            List<Registros> registros = new List<Registros>();
            Registros objR;
            if(dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    objR = new Registros
                    {
                        ID_compania = row["ID_compania"].ToString(),
                        Nombre_comp = row["Nombre_comp"].ToString(),
                        Nombre_comercial = row["Nombre_comercial"].ToString(),
                        Fecha_registro = row["Fecha_registro"].ToString(),
                        Tipo_persona = row["Tipo_persona"].ToString(),
                        Estatus = row["Estatus"].ToString() 
                    };
                    registros.Add(objR);    
                }
            }


            return registros;

        }


        [WebMethod]
        public List<Registros> Obtener_tipoRegimen(string regimen)
        {
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM  Table_compania WHERE Tipo_persona = '" + regimen + "'");
            List<Registros> registros = new List<Registros>();
            Registros objR;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    objR = new Registros
                    {
                        ID_compania = row["ID_compania"].ToString(),
                        Nombre_comp = row["Nombre_comp"].ToString(),
                        Nombre_comercial = row["Nombre_comercial"].ToString(),
                        Fecha_registro = row["Fecha_registro"].ToString(),
                        Tipo_persona = row["Tipo_persona"].ToString(),
                        Estatus = row["Estatus"].ToString()
                    };
                    registros.Add(objR);
                }
            }
            return registros;
        }
    }
}
