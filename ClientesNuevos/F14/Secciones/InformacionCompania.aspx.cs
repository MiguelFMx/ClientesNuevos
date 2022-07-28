using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Runtime;

namespace ClientesNuevos.F14.Seccioness
{

    public partial class ImformacionCompania : System.Web.UI.Page
    {
        wsUbicacion wsUbicacion = new wsUbicacion();
        List<wsUbicacion.ListaPais> lstPais;
        ListItem item;


        protected void Page_Load(object sender, EventArgs e)
        {           

            if (!IsPostBack)
            {
               

                llenarPaisCB(ddPais);
                llenarPaisCB(ddPaisFra);
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {

        }

        protected void btnNext_Command(object sender, CommandEventArgs e)
        {
           

            
        }


        protected void llenarPaisCB( DropDownList dropDown )
        {
            lstPais = new List<wsUbicacion.ListaPais>();
            lstPais = wsUbicacion.llenarCbPais();
           // ddPais.Items.Clear();

            dropDown.Items.Add(new ListItem("...", "0", true));

            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDown.Items.Add(item);
            }
            

        }

        protected void llenarEstado(DropDownList dropDown, int id)
        {
            lstPais = new List<wsUbicacion.ListaPais>();
            lstPais = wsUbicacion.llenarCbEstados(id);

            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDown.Items.Add(item);
            }
            dropDown.DataBind();
        }

        protected void ddPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddEstado.Items.Clear();
            ddCiudad.Items.Clear();
            var pais = Convert.ToInt32(ddPais.SelectedItem.Value);
            llenarEstado(ddEstado, pais);
        }

       

        protected void ddCiudad_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void ddEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddCiudad.Items.Clear();

            lstPais = new List<wsUbicacion.ListaPais>();
            var estado = Convert.ToInt32(ddEstado.SelectedItem.Value);

            lstPais = wsUbicacion.llenarCbCiudades(estado);


            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                ddCiudad.Items.Add(item);
            }

            ddCiudad.DataBind();
        }

        protected void ddPaisFra_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddEstadoFra.Items.Clear();
            ddCiudadFra.Items.Clear();
            var pais = Convert.ToInt32(ddPaisFra.SelectedItem.Value);
            llenarEstado(ddEstadoFra, pais);
        }

        protected void chkDireccionIgual_CheckedChanged(object sender, EventArgs e)
        {
            if (chkDireccionIgual.Checked)
            {
                pFra.Enabled = true;
                pFra.BackColor = System.Drawing.Color.White;

            }
            else
            {
                pFra.Enabled = false;
                pFra.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);
            }
        }

        protected void ddTipoDePersona_SelectedIndexChanged(object sender, EventArgs e)
        {
            int regimen = 0;
            regimen = Convert.ToInt32(ddTipoDePersona.SelectedValue);
            llenarCFDI(regimen);
        }

        protected void llenarCFDI(int regimen)
        {
            ddUsoCFDI.Items.Clear();

            List<wsUbicacion.CFDI> cfdi = new List<wsUbicacion.CFDI>();
            cfdi = wsUbicacion.llenarCFDI(regimen);

            for (int i = 0; i < cfdi.Count; i++)
            {
                item = new ListItem(cfdi[i].clave+"-"+cfdi[i].descripcion, cfdi[i].clave);
                ddUsoCFDI.Items.Add(item);
            }

            ddUsoCFDI.SelectedIndex = ddUsoCFDI.Items.IndexOf(ddUsoCFDI.Items.FindByText("P01"));
        }
    }
}