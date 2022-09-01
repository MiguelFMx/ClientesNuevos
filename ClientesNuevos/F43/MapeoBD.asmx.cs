using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using ClientesNuevos.App_Code;
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
            fecha = DateTime.Now.ToString("MM-dd-yyyy");

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
