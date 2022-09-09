using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientesNuevos.App_Code;
namespace ClientesNuevos.admin.carpetilla
{
    public partial class carpetilla : System.Web.UI.Page
    {
        string id_comp = "";
        DataTable data;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.QueryString["id"] != null)
                {
                    Obtener_Documentos(Request.QueryString["id"].ToString());
                }
            }
        }


        private void Obtener_Documentos(string id_comp)
        {
            DataTable data;
            data = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE ID_compania='"+id_comp+"'");

            if (data.Rows.Count > 0)
            {
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    var fila = data.Rows[i];
                    if (fila["Documento"].ToString() == "F5")
                    {
                        if(fila["Estatus"].ToString() == "100%")
                        {
                            lblEstatus_Acta.Text = "completado";
                            lblEstatus_Acta.CssClass = "etiqueta";
                        }
                        lblFecha_Acta.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                }
            }
        }
    }
}