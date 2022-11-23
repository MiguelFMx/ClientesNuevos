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
            public string Estatus { get; set; }

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
                    Estatus = row["Estatus"].ToString(),
                    Progreso = GetProgreso(row["ID_compania"].ToString(), row["Tipo_persona"].ToString(), row["ID_user"].ToString())
                };
                lst.Add(objR);
            }


            return lst;
        }

        public string GetProgreso(string id_comp, string tipo, string id)
        {
            string porcentaje = "";
            double prog;
            int total = 0, aux = 0;
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE ID_compania='" + id_comp + "' OR  ID_compania='"+id+"' AND Estatus='100%'");
            if (tipo == "0")
            {
                //fisico
                total = 15;
            }
            else if(tipo == "1")
            {
                //moral
                total = 14;
            }
            else
            {
                total = 10;
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


        public class Usuarios
        {
            public string Id { get; set; } 
            public string RFC { get; set; }
            public string Detalles { get; set; }
            public string Fecha { get; set; }
            public string Status { get; set; }

        }

        [WebMethod]
        public List<Usuarios> Obtener_UD()
        {
            DataTable dt = new DataTable();
            List<Usuarios> lst = new List<Usuarios>();
            Usuarios objR;
            dt = clsHerramientaBD.Existe("exec Master_User @Accion='select'", clsHerramientaBD.strConnAdmon);

            foreach (DataRow row in dt.Rows)
            {
                objR = new Usuarios
                {
                    Id = row["Id"].ToString(),
                    RFC = row["RFC"].ToString(),
                    Detalles = row["Detalles"].ToString(),
                    Fecha = row["Fecha_registro"].ToString().Substring(0,10),
                    Status = row["status"].ToString()
                };
                lst.Add(objR);
            }


            return lst;
        }

    }
}
    

