using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.usuario
{
    public partial class contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
           //lblEnviado.Text= EnviarCorreo(txtCorreo.Text, txtNombre.Text, txtAsunto.Text, txtCuerpo.Text);
        }

        public string EnviarCorreo(string correo, string remitente, string subject, string cuerpo)
        {
            ////Metodo para enviar correo por medio de MailKit
            //MimeMessage message = new MimeMessage();
            //message.From.Add(new MailboxAddress("Contacto", "postmaster@hungaros.com"));
            ////Fernanda
            //message.To.Add(new MailboxAddress("Certificaciones", "certificaciones@hungaros.com"));
            ////Hector
            //message.To.Add(new MailboxAddress("Sistemas", "sistemas@hungaros.com"));
            ////Miguel
            //message.To.Add(new MailboxAddress("Sistemas", "sistemas.aux@hungaros.com"));

            ////message.To.Add(new MailboxAddress("Certificaciones", "freyde.miguel@gmail.com"));
            ////sistemas@hungaros.com 
            //message.Subject = "Contacto";
            //message.Body = new TextPart(TextFormat.Html)
            //{
            //    Text = "<div>Nombre:    " + remitente+ "<br><br>Correo: " + correo+ "<br><br> Asunto:<br>" + subject+ "<br><br>Mensaje:<br>" + cuerpo+"</div>"
            //};
            //SmtpClient client = new SmtpClient();
            //try
            //{
            //    client.Connect("mailc76.carrierzone.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
            //    client.Authenticate("postmaster@hungaros.com", "Hungaro5.Mai1!");
            //    client.Send(message);
            //    client.Disconnect(true);
            //}
            //catch (Exception ex)
            //{
            //    return ex.Message;
            //}

            return "Correo enviado, gracias por contactarte con nosotros";
        }
    }
}