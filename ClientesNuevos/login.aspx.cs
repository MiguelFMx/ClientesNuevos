﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Cierra la sesion actual. 
            HttpContext.Current.Session.Abandon();
            FormsAuthentication.SignOut();

            //Borra las cookies creadas.
            foreach (string key in Request.Cookies.AllKeys)
            {
                HttpCookie c = Request.Cookies[key];
                c.Expires = DateTime.Now.AddMonths(-1);
                Response.AppendCookie(c);
            }

            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            List<wsLogin.Usuario> lstuser = new List<wsLogin.Usuario>();
            string usuario = txtUser.Text;
            string password = txtPass.Text;
            string ID = "", Rol = "";
            bool persistente = false;
            HttpCookie cUserID;
            lstuser = wsLogin.getUsuario(usuario,password);
            FormsAuthenticationTicket AuthTicket;
            string encTicket;

            if (RememberMe.Checked)
            {
                persistente = true;
            }

            Response.Cookies.Add(new HttpCookie("lang", ddLang.SelectedItem.Value));

            if (lstuser.Count > 0)
            {
                ID = lstuser[0].ID;
                Rol = lstuser[0].type;                

                AuthTicket = new FormsAuthenticationTicket(1,usuario, DateTime.Now, DateTime.Now.AddDays(1), persistente, Rol, FormsAuthentication.FormsCookiePath);
                
                encTicket = FormsAuthentication.Encrypt(AuthTicket);

                HttpContext.Current.Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));

                cUserID = new HttpCookie("id", lstuser[0].ID);
                HttpContext.Current.Response.Cookies.Add(cUserID);

                

                switch (Rol)
                {
                    case "1":                        
                        Response.Redirect("admin/index.aspx");
                        
                        break;
                    case "2":
                        Response.Redirect("usuario/user_index.aspx");
                        break;
                    default:
                        break;
                }

            }
            else
            {
                lbltest.Text = "Las credenciales no coinciden";
            }
        }

        private void ChecarUsuario()
        {
          
        }

        protected void ddLang_SelectedIndexChanged(object sender, EventArgs e)
        {
            string index = ddLang.SelectedItem.Value;
            if (index == "en")
            {
                lblIdiomas.Text = "Language";
                lblPass.Text = "Password";
                txtPass.Attributes.Add("placeholder", "Password");
                lbluser.Text = "User";
                txtUser.Attributes.Add("placeholder", "User");
                lblHeading.Text = "Welcome to Hungaro's Transportistas";
                btnLogin.Text = "Log in";
                RememberMe.Text = "&nbsp;Remember me";
                btnPasswordOlvidado.Text = "Forgot Password";
            }
            else
            {
                lblIdiomas.Text = "Idioma";
                lblPass.Text = "Contraseña";
                txtPass.Attributes.Add("placeholder", "Contraseña");
                lbluser.Text = "Usuario";
                txtUser.Attributes.Add("placeholder", "Usuario");
                lblHeading.Text = "Bienvenido a Hungaro's Transportistas";
                btnLogin.Text = "Iniciar sesión";
                btnPasswordOlvidado.Text = "Olvidé la contraseña";
                RememberMe.Text = "&nbsp;Recuerdame";

            }
        }
    }
}