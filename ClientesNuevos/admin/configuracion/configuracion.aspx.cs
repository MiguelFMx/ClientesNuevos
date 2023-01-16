using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.admin.configuracion
{
    public partial class configuracion : System.Web.UI.Page
    {
        clsSMTP clsSMTP = new clsSMTP();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                ObtenerInfo();

                LLenarEmpresa();
                BindData_roles();
                BindData_sub();
                BindData_Empresa();
                LLenarDocs();
            }
        }

        protected void ddLapso_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lapso = ddLapso.SelectedValue;

            ddTiempo.Items.Clear();
            if (lapso == "mensual")
            {
                llenarDropdown("mensual", ddTiempo);
                lbltiempo.Text = "mes(es)";
            }
            else
            {
                llenarDropdown("anual", ddTiempo);
                lbltiempo.Text = "año(s)";
            }
        }

        protected void BindData_Empresa()
        {
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Empresa", clsHerramientaBD.strConnAdmon);
            gvEmpresas.DataSource = dt;
            gvEmpresas.DataBind();
        }

        protected void BindData_roles()
        {
            DataTable roles = clsHerramientaBD.Existe("SELECT * FROM Roles", clsHerramientaBD.strConnAdmon);
            gvRoles.DataSource = roles;
            gvRoles.DataBind();
        }
        protected void BindData_sub()
        {
            DataTable subdom = clsHerramientaBD.Existe("exec Master_config @accion='SELECTSUb'", clsHerramientaBD.strConnAdmon);
            gvSubdominio.DataSource = subdom;
            gvSubdominio.DataBind();
        }

        protected void LLenarDocs()
        {
            DataTable data = clsHerramientaBD.Existe("SELECT * FROM Act_Docs");
            if(data.Rows.Count > 0)
            {
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    string doc = data.Rows[i]["Documento"].ToString();
                    string lapso = data.Rows[i]["lapso"].ToString();
                    int tiempo = Convert.ToInt32(data.Rows[i]["cantidad"]);

                    switch (doc)
                    {
                        case "CNAP":
                            if(lapso == "anual")
                            {
                                llenarDropdown("anual", ddTiempo);
                                ddLapso.SelectedIndex = 0;
                                lbltiempo.Text = "año(s)";
                                ddTiempo.SelectedIndex = tiempo - 1;
                            }
                            else
                            {
                                ddLapso.SelectedIndex = 1;
                                llenarDropdown("mensual", ddTiempo);
                                lbltiempo.Text = "mes(es)";
                                ddTiempo.SelectedIndex = tiempo - 1;

                            }
                            break;
                        case "CompDom":
                            if (lapso == "anual")
                            {
                                llenarDropdown("anual", ddTiempo_compdom);
                                ddLapso_compdom.SelectedIndex = 0;
                                lbltiempo_compdom.Text = "año(s)";
                                ddTiempo_compdom.SelectedIndex = tiempo - 1;
                            }
                            else
                            {
                                ddLapso_compdom.SelectedIndex = 1;
                                llenarDropdown("mensual", ddTiempo_compdom);
                                lbltiempo_compdom.Text = "mes(es)";
                                ddTiempo_compdom.SelectedIndex = tiempo - 1;

                            }
                            break;

                        case "CTPAT":
                            if (lapso == "anual")
                            {
                                llenarDropdown("anual", ddTiempo_ctpat);
                                ddLapso_ctpat.SelectedIndex = 0;
                                lblTiempo_ctpat.Text = "año(s)";
                                ddTiempo_ctpat.SelectedIndex = tiempo - 1;
                            }
                            else
                            {
                                ddLapso_compdom.SelectedIndex = 1;
                                llenarDropdown("mensual", ddTiempo_ctpat);
                                lblTiempo_ctpat.Text = "mes(es)";
                                ddTiempo_ctpat.SelectedIndex = tiempo - 1;

                            }
                            break;

                        case "OP":
                            if (lapso == "anual")
                            {
                                llenarDropdown("anual", ddTiempo_op);
                                ddLapso_op.SelectedIndex = 0;
                                lblTiempo_op.Text = "año(s)";
                                ddTiempo_op.SelectedIndex = tiempo - 1;
                            }
                            else
                            {
                                ddLapso_op.SelectedIndex = 1;
                                llenarDropdown("mensual", ddTiempo_op);
                                lblTiempo_op.Text = "mes(es)";
                                ddTiempo_op.SelectedIndex = tiempo - 1;

                            }
                            break;
                        case "OEA":
                            if (lapso == "anual")
                            {
                                llenarDropdown("anual", ddTiempo_oea);
                                ddLapso_oea.SelectedIndex = 0;
                                lblTiempo_oea.Text = "año(s)";
                                ddTiempo_oea.SelectedIndex = tiempo - 1;
                            }
                            else
                            {
                                ddLapso_oea.SelectedIndex = 1;
                                llenarDropdown("mensual", ddTiempo_oea);
                                lblTiempo_oea.Text = "mes(es)";
                                ddTiempo_oea.SelectedIndex = tiempo - 1;

                            }
                            break;
                        case "InSitu":
                            if (lapso == "anual")
                            {
                                llenarDropdown("anual", ddTiempo_is);
                                ddLapso_IS.SelectedIndex = 0;
                                lblTiempo_is.Text = "año(s)";
                                ddTiempo_is.SelectedIndex = tiempo - 1;
                            }
                            else
                            {
                                ddLapso_IS.SelectedIndex = 1;
                                llenarDropdown("mensual", ddTiempo_is);
                                lblTiempo_is.Text = "mes(es)";
                                ddTiempo_is.SelectedIndex = tiempo - 1;

                            }
                            break;
                        default:
                            break;
                    }
                }
            }
        }

        protected void llenarDropdown(string lapso, DropDownList dd)
        {
            dd.Items.Clear();
            switch (lapso)
            {
                case "anual":
                    for (int i = 1; i <= 5; i++)
                    {
                        string cant = i.ToString();
                        dd.Items.Add(new ListItem(cant, cant));
                    }
                    break;
                case "mensual":
                    for (int i = 1; i <=12; i++)
                    {
                        string cant = i.ToString();
                        dd.Items.Add(new ListItem(cant, cant));
                    }
                    break;
                default:
                    break;
            }
        }

        protected void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            //Actualizar expiracion
            try
            {
                string str = "";
                //CNAP
                str = "UPDATE Act_Docs SET lapso = '" + ddLapso.SelectedValue + "', cantidad='" + ddTiempo.SelectedValue + "' WHERE Documento='CNAP'";
                lblErr.Text = clsHerramientaBD.ExecuteSql(str);

                //comprobante de domicilio
                str = "UPDATE Act_Docs SET lapso = '" + ddLapso_compdom.SelectedValue + "', cantidad='" + ddTiempo_compdom.SelectedValue + "' WHERE Documento='CompDom'";
                lblErr.Text += clsHerramientaBD.ExecuteSql(str);

                //ctpat
                str = "UPDATE Act_Docs SET lapso = '" + ddLapso_ctpat.SelectedValue + "', cantidad='" + ddTiempo_ctpat.SelectedValue + "' WHERE Documento='CTPAT'";
                lblErr.Text += clsHerramientaBD.ExecuteSql(str);

                //OEA
                str = "UPDATE Act_Docs SET lapso = '" + ddLapso_oea.SelectedValue + "', cantidad='" + ddTiempo_oea.SelectedValue + "' WHERE Documento='OEA'";
                lblErr.Text += clsHerramientaBD.ExecuteSql(str);

                //OP
                str = "UPDATE Act_Docs SET lapso = '" + ddLapso_op.SelectedValue + "', cantidad='" + ddTiempo_op.SelectedValue + "' WHERE Documento='OP'";
                lblErr.Text += clsHerramientaBD.ExecuteSql(str);

                //InSitu
                str = "UPDATE Act_Docs SET lapso = '" + ddLapso_IS.SelectedValue + "', cantidad='" + ddTiempo_is.SelectedValue + "' WHERE Documento='InSitu'";
                lblErr.Text += clsHerramientaBD.ExecuteSql(str);
            }
            catch (Exception ex)
            {

                lblErr.Text = "Ocurrio un erro " + ex.Message;
            }


        }

        protected void btnRol_Click(object sender, EventArgs e)
        {
            lblTest_Rol.Text = clsConfiguracion.Insertar_Roles(txtRol.Text, "");
            BindData_roles();
        }

        protected void gvRoles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindData_roles();
            gvRoles.PageIndex = e.NewPageIndex;
            gvRoles.DataBind();
        }

        //Editar roles
        protected void btnEditar_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvRoles.Rows[rowIndex].Cells[0].Text;
            string Nombre = gvRoles.Rows[rowIndex].Cells[1].Text;
            
            txtRol.Text = Nombre;
            hfRol.Value = Id;

            btnRol.Visible = false;

            Panel_ROl.Visible = true;            
        }
        //Eliminar roles
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvRoles.Rows[rowIndex].Cells[0].Text;
            string Nombre = gvRoles.Rows[rowIndex].Cells[1].Text;            

            lblTest_Rol.Text =Nombre+": "+clsConfiguracion.Borrar_Roles(Nombre, Id);

            txtRol.Text = "";
            hfRol.Value = "";
            BindData_roles();

        }

        protected void btnAprove_Rol_Click(object sender, EventArgs e)
        {
            lblTest_Rol.Text = clsConfiguracion.Insertar_Roles(txtRol.Text, hfRol.Value);
            BindData_roles();
            btnRol.Visible = true;
            Panel_ROl.Visible = false;
            hfRol.Value = "";
            txtRol.Text = "";

        }

        protected void btnCancel_Rol_Click(object sender, EventArgs e)
        {
            Panel_ROl.Visible = false;
            btnRol.Visible = true;
            txtRol.Text = "";
        }

        protected void LLenarEmpresa()
        {
            DataTable data = clsHerramientaBD.Existe("SELECT * FROM Empresa", clsHerramientaBD.strConnAdmon);
            ddEmpresa.Items.Clear();
            if(data.Rows.Count > 0)
            {
                foreach (DataRow row in data.Rows)
                {
                    ddEmpresa.Items.Add(new ListItem(row["Nombre"].ToString(), row["ID_Empresa"].ToString()));
                }
            }
            else
            {
                ddEmpresa.Items.Add(new ListItem("No hay dominios registrados", "0", false));
            }            
        }

        //Subdominios===========================================================

        protected void bntAddSub_Click(object sender, EventArgs e)
        {
            string ID_empresa = ddEmpresa.SelectedValue;
            lblTest_Subdominio.Text = clsConfiguracion.Insertar_Subdom(txtSubdom.Text, ID_empresa, "");
            txtSubdom.Text = "";
            BindData_sub();
        }

        protected void btnAprove_Sub_Click(object sender, EventArgs e)
        {
            lblTest_Subdominio.Text = clsConfiguracion.Insertar_Subdom(txtSubdom.Text, ddEmpresa.SelectedValue, hfSubdom.Value);

            Panel_Sub.Visible = false;
            btnAddSub.Visible = true;
            txtSubdom.Text = "";

            BindData_sub();
        }

        protected void btnCancel_Sub_Click(object sender, EventArgs e)
        {
            Panel_Sub.Visible = false;
            btnAddSub.Visible = true;
            txtSubdom.Text = "";
        }

        protected void btnEditSubdom_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvSubdominio.Rows[rowIndex].Cells[0].Text;
            string Nombre = gvSubdominio.Rows[rowIndex].Cells[1].Text;
            string Dominio = gvSubdominio.Rows[rowIndex].Cells[2].Text;
            txtSubdom.Text = Dominio;
            hfSubdom.Value = Id;

            btnAddSub.Visible = false;
            Panel_Sub.Visible = true;
        }

        protected void btnDelSubdom_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvSubdominio.Rows[rowIndex].Cells[0].Text;

            lblTest_Subdominio.Text = clsConfiguracion.Borrar_Subdom(Id);

            BindData_sub();
        }

        //Empresa===============================================================
        protected void btnAprove_Empresa_Click(object sender, EventArgs e)
        {

            lblTest_Empresa.Text = clsConfiguracion.Insertar_Empresa(txtEmpresa.Text, hfEmpresa.Value);

            txtEmpresa.Text = "";
            Panel_Empresa.Visible = false;
            btnAddEmpresa.Visible = true;

            BindData_Empresa();
        }

        protected void btnCancel_Empresa_Click(object sender, EventArgs e)
        {
            txtEmpresa.Text = "";
            Panel_Empresa.Visible = false;
            btnAddEmpresa.Visible = true;
        }

        protected void btnEditEmpresa_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvEmpresas.Rows[rowIndex].Cells[0].Text;
            string nombre = gvEmpresas.Rows[rowIndex].Cells[1].Text;

            Panel_Empresa.Visible = true;
            btnAddEmpresa.Visible = false;

            hfEmpresa.Value = Id;
            txtEmpresa.Text = nombre;
        }

        protected void btnDelEmpresa_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvEmpresas.Rows[rowIndex].Cells[0].Text;

            lblTest_Subdominio.Text = clsConfiguracion.Eliminar_Empresa(Id);

            BindData_Empresa();
        }

        protected void btnAddEmpresa_Click(object sender, EventArgs e)
        {
            lblTest_Empresa.Text = clsConfiguracion.Insertar_Empresa(txtEmpresa.Text, "");
            txtEmpresa.Text = "";
            BindData_Empresa();
        }

        protected void ddLapso_compdom_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lapso = ddLapso_compdom.SelectedValue;

            ddTiempo_compdom.Items.Clear();
            if (lapso == "mensual")
            {
                llenarDropdown("mensual", ddTiempo_compdom);
                lbltiempo_compdom.Text = "mes(es)";
            }
            else
            {
                llenarDropdown("anual", ddTiempo_compdom);
                lbltiempo_compdom.Text = "año(s)";
            }
        }

        protected void ddLapso_ctpat_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lapso = ddLapso_ctpat.SelectedValue;

            ddTiempo_ctpat.Items.Clear();
            if (lapso == "mensual")
            {
                llenarDropdown("mensual", ddTiempo_ctpat);
                lblTiempo_ctpat.Text = "mes(es)";
            }
            else
            {
                llenarDropdown("anual", ddTiempo_ctpat);
                lblTiempo_ctpat.Text = "año(s)";
            }
        }

        protected void ddLapso_oea_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lapso = ddLapso_oea.SelectedValue;

            ddTiempo_oea.Items.Clear();
            if (lapso == "mensual")
            {
                llenarDropdown("mensual", ddTiempo_oea);
                lblTiempo_oea.Text = "mes(es)";
            }
            else
            {
                llenarDropdown("anual", ddTiempo_oea);
                lblTiempo_oea.Text = "año(s)";
            }
        }

        protected void ddLapso_op_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lapso = ddLapso_op.SelectedValue;

            ddTiempo_op.Items.Clear();
            if (lapso == "mensual")
            {
                llenarDropdown("mensual", ddTiempo_op);
                lblTiempo_oea.Text = "mes(es)";
            }
            else
            {
                llenarDropdown("anual", ddTiempo_op);
                lblTiempo_op.Text = "año(s)";
            }
        }

        protected void ddLapso_IS_SelectedIndexChanged(object sender, EventArgs e)
        {
            string lapso = ddLapso_IS.SelectedValue;

            ddTiempo_is.Items.Clear();
            if (lapso == "mensual")
            {
                llenarDropdown("mensual", ddTiempo_is);
                lblTiempo_is.Text = "mes(es)";
            }
            else
            {
                llenarDropdown("anual", ddTiempo_is);
                lblTiempo_is.Text = "año(s)";
            }
        }

        protected void btnProbarCon_Click(object sender, EventArgs e)
        {
            wsAdminIndex wsA = new wsAdminIndex();
            string Remitente = txtRemitente.Text;
            string Correo = txtCorreo.Text;
            string PuertoSMTP = txtPort.Text;
            string HostSMTP = txtHostSMTP.Text;
            string UsernameSMTP = txtUsername.Text;
            string PasswordSMTP = txtPassword.Text;

            string res = wsA.EnviarCorreoPrueba(PuertoSMTP, HostSMTP, UsernameSMTP, PasswordSMTP);

            if(res== "good")
            {
                literalTest.Text = "<div><i class='bi bi-check-circle-fill'></i></div>";

            }
            else
            {
                literalTest.Text = "<div><i class='bi bi-x-lg'></i></div>";

            }


        }

        protected void btnSMTP_Click(object sender, EventArgs e)
        {
            try
            {
                string Remitente = txtRemitente.Text;
                string Correo = txtCorreo.Text;
                string PuertoSMTP = txtPort.Text;
                string HostSMTP = txtHostSMTP.Text;
                string UsernameSMTP = txtUsername.Text;
                string PasswordSMTP = txtPassword.Text;

                clsSMTP.ActualizarInfo(Correo, Remitente, UsernameSMTP, PasswordSMTP, HostSMTP, PuertoSMTP);

                literalTest.Text = "Cambios guardados";

            }
            catch (Exception ex)
            {
                literalTest.Text = "Error: "+ex.Message;

            }
        }

        protected void ObtenerInfo()
        {           
            List<clsSMTP> datos = clsSMTP.ObtenerObjeto();
            if(datos.Count > 0)
            {
                txtCorreo.Text = datos[0].Correo;
                txtHostSMTP.Text = datos[0].HostSMTP;
                txtPort.Text = datos[0].PuertoSMTP;
                txtRemitente.Text = datos[0].Remitente;
                txtUsername.Text = datos[0].UsernameSMTP;
                txtPassword.Text = datos[0].PasswordSMTP;
            }
        }
    }
}