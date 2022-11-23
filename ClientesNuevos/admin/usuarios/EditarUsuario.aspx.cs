using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.admin.usuarios
{
    public partial class EditarUsuario : System.Web.UI.Page
    {
        DataTable infoUser = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                ObtenerEmpresa();
                ObtenerRoles();
                obtenerSubdominios();

                if (Request.QueryString["id"] != null)
                {
                    infoUser = clsHerramientaBD.Existe("SELECT * FROM Usuarios WHERE Id='" + Request.QueryString["id"] +"'", clsHerramientaBD.strConnAdmon);
                    
                    if(infoUser.Rows.Count > 0)
                    {
                        hfID.Value = infoUser.Rows[0]["Id"].ToString();
                        txtRFC.Text = infoUser.Rows[0]["RFC"].ToString();

                        lblFecha.Text += DateTime.Parse(infoUser.Rows[0]["Fecha_registro"].ToString().Substring(0,10)).ToString("dd 'de' MMM 'de' yyyy");
                        if (infoUser.Rows[0]["status"].ToString() == "activo")
                        {
                            chkEstatus.Checked = true;
                            lblEstado.Text = "Activo";
                            lblEstado.ForeColor = Color.FromArgb(65, 184, 39);
                        }
                        else
                        {
                            chkEstatus.Checked = false;
                            lblEstado.Text = "Inactivo";
                            lblEstado.ForeColor = Color.FromArgb(176, 11, 11);
                        }

                        BindDataU();
                    }
                }
            }
            
        }


        private void BindDataU()
        {
            //getroles
            DataTable dt = clsHerramientaBD.Existe("exec [Master_UserRols] @RFC='" + txtRFC.Text + "',@accion='getroles'", clsHerramientaBD.strConnAdmon);
            gvRoles.DataSource =dt;
            gvRoles.DataBind();
        }

        protected void chkEstatus_CheckedChanged(object sender, EventArgs e)
        {
            if (chkEstatus.Checked){
                lblEstado.Text = "Activo";
                lblEstado.ForeColor = Color.FromArgb(65, 184, 39);

                if(txtRFC.Text != "")
                {
                    string res = clsHerramientaBD.ExecuteSql("UPDATE Usuarios SET status='activo' WHERE Id='"+hfID.Value+"'",clsHerramientaBD.strConnAdmon);

                    if (res == "")
                    {
                        lblNewStatus.Text = "Se ha activado este usuario";
                    }
                    else
                    {
                        lblNewStatus.Text = res;
                    }
                }

            }
            else
            {
                lblEstado.Text = "Inactivo";
                lblEstado.ForeColor = Color.FromArgb(176, 11, 11);
                if (txtRFC.Text != "")
                {
                    string res = clsHerramientaBD.ExecuteSql("UPDATE Usuarios SET status='inactivo' WHERE Id='"+hfID.Value+"'", clsHerramientaBD.strConnAdmon);

                    if (res == "")
                    {
                        lblNewStatus.Text = "Se ha desactivado este usuario";
                    }
                    else
                    {
                        lblNewStatus.Text = res;
                    }
                }
            }
        }

        protected void obtenerSubdominios()
        {
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM subdomain", clsHerramientaBD.strConnAdmon);

            ddSubdom.Items.Clear();
            foreach (DataRow row in dt.Rows)
            {
                ddSubdom.Items.Add(new ListItem(row["subdominio"].ToString(), row["Id"].ToString()));
            }

        }
        protected void ObtenerRoles()
        {
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM Roles", clsHerramientaBD.strConnAdmon);

            ddRol.Items.Clear();
            foreach (DataRow row in dt.Rows)
            {
                ddRol.Items.Add(new ListItem(row["Rol"].ToString(), row["Id"].ToString()));
            }
        }
        protected void ObtenerEmpresa()
        {
            DataTable data = clsHerramientaBD.Existe("SELECT * FROM Empresa", clsHerramientaBD.strConnAdmon);
            ddDominio.Items.Clear();

            ddDominio.Items.Add(new ListItem("Seleccione la empresa", "0"));
            foreach (DataRow row in data.Rows)
            {
                ddDominio.Items.Add(new ListItem(row["Nombre"].ToString(), row["ID_Empresa"].ToString()));
            }
        }

        protected void ddDominio_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = ddDominio.SelectedValue;

            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM subdomain WHERE ID_Empresa='" + id + "'", clsHerramientaBD.strConnAdmon);
            ddSubdom.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    ddSubdom.Items.Add(new ListItem(row["subdominio"].ToString(), row["Id"].ToString()));
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvRoles.Rows[rowIndex].Cells[0].Text;
            string resultado = "";


            resultado = clsHerramientaBD.ExecuteSql("DELETE FROM user_detalles WHERE Id='"+Id+"'", clsHerramientaBD.strConnAdmon);
            if(resultado == "")
            {
                lblRolEdit.Text = "Rol eliminado";
            }
            else
            {
                lblRolEdit.Text = resultado;
            }

            BindDataU();
            //txtRol.Text = "";
            //hfRol.Value = "";
            //BindData_roles();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string res, rfc, dominio, subdominio, rol;
            rfc = txtRFC.Text;
            dominio = ddDominio.SelectedValue;
            subdominio = ddSubdom.SelectedValue;
            rol = ddRol.SelectedValue;

            wsUsuarios wsUsuarios = new wsUsuarios();
            res = wsUsuarios.Registrar_rol(rfc, subdominio, rol, dominio, "");

            lblRolNew.Text = res;

            BindDataU();
        }
    }
}