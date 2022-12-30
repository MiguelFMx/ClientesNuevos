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
using System.Web.WebSockets;

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
            DataTable detalles = new DataTable();

            detalles = clsHerramientaBD.Existe("SELECT * FROM user_detalles WHERE RFC='"+rfc+"' AND subdominio ='"+subdom+"' AND ID_Empresa='"+ID_empresa+"'",clsHerramientaBD.strConnAdmon);

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
                    if (detalles.Rows.Count > 0)
                    {
                        return "Un usuario no puede contar con mas de un rol en el mismo subdominio";
                    }
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
        public string ExisteRFC(string rfc)
        {
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Usuarios WHERE RFC='" + rfc + "'", clsHerramientaBD.strConnAdmon);
            if (dt.Rows.Count > 0)
            {
                return "si";
            }
            else
            {
                return "no";
            }
        }
        [WebMethod]
        public string Borrar_Rol(string id)
        {
            string res = "";
            res = clsHerramientaBD.ExecuteSql("DELETE FROM user_detalles WHERE Id = '" + id + "'", clsHerramientaBD.strConnAdmon);            

            return res;
        }
        /*
          //Contacto
                    //Puesto
                    //Correo
                    //Telefono
                    //Extension
                    //Celular
                    //Tipo de contacto*/
        public class Directorio
        {
            public string Contacto { get; set; }
            public string Puesto { get; set; }
            public string Correo { get; set; }
            public string Telefono { get; set; }
            public string Extension { get; set; }
            public string Celular { get; set; }
            public string Tipo { get; set; }
        }

        [WebMethod]
        public List<Directorio> ObtenerContactos(string RFC)
        {
            List<Directorio> lista = new List<Directorio>();
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE ID_compania = '"+RFC+"'");

            foreach (DataRow dr in dt.Rows)
            {
                Directorio objR = new Directorio
                {
                    Contacto = dr["Nombre"].ToString(),
                    Puesto = dr["Puesto"].ToString(),
                    Correo = dr["Correo"].ToString(),
                    Telefono = dr["Telefono"].ToString(),
                    Extension = dr["Extension"].ToString(),
                    Celular = dr["Celular"].ToString(),
                    Tipo = dr["Tipo"].ToString()
                };
                lista.Add(objR);
            }

            return lista;
        }


        [WebMethod]
        public string BorrarUsuario(string id)
        {
            string eliminar = "", delete = "";
            DataTable dtUser, dtDetalles, dtLogin;
            string error = "Ocurio un error al intentar eliminar el usuario";
            dtUser = clsHerramientaBD.Existe("SELECT * FROM Usuarios WHERE Id = '" + id + "'", clsHerramientaBD.strConnAdmon);
            dtDetalles = clsHerramientaBD.Existe("SELECT * FROM [user_detalles] WHERE RFC='" + dtUser.Rows[0]["RFC"].ToString()+"'", clsHerramientaBD.strConnAdmon);
            dtLogin = clsHerramientaBD.Existe("SELECT * FROM Logins WHERE RFC='" + dtUser.Rows[0]["RFC"].ToString() + "'", clsHerramientaBD.strConnAdmon);
            //Eliminar roles

            if (dtLogin.Rows.Count > 0)
            {
                eliminar = clsHerramientaBD.ExecuteSql("DELETE FROM Logins WHERE RFC='"+ dtUser.Rows[0]["RFC"].ToString() + "'",clsHerramientaBD.strConnAdmon);
                if(eliminar != "")
                {
                    return "Error: " + eliminar;
                }
            }
            if (dtDetalles.Rows.Count > 0)
            {
                eliminar = clsHerramientaBD.ExecuteSql("DELETE FROM [user_detalles] WHERE RFC='" + dtUser.Rows[0]["RFC"].ToString() + "'", clsHerramientaBD.strConnAdmon);
                
                if(eliminar == "")
                {
                    delete = clsHerramientaBD.ExecuteSql("DELETE FROM Usuarios WHERE Id='" + id + "'", clsHerramientaBD.strConnAdmon);

                    if(delete == "")
                    {
                        return "Usuario eliminado con exito";
                    }
                    else
                    {
                        return error;
                    }

                }
                else
                {
                    return error;
                }
            }
            else
            {
                //no hay roles
                delete = clsHerramientaBD.ExecuteSql("DELETE FROM Usuarios WHERE Id='" + id + "'", clsHerramientaBD.strConnAdmon);
                if (delete == "")
                {
                    return "Usuario eliminado con exito";
                }
                else
                {
                    return error;
                }
            }
        }
    }
}
