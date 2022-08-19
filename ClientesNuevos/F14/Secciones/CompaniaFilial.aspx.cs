using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.F14.Seccioness
{    
    public partial class CompaniaFilial : System.Web.UI.Page
    {
        List<wsUbicacion.ListaPais> lstPais;
        ListItem item;
        wsUbicacion wsUbicacion = new wsUbicacion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                ddCiudadComFilial.Items.Add(new ListItem("...", "0", true));
                ddEstadoComFilial.Items.Add(new ListItem("...", "0", true));

                LlenarPaisCB(ddPaisComFilial);
            }
        }


        protected void LlenarPaisCB(DropDownList dropDown)
        {
            lstPais = new List<wsUbicacion.ListaPais>();
            lstPais = wsUbicacion.llenarCbPais();

            dropDown.Items.Add(new ListItem("...", "0", true));

            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDown.Items.Add(item);
            }
        }

        protected void llenarCB(DropDownList dropDownList, string tipo, int id)
        {
            dropDownList.Items.Clear();
            lstPais = new List<wsUbicacion.ListaPais>();

            if(tipo == "estado")
            {
                lstPais = wsUbicacion.llenarCbEstados(id);

            }
            else if(tipo == "ciudad")
            {
                lstPais = wsUbicacion.llenarCbCiudades(id);

            }

            dropDownList.Items.Add(new ListItem("...", "0", true));

            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDownList.Items.Add(item);
            }
        }

        protected void ddPaisComFilial_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(ddPaisComFilial.SelectedValue);
            llenarCB(ddEstadoComFilial, "estado", index);
        }

        protected void ddEstadoComFilial_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(ddEstadoComFilial.SelectedValue);           
            llenarCB(ddCiudadComFilial, "ciudad", index);
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("AgentesAduanales.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("../../usuario/user_index.aspx");
        }
    }
}