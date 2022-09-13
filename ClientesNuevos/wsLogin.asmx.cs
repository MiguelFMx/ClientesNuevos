using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ClientesNuevos
{
    /// <summary>
    /// Descripción breve de wsLogin
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class wsLogin : System.Web.Services.WebService
    {

        public class Usuario
        {
            public string ID { get; set; }
            public string user { get; set; }
            public string pass { get; set; }
            public string type { get; set; }
        }

        [WebMethod]
        public static List<Usuario> getUsuario(string user, string pass)
        {
            string sqlStr = "LogINprocedure";
            SqlConnection conn = new SqlConnection(clsHerramientaBD.strConnction);
            DataTable dt = new DataTable();

            conn.Open();

            SqlCommand cmd = new SqlCommand(sqlStr,conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@user", user);
            cmd.Parameters.AddWithValue("@password", pass);

            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            

            
            try
            {
                da.Fill(dt);
            }
            catch (SqlException e)
            {
                return null;
            }
            finally
            {
                conn.Close();
            }
            List<Usuario> lstUser = new List<Usuario>();
            Usuario objUser;
            foreach (DataRow row in dt.Rows)
            {
                objUser = new Usuario();
                objUser.ID = row["ID"].ToString();
                objUser.user = row["user_name"].ToString();
                objUser.pass = row["password"].ToString();
                objUser.type = row["type"].ToString();

                lstUser.Add(objUser);
            }
            return lstUser;
        }

        
    }
}
