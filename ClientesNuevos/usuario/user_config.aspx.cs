using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}