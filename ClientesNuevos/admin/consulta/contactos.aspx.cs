using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Reflection.Emit;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.admin.consulta
{
    public partial class contactos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
                BindGridContacto();
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
                    ddSocios.Items.Add(new ListItem(row["Nombre_comp"].ToString(), row["RFC"].ToString()));
                }
            }
            catch (Exception ex)
            {
                ddSocios.Items.Add(new ListItem(ex.Message, "ERROR"));


            }

        }
        protected void btnBusqueda_Click(object sender, EventArgs e)
        {
            string tipo = btnBusqueda.Attributes["data-accion"].ToString(); //data-accion="buscar"
            if (tipo == "buscar")
            {
                btnBusqueda.Attributes["data-accion"] = "limpiar";
                btnBusqueda.Text = "<i class='bi bi-x-lg'></i>";
            }
            else
            {
                btnBusqueda.Attributes["data-accion"] = "buscar";
                btnBusqueda.Text = "<i class='bi bi-search'></i>";
                txtBusqueda.Text = "";
            }
            BindGrid();
        }

        protected void lstContactos_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lstContactos.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindGrid();
        }

        protected void lstContactos_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                Label2.Text = e.CommandArgument.ToString();
                DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE ID ='" + e.CommandArgument.ToString() + "'");
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("~/admin/consulta/editarcontacto.aspx?id=" + e.CommandArgument.ToString() + "&nombre=" + dt.Rows[0]["Nombre"].ToString());
                }


            }
        }

        private void BindGrid()
        {
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand()
            {
                CommandText = "Master_TablaContacto",
                Connection = con,
                CommandType = CommandType.StoredProcedure,
            };
            cmd.Parameters.Add("@accion", SqlDbType.VarChar).Value = "busqueda";
            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = txtBusqueda.Text.Trim();

            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sa.Fill(dt);
            lstContactos.DataSource = dt;
            lstContactos.DataBind();
        }

        protected void ddCantidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            (lstContactos.FindControl("DataPager1") as DataPager).PageSize = Convert.ToInt32(ddCantidad.SelectedValue);
            BindGridContacto();
        }

        private void BindGridContacto()
        {
            SqlConnection con = new SqlConnection(clsHerramientaBD.strConnction);
            SqlCommand cmd = new SqlCommand()
            {
                CommandText = "Master_TablaContacto",
                Connection = con,
                CommandType = CommandType.StoredProcedure,
            };
            cmd.Parameters.Add("@accion", SqlDbType.VarChar).Value = "lstCorreo";
            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar).Value = txtBuscarCorreo.Text.Trim();

            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sa.Fill(dt);

            lvCorreo.DataSource = dt;
            lvCorreo.DataBind();
        }

        protected void lvCorreo_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvCorreo.FindControl("DataPager2") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindGridContacto();
        }

        protected void ddCorreo_SelectedIndexChanged(object sender, EventArgs e)
        {
            (lvCorreo.FindControl("DataPager2") as DataPager).PageSize = Convert.ToInt32(ddCorreo.SelectedValue);
            BindGridContacto();
        }

        protected void btnBuscarCorreo_Click(object sender, EventArgs e)
        {
            string tipo = btnBuscarCorreo.Attributes["data-accion"].ToString(); //data-accion="buscar"
            if (tipo == "buscar")
            {
                btnBuscarCorreo.Attributes["data-accion"] = "limpiar";
                btnBuscarCorreo.Text = "<i class='bi bi-x-lg'></i>";
            }
            else
            {
                btnBuscarCorreo.Attributes["data-accion"] = "buscar";
                btnBuscarCorreo.Text = "<i class='bi bi-search'></i>";
                txtBuscarCorreo.Text = "";
            }
            BindGridContacto();
        }

        protected void lvCorreo_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Mail")
            {
                txtPara.Text += e.CommandArgument.ToString() + ", ";                
            }
        }

        protected void lvCorreo_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            ListViewItem item = (ListViewItem)lvCorreo.Items[e.NewSelectedIndex];
            System.Web.UI.WebControls.Label correo = (System.Web.UI.WebControls.Label)item.FindControl("CorreoLabel");

            txtMensaje.Text = correo.Text;
        }
    }
}