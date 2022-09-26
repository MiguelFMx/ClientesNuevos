using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using ClientesNuevos.App_Code;
using ClientesNuevos.F14;

namespace ClientesNuevos.F14
{
    /// <summary>
    /// Descripción breve de wsBaseDatos
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class wsBaseDatos : System.Web.Services.WebService
    {
        [WebMethod]
        public DataTable Existe(string sqlCommand)
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

        [WebMethod]
        public string insertar_estatus(string id_compania, string status, string fecha, string no_cuenta, string programa)
        {
            string res;
            string sqlStr = "Master_Tablactpat";

            SqlConnection conn = new SqlConnection(clsHerramientaBD.strConnction);

            DataTable tabla = Existe("SELECT * FROM Table_ctpat WHERE ID_compania='" + id_compania + "'");

            conn.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", id_compania);
                cmd.Parameters.AddWithValue("@Estatus", status);
                cmd.Parameters.AddWithValue("@fecha_validacion", fecha);
                cmd.Parameters.AddWithValue("@no_cuenta", no_cuenta);
                cmd.Parameters.AddWithValue("@Programa", programa);
                if (tabla.Rows.Count > 0)
                {
                    cmd.Parameters.AddWithValue("@accion", "update");
                }
                else
                {
                    cmd.Parameters.AddWithValue("@accion", "insert");

                }
                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                res = Convert.ToString(cmd.Parameters["@Msg"].Value);
            }
            catch (SqlException e)
            {
                res = e.Message;
            }
            finally
            {
                conn.Close();
            }

            return res;
        }
        [WebMethod]
        public string Actualizar_estatus(string id_compania, string status, string fecha, string no_cuenta)
        {
            string res;
            string sqlStr = "Master_Tablactpat";

            SqlConnection conn = new SqlConnection(clsHerramientaBD.strConnction);
            conn.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, conn)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", id_compania);
                cmd.Parameters.AddWithValue("@Estatus", status);
                cmd.Parameters.AddWithValue("@fecha_validacion", fecha);
                cmd.Parameters.AddWithValue("@no_cuenta", no_cuenta);
                cmd.Parameters.AddWithValue("@accion", "update");
                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;


                cmd.ExecuteNonQuery();
                res = Convert.ToString(cmd.Parameters["@Msg"].Value);

            }
            catch (SqlException e)
            {
                res = e.Message;
            }
            finally
            {
                conn.Close();
            }

            return res;
        }
        public class Estatus
        {
            public string Status { get; set; }
            public string No_cuenta { get; set; }
            public string Fecha_validacion { get; set; }
        }
        [WebMethod]
        public List<Estatus> ObtenerEstatus(string id)
        {
            List<Estatus> lstEstatus = new List<Estatus>();
            Estatus objEsattus;
            string strSQL = "SELECT * FROM Table_ctpat WHERE ID_compania = '" + id + "'";
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            try
            {
                da.Fill(dt);
            }
            catch (Exception)
            {

                throw;
            }

            foreach (DataRow row in dt.Rows)
            {
                objEsattus = new Estatus
                {
                    Status = row["Estatus"].ToString(),
                    No_cuenta = row["no_cuenta"].ToString(),
                    Fecha_validacion = row["fecha_validacion"].ToString()
                };
                lstEstatus.Add(objEsattus);
            }

            return lstEstatus;
        }

        [WebMethod]
        public DataTable getCompania(string id)
        {
            string strSQL = "SELECT * FROM Table_compania WHERE ID_user = " + id;
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
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

        [WebMethod]
        public string LlenarContacto(string Nombre, string Puesto, string Telefono, string Extension, string Celular, string Tipo, string Correo, string ID_compania)
        {
            string res="";
           res = clsF14.Insertar_contacto(ID_compania, Nombre, Puesto, Telefono, Extension, Celular, Tipo, Correo);

            return res;
        }

        public class Contacto
        {
            public string ID { get; set; }
            public string Nombre { get; set; }
            public string Puesto { get; set; }
            public string Telefono { get; set; }
            public string Extension { get; set; }
            public string Tipo { get; set; }
            public string Celular { get; set; }
            public string Correo { get; set; }
        }

        [WebMethod]
        public List<Contacto> getContacto(string id)
        {
            string strSQL = "SELECT * FROM Table_Contacto WHERE ID_compania = '" + id + "' AND (Tipo = 'Comp' OR Tipo = 'Fra')";
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            try
            {
                da.Fill(dt);
            }
            catch (Exception)
            {

                throw;
            }
            List<Contacto> lstContacto = new List<Contacto>();
            Contacto objContacto;

            foreach (DataRow row in dt.Rows)
            {
                objContacto = new Contacto();
                objContacto.ID = row["ID"].ToString();
                objContacto.Nombre = row["Nombre"].ToString();
                objContacto.Puesto = row["Puesto"].ToString();
                objContacto.Telefono = row["Telefono"].ToString();
                objContacto.Extension = row["Extension"].ToString();
                objContacto.Celular = row["Celular"].ToString();
                objContacto.Tipo = row["Tipo"].ToString();
                objContacto.Correo = row["Correo"].ToString();


                lstContacto.Add(objContacto);
            }

            return lstContacto;
        }

        [WebMethod]
        public string BorrarContacto(string index)
        {
            string resultado = "";

            string strSQL = "DELETE FROM Table_Contacto WHERE ID = " + index;
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException sql)
            {

                resultado = sql.Message;
            }
            finally
            {
                con.Close();
                resultado = "Se borro el contacto";
            }

            return resultado;
        }


        //=====================================================Compañia filial ============================================================
        [WebMethod]
        public string insertar_CompaniaFilial(string ID_compania, string Nombre, string Nombre_comercial, string RFC, string Direccion, string Pais, string Estado,
            string Ciudad, string CP, string Nombre_contacto, string Puesto_contacto, string correo, string Telefono, string Extension, string Celular)
        {
            string resultado = "";

           resultado = clsF14.Insertar_CompaniaFilial(ID_compania, Nombre, Nombre_comercial, RFC, Direccion, Pais, Estado, Ciudad, CP, Nombre_contacto, Puesto_contacto, correo, Telefono, Extension, Celular);

            return resultado;
        }


        [WebMethod]
        public string GetID()
        {
            DataTable dt = new DataTable();
            string id_com = "";
            if (HttpContext.Current.Request.Cookies.Get("id_comp").Value != "")
            {
                id_com = HttpContext.Current.Request.Cookies.Get("id_comp").Value;
            }
            else
            {
             dt = Existe("SELECT * FROM Table_compania WHERE ID_user ='" + HttpContext.Current.Request.Cookies.Get("id").Value + "'");

            }

            if (dt.Rows.Count > 0)
            {
                id_com = dt.Rows[0]["RFC"].ToString();
            }

            return id_com;
        }

        public class ComFil
        {
            public string ID { get; set; }
            public string ID_compania { get; set; }
            public string Nombre { get; set; }
            public string Nombre_comercial { get; set; }
            public string RFC { get; set; }
            public string Direccion { get; set; }
            public string Pais { get; set; }
            public string Estado { get; set; }
            public string Ciudad { get; set; }
            public string CP { get; set; }
            public string Nombre_contacto { get; set; }
            public string Puesto_contacto { get; set; }
            public string Correo { get; set; }
            public string Telefono { get; set; }
            public string Extension { get; set; }
            public string Celular { get; set; }
        }


        [WebMethod]
        public List<ComFil> Get_companiaFilial(string id_comp)
        {
            string strSql = "exec select_ComFilial @id_compania= '" + id_comp + "'";
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSql, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            try
            {
                con.Open();


                da.Fill(dt);
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("Hubo un error: " + ex.Message);
            }
            finally
            {
                con.Close();
            }
            ComFil objComFil;
            List<ComFil> comFils = new List<ComFil>();

            foreach (DataRow row in dt.Rows)
            {
                objComFil = new ComFil
                {
                    ID = row["ID"].ToString(),
                    ID_compania = row["ID_compania"].ToString(),
                    Nombre = row["Nombre"].ToString(),
                    Nombre_comercial = row["Nombre_comercial"].ToString(),
                    RFC = row["RFC"].ToString(),
                    Direccion = row["Direccion"].ToString(),
                    Pais = row["Pais"].ToString(),
                    Estado = row["Estado"].ToString(),
                    Ciudad = row["Ciudad"].ToString(),
                    CP = row["CP"].ToString(),
                    Nombre_contacto = row["Nombre_contacto"].ToString(),
                    Puesto_contacto = row["Puesto_contacto"].ToString(),
                    Correo = row["Correo"].ToString(),
                    Telefono = row["Telefono"].ToString(),
                    Extension = row["Extension"].ToString(),
                    Celular = row["Celular"].ToString()
                };

                comFils.Add(objComFil);
            }


            return comFils;
        }

        [WebMethod]
        public string BorrarComFilial(string index)
        {
            string resultado = "";

            string strSQL = "DELETE FROM Table_CompaniaFilial WHERE ID = " + index;
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(strSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException sql)
            {

                resultado = sql.Message;
            }
            finally
            {
                con.Close();
                resultado = "Se borro el registro";
            }

            return resultado;
        }


        //======================================================== Info. Cadena Servicio =====================================================

        //================= Programas de seguridad
        [WebMethod]
        public string Insertar_ProgramaSeguridad(string ID_compania, string Descripcion, string Codigo, string Ruta)
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


        [WebMethod]
        public string InsertarDocumento(string ID_compania, string Doc, string Ruta, string Estatus)
        {
            string documento="";
           documento = clsF14.Insertar_Documento(ID_compania, Doc, Ruta, Estatus);

            return documento;
        }

        [WebMethod]
        public string Actualizar_Estado(string ID_compania, string Documento, string Estatus)
        {
            string resultado = "";
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand("Master_Documentos", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Documento", Documento);
                cmd.Parameters.AddWithValue("@Estatus", Estatus);
                cmd.Parameters.AddWithValue("@accion", "check");
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

        //=====================================================Servicios y productos================================================================

        [WebMethod]
        public string Insertar_Productos(string ID_compania, string descripcion, string comentarios)
        {
            string resultado = "";
            string sqlStr = "Master_tableMercancia";

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);


            con.Open();

            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@Descripcion", descripcion);
                cmd.Parameters.AddWithValue("@Comentarios", comentarios);
                cmd.Parameters.AddWithValue("@accion", "insert");

                cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                resultado = Convert.ToString(cmd.Parameters["@Msg"].Value);
            }
            catch (SqlException ex)
            {
                resultado = ex.Message;
                throw;
            }
            finally
            {
                con.Close();
            }


            return resultado;
        }


        [WebMethod]
        public string insertar_servicio(string id_compania, string grupo, string subgrupo)
        {
            string resultado;
            string sqlStr = "Master_TablaServicios";
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);


            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", id_compania);
                cmd.Parameters.AddWithValue("@grupoPrincipal", grupo);
                cmd.Parameters.AddWithValue("@subGrupo", subgrupo);
                cmd.Parameters.AddWithValue("@accion", "insert");

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

        public class Mercancia
        {
            public string Descripcion { get; set; }
            public string Comentarios { get; set; }

        }
        public class Servicio
        {
            public string GrupoPrincipal { get; set; }
            public string SubGrupo { get; set; }

        }

        [WebMethod]
        public List<Mercancia> Obtener_Productos(string ID_compania)
        {
            string sqlCommand = "SELECT * FROM Table_mercancia WHERE ID_compania= '" + ID_compania + "'";
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(sqlCommand, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();

            Mercancia objMerc;
            List<Mercancia> lstMerc = new List<Mercancia>();

            try
            {
                da.Fill(data);

                foreach (DataRow row in data.Rows)
                {
                    objMerc = new Mercancia
                    {
                        Descripcion = row["Descripcion"].ToString(),
                        Comentarios = row["Comentarios"].ToString()
                    };
                    lstMerc.Add(objMerc);
                }
            }
            catch (SqlException ex)
            {

                System.Diagnostics.Trace.WriteLine(ex.Message);
            }

            return lstMerc;
        }


        [WebMethod]
        public List<Servicio> Obtener_Servicios(string ID_compania)
        {
            string sqlCommand = "SELECT * FROM Table_Servicios WHERE ID_compania= '" + ID_compania + "'";
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand(sqlCommand, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable data = new DataTable();

            Servicio objServicio;
            List<Servicio> lstServ = new List<Servicio>();
            try
            {
                da.Fill(data);

                foreach (DataRow row in data.Rows)
                {
                    objServicio = new Servicio
                    {
                        GrupoPrincipal = row["grupoPrincipal"].ToString(),
                        SubGrupo = row["subGrupo"].ToString()
                    };
                    lstServ.Add(objServicio);
                }
            }
            catch (SqlException ex)
            {

                System.Diagnostics.Trace.WriteLine(ex.Message);
            }

            return lstServ;

        }

        [WebMethod]
        public string EncontrarEliminar(string ID_Compania, string tabla)
        {
            string resultado;
            DataTable data = new DataTable();
            data = Existe("SELECT * FROM " + tabla + " WHERE ID_compania='" + ID_Compania + "'");
            if (data.Rows.Count > 0)
            {
                data = Existe("DELETE FROM " + tabla + " WHERE ID_compania='" + ID_Compania + "'");
                resultado = "Se borraron los registros anteriores";
            }
            resultado = "No habia rgistros";

            return resultado;
        }


        //===========================F14
        [WebMethod]
        public string Mostrar_compani(string ID_compania)
        {
            string resultado = "";
            string sqlStr = "select_compania";
            DataTable data = new DataTable();

            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlDataAdapter da;
            con.Open();
            try
            {
                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", ID_compania);
                cmd.Parameters.AddWithValue("@accion", "insert");




            }
            catch (SqlException ex)
            {
                resultado = ex.Message;
                throw;
            }
            finally
            {
                con.Close();
            }


            return resultado;
        }

        private void InitializeComponent()
        {

        }
    }

}

