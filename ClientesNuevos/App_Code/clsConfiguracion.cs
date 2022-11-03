using ClientesNuevos.F5.Autoevaluacion;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Drawing;

namespace ClientesNuevos.App_Code
{
    public class clsConfiguracion
    {
        /*
         -- Clase que permite el CRUD en las tablas: Roles, Empresa y subdomain de la base de datos 'user_admin'       
         */
        public static string Insertar_Empresa(string nombre, string ID_empresa)
        {
            string resultado = "";
            string sqlStr = "Master_config";
            string sqlCon = clsHerramientaBD.strConnAdmon;
            SqlConnection con = new SqlConnection(sqlCon);
            DataTable dt = new DataTable();
                
            if(ID_empresa != "")
            {
                clsHerramientaBD.Existe("SELECT * FROM Empresa WHERE ID_Empresa='" + ID_empresa + "'", sqlCon);
            }
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
               
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@tabla", "Empresa");

                if (dt.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@accion", "update");
                    cmd.Parameters.AddWithValue("@ID_empresa", ID_empresa);

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

        public static string Eliminar_Empresa(string ID_Empresa)
        {
            string resultado = "";
            string sqlStr = "Master_config";
            string sqlCon = clsHerramientaBD.strConnAdmon;
            SqlConnection con = new SqlConnection(sqlCon);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@tabla", "Empresa");
                cmd.Parameters.AddWithValue("@ID_Empresa", ID_Empresa);
                cmd.Parameters.AddWithValue("@accion", "delete");               
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
        
        //====================Roles=====================================
        public static string Insertar_Roles(string rol, string Id)
        {
            string resultado = "";
            string sqlStr = "Master_config";
            string sqlCon = clsHerramientaBD.strConnAdmon;
            SqlConnection con = new SqlConnection(sqlCon);
            DataTable dt = new DataTable();

            if (Id != "")
            {
                dt = clsHerramientaBD.Existe("SELECT * FROM Roles WHERE Id='" + Id + "'", sqlCon);

            }
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@Rol", rol);
                cmd.Parameters.AddWithValue("@tabla", "Roles");

                if (dt.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
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

        public static string Borrar_Roles(string rol, string Id)
        {
            string resultado = "";
            string sqlStr = "Master_config";
            string sqlCon = clsHerramientaBD.strConnAdmon;
            SqlConnection con = new SqlConnection(sqlCon);
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@Id", Id);
                cmd.Parameters.AddWithValue("@Rol", rol);
                cmd.Parameters.AddWithValue("@tabla", "Roles");
                cmd.Parameters.AddWithValue("@accion", "delete");                
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

        //=================== Subdominios ==============================
        public static string Insertar_Subdom(string subdominio, string ID_empresa, string Id)
        {
            string resultado = "";
            string sqlStr = "Master_config";
            string sqlCon = clsHerramientaBD.strConnAdmon;
            SqlConnection con = new SqlConnection(sqlCon);
            DataTable dt = new DataTable();

            string fecha = DateTime.Now.ToString("dd/MM/yyyy");
            if (Id != "")
            {
                dt = clsHerramientaBD.Existe("SELECT * FROM subdomain WHERE Id='" + Id + "'", sqlCon);

            }
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@subdominio", subdominio); 
                cmd.Parameters.AddWithValue("@ID_Empresa", ID_empresa);                
                cmd.Parameters.AddWithValue("@tabla", "subdom");

                if (dt.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@accion", "update");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");
                    cmd.Parameters.AddWithValue("@fecha", fecha);
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

        public static string Borrar_Subdom( string Id)
        {
            string resultado = "";
            string sqlStr = "Master_config";
            string sqlCon = clsHerramientaBD.strConnAdmon;
            SqlConnection con = new SqlConnection(sqlCon);
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@Id", Id);
                cmd.Parameters.AddWithValue("@tabla", "subdom");
                cmd.Parameters.AddWithValue("@accion", "delete");
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
    }
}