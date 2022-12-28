using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ClientesNuevos.admin.consulta
{
    /// <summary>
    /// Descripción breve de wsConsultas
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsConsultas : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }

        public class OpinionPositiva: Registros
        {
            public string Fecha_creacion { get; set; }
            public string Documento { get; set; }
            public string Status_doc { get; set; }
        }
        public class Registros
        {
            public string ID_compania { get; set; }
            public string Nombre_comp { get; set; }
            public string Nombre_comercial { get; set; }
            public string Tipo_persona { get; set; }
            public string Fecha_registro { get; set; }
            public string Estatus { get; set; }
        }


        public class Contacto:Registros
        {
            public string Nombre { get; set; }
            public string Puesto { get; set; }
            public string Correo { get; set; }
            public string Telefono { get; set; }
            public string Extension { get; set; }
            public string Celular { get; set; }
            public string Tipo { get; set; }
        }

        public class Roles : Registros
        {
            public string Rol { get; set; }
            public string Dominio { get; set; }

        }
        [WebMethod]
        public List<Contacto> GetContactos()
        {
            var list = new List<Contacto>();
            Contacto objContacto;
            try
            {
                DataTable tContacto = clsHerramientaBD.Existe("exec Master_TablaContacto @accion='Lista'");
                if(tContacto.Rows.Count > 0)
                {
                    foreach (DataRow row in tContacto.Rows)
                    {
                        objContacto = new Contacto
                        {
                            ID_compania = row["ID_compania"].ToString(),
                            Nombre_comercial = row["Nombre_comercial"].ToString(),
                            Nombre = row["Nombre"].ToString(),
                            Puesto = row["Puesto"].ToString(),
                            Correo = row["Correo"].ToString(),
                            Telefono = row["Telefono"].ToString(),
                            Extension = row["Extension"].ToString(),
                            Celular = row["Celular"].ToString(),
                            Tipo = row["Tipo"].ToString(),
                             Estatus="",
                             Fecha_registro="",
                             Nombre_comp ="",
                             Tipo_persona = ""
                        };
                        list.Add(objContacto);
                    }
                }
            }
            catch (Exception ex)
            {
                
            }

            return list;    
        }

        [WebMethod]
        public List<Registros> Obtener_registros(string status)
        {
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM  Table_compania WHERE Estatus = '"+status+"'");
            List<Registros> registros = new List<Registros>();
            Registros objR;
            if(dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    objR = new Registros
                    {
                        ID_compania = row["ID_compania"].ToString(),
                        Nombre_comp = row["Nombre_comp"].ToString(),
                        Nombre_comercial = row["Nombre_comercial"].ToString(),
                        Fecha_registro = row["Fecha_registro"].ToString(),
                        Tipo_persona = row["Tipo_persona"].ToString(),
                        Estatus = row["Estatus"].ToString() 
                    };
                    registros.Add(objR);    
                }
            }
            return registros;
        }


        [WebMethod]
        public List<Registros> Obtener_tipoRegimen(string regimen)
        {
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM  Table_compania WHERE Tipo_persona = '" + regimen + "'");
            List<Registros> registros = new List<Registros>();
            Registros objR;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    objR = new Registros
                    {
                        ID_compania = row["ID_compania"].ToString(),
                        Nombre_comp = row["Nombre_comp"].ToString(),
                        Nombre_comercial = row["Nombre_comercial"].ToString(),
                        Fecha_registro = row["Fecha_registro"].ToString(),
                        Tipo_persona = row["Tipo_persona"].ToString(),
                        Estatus = row["Estatus"].ToString()
                    };
                    registros.Add(objR);
                }
            }
            return registros;
        }


        [WebMethod]
        public List<OpinionPositiva> Obtener_OP()
        {
            OpinionPositiva objOP;
            List<OpinionPositiva> lstOP = new List<OpinionPositiva>();
            DataTable dtComp = new DataTable();
            DataTable dtDoc = new DataTable();
            int sinOP = 0;
            int OPdes = 0;
            dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE Estatus='activo'");
            if (dtComp.Rows.Count > 0)
            {
                for (int i = 0; i < dtComp.Rows.Count; i++)
                {

                    if (dtComp.Rows[i]["Tipo_persona"].ToString() != "2")
                    {
                        string id = dtComp.Rows[i]["ID_compania"].ToString();
                        dtDoc = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE Documento='Opinion positiva' AND ID_compania='" + id + "'");
                        if (dtDoc.Rows.Count > 0)
                        {
                            string mes = DateTime.Now.ToString("MM");
                            string fecha = dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(3, 2);

                            if (fecha != mes)
                            {
                                OPdes++;
                                objOP = new OpinionPositiva
                                {
                                    ID_compania = id,
                                    Nombre_comp = dtComp.Rows[i]["Nombre_comp"].ToString(),
                                    Nombre_comercial = dtComp.Rows[i]["Nombre_comercial"].ToString(),
                                    Documento = dtDoc.Rows[0]["Documento"].ToString(),
                                    Fecha_creacion = dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(0, 10),
                                    Status_doc = dtDoc.Rows[0]["Estatus"].ToString(),
                                    Tipo_persona = dtComp.Rows[0]["Tipo_persona"].ToString()
                                };
                                lstOP.Add(objOP);

                            }
                        }
                        else
                        {
                            sinOP++;
                            objOP = new OpinionPositiva
                            {
                                ID_compania = id,
                                Nombre_comp = dtComp.Rows[i]["Nombre_comp"].ToString(),
                                Nombre_comercial = dtComp.Rows[i]["Nombre_comercial"].ToString(),
                                Documento = "Opinion positiva",
                                Fecha_creacion = "--/--/----",
                                Status_doc = "pendiente",
                               Tipo_persona = dtComp.Rows[i]["Tipo_persona"].ToString()

                            };
                            lstOP.Add(objOP);

                        } 
                    }

                }
            }



            return lstOP;
        }



        [WebMethod]
        public List<Roles> Obtener_Clientes()
        {
            Roles objRol;
            List<Roles> lstRol = new List<Roles>();
            DataTable dtComp = new DataTable();
            DataTable dtRoles = new DataTable();
            int cliente = 0;
            int proveedor = 0;
            int sinRol = 0;

            string subdominio, dominio, rol;
            dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE Estatus='activo'");
            if (dtComp.Rows.Count > 0)
            {
                for (int i = 0; i < dtComp.Rows.Count; i++)
                {
                    string id = dtComp.Rows[i]["RFC"].ToString();
                    dtRoles = clsHerramientaBD.Existe("exec Master_UserRols @RFC='"+id+"',@accion='GetRolEspecifico'",clsHerramientaBD.strConnAdmon);
                    if (dtRoles.Rows.Count > 0)
                    {
                        if(dtRoles.Rows.Count == 1)
                        {
                            subdominio = dtRoles.Rows[0]["subdominio"].ToString();
                            dominio = dtRoles.Rows[0]["Nombre"].ToString();
                            rol = dtRoles.Rows[0]["Rol"].ToString();
                            if (rol == "proveedor" )
                            {
                                proveedor++;
                                objRol = new Roles
                                {
                                    ID_compania = id,
                                    Nombre_comp = dtComp.Rows[i]["RFC"].ToString(),
                                    Nombre_comercial = dtComp.Rows[i]["RFC"].ToString(),
                                    Rol = rol,
                                    Dominio = dominio
                                };
                            }
                            else if(rol== "cliente")
                            {
                                cliente++;

                            }

                        } 

                        //if (fecha != mes)
                        //{
                        //    //CLiente
                        //    objOP = new OpinionPositiva
                        //    {
                        //        ID_compania = id,
                        //        Nombre_comp = dtComp.Rows[i]["Nombre_comp"].ToString(),
                        //        Nombre_comercial = dtComp.Rows[i]["Nombre_comercial"].ToString(),
                        //        Documento = dtDoc.Rows[0]["Documento"].ToString(),
                        //        Fecha_creacion = dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(0, 10),
                        //        Status_doc = dtDoc.Rows[0]["Estatus"].ToString()
                        //    };
                        //    lstRol.Add(objRol);
                        //    //proveedor
                        //}else if ()
                        //{

                        //}
                    }
                    else
                    {
                        //Sin rol asignado,es decir sin registro
                        //sinRol++;
                        //objRol = new OpinionPositiva
                        //{
                        //    ID_compania = id,
                        //    Nombre_comp = dtComp.Rows[i]["Nombre_comp"].ToString(),
                        //    Nombre_comercial = dtComp.Rows[i]["Nombre_comercial"].ToString(),
                        //    Documento = "Opinion positiva",
                        //    Fecha_creacion = "--/--/----",
                        //    Status_doc = "pendiente"
                        //};
                        //lstOP.Add(objRol);

                    }

                }
            }
            return lstRol;
        }


        [WebMethod]
        public string RegistrarContacto(string RFC, string nombre, string puesto, string mail, string tipo, string tel, string ext, string cel)
        {
            string resultado;
            string sqlStr = "Master_TablaContacto";
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlStr, con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@ID_compania", RFC);
                cmd.Parameters.AddWithValue("@Nombre", nombre);
                cmd.Parameters.AddWithValue("@Puesto", puesto);
                cmd.Parameters.AddWithValue("@Telefono", tel);
                cmd.Parameters.AddWithValue("@Extension", ext);
                cmd.Parameters.AddWithValue("@Tipo", tipo);
                cmd.Parameters.AddWithValue("@Celular", cel);
                cmd.Parameters.AddWithValue("@Correo", mail);
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
            return "";
        }
    }
}
