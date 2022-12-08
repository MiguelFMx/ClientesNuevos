using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

namespace ClientesNuevos.App_Code
{
    public class clsF14
    {
        public static string strConnction = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

             
        public static string Insertar_info_compania(string ID_compania, string nombre_comp, string nombre_comercial, int tipo_persona, string rfc, string CURP, int tiempo_negocio, string direccion, string cp, string pais, string estado, string ciudad, string fecha_registro, string id_user)
        {
            F14.wsBaseDatos wsBaseDatos = new ClientesNuevos.F14.wsBaseDatos();

            string resultado;
            DataTable table = wsBaseDatos.Existe("SELECT * FROM Table_compania WHERE ID_compania ='" + ID_compania + "'");


            string sqlStr = "Master_TablaCompania";
            SqlConnection con = new SqlConnection(strConnction);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Nombre_comp", nombre_comp);
                cmd.Parameters.AddWithValue("@nombre_comercial", nombre_comercial);
                cmd.Parameters.AddWithValue("@Tipo_persona", tipo_persona);
                cmd.Parameters.AddWithValue("@RFC", rfc);
                cmd.Parameters.AddWithValue("@CURP", CURP);
                cmd.Parameters.AddWithValue("@tiempo_negocio", tiempo_negocio);
                cmd.Parameters.AddWithValue("@direccion", direccion);
                cmd.Parameters.AddWithValue("@codigo_postal", cp);
                cmd.Parameters.AddWithValue("@Pais", pais);
                cmd.Parameters.AddWithValue("@Estado", estado);
                cmd.Parameters.AddWithValue("@Ciudad", ciudad);
                cmd.Parameters.AddWithValue("@fecha_registro", fecha_registro);
                cmd.Parameters.AddWithValue("@ID_user", id_user);


                if (table.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@accion", "update");

                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;


                cmd.ExecuteNonQuery();
                string res = Convert.ToString(cmd.Parameters["@Msg"].Value);

                resultado = " " + res;
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
        public static string Actualizar_info(string ID_compania, string nombre_comp, string nombre_comercial, int tipo_persona, string rfc, string CURP, int tiempo_negocio, string direccion, string cp, string pais, string estado, string ciudad, string fecha_registro, string id_user)
        {
            string resultado;

            SqlConnection con = new SqlConnection(strConnction);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("Master_TablaCompania", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Nombre_comp", nombre_comp);
                cmd.Parameters.AddWithValue("@nombre_comercial", nombre_comercial);
                cmd.Parameters.AddWithValue("@Tipo_persona", tipo_persona);
                cmd.Parameters.AddWithValue("@RFC", rfc);
                cmd.Parameters.AddWithValue("@CURP", CURP);
                cmd.Parameters.AddWithValue("@tiempo_negocio", tiempo_negocio);
                cmd.Parameters.AddWithValue("@direccion", direccion);
                cmd.Parameters.AddWithValue("@codigo_postal", cp);
                cmd.Parameters.AddWithValue("@Pais", pais);
                cmd.Parameters.AddWithValue("@Estado", estado);
                cmd.Parameters.AddWithValue("@Ciudad", ciudad);
                cmd.Parameters.AddWithValue("@fecha_registro", fecha_registro);
                cmd.Parameters.AddWithValue("@accion", "update");

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;


                cmd.ExecuteNonQuery();
                string res = Convert.ToString(cmd.Parameters["@Msg"].Value);

                resultado = " " + res;
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
            }


            return resultado;
        }
        public static string Insertar_info_bancaria(string ID_compania, string Nombre_banco, string rfc_banco, string no_cuenta, string clave_bancaria, string Uso_CFDI, string Metodo_pago, string Forma_pago, string Moneda)
        {
            ClientesNuevos.F14.wsBaseDatos wsBaseDatos = new ClientesNuevos.F14.wsBaseDatos();
            string resultado;
            DataTable data = wsBaseDatos.Existe("SELECT * FROM Table_infoBancaria WHERE ID_compania='" + ID_compania + "'");
            string sqlStr = "Master_TablaInfoBancaria";
            SqlConnection con = new SqlConnection(strConnction);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Nombre_banco", Nombre_banco);
                cmd.Parameters.AddWithValue("@rfc_banco", rfc_banco);
                cmd.Parameters.AddWithValue("@no_cuenta", no_cuenta);
                cmd.Parameters.AddWithValue("@clave_bancaria", clave_bancaria);
                cmd.Parameters.AddWithValue("@Uso_CFDI", Uso_CFDI);
                cmd.Parameters.AddWithValue("@Metodo_pago", Metodo_pago);
                cmd.Parameters.AddWithValue("@Forma_pago", Forma_pago);
                cmd.Parameters.AddWithValue("@Moneda", Moneda);


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

        public static string Actualizar_info_bancaria(string ID_compania, string Nombre_banco, string rfc_banco, string no_cuenta, string clave_bancaria, string Uso_CFDI, string Metodo_pago, string Forma_pago, string Moneda)
        {
            string resultado;
            string sqlStr = "Master_TablaInfoBancaria";
            SqlConnection con = new SqlConnection(strConnction);

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Nombre_banco", Nombre_banco);
                cmd.Parameters.AddWithValue("@rfc_banco", rfc_banco);
                cmd.Parameters.AddWithValue("@no_cuenta", no_cuenta);
                cmd.Parameters.AddWithValue("@clave_bancaria", clave_bancaria);
                cmd.Parameters.AddWithValue("@Uso_CFDI", Uso_CFDI);
                cmd.Parameters.AddWithValue("@Metodo_pago", Metodo_pago);
                cmd.Parameters.AddWithValue("@Forma_pago", Forma_pago);
                cmd.Parameters.AddWithValue("@Moneda", Moneda);
                cmd.Parameters.AddWithValue("@accion", "update");

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

        public static string Actualizar_dir_fra(string ID_compania, string Direccion_fra, string CP_fra, string Pais_fra, string Estado_fra, string Ciudad_fra)
        {
            string resultado;
            SqlConnection con = new SqlConnection(strConnction);
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("Master_TablaDireccionFra", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Direccion_fra", Direccion_fra);
                cmd.Parameters.AddWithValue("@CP_fra", CP_fra);
                cmd.Parameters.AddWithValue("@Pais_fra", Pais_fra);
                cmd.Parameters.AddWithValue("@Estado_fra", Estado_fra);
                cmd.Parameters.AddWithValue("@Ciudad_fra", Ciudad_fra);
                cmd.Parameters.AddWithValue("@accion", "update");

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                resultado = Convert.ToString(cmd.Parameters["@Msg"].Value);
            }
            catch (Exception ex)
            {
                resultado = ex.Message;
            }

            return resultado;
        }

        public static string Insertar_dir_fra(string ID_compania, string Direccion_fra, string CP_fra, string Pais_fra, string Estado_fra, string Ciudad_fra)
        {
            ClientesNuevos.F14.wsBaseDatos wsBaseDatos = new ClientesNuevos.F14.wsBaseDatos();
            string resultado;
            string sqlStr = "Master_TablaDireccionFra";
            SqlConnection con = new SqlConnection(strConnction);

            DataTable table = wsBaseDatos.Existe("SELECT * FROM Table_DireccionFra WHERE ID_compania ='" + ID_compania + "'");
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Direccion_fra", Direccion_fra);
                cmd.Parameters.AddWithValue("@CP_fra", CP_fra);
                cmd.Parameters.AddWithValue("@Pais_fra", Pais_fra);
                cmd.Parameters.AddWithValue("@Estado_fra", Estado_fra);
                cmd.Parameters.AddWithValue("@Ciudad_fra", Ciudad_fra);

                if (table.Rows.Count > 0)
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

        public static string Insertar_AgenteAduanal(string ID_compania, string Nombre, string Nombre_comercial, string no_patente, string rfc, string direccion, string cp, string estado, string ciudad, string tipo)
        {
            ClientesNuevos.F14.wsBaseDatos wsBaseDatos = new ClientesNuevos.F14.wsBaseDatos();

            string resultado;
            string sqlStr = "Master_TablaAgentAduanal";
            SqlConnection con = new SqlConnection(strConnction);

            DataTable data = wsBaseDatos.Existe("SELECT * FROM Table_AgenteAduanal WHERE ID_compania = '" + ID_compania + "' AND tipo ='" + tipo + "'");

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@Nombre_comercial", Nombre_comercial);
                cmd.Parameters.AddWithValue("@no_patente", no_patente);
                cmd.Parameters.AddWithValue("@rfc", rfc);
                cmd.Parameters.AddWithValue("@direccion", direccion);
                cmd.Parameters.AddWithValue("@estado", estado);
                cmd.Parameters.AddWithValue("@ciudad", ciudad);
                cmd.Parameters.AddWithValue("@codigo_postal", cp);
                cmd.Parameters.AddWithValue("@tipo", tipo);

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
                string res = Convert.ToString(cmd.Parameters["@Msg"].Value);

                resultado = " " + res;
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

        public static string Insertar_contacto(string ID_compania, string Nombre, string Puesto, string Telefono, string Extension, string Celular, string tipo, string Correo, string id)
        {
            string resultado;
            string sqlStr = "Master_TablaContacto";
            SqlConnection con = new SqlConnection(strConnction);

            DataTable dt = new DataTable();

            if(id != "")
            {
                dt = clsHerramientaBD.Existe("SELECT * FROM [Table_Contacto] WHERE ID='"+id+"'");
            }


            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@Puesto", Puesto);
                cmd.Parameters.AddWithValue("@Telefono", Telefono);
                cmd.Parameters.AddWithValue("@Extension", Extension);
                cmd.Parameters.AddWithValue("@Tipo", tipo);
                cmd.Parameters.AddWithValue("@Celular", Celular);
                cmd.Parameters.AddWithValue("@Correo", Correo);

                   if(dt.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@accion", "update2");
                    cmd.Parameters.AddWithValue("@ID", id);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;


                cmd.ExecuteNonQuery();
                string res = Convert.ToString(cmd.Parameters["@Msg"].Value);

                resultado = " " + res;
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
        //update2




        public static string Insertar_contactoAA(string ID_compania, string Nombre, string Puesto, string Telefono, string Extension, string Celular, string tipo, string Correo)
        {
            string resultado;
            string sqlStr = "Master_TablaContacto";
            SqlConnection con = new SqlConnection(strConnction);
            ClientesNuevos.F14.wsBaseDatos wsBaseDatos = new ClientesNuevos.F14.wsBaseDatos();
            DataTable data = wsBaseDatos.Existe(" SELECT * FROM Table_Contacto WHERE ID_compania ='" + ID_compania + "'AND tipo ='" + tipo + "'");

            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@Puesto", Puesto);
                cmd.Parameters.AddWithValue("@Telefono", Telefono);
                cmd.Parameters.AddWithValue("@Extension", Extension);
                cmd.Parameters.AddWithValue("@Tipo", tipo);
                cmd.Parameters.AddWithValue("@Celular", Celular);
                cmd.Parameters.AddWithValue("@Correo", Correo);

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
                string res = Convert.ToString(cmd.Parameters["@Msg"].Value);

                resultado = " " + res;
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

        public static string Insertar_CompaniaFilial(string ID_compania, string Nombre, string Nombre_comercial, string RFC, string Direccion, string Pais, string Estado,
                string Ciudad, string CP, string Nombre_contacto, string Puesto_contacto, string correo, string Telefono, string Extension, string Celular, string id)
        {
            string resultado = "";

            SqlConnection con = new SqlConnection(strConnction);
            DataTable dt = new DataTable();

            if (id != "")
            {
                dt = clsHerramientaBD.Existe("SELECT * FROM Table_CompaniaFilial WHERE ID = '"+id+"'");
            }
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("Mastar_ComFilial", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@Nombre_comercial", Nombre_comercial);
                cmd.Parameters.AddWithValue("@RFC", RFC);
                cmd.Parameters.AddWithValue("@Direccion", Direccion);
                cmd.Parameters.AddWithValue("@Pais", Pais);
                cmd.Parameters.AddWithValue("@Estado", Estado);
                cmd.Parameters.AddWithValue("@Ciudad", Ciudad);
                cmd.Parameters.AddWithValue("@CP", CP);
                cmd.Parameters.AddWithValue("@Nombre_contacto", Nombre_contacto);
                cmd.Parameters.AddWithValue("@Puesto_contacto", Puesto_contacto);
                cmd.Parameters.AddWithValue("@Correo", correo);
                cmd.Parameters.AddWithValue("@Telefono", Telefono);
                cmd.Parameters.AddWithValue("@Extension", Extension);
                cmd.Parameters.AddWithValue("@Celular", Celular);
                if (dt.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@accion", "update");
                    cmd.Parameters.AddWithValue("@ID", id);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                resultado = " " + Convert.ToString(cmd.Parameters["@Msg"].Value);
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


        public static string Insertar_ProgramaSeguridad(string ID_compania, string Descripcion, string Codigo, string Ruta)
        {
            string resultado = "";

            string sqlStr = "Master_ProgramaSeguridad";
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);

            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Descripcion", Descripcion);
                cmd.Parameters.AddWithValue("@codigo_certificacion", Codigo);
                cmd.Parameters.AddWithValue("@ruta", Ruta);
                cmd.Parameters.AddWithValue("@accion", "insert");

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

        //editar programa de seguridad, documento pdf
        public static string Insertar_ProgramaSeguridad(string ID_compania, string Descripcion, string Codigo, string Ruta, string ID)
        {
            string resultado = "";

            string sqlStr = "Master_ProgramaSeguridad";
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);

            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@id", ID);

                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Descripcion", Descripcion);
                cmd.Parameters.AddWithValue("@codigo_certificacion", Codigo);
                cmd.Parameters.AddWithValue("@ruta", Ruta);
                cmd.Parameters.AddWithValue("@accion", "update");

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


        public static string Insertar_Documento(string ID_compania, string nombreDocumento, string Ruta, string Estatus)
        {
            string resultado = "", fecha = "";
            ClientesNuevos.F14.wsBaseDatos wsBaseDatos = new ClientesNuevos.F14.wsBaseDatos();
            SqlConnection con = new SqlConnection(strConnction);

            DataTable dt = wsBaseDatos.Existe("SELECT * FROM Table_Documentos WHERE ID_compania='" + ID_compania + "' AND Documento='" + nombreDocumento + "'");

            fecha = DateTime.Now.ToString("dd/MM/yyyy");
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("Master_Documentos", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Documento", nombreDocumento);
                cmd.Parameters.AddWithValue("@Ruta", Ruta);
                cmd.Parameters.AddWithValue("@Fecha", fecha);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Estatus"].ToString() == "100%")
                    {
                        if(nombreDocumento == "F20")
                        {
                            cmd.Parameters.AddWithValue("@Estatus", "100%");

                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@Estatus", "updated");

                        }

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Estatus", Estatus);

                    }
                    cmd.Parameters.AddWithValue("@accion", "update");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");
                    cmd.Parameters.AddWithValue("@Estatus", Estatus);

                }

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                resultado = Convert.ToString(cmd.Parameters["@Msg"].Value);

                //resultado = res;
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
    }
}