using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

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
        public  string RegistrarRespuesta(string numero, string respuesta, string descripcion)
        {
            string strSql = "INSERT INTO table_respuestasAutoEv (ID_evaluacion, Numero, Respuesta, Observacion)" +
                "VALUES ('1','" +numero + "'," + respuesta + ",'" + descripcion + "')";

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

    }
}

