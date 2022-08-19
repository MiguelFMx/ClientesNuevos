using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Abandon();
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

            HttpCookie cUserID, cRol;
            lstuser = wsLogin.getUsuario(usuario,password);
            FormsAuthenticationTicket AuthTicket;
            string encTicket;
            if (lstuser.Count > 0)
            {
                AuthTicket = new FormsAuthenticationTicket(1, lstuser[0].ID, DateTime.Now, DateTime.Now.AddDays(1), false,
                    lstuser[0].type, FormsAuthentication.FormsCookiePath);
                encTicket = FormsAuthentication.Encrypt(AuthTicket);
                HttpContext.Current.Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));

                cUserID = new HttpCookie("id", lstuser[0].ID);
                cRol = new HttpCookie("rol", lstuser[0].type);

                HttpContext.Current.Response.Cookies.Add(cUserID);
                HttpContext.Current.Response.Cookies.Add(cRol);

                
                if(lstuser[0].type == "2")
                {
                    Response.Redirect("usuario/user_index.aspx");
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
    }
}