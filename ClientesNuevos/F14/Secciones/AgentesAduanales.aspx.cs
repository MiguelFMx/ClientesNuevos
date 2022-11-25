using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.F14.Seccioness
{
    public partial class AgentesAduanales : System.Web.UI.Page
    {
        wsUbicacion wsUbicacion = new wsUbicacion();
        wsBaseDatos wsBaseDatos = new wsBaseDatos();
        List<wsUbicacion.ListaPais> lstPais;
        DataTable dtAAM = new DataTable();
        DataTable dtContactoAAM = new DataTable();
        DataTable dtContactoAAU = new DataTable();
        DataTable dtAAU = new DataTable();
        DataTable id = new DataTable();
        ListItem item;
        string id_comp;
        
        string id_user = HttpContext.Current.Request.Cookies.Get("id").Value;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack){
                LlenarEstado(ddEstadoAA, 142);
                LlenarEstado(ddEstadoAAm, 231);

                //Roles de admin y usuario
                if (User.IsInRole("1")|| User.IsInRole("2"))
                {
                    pUser.Visible = false;
                    pAdmin.Visible = true;

                    //Nuevo registro
                    if (Request.QueryString["rfc"]!=null && Request.QueryString["accion"] != null)
                    {        
                        btnAdminNext.Text = "Skip";
                        btnAdminSave.Text = "Registrar";
                    }
                    else if(Request.QueryString["rfc"] != null)
                    {
                        //Si solo esta el rfc, significa que es consulta.
                        btnAdminNext.Text = "<i class=\"bi bi-arrow-right\"></i>";
                        btnAdminSave.Text = "Actualizar";

                        //Get RFC
                        string id_C = Request.QueryString["rfc"].ToString();
                        llenarCampos(id_C);

                        CambiarLinks();

                    }
                }
                // Solo el cliente tiene acceso
                else if (User.IsInRole("3"))
                {
                    try
                    {
                        id = wsBaseDatos.Existe("SELECT * FROM Table_compania WHERE ID_user = '" + id_user + "'");
                        if (id.Rows.Count > 0)
                        {
                            id_comp = id.Rows[0]["ID_compania"].ToString();

                            llenarCampos(id_comp);
                        }

                    }
                    catch (Exception ex)
                    {

                        lblResultado.Text = "Error: " + ex.Message;
                    }

                }
                else if (User.IsInRole("4"))
                {
                    Response.Redirect("~/F14/secciones/InformacionCadenaSuministro.aspx");
                } 
            }
        }

        private void llenarCampos(string IDCompania)
        {
            dtAAM = wsBaseDatos.Existe("SELECT * FROM Table_AgenteAduanal WHERE ID_compania = '" + IDCompania + "' AND tipo = 'AAMX'");
            dtAAU = wsBaseDatos.Existe("SELECT * FROM Table_AgenteAduanal WHERE ID_compania = '" + IDCompania + "' AND tipo = 'AAUSA'");

            if (dtAAM.Rows.Count > 0)
            {
                try
                {
                    LlenarCamposAAM(dtAAM);
                    // Obtiene los datos de contacto Mexicano
                    dtContactoAAM = wsBaseDatos.Existe("SELECT * FROM Table_Contacto WHERE ID_compania = '" + IDCompania + "' AND tipo ='AAMX'");
                    llenarContactoAAM(dtContactoAAM);
                }
                catch (Exception er)
                {

                    lblResultado.Text = er.Message;
                }
            }
            else
            {
                lblResultado.Text = "No hay datos para el agente aduanal mexicano \n";

            }
            //================================Agente aduanal americano
            if (dtAAU.Rows.Count > 0)
            {
                //obtener los datos de contacto usa
                LlenarCamposAA(dtAAU);
                dtContactoAAU = wsBaseDatos.Existe("SELECT * FROM Table_Contacto WHERE ID_compania = '" + IDCompania + "' AND tipo ='AAUSA'");
                llenarContactoAA(dtContactoAAU);
            }
            else
            {
                lblResultado.Text += " No hay datos para el agente aduanal americano";

            }


        }


        private void CambiarLinks()
        {
            step1.NavigateUrl = "~/F14/Secciones/InformacionCompania.aspx?rfc=" + Request.QueryString["rfc"];
            step3.NavigateUrl = "~/F14/Secciones/CompaniaFilial.aspx?rfc=" + Request.QueryString["rfc"];
            step4.NavigateUrl = "~/F14/Secciones/TipoServicioProductos.aspx?rfc=" + Request.QueryString["rfc"];
            step5.NavigateUrl = "~/F14/Secciones/InformacionCadenaSuministro.aspx?rfc=" + Request.QueryString["rfc"];
        }

        private void LlenarCamposAA(DataTable dtAAU)
        {
            txtNombreCompaniaAAm.Text = dtAAU.Rows[0]["Nombre"].ToString();
            txtNoPatAAm.Text = dtAAU.Rows[0]["no_patente"].ToString();
            txtNombrComAAm.Text = dtAAU.Rows[0]["Nombre_comercial"].ToString();
            txtRFCTaxAAm.Text = dtAAU.Rows[0]["RFC"].ToString();
            txtDirecAAm.Text = dtAAU.Rows[0]["Direccion"].ToString();
            txtCPAAm.Text = dtAAU.Rows[0]["codigo_postal"].ToString();

            ddEstadoAAm.Items.FindByValue(dtAAU.Rows[0]["Estado"].ToString()).Selected = true;
            LlenarCiudad(ddCiudadAAm, Convert.ToInt32(dtAAU.Rows[0]["Estado"]));
           // ddCiudadAAm.Items.FindByValue(dtAAU.Rows[0]["Ciudad"].ToString()).Selected = true;

        }

        private void llenarContactoAA(DataTable dtContactoAAU)
        {
            txtNombrContAAm.Text = dtContactoAAU.Rows[0]["Nombre"].ToString();
            txtpuestoContAAm.Text = dtContactoAAU.Rows[0]["puesto"].ToString();
            txtTelContAAm.Text = dtContactoAAU.Rows[0]["Telefono"].ToString();
            txtCelContAAm.Text = dtContactoAAU.Rows[0]["Celular"].ToString();
            txtCorreoContAAm.Text = dtContactoAAU.Rows[0]["Correo"].ToString();
            txtExtContAAm.Text = dtContactoAAU.Rows[0]["Extension"].ToString();
        }

        private void llenarContactoAAM(DataTable dtContactoAAM)
        {
            txtNombrContAA.Text = dtContactoAAM.Rows[0]["Nombre"].ToString();
            txtpuestoContAA.Text = dtContactoAAM.Rows[0]["puesto"].ToString();
            txtTelContAA.Text = dtContactoAAM.Rows[0]["Telefono"].ToString();
            txtCelContAA.Text = dtContactoAAM.Rows[0]["Celular"].ToString();
            txtCorreoContAA.Text = dtContactoAAM.Rows[0]["Correo"].ToString();
            txtExtxContAA.Text = dtContactoAAM.Rows[0]["Extension"].ToString();

        }

        protected void ddEstadoAA_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddCiudadAA.Items.Clear();
            
            lstPais = new List<wsUbicacion.ListaPais>();
            var estado = Convert.ToInt32(ddEstadoAA.SelectedItem.Value);

            lstPais = wsUbicacion.llenarCbCiudades(estado);


            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                ddCiudadAA.Items.Add(item);
            }

            ddCiudadAA.DataBind();
        }

        protected void LlenarEstado(DropDownList dropDown, int id)
        {
            dropDown.Items.Clear();
            lstPais = new List<wsUbicacion.ListaPais>();
            lstPais = wsUbicacion.llenarCbEstados(id);

            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDown.Items.Add(item);
            }
            dropDown.DataBind();

        }

        protected void LlenarCiudad(DropDownList dropDownList, int id)
        {
            dropDownList.Items.Clear();
            lstPais = new List<wsUbicacion.ListaPais>();
            lstPais = wsUbicacion.llenarCbCiudades(id);

            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDownList.Items.Add(item);
            }
            dropDownList.DataBind();
        }

        protected void ddEstadoAAm_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddCiudadAAm.Items.Clear();

            lstPais = new List<wsUbicacion.ListaPais>();
            var estado = Convert.ToInt32(ddEstadoAAm.SelectedItem.Value);

            lstPais = wsUbicacion.llenarCbCiudades(estado);


            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                ddCiudadAAm.Items.Add(item);
            }

            ddCiudadAAm.DataBind();
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            //INSRTAR EN BASE DE DATOS LOS 4 CAMPOS
            //Insertar_agente_aduanal_mx();
            //Insertar_contacto_mx();
            //Insertar_agente_aduanal_usa();
            //Insertar_contacto_usa();

           // Response.Redirect("CompaniaFilial.aspx");
        }
        private string Insertar_agente_aduanal_mx() 
        {
            string ID_compania, Nombre, Nombre_comercial, no_patente, rfc, direccion, cp, estado, ciudad, tipo, res="";
            ID_compania = Request.Cookies.Get("id_comp").Value;
            Nombre = txtNombreCompaniaAA.Text;
            Nombre_comercial = txtNombreCompaniaAA.Text;
            no_patente = txtNoPatAA.Text;
            rfc = txtRFCTaxAA.Text;
            direccion = txtDirecAA.Text;
            cp = txtCPAA.Text;
            estado = ddEstadoAA.SelectedValue;
            ciudad = ddCiudadAA.SelectedValue;
            tipo = "AAMX";
            res= "////"+clsF14.Insertar_AgenteAduanal(ID_compania, Nombre, Nombre_comercial, no_patente, rfc, direccion, cp, estado, ciudad, tipo);

            return res;
        }

        private string Insertar_agente_aduanal_usa()
        {
            string ID_compania, Nombre, Nombre_comercial, no_patente, rfc, direccion, cp, estado, ciudad, tipo, res = "";
            ID_compania = Request.Cookies.Get("id_comp").Value;
            Nombre = txtNombreCompaniaAAm.Text;
            Nombre_comercial = txtNombreCompaniaAAm.Text;
            no_patente = txtNoPatAAm.Text;
            rfc = txtRFCTaxAAm.Text;
            direccion = txtDirecAAm.Text;
            cp = txtCPAAm.Text;
            estado = ddEstadoAAm.SelectedValue;
            ciudad = ddCiudadAAm.SelectedValue;
            tipo = "AAUSA";
            res = "/////"+clsF14.Insertar_AgenteAduanal(ID_compania, Nombre, Nombre_comercial, no_patente, rfc, direccion, cp, estado, ciudad, tipo);

            return res;
        }

        private string Insertar_contacto_mx()
        {
            string ID_compania, Nombre, Puesto, Telefono, Extension, Celular, tipo, Correo, res="";
            ID_compania = Request.Cookies.Get("id_comp").Value;
            Nombre = txtNombrContAA.Text;
            Puesto = txtpuestoContAA.Text;
            Telefono = txtTelContAA.Text;
            Extension = txtExtxContAA.Text;
            Celular = txtCelContAA.Text;
            tipo = "AAMX";
            Correo = txtCorreoContAA.Text;

            res="////"+ clsF14.Insertar_contactoAA(ID_compania, Nombre, Puesto, Telefono, Extension, Celular, tipo, Correo);

            return res;
        }
        private string Insertar_contacto_usa()
        {
            string ID_compania, Nombre, Puesto, Telefono, Extension, Celular, tipo, Correo, res="";
            ID_compania = Request.Cookies.Get("id_comp").Value;
            Nombre = txtNombrContAAm.Text;
            Puesto = txtpuestoContAAm.Text;
            Telefono = txtTelContAAm.Text;
            Extension = txtExtContAAm.Text;
            Celular = txtCelContAAm.Text;
            Correo = txtCorreoContAAm.Text;
            tipo = "AAUSA";

            res="////"+clsF14.Insertar_contactoAA(ID_compania, Nombre, Puesto, Telefono, Extension, Celular, tipo, Correo);

            return res;
        }

        private void LlenarCamposAAM(DataTable dt)
        {
            txtNombreCompaniaAA.Text = dt.Rows[0]["Nombre"].ToString();
            txtNoPatAA.Text = dt.Rows[0]["no_patente"].ToString();
            txtNombrComAA.Text = dt.Rows[0]["Nombre_comercial"].ToString();
            txtRFCTaxAA.Text = dt.Rows[0]["RFC"].ToString();
            txtDirecAA.Text = dt.Rows[0]["Direccion"].ToString();
            txtCPAA.Text = dt.Rows[0]["codigo_postal"].ToString();

            ddEstadoAA.Items.FindByValue(dt.Rows[0]["Estado"].ToString()).Selected = true;
            LlenarCiudad(ddCiudadAA, Convert.ToInt32(dt.Rows[0]["Estado"]));
            ddCiudadAA.Items.FindByValue(dt.Rows[0]["Ciudad"].ToString()).Selected = true;
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("../../usuario/user_index.aspx");
        }

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("InformacionCompania.aspx");

        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            string res="", documento="";

            try
            {
                documento = clsF14.Insertar_Documento(Request.Cookies.Get("id_comp").Value, "F14", "null", "40%");

                res = Registrar_AgenteAduanal();

                lblResultado.Text = res + " " + documento;

                HttpContext.Current.Response.Redirect("CompaniaFilial.aspx?res=Exito");
            }
            catch (Exception ex)
            {
                lblResultado.Text = ex.Message;
            }
        }

        protected string Registrar_AgenteAduanal()
        {
            string resultado="";

            resultado = Insertar_agente_aduanal_mx();
            resultado += Insertar_contacto_mx();
            resultado +=Insertar_agente_aduanal_usa();
            resultado += Insertar_contacto_usa();


            return resultado;
        }


        //=====================================Sobrecarga
        private string Insertar_agente_aduanal_mx(string IDc)
        {
            string ID_compania, Nombre, Nombre_comercial, no_patente, rfc, direccion, cp, estado, ciudad, tipo, res = "";
            ID_compania = IDc;
            Nombre = txtNombreCompaniaAA.Text;
            Nombre_comercial = txtNombreCompaniaAA.Text;
            no_patente = txtNoPatAA.Text;
            rfc = txtRFCTaxAA.Text;
            direccion = txtDirecAA.Text;
            cp = txtCPAA.Text;
            estado = ddEstadoAA.SelectedValue;
            ciudad = ddCiudadAA.SelectedValue;
            tipo = "AAMX";
            res = "////" + clsF14.Insertar_AgenteAduanal(ID_compania, Nombre, Nombre_comercial, no_patente, rfc, direccion, cp, estado, ciudad, tipo);

            return res;
        }

        private string Insertar_agente_aduanal_usa(string IDc)
        {
            string ID_compania, Nombre, Nombre_comercial, no_patente, rfc, direccion, cp, estado, ciudad, tipo, res = "";
            ID_compania = IDc;
            Nombre = txtNombreCompaniaAAm.Text;
            Nombre_comercial = txtNombreCompaniaAAm.Text;
            no_patente = txtNoPatAAm.Text;
            rfc = txtRFCTaxAAm.Text;
            direccion = txtDirecAAm.Text;
            cp = txtCPAAm.Text;
            estado = ddEstadoAAm.SelectedValue;
            ciudad = ddCiudadAAm.SelectedValue;
            tipo = "AAUSA";
            res = "/////" + clsF14.Insertar_AgenteAduanal(ID_compania, Nombre, Nombre_comercial, no_patente, rfc, direccion, cp, estado, ciudad, tipo);

            return res;
        }

        private string Insertar_contacto_mx(string IDc)
        {
            string ID_compania, Nombre, Puesto, Telefono, Extension, Celular, tipo, Correo, res = "";
            ID_compania = IDc;
            Nombre = txtNombrContAA.Text;
            Puesto = txtpuestoContAA.Text;
            Telefono = txtTelContAA.Text;
            Extension = txtExtxContAA.Text;
            Celular = txtCelContAA.Text;
            tipo = "AAMX";
            Correo = txtCorreoContAA.Text;

            res = "////" + clsF14.Insertar_contactoAA(ID_compania, Nombre, Puesto, Telefono, Extension, Celular, tipo, Correo);

            return res;
        }
        private string Insertar_contacto_usa(string IDc)
        {
            string ID_compania, Nombre, Puesto, Telefono, Extension, Celular, tipo, Correo, res = "";
            ID_compania = IDc;
            Nombre = txtNombrContAAm.Text;
            Puesto = txtpuestoContAAm.Text;
            Telefono = txtTelContAAm.Text;
            Extension = txtExtContAAm.Text;
            Celular = txtCelContAAm.Text;
            Correo = txtCorreoContAAm.Text;
            tipo = "AAUSA";

            res = "////" + clsF14.Insertar_contactoAA(ID_compania, Nombre, Puesto, Telefono, Extension, Celular, tipo, Correo);

            return res;
        }
        protected string Registrar_AgenteAduanal(string IDc)
        {
            string resultado = "";

            resultado = Insertar_agente_aduanal_mx(IDc);
            resultado += Insertar_contacto_mx(IDc);
            resultado += Insertar_agente_aduanal_usa(IDc);
            resultado += Insertar_contacto_usa(IDc);


            return resultado;
        }


        protected void btnAdminBack_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/CompaniaFilial.aspx?accion=new&rfc=" + Request.QueryString["rfc"]);
            }
            else if (Request.QueryString["rfc"] != null)
            {
                Response.Redirect("~/f14/secciones/InformacionCompania.aspx?rfc=" + Request.QueryString["rfc"]);
            }
        }

        protected void btnAdminH_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/index.aspx");
        }

        protected void btnAdminSave_Click(object sender, EventArgs e)
        {
            //Registros
                Registrar_AgenteAduanal(Request.QueryString["rfc"]);
            if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/CompaniaFilial.aspx?accion=new&rfc=" + Request.QueryString["rfc"]);
            }
            else if(Request.QueryString["rfc"] != null)
            {
                Response.Redirect("~/f14/secciones/CompaniaFilial.aspx?rfc=" + Request.QueryString["rfc"]);
            }
        }

        protected void btnAdminNext_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"]!=null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/CompaniaFilial.aspx?accion=new&rfc=" + Request.QueryString["rfc"]);
            }
            else if (Request.QueryString["rfc"] != null)
            {
                Response.Redirect("~/f14/secciones/CompaniaFilial.aspx?rfc=" + Request.QueryString["rfc"]);
            }

        }
    }
}