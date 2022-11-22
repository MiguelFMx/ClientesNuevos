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

        public class OpinionPositiva: Registros
        {
            public string Fecha_creacion { get; set; }
            public string Documento { get; set; }
            public string Status_doc { get; set; }
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


        [WebMethod]
        public List<OpinionPositiva> Obtener_OP()
        {
            OpinionPositiva objOP;
            List<OpinionPositiva> lstOP = new List<OpinionPositiva>();
            DataTable dtComp = new DataTable();
            DataTable dtDoc = new DataTable();
            int sinOP = 0;
            int OPdes = 0;
            dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE Estatus='activo'");
            if (dtComp.Rows.Count > 0)
            {
                for (int i = 0; i < dtComp.Rows.Count; i++)
                {
                    string id = dtComp.Rows[i]["ID_compania"].ToString();
                    dtDoc = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE Documento='Opinion positiva' AND ID_compania='" + id + "'");
                    if (dtDoc.Rows.Count > 0)
                    {
                        string mes = DateTime.Now.ToString("MM");
                        string fecha = dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(3, 2);

                        if (fecha != mes)
                        {
                            OPdes++;
                            objOP = new OpinionPositiva
                            {
                                ID_compania = id,
                                Nombre_comp = dtComp.Rows[i]["Nombre_comp"].ToString(),
                                Nombre_comercial = dtComp.Rows[i]["Nombre_comercial"].ToString(),
                                Documento = dtDoc.Rows[0]["Documento"].ToString(),
                                Fecha_creacion = dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(0,10),
                                Status_doc = dtDoc.Rows[0]["Estatus"].ToString()
                            };
                            lstOP.Add(objOP);

                        }
                    }
                    else
                    {
                        sinOP++;
                        objOP = new OpinionPositiva
                        {
                            ID_compania = id,
                            Nombre_comp = dtComp.Rows[i]["Nombre_comp"].ToString(),
                            Nombre_comercial = dtComp.Rows[i]["Nombre_comercial"].ToString(),
                            Documento = "Opinion positiva",
                            Fecha_creacion = "--/--/----",
                            Status_doc = "pendiente"
                        };
                        lstOP.Add(objOP);

                    }

                }
            }



            return lstOP;
        }
    }
}
