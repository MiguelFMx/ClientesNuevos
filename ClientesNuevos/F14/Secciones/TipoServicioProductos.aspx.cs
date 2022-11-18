using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
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
                }else if (Request.QueryString["rfc"] != null)
                {
                    CambiarLinks();
                }
            }
            
        }

        private void CambiarLinks()
        {
            step1.NavigateUrl = "~/F14/Secciones/InformacionCompania.aspx?rfc=" + Request.QueryString["rfc"];
            step2.NavigateUrl = "~/F14/Secciones/AgentesAduanales.aspx?rfc=" + Request.QueryString["rfc"];
            step3.NavigateUrl = "~/F14/Secciones/CompaniaFilial.aspx?rfc=" + Request.QueryString["rfc"];
            step5.NavigateUrl = "~/F14/Secciones/InformacionCadenaSuministro.aspx?rfc=" + Request.QueryString["rfc"];
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
            }else if (Request.QueryString["rfc"]!=null) {
                Response.Redirect("~/f14/secciones/CompaniaFilial.aspx?rfc=" + Request.QueryString["rfc"]);

            }
        }

        protected void btnAdminH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/index.aspx");
        }

       

        protected void btnAdminNext_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/InformacionCadenaSuministro.aspx?accion=new&rfc=" + Request.QueryString["rfc"]);
            }else if(Request.QueryString["rfc"] != null)
            {
                Response.Redirect("~/f14/secciones/InformacionCadenaSuministro.aspx?rfc=" + Request.QueryString["rfc"]);

            }
        }
    }
}