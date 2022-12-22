using Antlr.Runtime;
using ClientesNuevos.admin;
using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static ClientesNuevos.F14.wsBaseDatos;
using static ClientesNuevos.F5.wsAutoevaluacion;

namespace ClientesNuevos.F14.Seccioness
{    
    public partial class CompaniaFilial : System.Web.UI.Page
    {
        List<wsUbicacion.ListaPais> lstPais;
        ListItem item;
        wsUbicacion wsUbicacion = new wsUbicacion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                //LLenar combos
                ddCiudadComFilial.Items.Add(new ListItem("...", "0", true));
                ddEstadoComFilial.Items.Add(new ListItem("...", "0", true));

                LlenarPaisCB(ddPaisComFilial);


                //ComFil_DataBind("BNM840515VB1");

                if (User.IsInRole("1") || User.IsInRole("2"))
                {
                    pUsrControl.Visible = false;
                    pAdminControl.Visible = true;
                    btnAdminSave.Visible = false;   

                    if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
                    {
                        btnAdminNext.Text = "<i class=\"bi bi-arrow-right\"></i>";
                        btnAdminSaltar.Visible=true;
                        ComFil_DataBind(Request.QueryString["rfc"]);
                        DeshabilitarLinks();

                    }
                    else if(Request.QueryString["rfc"] != null)
                    {
                        ComFil_DataBind(Request.QueryString["rfc"]);
                        CambiarLinks();
                        btnAdminNext.Text = "<i class=\"bi bi-arrow-right\"></i>";
                    }
                }
                else if (User.IsInRole("3")) //cliente
                {
                    //Obtenemos datos
                    if(Request.Cookies.Get("id_comp") != null)
                    {                       
                        ComFil_DataBind(Request.Cookies.Get("id_comp").Value);
                    }
                }
                else if (User.IsInRole("4")) //proveedor
                {
                    Response.Redirect("~/f14/secciones/InformacionCadenaSuministro.aspx");
                }
            }
        }
        private void CambiarLinks()
        {
            step1.NavigateUrl = "~/F14/Secciones/InformacionCompania.aspx?rfc=" + Request.QueryString["rfc"];
            step2.NavigateUrl = "~/F14/Secciones/AgentesAduanales.aspx?rfc=" + Request.QueryString["rfc"];
            step4.NavigateUrl = "~/F14/Secciones/TipoServicioProductos.aspx?rfc=" + Request.QueryString["rfc"];
            step5.NavigateUrl = "~/F14/Secciones/InformacionCadenaSuministro.aspx?rfc=" + Request.QueryString["rfc"];
        }
        private void DeshabilitarLinks()
        {
            step2.Enabled = false;
            step3.Enabled = false;
            step4.Enabled = false;
            step5.Enabled = false;
        }
        protected void LlenarPaisCB(DropDownList dropDown)
        {
            lstPais = new List<wsUbicacion.ListaPais>();
            lstPais = wsUbicacion.llenarCbPais();

            dropDown.Items.Add(new ListItem("...", "0", true));

            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDown.Items.Add(item);
            }
        }

        protected void llenarCB(DropDownList dropDownList, string tipo, int id)
        {
            dropDownList.Items.Clear();
            lstPais = new List<wsUbicacion.ListaPais>();

            if(tipo == "estado")
            {
                lstPais = wsUbicacion.llenarCbEstados(id);

            }
            else if(tipo == "ciudad")
            {
                lstPais = wsUbicacion.llenarCbCiudades(id);

            }

            dropDownList.Items.Add(new ListItem("...", "0", true));

            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDownList.Items.Add(item);
            }
        }

        protected void ddPaisComFilial_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(ddPaisComFilial.SelectedValue);
            if(ddPaisComFilial.SelectedItem.Value == "231")
            {
                lblRFC.Text = "W9:";
                lblCP.InnerText = "Zip code:";
            }
            else
            {
                lblRFC.Text = "RFC:";
                lblCP.InnerText = "CP:";
            }
            llenarCB(ddEstadoComFilial, "estado", index);
        }

        protected void ddEstadoComFilial_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(ddEstadoComFilial.SelectedValue);           
            llenarCB(ddCiudadComFilial, "ciudad", index);
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("AgentesAduanales.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            if(User.IsInRole("1")|| User.IsInRole("2"))
            {
                Response.Redirect("~/admin/index.aspx");
            }
            else
            {
                HttpContext.Current.Response.Redirect("~/usuario/user_index.aspx");

            }
        }

        protected void btnAdminBack_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/AgentesAduanales.aspx?accion="+ Request.QueryString["accion"] + "&rfc="+ Request.QueryString["rfc"]);
            }
            else if (Request.QueryString["rfc"]!=null)
            {
                Response.Redirect("~/f14/secciones/AgentesAduanales.aspx?rfc=" + Request.QueryString["rfc"]);

            }
        }

        protected void btnAdminH_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("~/admin/index.aspx");
           
        }

        protected void btnAdminSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnAdminNext_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/TipoServicioProductos.aspx?accion=" + Request.QueryString["accion"] + "&rfc=" + Request.QueryString["rfc"]);
            }else if(Request.QueryString["rfc"] != null)
            {
                Response.Redirect("~/f14/secciones/TipoServicioProductos.aspx?rfc=" + Request.QueryString["rfc"]);
            }
        }

        protected void ComFil_DataBind(string id_comp)
        {
            string strSql = "exec select_ComFilial @id_compania= '" + id_comp + "'";
            DataTable dt = clsHerramientaBD.Existe(strSql);

            gvComFil.DataSource = dt;
            gvComFil.DataBind();
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {

            btnAddCF.Visible = false;
            pEdit.Visible = true;

            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            hfID.Value = gvComFil.Rows[rowIndex].Cells[0].Text;
            string comp = gvComFil.Rows[rowIndex].Cells[1].Text;
            txtNombreCompaniaFilial.Text = gvComFil.Rows[rowIndex].Cells[2].Text;
            txtNombrComFilial.Text = gvComFil.Rows[rowIndex].Cells[3].Text;
            txtRfcComFilial.Text = gvComFil.Rows[rowIndex].Cells[4].Text;
            txtDirecFiscalComFilial.Text = gvComFil.Rows[rowIndex].Cells[5].Text;
            txtCPComFIlial.Text = gvComFil.Rows[rowIndex].Cells[9].Text;
            txtNombrContFilial.Text = gvComFil.Rows[rowIndex].Cells[10].Text;
            txtPuestoContFilial.Text = gvComFil.Rows[rowIndex].Cells[11].Text;
            txtCorreoContFilial.Text = gvComFil.Rows[rowIndex].Cells[12].Text;
            txtTelContFilial.Text = gvComFil.Rows[rowIndex].Cells[13].Text;
            txtCelContFilial.Text= gvComFil.Rows[rowIndex].Cells[15].Text;

            if(gvComFil.Rows[rowIndex].Cells[14].Text != "&nbsp;")
            {
                txtExtContFilial.Text = gvComFil.Rows[rowIndex].Cells[14].Text;
            }

            string id = ddPaisComFilial.SelectedItem.Text;
            ddPaisComFilial.Items.FindByText(id).Selected = false;
            ddPaisComFilial.Items.FindByText(gvComFil.Rows[rowIndex].Cells[6].Text).Selected = true;

            //LLenar estado
            int index = Convert.ToInt32(ddPaisComFilial.SelectedValue);
            llenarCB(ddEstadoComFilial, "estado", index);
            string id2 = ddEstadoComFilial.SelectedItem.Text;
            ddEstadoComFilial.Items.FindByText(id2).Selected = false;
            ddEstadoComFilial.Items.FindByText(gvComFil.Rows[rowIndex].Cells[7].Text).Selected = true;

            //Llenar ciudad
            int index2 = Convert.ToInt32(ddEstadoComFilial.SelectedValue);
            llenarCB(ddCiudadComFilial, "ciudad", index2);
            string id3 = ddCiudadComFilial.SelectedItem.Text;
            ddCiudadComFilial.Items.FindByText(id3).Selected = false;
            ddCiudadComFilial.Items.FindByText(gvComFil.Rows[rowIndex].Cells[8].Text).Selected = true;

        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            string ID = gvComFil.Rows[rowIndex].Cells[0].Text;
            string comp = gvComFil.Rows[rowIndex].Cells[1].Text;

            string str = "";
            str = clsHerramientaBD.ExecuteSql("DELETE FROM Table_CompaniaFilial WHERE ID='"+ID+ "' AND ID_compania='"+comp+"'");
            if(str != "")
            {
                lblRes.Text = str;
            }

            ComFil_DataBind(comp);
        }

        protected void btnAddCF_Click(object sender, EventArgs e)
        {
            string IdComp ="";

            if (User.IsInRole("1") || User.IsInRole("2"))
            {
                 IdComp = Request.QueryString["rfc"];
                string Nombre = txtNombrComFilial.Text;
                string NombreCom = txtNombrComFilial.Text;
                string RFC = txtRfcComFilial.Text;
                string Direccion = txtDirecFiscalComFilial.Text;
                string Pais = ddPaisComFilial.SelectedItem.Value;
                string Estado = ddEstadoComFilial.SelectedItem.Value;
                string Ciudad = ddCiudadComFilial.SelectedItem.Value;
                string CP = txtCPComFIlial.Text;
                //Contacto
                string NombreC = txtNombrContFilial.Text;
                string PuestoC = txtPuestoContFilial.Text;
                string CorreoC = txtCorreoContFilial.Text;
                string TelC = txtTelContFilial.Text;
                string Ext = txtExtContFilial.Text;
                string CelC = txtCelContFilial.Text;

                string str = clsF14.Insertar_CompaniaFilial(IdComp,Nombre,NombreCom,RFC,Direccion,Pais,Estado,Ciudad,CP,NombreC,PuestoC,CorreoC,TelC,Ext,CelC,"");

                lblRes.Text = str;

                Limpiar();
                ComFil_DataBind(IdComp);
            }
            else
            {
                if (Request.Cookies.Get("id_comp") != null)
                {
                    IdComp = Request.Cookies.Get("id_comp").Value;


                    string Nombre = txtNombrComFilial.Text;
                    string NombreCom = txtNombrComFilial.Text;
                    string RFC = txtRfcComFilial.Text;
                    string Direccion = txtDirecFiscalComFilial.Text;
                    string Pais = ddPaisComFilial.SelectedItem.Value;
                    string Estado = ddEstadoComFilial.SelectedItem.Value;
                    string Ciudad = ddCiudadComFilial.SelectedItem.Value;
                    string CP = txtCPComFIlial.Text;
                    //Contacto
                    string NombreC = txtNombrContFilial.Text;
                    string PuestoC = txtPuestoContFilial.Text;
                    string CorreoC = txtCorreoContFilial.Text;
                    string TelC = txtTelContFilial.Text;
                    string Ext = txtExtContFilial.Text;
                    string CelC = txtCelContFilial.Text;

                    string str = clsF14.Insertar_CompaniaFilial(IdComp, Nombre, NombreCom, RFC, Direccion, Pais, Estado, Ciudad, CP, NombreC, PuestoC, CorreoC, TelC, Ext, CelC, "");

                    lblRes.Text = str;

                    Limpiar();
                    ComFil_DataBind(IdComp);
                }
            }
            
        }

        private void Limpiar()
        {
            txtNombrComFilial.Text="";
            txtNombreCompaniaFilial.Text="";
            txtRfcComFilial.Text="";
            txtDirecFiscalComFilial.Text="";
            txtCPComFIlial.Text="";
            //Contacto
            txtNombrContFilial.Text="";
            txtPuestoContFilial.Text="";
            txtCorreoContFilial.Text="";
            txtTelContFilial.Text="";
            txtExtContFilial.Text="";
            txtCelContFilial.Text="";
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            string IdComp = "";
            if (User.IsInRole("1") || User.IsInRole("2"))
            {
                IdComp = Request.QueryString["rfc"];
                string Nombre = txtNombrComFilial.Text;
                string NombreCom = txtNombrComFilial.Text;
                string RFC = txtRfcComFilial.Text;
                string Direccion = txtDirecFiscalComFilial.Text;
                string Pais = ddPaisComFilial.SelectedItem.Value;
                string Estado = ddEstadoComFilial.SelectedItem.Value;
                string Ciudad = ddCiudadComFilial.SelectedItem.Value;
                string CP = txtCPComFIlial.Text;
                //Contacto
                string NombreC = txtNombrContFilial.Text;
                string PuestoC = txtPuestoContFilial.Text;
                string CorreoC = txtCorreoContFilial.Text;
                string TelC = txtTelContFilial.Text;
                string Ext = txtExtContFilial.Text;
                string CelC = txtCelContFilial.Text;
                string ID = hfID.Value;

                string str = clsF14.Insertar_CompaniaFilial(IdComp, Nombre, NombreCom, RFC, Direccion, Pais, Estado, Ciudad, CP, NombreC, PuestoC, CorreoC, TelC, Ext, CelC, ID);

                lblRes.Text = str;
                pEdit.Visible = false;
                btnAddCF.Visible = true;
                Limpiar();
                ComFil_DataBind(IdComp);
            }
            else
            {
                if (Request.Cookies.Get("id_comp") != null)
                {
                    IdComp = Request.Cookies.Get("id_comp").Value;
                    string Nombre = txtNombrComFilial.Text;
                    string NombreCom = txtNombrComFilial.Text;
                    string RFC = txtRfcComFilial.Text;
                    string Direccion = txtDirecFiscalComFilial.Text;
                    string Pais = ddPaisComFilial.SelectedItem.Value;
                    string Estado = ddEstadoComFilial.SelectedItem.Value;
                    string Ciudad = ddCiudadComFilial.SelectedItem.Value;
                    string CP = txtCPComFIlial.Text;
                    //Contacto
                    string NombreC = txtNombrContFilial.Text;
                    string PuestoC = txtPuestoContFilial.Text;
                    string CorreoC = txtCorreoContFilial.Text;
                    string TelC = txtTelContFilial.Text;
                    string Ext = txtExtContFilial.Text;
                    string CelC = txtCelContFilial.Text;
                    string ID = hfID.Value;

                    string str = clsF14.Insertar_CompaniaFilial(IdComp, Nombre, NombreCom, RFC, Direccion, Pais, Estado, Ciudad, CP, NombreC, PuestoC, CorreoC, TelC, Ext, CelC, ID);

                    lblRes.Text = str;
                    pEdit.Visible = false;
                    btnAddCF.Visible = true;
                    Limpiar();
                    ComFil_DataBind(IdComp);
                }
            }
                
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Limpiar();
            pEdit.Visible = false;
        }

        protected void btnAdminSaltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/f14/secciones/TipoServicioProductos.aspx?accion=" + Request.QueryString["accion"] + "&rfc=" + Request.QueryString["rfc"]);
        }
    }
}