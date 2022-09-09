using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.F5.Autoevaluacion
{
    public partial class Resultados : System.Web.UI.Page
    {
        DataTable dt, data;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt = clsHerramientaBD.Existe("SELECT * FROM Table_F5 WHERE ID_compania='"+Request.Cookies.Get("id_comp").Value+"'");
                data = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_user='"+Request.Cookies.Get("id").Value+"'");
                lblFecha.Text = dt.Rows[0]["Fecha"].ToString().Substring(0, 9);
                lblEmpresa.Text = data.Rows[0]["Nombre_comp"].ToString();
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("autoevaluacion.aspx");
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../.././usuario/user_index.aspx");
        }

    }
}