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
            public string numero;
            public string pregunta;
        }

        [WebMethod]
        public List<ListaPreguntas> LlenarTabla()
        {
            //string strSQL = "SELECT Pregunta, Descripcion FROM table_preguntas";
            string strSQL = "SELECT *, ROW_NUMBER() OVER (ORDER BY ID) AS RowN FROM table_preguntas WHERE Pregunta LIKE '1%' ORDER BY ID ";

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
        public List<ListaPreguntas> LlenarTablaS(string currentStep)
        {
            //string strSQL = "SELECT Pregunta, Descripcion FROM table_preguntas";
            string strSQL = "SELECT *, ROW_NUMBER() OVER (ORDER BY ID) AS RowN FROM table_preguntas WHERE Pregunta LIKE '"+currentStep+"%' ORDER BY ID ";

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

    }
}

