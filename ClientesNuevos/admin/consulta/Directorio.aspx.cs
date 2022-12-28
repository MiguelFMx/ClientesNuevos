using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.admin.consulta
{
    public partial class Directorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCombo();
            }
        }



        protected void CargarCombo()
        {
            ddSocios.Items.Clear();
            DataTable dt = new DataTable();
            try
            {
                dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania");
                foreach (DataRow row in dt.Rows)
                {
                    ddSocios.Items.Add(new ListItem(row["Nombre_comercial"].ToString(), row["RFC"].ToString()));
                }
            }
            catch (Exception)
            {

                
            }

        }
    }
}