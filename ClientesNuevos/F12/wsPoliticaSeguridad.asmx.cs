using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.F12
{
    /// <summary>
    /// Descripción breve de wsPoliticaSeguridad
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class wsPoliticaSeguridad : System.Web.Services.WebService
    {

        [WebMethod]
        public static string Insertar_PoliticaSeguridad(string id_compania, string OEA, string Representante, string Firma)
        {
            string res;
            string sqlStr = "Master_PoliticaSeguridad";
            string Fecha = "";
            Fecha = DateTime.Now.ToString("MM-dd-yyyy");

            SqlConnection conn = new SqlConnection(clsHerramientaBD.strConnction);

            DataTable tabla = clsHerramientaBD.Existe("SELECT * FROM Table_PoliticaSeguridad WHERE ID_compania='" + id_compania + "'");

            conn.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", id_compania);
                cmd.Parameters.AddWithValue("@OEA", OEA);
                cmd.Parameters.AddWithValue("@Representante", Representante);
                cmd.Parameters.AddWithValue("@Firma", Firma);
                cmd.Parameters.AddWithValue("@Fecha", Fecha);
                if (tabla.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@accion", "update");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }
                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                res = Convert.ToString(cmd.Parameters["@Msg"].Value);
            }
            catch (SqlException e)
            {
                res = e.Message;
            }
            finally
            {
                conn.Close();
            }

            return res;
        }
    }
}
