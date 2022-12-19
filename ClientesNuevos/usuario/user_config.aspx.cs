using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MailKit.Net.Smtp;
using MimeKit;
using MimeKit.Text;
using System.Web.Services.Description;

namespace ClientesNuevos.usuario
{
    public partial class user_config : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ddIdioma_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string index = ddIdioma.SelectedItem.Value;
            //    if (index == "en")
            //    {
            //        lblIdiomas.Text = "Language";
            //        lblPass.Text = "Password";
            //        txtPass.Attributes.Add("placeholder", "Password");
            //        lbluser.Text = "User";
            //        txtUser.Attributes.Add("placeholder", "User");
            //        lblHeading.Text = "Welcome to Hungaro's Transportistas";
            //        btnLogin.Text = "Log in";
            //        RememberMe.Text = "&nbsp;Remember me";
            //        btnPasswordOlvidado.Text = "Forgot Password";
            //    }
            //    else
            //    {
            //        lblIdiomas.Text = "Idioma";
            //        lblPass.Text = "Contraseña";
            //        txtPass.Attributes.Add("placeholder", "Contraseña");
            //        lbluser.Text = "Usuario";
            //        txtUser.Attributes.Add("placeholder", "Usuario");
            //        lblHeading.Text = "Bienvenido a Hungaro's Transportistas";
            //        btnLogin.Text = "Iniciar sesión";
            //        btnPasswordOlvidado.Text = "Olvidé la contraseña";
            //        RememberMe.Text = "&nbsp;Recuerdame";

            //    }
            //Response.Cookies.Add(new HttpCookie("lang", ddIdioma.SelectedItem.Value));
        }

        protected void CambiarPass_CancelButtonClick(object sender, EventArgs e)
        {

        }

        protected void CambiarPass_ChangingPassword(object sender, LoginCancelEventArgs e)
        {
            if(CambiarPass.CurrentPassword != CambiarPass.NewPassword)
            {
                int affectedRow = 0;
                string SqlStr = "UPDATE [Usuarios] SET [Password] = @NewPass WHERE [RFC] = @RFC AND [Password] = @CurrentPass";

                SqlConnection con = new SqlConnection(clsHerramientaBD.strConnAdmon);
                SqlCommand cmd = new SqlCommand(SqlStr, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@RFC", this.Page.User.Identity.Name);
                cmd.Parameters.AddWithValue("@CurrentPass", CambiarPass.CurrentPassword);
                cmd.Parameters.AddWithValue("@NewPass", CambiarPass.NewPassword);
                try
                {
                    con.Open();
                    affectedRow = cmd.ExecuteNonQuery();
                    con.Close();


                    if (affectedRow > 0)
                    {
                        lblPass.ForeColor = Color.Green;
                        lblPass.Text = "La contraseña ha sido actualizada";

                        Response.Redirect("~/login.aspx?pass=success");
                    }
                    else
                    {
                        lblPass.ForeColor = Color.Red;
                        lblPass.Text = "La contraseña actual es incorrecta";
                    }
                }
                catch (SqlException ex)
                {
                    lblPass.Text = "Ocurrio un error: " + ex.Message;
                }
               
            }
            else
            {
                lblPass.Text = "La nueva contraseña no puede ser igual a la actual";
            }
            e.Cancel = true;
        }

        protected void CancelPushButton_Click(object sender, EventArgs e)
        {
            CambiarPass.Attributes.Clear();
        }

        protected void EnviarCorreo(string pass)
        {
            MimeMessage correo = new MimeMessage();
            correo.From.Add(new MailboxAddress("Hungaros", "postmaster@hungaros.com"));
            correo.To.Add(new MailboxAddress("Miguel", "freyde.miguel@gmail.com"));


            string mb = "<div>Aviso de cambio de contraseña</div><br><br>" +
                        "<div>Su contraseña ha sido actualizada con exito, por favor inicie sesion nuevamente. <br></div>" +
                        "<br><br><div>Este correo ha sido generado automaticamente</div>";

            correo.Subject = "Cambio de contraseña";

            BodyBuilder bodyBuilder = new BodyBuilder
            {
                HtmlBody = String.Format(@mb)
            };


            correo.Body = bodyBuilder.ToMessageBody();

            SmtpClient client = new SmtpClient();
            try
            {
                client.Connect("mailc76.carrierzone.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
                client.Authenticate("postmaster@hungaros.com", "Hungaro5.Mai1!");
                client.Send(correo);
                client.Disconnect(true);
            }
            catch (Exception ex)
            {            
                lblPass.Text = ex.Message;
            }
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            EnviarCorreo("test");
        }
    }
}