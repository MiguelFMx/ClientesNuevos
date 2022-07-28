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

    public static string Insertar_info_compania(string ID_compania, string nombre_comp,
            string nombre_comercial, int tipo_persona, string rfc, string CURP,
            int tiempo_negocio, string direccion, string cp, string pais, 
            string estado, string ciudad, string fecha_registro, string id_user)
        {
            string resultado = "";
            string sqlStr = "Master_TablaCompania";
            SqlConnection con = new SqlConnection(strConnction);
            
            con.Open();
            try
            {
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.CommandType = CommandType.StoredProcedure;
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
            
            return resultado;
        }
    }
