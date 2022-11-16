using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using ClientesNuevos.App_Code;
using System.Runtime.Remoting.Messaging;
using System.Security.Permissions;
using System.Runtime.Remoting;

namespace ClientesNuevos.F43
{
    /// <summary>
    /// Descripción breve de MapeoBD
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class MapeoBD : System.Web.Services.WebService
    {
        public class MapeoFlujo
        {
            public string ID { get; set; } 
            public string ID_Mapeo { get; set; }
            public string no_paso { get; set; }
            public string Proveedor { get; set; }
            public string Proceso { get; set; }
            public string Movimiento { get; set; }
            public string Detalles { get; set; }
            public string dias_reposo { get; set; }
            public string modo_transporte { get; set; }
            public string pregunta { get; set; }

        }
        public class infoMapeo
        {
            public string ID_Mapeo { get; set; }
            public string ID_Compania { get; set; }
            public string Fecha { get; set; } 
            public string Auditor { get; set; }

        }
        [WebMethod]
        public List<infoMapeo> ObtenerInfoMapeo(string ID_Mapeo)
        {
            List<infoMapeo> lstMapeo = new List<infoMapeo>();
            infoMapeo objMapeo;

            string strSQL = "SELECT * FROM Table_Mapeo WHERE ID_compania = '" + ID_Mapeo + "'";
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            try
            {
                da.Fill(dt);
            }
            catch (Exception)
            {

                throw;
            }

            foreach (DataRow row in dt.Rows)
            {
                objMapeo = new infoMapeo
                {
                    ID_Mapeo = row["ID_Mapeo"].ToString(),
                    ID_Compania = row["ID_Compania"].ToString(),
                    Auditor = row["Auditor"].ToString(),
                    Fecha = row["Fecha"].ToString().Substring(0, 10)
                };
                lstMapeo.Add(objMapeo);
            }

            return lstMapeo;
        }

        [WebMethod]
        public List<MapeoFlujo> ObtenerMapeo(string ID_Mapeo)
        {
            List<MapeoFlujo> lstMapeo = new List<MapeoFlujo>();
            MapeoFlujo objMF;            
             
            string strSQL = "SELECT * FROM Table_MapeoDetalle WHERE ID_mapeo = '" + ID_Mapeo + "'";
            DataTable dt = new DataTable();
           
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            try
            {
                da.Fill(dt);
            }
            catch (Exception)
            {

                throw;
            }
            
           foreach (DataRow row in dt.Rows)
           {
               objMF = new MapeoFlujo
               {
                   ID = row["ID"].ToString(),
                   ID_Mapeo = row["ID_Mapeo"].ToString(),
                   no_paso = row["no_paso"].ToString(),
                   Proveedor = row["Proveedor"].ToString(),
                   Proceso = row["Proceso"].ToString(),
                   Movimiento = row["Movimiento"].ToString(),
                   Detalles = row["Detalles"].ToString(),
                   dias_reposo = row["dias_reposo"].ToString(),
                   modo_transporte = row["modo_transporte"].ToString(),
                   pregunta = row["pregunta"].ToString()
               };
               lstMapeo.Add(objMF);
           }
            return lstMapeo;
        }
       //Insertar en tabla de detalles de Mapeo
       [WebMethod]
       public string Insertar_DetallesMapeo(string ID_Mapeo, string no_paso, string Provedor, string Proceso, string Movimiento, string Detalles, string dias_reposo, string modo_transporte, string pregunta)
        {
            string res="";
            string delete = "";
            int x = 0;
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("RegistrarDetallesMapeo", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_mapeo",ID_Mapeo);
                cmd.Parameters.AddWithValue("@no_paso", no_paso);
                cmd.Parameters.AddWithValue("@Proveedor", Provedor);
                cmd.Parameters.AddWithValue("@Proceso", Proceso);
                cmd.Parameters.AddWithValue("@Movimiento", Movimiento);
                cmd.Parameters.AddWithValue("@Detalles", Detalles);
                cmd.Parameters.AddWithValue("@dias_reposo", dias_reposo);
                cmd.Parameters.AddWithValue("@modo_transporte", modo_transporte);
                cmd.Parameters.AddWithValue("@pregunta", pregunta);
                cmd.Parameters.AddWithValue("@accion", "insert");

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;


                cmd.ExecuteNonQuery();
                res =" "+ Convert.ToString(cmd.Parameters["@Msg"].Value);

            }
            catch (SqlException ex)
            {

                res = ex.Message;
            }

            return res;
        }
        [WebMethod]
        public string BuscaryBorrar_Mapeo(string ID_Mapeo)
        {
            int x;
            string delete="";
            x = Registro_existent("SELECT * FROM Table_MapeoDetalle WHERE ID_Mapeo = '" + ID_Mapeo + "'");
            if (x == 1)
            {
                delete = clsHerramientaBD.ExecuteSql("DELETE FROM Table_MapeoDetalle WHERE ID_Mapeo = '" + ID_Mapeo + "'");
            }

            return delete;
        }

        //Insertar en tabla de Mapeo
        
        [WebMethod]
        public string Registrar_Mapeo(string ID_compania, string ID_mapeo, string auditor)
        {
            string res = "", fecha="";
            int x = 0;
            fecha = DateTime.Now.ToString("dd/MM/yyyy");

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);

           
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("RegistroDeMapeo", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@ID_Mapeo", ID_mapeo);
                cmd.Parameters.AddWithValue("@Auditor", auditor);
                cmd.Parameters.AddWithValue("@Fecha", fecha);


                x = Registro_existent("SELECT * FROM Table_Mapeo WHERE ID_Mapeo='" + ID_mapeo + "'");
                if (x == 1)
                {
                    cmd.Parameters.AddWithValue("@accion", "update");

                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;


                cmd.ExecuteNonQuery();
                res = " " + Convert.ToString(cmd.Parameters["@Msg"].Value);

            }
            catch (SqlException ex)
            {

                res = ex.Message;
            }

            return res;
        }



        public int Registro_existent(string sqlCommand)
        {
            int res = 0;
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(sqlCommand, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            try
            {
                da.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    res = 1;
                }
                else
                {
                    res = 0;
                }
            }
            catch (Exception)
            {

                res = 0;
            }
            return res;
        }
    }
}
