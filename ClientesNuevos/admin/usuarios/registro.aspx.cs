using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ClientesNuevos.F14.wsUbicacion;

namespace ClientesNuevos.admin.usuarios
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
               // ObtenerRoles();
            }
        }


        protected void ObtenerRoles()
        {
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM Roles", clsHerramientaBD.strConnAdmon);

            foreach (DataRow row in dt.Rows)
            {
                ddRol.Items.Add(new ListItem(row["Id"].ToString(), row["Rol"].ToString()));
            }
        }

        protected void BindData()
        {
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM usuarios");
            gvRoles.DataSource = dt;
            gvRoles.DataBind(); 
        }
    }
}