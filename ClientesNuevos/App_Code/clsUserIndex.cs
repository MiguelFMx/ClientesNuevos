using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace ClientesNuevos.App_Code
{
    public class clsUserIndex
    {
        public class ControlDocumento
        {
            public string ID_compania { get; set; }
            public string Documento { get; set; }
            public string Estatus { get; set; }
            public string  Fecha{ get; set; }            
            public string Ruta { get; set; }
        }

        public static List<ControlDocumento> Obtener_Documentos(string id_comp)
        {
            List<ControlDocumento> documentos = new List<ControlDocumento>();
            ControlDocumento objDoc;
            DataTable dt = new DataTable();
            string StrSql = "SELECT * FROM Table_Documentos WHERE ID_compania = '"+id_comp+"'";
            SqlConnection connection = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(StrSql, connection);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            try
            {
                da.Fill(dt);
            }
            catch (SqlException ex)
            {
                                
            }

            foreach (DataRow row in dt.Rows)
            {
                objDoc = new ControlDocumento
                {
                    ID_compania = row["ID_compania"].ToString(),
                    Documento = row["Documento"].ToString(),
                    Estatus = row["Estatus"].ToString(),
                    Fecha = row["Fecha_creacion"].ToString(),
                    Ruta = row["Ruta"].ToString()
                };
                documentos.Add(objDoc);
            }

            return documentos;
        }


        //SObrecarga solicitando el id
        public static List<ControlDocumento> Obtener_Documentos(string id_comp, string id)
        {
            List<ControlDocumento> documentos = new List<ControlDocumento>();
            ControlDocumento objDoc;
            DataTable dt = new DataTable();
            string StrSql = "SELECT * FROM Table_Documentos WHERE ID_compania = '" + id_comp + "' OR ID_compania='"+id+"'";
            SqlConnection connection = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(StrSql, connection);

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            try
            {
                da.Fill(dt);
            }
            catch (SqlException ex)
            {

            }

            foreach (DataRow row in dt.Rows)
            {
                objDoc = new ControlDocumento
                {
                    ID_compania = row["ID_compania"].ToString(),
                    Documento = row["Documento"].ToString(),
                    Estatus = row["Estatus"].ToString(),
                    Fecha = row["Fecha_creacion"].ToString(),
                    Ruta = row["Ruta"].ToString()
                };
                documentos.Add(objDoc);
            }

            return documentos;
        }



    }
}