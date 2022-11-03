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
            public string Rfc { get; set; }
            public string Pass { get; set; }
            public string ID_Rol { get; set; }
            public string status { get; set; }
            public string ID_empresa { get; set; }
            public string Subdominio { get; set; }


        }

        [WebMethod]
        public static List<Usuario> getUsuario(string user, string pass)
        {
            string sqlStr = "UserLogin";
            SqlConnection conn = new SqlConnection(clsHerramientaBD.strConnAdmon);
            DataTable dt = new DataTable();

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@RFC", user);
                cmd.Parameters.AddWithValue("@Pass", pass);


                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (SqlException ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            finally
            {
                conn.Close();
            }
            List<Usuario> lstUser = new List<Usuario>();
            Usuario objUser;
            foreach (DataRow row in dt.Rows)
            {
                    objUser = new Usuario
                    {
                        ID = row["Id"].ToString(),
                        Rfc = row["RFC"].ToString(),
                        Pass = row["Password"].ToString(),
                        ID_Rol = row["ID_rol"].ToString(),
                        ID_empresa = row["ID_empresa"].ToString(),
                        Subdominio = row["subdominio"].ToString(),
                        status = row["status"].ToString()
                    };
                    lstUser.Add(objUser);                
                
            }
            return lstUser;
        }

        
    }
}
