using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace ClientesNuevos.App_Code
{
    public class clsHerramientaBD
    {
        public static string strConnction = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        public static DataTable Existe(string sqlCommand)
        {
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(sqlCommand, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            try
            {
                da.Fill(dt);
            }
            catch (Exception)
            {

                throw;
            }

            return dt;
        }

        public static string ExecuteSql(string strSql)
        {
            string strError = "";

            SqlConnection conn = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSql, conn);


            conn.Open();

            try
            {
                cmd.Connection = conn;
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {

                strError = ex.Message;
            }

            return strError;
        }
    }
}