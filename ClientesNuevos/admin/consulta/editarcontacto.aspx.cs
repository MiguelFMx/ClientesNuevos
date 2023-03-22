using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.admin.consulta
{
    public partial class editarcontacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblID.Text = Request.QueryString["id"].ToString();

                LlenarEmpresa();

                DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE ID='" + lblID.Text + "'");
                if (dt.Rows.Count > 0)
                {
                    txtNombre.Text = dt.Rows[0]["Nombre"].ToString();
                    txtPuesto.Text = dt.Rows[0]["Puesto"].ToString();
                    txtExt.Text = dt.Rows[0]["Extension"].ToString();
                    txtTel.Text = dt.Rows[0]["Telefono"].ToString();
                    txtCel.Text = dt.Rows[0]["Celular"].ToString();
                    txtCorreo.Text = dt.Rows[0]["Correo"].ToString();

                    if (dt.Rows[0]["Tipo"].ToString() == "Fra") chTipo.Checked = true;

                    ddEmpresa.Items.FindByValue(dt.Rows[0]["ID_compania"].ToString()).Selected = false;
                    ddEmpresa.Items.FindByValue(dt.Rows[0]["ID_compania"].ToString()).Selected = true;
                }
            }
        }

        private void LlenarEmpresa()
        {
            ddEmpresa.Items.Clear();
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    ddEmpresa.Items.Add(new ListItem(dr["Nombre_comp"].ToString(), dr["RFC"].ToString()));
                }
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            wsConsultas wsConsultas = new wsConsultas();
            string res = "";

            try
            {

                string rfc = ddEmpresa.SelectedValue.ToString();
                string tipo = "";
                if (chTipo.Checked)
                {
                    tipo = "Fra";
                }
                else
                {
                    tipo = "Comp";
                }
               res = wsConsultas.EditarContacto(rfc, txtNombre.Text, txtPuesto.Text, txtCorreo.Text,tipo,txtTel.Text,txtExt.Text,txtCel.Text,lblID.Text);

            }
            catch (Exception ex)
            {
                res = ex.Message;
            }

            Label1.Text = res;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            //BorrarContacto
            wsConsultas wsConsultas = new wsConsultas();

            try
            {
                Label1.Text = wsConsultas.BorrarContacto(lblID.Text);
                txtNombre.Text = "";
                txtPuesto.Text = "";
                txtExt.Text = "";
                txtTel.Text = "";
                txtCel.Text = "";
                txtCorreo.Text = "";
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }
    }
}