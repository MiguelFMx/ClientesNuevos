using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

public class ClsF14
    {

        public static string strConnction = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    public static string Insertar_info_compania(string ID_compania, string nombre_comp, string nombre_comercial, int tipo_persona, string rfc, string CURP,int tiempo_negocio, string direccion, string cp, string pais,string estado, string ciudad, string fecha_registro, string id_user)
    {
            string resultado;
            string sqlStr = "Master_TablaCompania";
            SqlConnection con = new SqlConnection(strConnction);
            
            con.Open();
            try
            {
            SqlCommand cmd = new SqlCommand(sqlStr, con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@ID_compania",ID_compania);
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
            cmd.Parameters.AddWithValue("@accion", "insert");

            cmd.Parameters.Add("@Msg", SqlDbType.NVarChar, 10000).Direction = ParameterDirection.Output;


            cmd.ExecuteNonQuery();
            string res = Convert.ToString(cmd.Parameters["@Msg"].Value);

            resultado = " "+res;
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
    public static string Insertar_info_bancaria(string ID_compania, string Nombre_banco, string rfc_banco, string no_cuenta, string clave_bancaria,string Uso_CFDI, string Metodo_pago, string Forma_pago, string Moneda)
    {
        string resultado;
        string sqlStr = "Master_TablaInfoBancaria";
        SqlConnection con = new SqlConnection(strConnction);

        con.Open();
        try
        {
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
            cmd.Parameters.AddWithValue("@accion", "insert");

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

    public static string Insertar_dir_fra(string ID_compania, string Direccion_fra, string CP_fra, string Pais_fra, string Estado_fra, string Ciudad_fra)
    {
        string resultado;
        string sqlStr = "Master_TablaDireccionFra";
        SqlConnection con = new SqlConnection(strConnction);

        con.Open();
        try
        {
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
            cmd.Parameters.AddWithValue("@accion", "insert");

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



    }
