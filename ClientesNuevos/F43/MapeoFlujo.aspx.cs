using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientesNuevos.App_Code;
using System.Globalization;

namespace ClientesNuevos.F43
{
    public partial class MapeoFlujo : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hfLocalizacion.Value = CultureInfo.CurrentUICulture.NativeName;

                if(User.IsInRole("1") || User.IsInRole("2"))
                {
                    pAdmin.Visible = true;
                    pUser.Visible = false;
                    hfRol.Value = "admin"; //Engloba user y admin

                    if (Request.QueryString["rfc"] != null)
                    {
                        DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_compania='"+ Request.QueryString["rfc"] + "'");
                        if(dt.Rows.Count > 0)
                        {                            
                            lblCliente.Text ="Cliente/Proveedor: "+ dt.Rows[0]["Nombre_comercial"].ToString();
                        }
                    }
                    else if(Request.QueryString["rfc"] != null || Request.QueryString["accion"] != null)
                    {
                        btnBackAdmin.Visible = false;
                    }


                }else if (User.IsInRole("3") || User.IsInRole("4"))
                {
                    hfRol.Value = "user"; //Engloba cliente y proveedor

                    lblFecha.Text += DateTime.Now.ToString("dd/MM/yyyy");
                    lblCliente.Text += Obtener_Nombre();
                }
               
            }
        }


        protected string Obtener_Nombre()
        {
            string nombre="";

            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_user='"+ Context.Request.Cookies.Get("id").Value +"'");

            if (dt.Rows.Count > 0)
            {
                nombre = dt.Rows[0]["Nombre_comp"].ToString();
            }
            return nombre;
        }

        protected void btnBackAdmin_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null)
            {
                //id=BNM840515VB1&type=fisica
                if (Request.Cookies.Get("tipo") != null)
                {
                    Response.Redirect("~/admin/carpetilla/carpetilla?id=" + Request.QueryString["rfc"] + "&type=" + Request.Cookies.Get("tipo").Value);
                }
                else
                {
                    Response.Redirect("~/admin/index.aspx");
                }
            }
            
        }

        protected void btnHomeAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/index.aspx");

        }
    }
}