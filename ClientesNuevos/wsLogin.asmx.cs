using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using MailKit.Net;
using MailKit;
using MimeKit.Text;
using MimeKit;
using MailKit.Net.Smtp;

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

        [WebMethod]
        public string GetMail(string email)
        {
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE Correo = '"+email+"'");
            if (dt.Rows.Count > 0)
            {
                return "1";
            }
            else
            {
                return "0";
            }
        }

        [WebMethod]
        public string EnviarCorreo(string email)
        {
            string resultado="";

            string rfc="", pass="";

            DataTable table = clsHerramientaBD.Existe("Select * from Table_Contacto WHERE Correo='" + email + "'");
            if (table.Rows.Count > 0)
            {
                rfc = table.Rows[0]["ID_compania"].ToString();

                DataTable dtInfo = clsHerramientaBD.Existe("SELECT * FROM Usuarios WHERE RFC ='"+rfc+"'", clsHerramientaBD.strConnAdmon);

                if(dtInfo.Rows.Count > 0)
                {
                    pass = dtInfo.Rows[0]["Password"].ToString();
                }

                //Metodo para enviar correo por medio de MailKit
                MimeMessage message = new MimeMessage();
                message.From.Add(new MailboxAddress("No Re: Hungaros", "postmaster@hungaros.com"));
                message.To.Add(new MailboxAddress("", email));
                //message.To.Add(new MailboxAddress("Certificaciones", "freyde.miguel@gmail.com"));

                message.Subject = "Contacto";
                message.Body = new TextPart(TextFormat.Html)
                {
                    Text = "<div>Usuario con RFC:" + rfc + "<br><br>Por medio del correo de " + email + " solicito su contraseña <br><br> Contraseña:" + pass + "<br><br><br>Por favor, ingrese a su cuenta y actulice su contraseña<br></div>"
                };
                SmtpClient client = new SmtpClient();
                try
                {
                    client.Connect("mailc76.carrierzone.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
                    client.Authenticate("postmaster@hungaros.com", "Hungaro5.Mai1!");
                    client.Send(message);
                    client.Disconnect(true);
                    resultado = "Correo enviado";
                }               
                catch (Exception ex)
                {
                    return ex.Message;
                }


            }
            else
            {
                resultado = "No se encontro el correo";
            }

           

            //return "Correo enviado, gracias por contactarte con nosotros";

            return resultado;
        }
        
    }
}
