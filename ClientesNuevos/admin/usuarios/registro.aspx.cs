using ClientesNuevos.App_Code;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ClientesNuevos.F14.wsUbicacion;

namespace ClientesNuevos.admin.usuarios
{
    public partial class registro : System.Web.UI.Page
    {
        DataTable dtRoles;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dtRoles = new DataTable();
                ObtenerRoles();
                ObtenerEmpresa();

                //llenartabla();
                //BindData();

            }
        }


        protected void obtenerSubdominios()
        {
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM subdomain", clsHerramientaBD.strConnAdmon);

            ddRol.Items.Clear();
            foreach (DataRow row in dt.Rows)
            {
                ddRol.Items.Add(new ListItem(row["subdominio"].ToString(), row["Id"].ToString()));
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
            ddEmpresa.Items.Clear();

            ddEmpresa.Items.Add(new ListItem("Seleccione la empresa", "0"));
            foreach (DataRow row in data.Rows)
            {
                ddEmpresa.Items.Add(new ListItem(row["Nombre"].ToString(), row["ID_Empresa"].ToString()));
            }
        }

        protected void BindData()
        {
            //DataTable dt = new DataTable();
            //dt = clsHerramientaBD.Existe("SELECT * FROM usuarios");
            //gvRoles.DataSource = dtRoles;
            //gvRoles.DataBind();
        }

        protected void RegistrarUsuario(string RFC, string pass)
        {
            string connection = clsHerramientaBD.VerificarConexion(clsHerramientaBD.strConnAdmon);
            string fecha = DateTime.Now.ToString("dd/MM/yyyy");
            DataTable dt;
            string registro = "";

            lblErrEmpresa.Text = "";
            lblError.Text = "";
            if (connection == "true")
            {
                if (ddEmpresa.SelectedIndex == 0)
                {
                    lblErrEmpresa.Text = "Seleccione una empresa";

                }
                else
                {

                    dt = clsHerramientaBD.Existe("SELECT * FROM [Usuarios] WHERE RFC ='" + RFC + "'", clsHerramientaBD.strConnAdmon);
                    if (dt.Rows.Count > 0)
                    {
                        hlExiste.Visible = true;
                        hlExiste.Text = "Ya existe un usuario registrado con ese RFC";
                        hlExiste.NavigateUrl = "EditarUsuario.aspx?id=" + dt.Rows[0]["Id"].ToString();
                        registro = "Ya existe";

                    }
                    else
                    {
                        registro = clsHerramientaBD.ExecuteSql("INSERT INTO Usuarios ([RFC], [Password], [Fecha_registro], [status]) VALUES ('" + RFC + "','" + pass + "','" + fecha + "','activo')", clsHerramientaBD.strConnAdmon);
                    }
                    if (registro == "")
                    {
                        lblError.Text = "Usuario registrado";
                        lblError.ForeColor = Color.DarkGreen;
                        Panel_roles.Enabled = true;
                        txtRFC.Enabled = false;
                        ddEmpresa.Enabled = false;
                    }
                    else
                    {
                        if (!hlExiste.Visible)
                        {
                            lblError.Text = "Error: " + registro;
                            lblError.ForeColor = Color.Red;

                        }
                    }
                }
            }
            else
            {
                lblError.Text = connection;
            }

        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            try
            {
                RegistrarUsuario(txtRFC.Text, txtPass.Text);

               
            }
            catch (Exception)
            {
                lblError.Text = "Verifique la informacion";
            }
        }

        

        protected void llenartabla()
        {
            dtRoles.Columns.Add(new DataColumn("Subdominio"));
            dtRoles.Columns.Add(new DataColumn("Rol"));
        }

        protected void ddEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = ddEmpresa.SelectedValue;

            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM subdomain WHERE ID_Empresa='"+id+"'", clsHerramientaBD.strConnAdmon);
            ddSubdominio.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    ddSubdominio.Items.Add(new ListItem(row["subdominio"].ToString(), row["Id"].ToString()));
                }
            }
        }

       
    }
}