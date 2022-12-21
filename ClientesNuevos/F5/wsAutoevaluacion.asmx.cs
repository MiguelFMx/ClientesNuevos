using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.F5
{
    /// <summary>
    /// Descripción breve de wsAutoevaluacion
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsAutoevaluacion : System.Web.Services.WebService
    {
        public static string strConnction = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        public class ListaPreguntas
        {
            public string numero { get; set; }
            public string pregunta { get; set; }
        }
        public class LstRespuesta
        {
            public string numero { get; set; }
            public string respuesta { get; set; }
            public string observacion { get; set; }

        }
        public class LstRes
        {
            public string numero { get; set; }
            public string descripcion { get; set; }
            public string respuesta { get; set; }
            public string observacion { get; set; }

        }
        [WebMethod]
        public List<ListaPreguntas> LlenarTabla()
        {
            //string strSQL = "SELECT Pregunta, Descripcion FROM table_preguntas";
            string strSQL = "SELECT * FROM table_preguntas";

            SqlConnection con = new SqlConnection(strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                da.Fill(dt);
            }
            catch (Exception)
            {

                throw;
            }

            List<ListaPreguntas> lstPreguntas = new List<ListaPreguntas>();
            ListaPreguntas objItem;
            foreach (DataRow row in dt.Rows)
            {
                objItem = new ListaPreguntas();
                objItem.numero = row["Pregunta"].ToString();
                objItem.pregunta = row["Descripcion"].ToString();

                lstPreguntas.Add(objItem);
            }

            return lstPreguntas;
        }

        [WebMethod]
        public List<LstRes> LlenarTablaRespuesta(string id)
        {
           
            string strSQL = "exec ObtenerRespuestas '" + id + "'";

            SqlConnection con = new SqlConnection(strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                da.Fill(dt);
            }
            catch (Exception)
            {

                throw;
            }

            List<LstRes> lstRes = new List<LstRes>();

            LstRes objItem;
            foreach (DataRow row in dt.Rows)
            {
                objItem = new LstRes();
                objItem.numero = row["Numero"].ToString();
                objItem.descripcion = row["Descripcion"].ToString();
                objItem.respuesta = row["Respuesta"].ToString();
                objItem.observacion = row["Observacion"].ToString();
                lstRes.Add(objItem);
            }

            return lstRes;
        }


        [WebMethod]
        public List<ListaPreguntas> LlenarTablaS(string currentStep)
        {           
            //string strSQL = "SELECT *, ROW_NUMBER() OVER (ORDER BY ID) AS RowN FROM table_preguntas WHERE Pregunta LIKE '"+currentStep+"%' ORDER BY ID ";
            string strSQL = "EXEC getPreguntas2 "+currentStep;

            SqlConnection con = new SqlConnection(strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                da.Fill(dt);
            }
            catch (Exception)
            {

                throw;
            }

            List<ListaPreguntas> lstPreguntas = new List<ListaPreguntas>();
            ListaPreguntas objItem;
            foreach (DataRow row in dt.Rows)
            {
                objItem = new ListaPreguntas();
                objItem.numero = row["Pregunta"].ToString();
                objItem.pregunta = row["Descripcion"].ToString();

                lstPreguntas.Add(objItem);
            }

            return lstPreguntas;
        }


        [WebMethod]
        public  string RegistrarRespuesta(string id_evaluacion, string numero, string respuesta, string descripcion)
        {
            string strSql = "";
            string  table="";
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(strConnction);

            string strError = "";

            if (numero == "1.0.1")
            {
                table = clsHerramientaBD.ExecuteSql("DELETE FROM table_respuestasAutoEv WHERE ID_evaluacion = '" + id_evaluacion + "' ");
            }
            
                strSql = "INSERT INTO table_respuestasAutoEv (ID_evaluacion, Numero, Respuesta, Observacion)" +
               "VALUES ('" + id_evaluacion + "','" + numero + "'," + respuesta + ",'" + descripcion + "')";
            cmd = new SqlCommand(strSql, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                strError = "Respuestas de  la pregunta " + numero + " Se guardo";
                con.Close();
            }
            catch (SqlException ex)
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
                strError = ex.Message ;
            }

            return strError;

        }


        [WebMethod]
        public string RegistrarRespuestas(List<LstRespuesta> lista)
        {
            string strSql = "INSERT INTO table_respuestasAutoEv (ID_evaluacion, Numero, Respuesta, Observacion)" +
                "VALUES ('1','" + lista[0].numero + "'," + lista[0].respuesta + ",'" +lista[0].observacion + "')";

            SqlConnection con = new SqlConnection(strConnction);
            SqlCommand cmd = new SqlCommand(strSql, con);



            string strError = "";
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (SqlException ex)
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
                strError = ex.Message;
            }

            return strError;

        }

        [WebMethod]
        public string Registrar_F5(string ID_compania, string ID_cuestionario, string ID_autoevaluacion)
        {
            string resultado = "";
            string fecha = DateTime.Now.ToString("dd/MM/yyyy");


            DataTable dt;
            dt = clsHerramientaBD.Existe("SELECT * FROM Table_F5 WHERE ID_compania = '"+ID_compania+"'");
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("Master_F5", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@ID_Cuestionario", ID_cuestionario);
                cmd.Parameters.AddWithValue("@ID_Evaluacion", ID_autoevaluacion);
                cmd.Parameters.AddWithValue("@Fecha", fecha);
                if(dt.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@accion", "update");

                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }
                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                resultado = Convert.ToString(cmd.Parameters["@Msg"].Value);
            }
            catch (SqlException ex)
            {
                resultado = ex.Message;
            }
            finally
            {
                con.Close();
            }
            return resultado;
        }


        [WebMethod]
        public string Registrar_cuestionario(string ID_cuestionario, string p100, string p120, string p130, string p140, string p150, string p160, string p1311, string p1312, string p1313, string p1321, string p1322)
        {
            string resultado = "";

            string sqlStr = "Master_F5Cuestionario";
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);

            DataTable data;

            con.Open();
            data = clsHerramientaBD.Existe("SELECT * FROM Table_CuestionarioCTPAT WHERE ID_Cuestionario='" + ID_cuestionario + "'");
            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_cuestionario", ID_cuestionario);
                cmd.Parameters.AddWithValue("@p100", p100);
                cmd.Parameters.AddWithValue("@p120", p120);
                cmd.Parameters.AddWithValue("@p130", p130);
                cmd.Parameters.AddWithValue("@p140", p140);
                cmd.Parameters.AddWithValue("@p150", p150);
                cmd.Parameters.AddWithValue("@p160", p160);
                cmd.Parameters.AddWithValue("@p1311", p1311);
                cmd.Parameters.AddWithValue("@p1312", p1312);
                cmd.Parameters.AddWithValue("@p1313", p1313);
                cmd.Parameters.AddWithValue("@p1321", p1321);
                cmd.Parameters.AddWithValue("@p1322", p1322);

                if (data.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@accion", "update");

                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;


                cmd.ExecuteNonQuery();
                resultado = Convert.ToString(cmd.Parameters["@Msg"].Value);

            }
            catch (SqlException e)
            {
                resultado = e.Message;
            }
            finally
            {
                con.Close();
            }

            return resultado;
        }

    }
}

