using Antlr.Runtime.Tree;
using ClientesNuevos.App_Code;
using ClientesNuevos.F5.Autoevaluacion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ClientesNuevos.admin.usuarios
{
    /// <summary>
    /// Descripción breve de wsUsuarios
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class wsUsuarios : System.Web.Services.WebService
    {

        [WebMethod]
        public string Registrar_rol(string rfc, string subdom, string ID_rol, string ID_empresa, string id)
        {
            //string connection = clsHerramientaBD.VerificarConexion(clsHerramientaBD.strConnAdmon);
            string resultado = "";
            string sqlStr = "Master_UserRols";
            string sqlCon = clsHerramientaBD.strConnAdmon;

            SqlConnection con = new SqlConnection(sqlCon);
            DataTable dt = new DataTable();
            if(id != "")
            {
                dt = clsHerramientaBD.Existe("SELECT * FROM user_detalles WHERE Id='" + id + "'", sqlCon);
            }
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@RFC", rfc);
                cmd.Parameters.AddWithValue("@ID_Empresa", ID_empresa);
                cmd.Parameters.AddWithValue("@ID_rol", ID_rol);
                cmd.Parameters.AddWithValue("@subdominio", subdom);

                if (dt.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@accion", "update");

                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }
                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                string res = Convert.ToString(cmd.Parameters["@Msg"].Value);

                resultado = res;
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


        public class Roles
        {
            public string Id { get; set; }
            public string Dominio { get; set; }
            public string Subdominio { get; set; }
            public string Rol { get; set; }
            public string RFC { get; set; }

        }

        [WebMethod]
        public List<Roles> Obtener_roles_user(string id)
        {
            List<Roles> lst = new List<Roles>();
            Roles objR;
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("exec Master_UserRols @accion='getroles', @RFC='"+id+"'", clsHerramientaBD.strConnAdmon);

            foreach (DataRow Row in dt.Rows)
            {
                objR = new Roles
                {
                    Dominio = Row["Dominio"].ToString(),
                    Id = Row["Id"].ToString(),
                    RFC = Row["RFC"].ToString(),
                    Subdominio = Row["Subdominio"].ToString(),
                    Rol = Row["Rol"].ToString()
                };
                lst.Add(objR);
            }
            return lst;
        }

        [WebMethod]
        public List<Roles> ObtenerRoles_Especifico(string id)
        {
            List<Roles> roles = new List<Roles>();
            Roles objR;
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("exec Master_UserRols @accion='GetRolEspecifico', @RFC='" + id + "'", clsHerramientaBD.strConnAdmon);

            foreach (DataRow Row in dt.Rows)
            {
                objR = new Roles
                {
                    Dominio = Row["Nombre"].ToString(),
                    Id = Row["Id"].ToString(),
                    RFC = Row["RFC"].ToString(),
                    Subdominio = Row["Subdominio"].ToString(),
                    Rol = Row["Rol"].ToString()
                };
                roles.Add(objR);
            }
            return roles;
        }

        [WebMethod]
        public string Borrar_Rol(string id)
        {
            string res = "";
            res = clsHerramientaBD.ExecuteSql("DELETE FROM user_detalles WHERE Id = '" + id + "'");            

            return res;
        }

    }
}
