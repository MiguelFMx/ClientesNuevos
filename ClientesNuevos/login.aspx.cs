using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClientesNuevos.App_Code;

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

            //pass=success
            if (!IsPostBack)
            {
                if (Request.QueryString["pass"] != null)
                {
                    if(Request.QueryString["pass"] == "success")
                    {
                        //Mostrar mensaje
                        Password.Visible = true;
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            List<wsLogin.Usuario> lstuser = new List<wsLogin.Usuario>();
            string usuario = txtUser.Text.ToUpper();
            string password = txtPass.Text;
            string ID = "", Rol = "", Empresa = "", subdom="";
            bool persistente = false;
            HttpCookie cUserID;
            FormsAuthenticationTicket AuthTicket;
            string encTicket;

            string connection = clsHerramientaBD.VerificarConexion(clsHerramientaBD.strConnction);
            if ( connection == "true")
            {
                lstuser = wsLogin.getUsuario(usuario, password);

                if (RememberMe.Checked)
                {
                    persistente = true;
                }

                if (lstuser.Count > 0)
                {
                    int aux = 0;

                    for (int i = 0; i < lstuser.Count; i++)
                    {
                        if (lstuser[i].Subdominio == "1")
                        {
                            aux = i;
                        }
                    }

                    ID = lstuser[aux].ID;
                    Rol = lstuser[aux].ID_Rol;
                    Empresa = lstuser[aux].ID_empresa;
                    subdom = lstuser[aux].Subdominio;
                    /* ID de Hungaros en la tabla */
                    if (lstuser[0].status == "activo")
                    {
                        if (subdom == "1" )
                        {
                            AuthTicket = new FormsAuthenticationTicket(1, usuario, DateTime.Now, DateTime.Now.AddDays(1), persistente, Rol+";"+ID, FormsAuthentication.FormsCookiePath);

                            encTicket = FormsAuthentication.Encrypt(AuthTicket);

                            HttpContext.Current.Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));                      

                            cUserID = new HttpCookie("id", lstuser[0].ID);
                            HttpContext.Current.Response.Cookies.Add(cUserID);

                            switch (Rol)
                            {
                                case "1": /* admin */
                                    Response.Redirect("admin/index.aspx");
                                    break;
                                case "2": /* usuario */
                                    Response.Redirect("admin/index.aspx");
                                    break;
                                case "3": /* cliente */
                                    Response.Redirect("usuario/user_index.aspx");
                                    break;
                                case "4": /* proveedor */
                                    Response.Redirect("usuario/user_index.aspx");
                                    break;
                                default:
                                    lblPass.Text = "Usuario sin rol asignado";
                                    break;
                            }
                        }                        
                        else
                        {
                            //El usuario existe pero no tiene un rol asignado en el dominio
                            lbltest.Text = "No esta registrado en este dominio";
                        }
                    }
                    else
                    {
                        //Usuario desactivado
                        lbltest.Text = "El usuario con el que intenta iniciar sesión esta desactivado";
                    }
                                     
                }
                else
                {
                    //Usuario o password incorrecto
                    lbltest.Text = "Usuario o contraseña inconrrectas";
                }
            }
            else
            {
                //La conexion a la base de datos fallo
                lbltest.Text = "No se pudo establecer una conexion con el servidor";
            }            
        }

        private void ChecarUsuario()
        {
          
        }

        protected void btnPrueba_Click(object sender, EventArgs e)
        {
            string test = clsHerramientaBD.VerificarConexion(clsHerramientaBD.strConnAdmon);

            lbltest.Text = test;
        }

       
    }
}