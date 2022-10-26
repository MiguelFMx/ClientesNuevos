using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;

namespace ClientesNuevos.F14
{
    /// <summary>
    /// Descripción breve de wsUbicacion
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class wsUbicacion : System.Web.Services.WebService
    {
        public static string strConnction = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        
        public class ListaPais
        {
            public string id { get; set; }
            public string fullname { get; set; }
        }
        public class CFDI
        {
            public string clave { get; set; }
            public string descripcion { get; set; }
        }

        List<ListaPais> lstPais;


        [WebMethod]
        public List<ListaPais> llenarCbPais()
        {

            
            string strSQL = "SELECT * FROM countries ORDER BY fullname ASC";

            SqlConnection con = new SqlConnection(  strConnction);
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

            lstPais = new List<ListaPais>();
            ListaPais objpais;

            foreach (DataRow row in dt.Rows)
            {
                objpais = new ListaPais();
                objpais.id = row["id"].ToString();
                objpais.fullname = row["fullname"].ToString();

                lstPais.Add(objpais);
            }

            return lstPais;
        }


        [WebMethod]
        public List<ListaPais> llenarCbEstados(int id)
        {
            string strSQL = "getEstados "+id;

            SqlConnection con = new SqlConnection(strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                da.Fill(dt);
            }
            catch (Exception ex)
            {

                throw ex;
            }

            lstPais = new List<ListaPais>();
            ListaPais objpais;

            foreach (DataRow row in dt.Rows)
            {
                objpais = new ListaPais();
                objpais.id = row["id"].ToString();
                objpais.fullname = row["fullname"].ToString();

                lstPais.Add(objpais);
            }

            return lstPais;
        }


        [WebMethod]
        public List<ListaPais> llenarCbCiudades(int id)
        {

            string strSQL = "getCiudades " + id;

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

            lstPais = new List<ListaPais>();
            ListaPais objpais;

            foreach (DataRow row in dt.Rows)
            {
                objpais = new ListaPais();
                objpais.id = row["id"].ToString();
                objpais.fullname = row["fullname"].ToString();

                lstPais.Add(objpais);
            }

            return lstPais;
        }


        [WebMethod]
        public List<CFDI> llenarCFDI(int tipo)
        {
            string strSQL = "";
            
            if(tipo == 0) //moral
            {
                strSQL = "SELECT * FROM table_UsoCFDI WHERE Regimen='1' ";

            }else if(tipo == 1) //fisica
            {
                strSQL = "SELECT * FROM table_UsoCFDI";
            }

            SqlConnection con = new SqlConnection(strConnction);
            SqlCommand cmd = new SqlCommand(strSQL,con);
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

            List<CFDI> lstCFDI = new List<CFDI>();
            CFDI objCFDI;

            foreach (DataRow row in dt.Rows)
            {
                objCFDI = new CFDI();
                objCFDI.clave = row["Clave"].ToString();
                objCFDI.descripcion = row["Descripcion"].ToString();

                lstCFDI.Add(objCFDI);
            }

            return lstCFDI;
        }



        [WebMethod]
        public List<CFDI> llenarFormaPago()
        {

            string strSQL = "SELECT * FROM table_FormaPago";

            SqlConnection con = new SqlConnection(strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                da.Fill(dt);
            }
            catch (SqlException e)
            {
              Context.Response.Write("<script language=javascript>alert('ERROR "+e.Message+"');</script>");

            }

           List<CFDI> lstFP = new List<CFDI>();
            CFDI objCFDI;

            foreach (DataRow row in dt.Rows)
            {
                objCFDI = new CFDI();
                objCFDI.clave = row["clave"].ToString();
                objCFDI.descripcion = row["descripcion"].ToString();

                lstFP.Add(objCFDI);
            }

            return lstFP;
        }
    }
}
