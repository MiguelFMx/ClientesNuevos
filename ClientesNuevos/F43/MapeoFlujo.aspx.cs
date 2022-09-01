using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.F43
{
    public partial class MapeoFlujo : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblFecha.Text += DateTime.Now.ToString("dd/MM/yyyy");
                lblCliente.Text += Obtener_Nombre();
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


    }
}