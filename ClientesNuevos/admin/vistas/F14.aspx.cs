using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientesNuevos.App_Code;
using ClientesNuevos.F14;

namespace ClientesNuevos.admin.vistas
{
    public partial class F14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    getInfo(Request.QueryString["id"].ToString());
                }
            }
        }


        protected void getInfo(string id)
        {
            DataTable informacion = new DataTable();
            DataTable dirFra = new DataTable();
            DataTable DatosBancarios = new DataTable();
            wsBaseDatos wsBaseDatos = new wsBaseDatos();

            informacion = wsBaseDatos.Existe("SELECT * FROM Table_compania WHERE ID_compania='"+id+"'");

            //Informacion de compania
            if(informacion.Rows.Count > 0)
            {
                txtNombreCompania.Text= informacion.Rows[0]["Nombre_comp"].ToString();
                txtNombrCom.Text = informacion.Rows[0]["Nombre_comercial"].ToString();
                txtRfc.Text = informacion.Rows[0]["RFC"].ToString();
                txtCURP.Text = informacion.Rows[0]["CURP"].ToString();
                txtAnosNegocio.Text= informacion.Rows[0]["tiempo_negocio"].ToString();
            }


        }
    }
}