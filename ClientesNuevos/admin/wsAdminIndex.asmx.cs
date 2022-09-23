using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.admin
{
    /// <summary>
    /// Descripción breve de wsAdminIndex
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsAdminIndex : System.Web.Services.WebService
    {
        public class Registros
        {
            public string ID_compania { get; set; }
            public string Nombre_comp { get; set; }
            public string Nombre_comercial { get; set; }
            public string Tipo_persona { get; set; }
            public string RFC { get; set; }
            public string CURP { get; set; }
            public string tiempo_negocio { get; set; }
            public string Direccion { get; set; }
            public string codigo_postal { get; set; }
            public string Pais { get; set; }
            public string Estado { get; set; }
            public string Ciudad { get; set; }
            public string Fecha_registro { get; set; }

            public string Progreso { get; set; }

        }
        [WebMethod]
        public List<Registros> Obtener_registros()
        {
            DataTable dt = new DataTable();
            List<Registros> lst = new List<Registros>();
            Registros objR;
            dt = clsHerramientaBD.Existe("exec select_compania @accion='todo'");

            foreach (DataRow row in dt.Rows)
            {
                objR = new Registros
                {
                    ID_compania = row["ID_compania"].ToString(),
                    Nombre_comp = row["Nombre_comp"].ToString(),
                    Nombre_comercial = row["Nombre_comercial"].ToString(),
                    RFC = row["RFC"].ToString(),
                    CURP = row["CURP"].ToString(),
                    tiempo_negocio = row["tiempo_negocio"].ToString(),
                    Direccion = row["Direccion"].ToString(),
                    codigo_postal = row["codigo_postal"].ToString(),
                    Tipo_persona = row["Tipo_persona"].ToString(),
                    Pais = row["Pais"].ToString(),
                    Estado = row["Estado"].ToString(),
                    Ciudad = row["Ciudad"].ToString(),
                    Fecha_registro = row["Fecha_registro"].ToString(),
                    Progreso = GetProgreso(row["ID_compania"].ToString(), row["Tipo_persona"].ToString())
                };
                lst.Add(objR);
            }


            return lst;
        }
        public string GetProgreso(string id_comp, string tipo)
        {
            string porcentaje = "";
            double prog;
            int total = 0, aux = 0;
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE ID_compania='" + id_comp + "' AND Estatus='100%'");
            if (tipo == "0")
            {
                //moral
                total = 13;
            }
            else if(tipo == "1")
            {
                //total de documentos
                total = 14;
            }
            else
            {
                total = 9;
            }

            //aux = numero de registros
            aux = dt.Rows.Count;
            if(aux != 0)
            {
                prog = ((aux * 100) / total);
                
                porcentaje = Convert.ToString(Math.Round(prog));

            }
            else
            {
                porcentaje = "0";
            }

            return porcentaje;
        }
    }
}
    

