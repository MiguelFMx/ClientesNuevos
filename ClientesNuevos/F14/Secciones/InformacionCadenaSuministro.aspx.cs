using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.F14.Seccioness
{
    public partial class InformacionCadenaSuministro : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                string resultado = HttpContext.Current.Request.QueryString["res"].ToString();
                if (resultado == "Exito")
                {
                    pAlert.Visible = true;
                }
            }
            catch (Exception)
            {
                pAlert.Visible = false;
            }
            if (IsPostBack)
            {
                
            }
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("tiposervicioproductos.aspx");
        }
    }
}