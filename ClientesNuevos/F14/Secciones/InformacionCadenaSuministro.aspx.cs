using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Optimization;


namespace ClientesNuevos.F14.Seccioness
{
    public partial class InformacionCadenaSuministro : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

           /*Quitar esta parte*/
            if (Request.Cookies.Get("ctipo").Value == "proveedor")
            {
                step2.Visible = false;
                step3.Visible = false;
                step4.Visible = false;
                lblDesc5.Text = "Paso 2";
                lblstep5.Text = "2";
            }

            if (IsPostBack)
            {
                if (Request.QueryString["res"] != null)
                {
                    string resultado = HttpContext.Current.Request.QueryString["res"].ToString();
                    if (resultado == "Exito")
                    {
                        pAlert.Visible = true;
                    }
                }
                else
                {
                    pAlert.Visible = false;
                }


                
            }
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            if(Request.Cookies.Get("ctipo").Value == "proveedor")
            {
                HttpContext.Current.Response.Redirect("informacionCompania.aspx");

            }
            else
            {
                HttpContext.Current.Response.Redirect("tiposervicioproductos.aspx");

            }
        }
    }
}