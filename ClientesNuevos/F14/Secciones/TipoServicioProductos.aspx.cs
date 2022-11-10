using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.F14.Seccioness
{
    public partial class TipoServicioProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("1") || User.IsInRole("2"))
            {
                pUser.Visible = false;
                pAdmin.Visible = true;
                if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
                {
                    btnAdminNext.Text = "Skip";
                    btnAdminSave.Text = "Registrar";
                }
            }
            
        }

        private void CambiarLinks()
        {
            step1.NavigateUrl = "~/F14/Secciones/InformacionCompania.aspx?admin=si&id=" + Request.QueryString["id"];
            step2.NavigateUrl = "~/F14/Secciones/AgentesAduanales.aspx?admin=si&id=" + Request.QueryString["id"];
            step3.NavigateUrl = "~/F14/Secciones/CompaniaFilial.aspx?admin=si&id=" + Request.QueryString["id"];
            step5.NavigateUrl = "~/F14/Secciones/InformacionCadenaSuministro.aspx?admin=si&id=" + Request.QueryString["id"];
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("CompaniaFilial.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {

            HttpContext.Current.Response.Redirect("../../usuario/user_index.aspx");
        }

        protected void btnAdminBack_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/CompaniaFilial.aspx?accion=new&rfc=" + Request.QueryString["rfc"]);
            }
        }

        protected void btnAdminH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/index.aspx");
        }

        protected void btnAdminSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnAdminNext_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/InformacionCadenaSuministro.aspx?accion=new&rfc=" + Request.QueryString["rfc"]);
            }
        }
    }
}