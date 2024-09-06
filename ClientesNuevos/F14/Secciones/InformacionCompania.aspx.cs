﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime;
using ClientesNuevos;
using System.Data;
using ClientesNuevos.App_Code;
using System.IO;
using System.Web.Security;
using static System.Net.Mime.MediaTypeNames;
using ClientesNuevos.F5.Autoevaluacion;
using System.Diagnostics;


namespace ClientesNuevos.F14.Seccioness
{

    public partial class ImformacionCompania : System.Web.UI.Page
    {
        wsUbicacion wsUbicacion = new wsUbicacion();
        wsBaseDatos wsBaseDatos = new wsBaseDatos();

        List<wsUbicacion.ListaPais> lstPais;
        ListItem item;
        DataTable dt, dtBanco, dtFra;
        //Detecta si la seccion de info bancaria esta activa
        bool boolbanco = true;

        string id_user = HttpContext.Current.Request.Cookies.Get("id").Value;

        protected void Page_Load(object sender, EventArgs e)
            {          
                //BloquearOpcion(ref ddTipoDePersona, "2");

            if (!IsPostBack)
            {
                FormsIdentity ident = User.Identity as FormsIdentity;
                FormsAuthenticationTicket authTicket = ident.Ticket;

                string userInfo = authTicket.UserData;
                string[] info = userInfo.Split(';');
                string id = info[1];



                LlenarPaisCB(ddPais);
                LlenarPaisCB(ddPaisFra);
                llenarMetodoPago();

                //Reviso roles
                //Administrador y usuario
                if(User.IsInRole("1") || User.IsInRole("2"))
                {

                    pAdminControl.Visible = true;
                    pUserControl.Visible = false;

                   

                    //Si es ver info solo sera el querystring rfc
                    if (Request.QueryString["rfc"]!= null)
                    {
                        

                        DataTable tabla = clsHerramientaBD.Existe("SELECT * FROM user_detalles WHERE RFC='" + Request.QueryString["rfc"] + "' AND ID_Empresa='1' AND subdominio='1'", clsHerramientaBD.strConnAdmon);
                        if(tabla.Rows.Count > 0)
                        {
                            if (tabla.Rows[0]["ID_rol"].ToString() == "4")
                            {
                                TipoRegistro("proveedor");

                            }                           
                            
                        }

                        //Obtengo la info de la compañia
                        dt = wsBaseDatos.Existe("SELECT * FROM Table_compania WHERE ID_compania = '" + Request.QueryString["rfc"] + "'");
                        //Si hay informacion obtengo el ID de la compañia para hacer la consulta en la tabla de banco
                        if (dt.Rows.Count > 0)
                        {
                            string tipo = dt.Rows[0]["ID_user"].ToString();
                            if (dt.Rows[0]["Tipo_persona"].ToString() == "2")
                            {
                                
                                lblRFC.Text = "W9:";
                                pDatosBancarios.Enabled = false;
                                pDatosBancarios.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);
                                txtCURP.Enabled = false;

                                RequiredFieldValidator7.Enabled = false;
                                RequiredFieldValidator8.Enabled = false;
                                RequiredFieldValidator9.Enabled = false;
                                RequiredFieldValidator10.Enabled = false;
                            }else if (dt.Rows[0]["Tipo_persona"].ToString() == "0")
                            {
                                TipoRegistro("proveedor");

                            }


                            dtFra = clsHerramientaBD.Existe("SELECT * FROM Table_DireccionFra WHERE ID_compania ='" + Request.QueryString["rfc"] + "'");

                            if (dt.Rows[0]["Direccion"].ToString() != dtFra.Rows[0]["Direccion_fra"].ToString() )
                            {
                                if (dtFra.Rows[0]["Direccion_fra"].ToString() != "")
                                {
                                    LlenarFra(dtFra); 
                                }
                            }

                            dtBanco = new DataTable();
                            dtBanco = wsBaseDatos.Existe("SELECT * FROM Table_infoBancaria WHERE ID_compania = '" + dt.Rows[0]["ID_compania"].ToString() + "'");

                            

                            if (dtBanco.Rows.Count > 0)
                            {

                                if (dtBanco.Rows[0]["Nombre_banco"].ToString() != "")
                                {
                                    if (dtBanco.Rows[0]["Nombre_banco"].ToString() == "NTS")
                                    {
                                        chNTS.Checked = true;
                                        //deshabilitar campos               
                                        pDatosBancarios.Enabled = false;
                                        pDatosBancarios.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);

                                        //Deshabilito los validadores
                                        RequiredFieldValidator7.Enabled = false;
                                        RequiredFieldValidator8.Enabled = false;
                                        RequiredFieldValidator9.Enabled = false;
                                        RequiredFieldValidator10.Enabled = false;

                                        llenarCampos(dt, new DataTable());
                                    }else if (dtBanco.Rows[0]["Nombre_banco"].ToString() == "HTS")
                                    {
                                        chHTS.Checked = true;
                                        //deshabilitar campos               
                                        pDatosBancarios.Enabled = false;
                                        pDatosBancarios.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);

                                        //Deshabilito los validadores
                                        RequiredFieldValidator7.Enabled = false;
                                        RequiredFieldValidator8.Enabled = false;
                                        RequiredFieldValidator9.Enabled = false;
                                        RequiredFieldValidator10.Enabled = false;

                                        llenarCampos(dt, new DataTable());
                                    }
                                    else
                                    {
                                        llenarCampos(dt, dtBanco);
                                    }
                                   
                                }
                                
                                else
                                {
                                    llenarCampos(dt, new DataTable());

                                }

                            }
                            else
                            {
                                llenarCampos(dt, new DataTable());
                            }
                        }

                        DataBind_Contactos();
                        CambiarLinks();
                    }
                    else if (Request.QueryString["accion"] != null)
                    {
                        //accion: nuevo registro
                        if(Request.QueryString["accion"] == "new")
                        {
                            if (Request.Cookies.Get("id_comp") != null)
                            {
                                HttpCookie myCookie = new HttpCookie("id_comp");
                                myCookie.Expires = DateTime.Now.AddDays(-1d);
                                Response.Cookies.Add(myCookie);
                            }

                            pRegistro.Visible = true;
                            DeshabilitarLinks();
                            btnAdinSave.Text = "Registrar";
                            btnAdminNext.Visible = false;
                            btnAdminH.Visible = false;
                            btnAdminBack.Text = "Cancelar";
                            gvContactos.DataSource = null;
                            gvContactos.DataBind();
                        }

                    }
                    else
                    {
                        Response.Redirect("~/F14/secciones/InformacionCompania.aspx?accion=new");
                    }
                }
                else if(User.IsInRole("3") || User.IsInRole("4")) //Rol=Cliente
                {
                    if (Request.QueryString["accion"] != null)
                    {
                        Response.Redirect("~/F14/secciones/InformacionCompania.aspx");

                    }

                    if (User.IsInRole("4"))
                    {
                        step2.Visible = false;
                        step3.Visible = false;
                        step4.Visible = false;
                        lblDesc5.Text = "Paso 2";
                        lblstep5.Text = "2";
                        DeshabilitarDatosBancarios(1);

                    }

                    dt = wsBaseDatos.Existe("SELECT * FROM Table_compania WHERE ID_user = '" + id_user + "'");
                    DataBind_Contactos();

                    if (dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Tipo_persona"].ToString() == "2")
                        {

                            lblRFC.Text = "W9:";
                            
                            txtCURP.Enabled = false;
                            DeshabilitarDatosBancarios(1);
                        }
                        dtBanco = new DataTable();
                        dtBanco = wsBaseDatos.Existe("SELECT * FROM Table_infoBancaria WHERE ID_compania = '" + dt.Rows[0]["ID_compania"].ToString() + "'");
                        
                        if(dtBanco.Rows.Count > 0)
                        {
                            if (dtBanco.Rows[0]["Nombre_banco"].ToString() == "NTS")
                            {
                                chNTS.Checked = true;
                                llenarCampos(dt, new DataTable());
                                DeshabilitarDatosBancarios(1);

                            }else if (dtBanco.Rows[0]["Nombre_banco"].ToString() == "HTS")
                            {
                                chHTS.Checked = true;
                                llenarCampos(dt, new DataTable());
                                DeshabilitarDatosBancarios(1);
                            }
                            else
                            {
                                llenarCampos(dt, dtBanco);

                            }

                        }
                        else
                        {
                            llenarCampos(dt, new DataTable());
                        }

                    }
                }
                
            }
        }

        private void CambiarLinks()
        {
            step2.NavigateUrl = "~/F14/Secciones/AgentesAduanales.aspx?rfc="+ Request.QueryString["rfc"];
            step3.NavigateUrl = "~/F14/Secciones/CompaniaFilial.aspx?rfc=" + Request.QueryString["rfc"];
            step4.NavigateUrl= "~/F14/Secciones/TipoServicioProductos.aspx?rfc=" + Request.QueryString["rfc"];
            step5.NavigateUrl="~/F14/Secciones/InformacionCadenaSuministro.aspx?rfc="+ Request.QueryString["rfc"];
        }
        
        protected void LlenarFra(DataTable dt)
        {
            if(dt.Rows.Count > 0)
            {
                if(dt.Rows[0]["Estado_fra"].ToString() != "0") { 
                txtDirecFacturacion.Text = dt.Rows[0]["Direccion_fra"].ToString();
                txtCPFra.Text = dt.Rows[0]["CP_fra"].ToString();

                //Obtener pais
                string Pais = ddPaisFra.SelectedValue;
                ddPaisFra.Items.FindByValue(Pais).Selected = false;
                ddPaisFra.Items.FindByValue(dt.Rows[0]["Pais_fra"].ToString()).Selected = true;

                LlenarEstado(ddEstadoFra, Convert.ToInt32(dt.Rows[0]["Pais_fra"]));
                ddEstadoFra.Items.FindByValue(dt.Rows[0]["Estado_fra"].ToString()).Selected = true;

                LlenarCiudad(ddCiudadFra, Convert.ToInt32(dt.Rows[0]["Estado_fra"]));               

                ddCiudadFra.Items.FindByValue(dt.Rows[0]["Ciudad_fra"].ToString()).Selected = true;

                chFactura.Checked = true;
                pFra.Enabled = true;
                pFra.BackColor = System.Drawing.Color.White;
                }
            }
        }

        protected void llenarCampos(DataTable table , DataTable dtBanco)
        {

            //======================================Informacion de compañia=================================================
            if(table.Rows.Count > 0)
            {
                txtRfc.Enabled = false;
                txtRfc.Text = table.Rows[0]["ID_compania"].ToString();

                txtNombreCompania.Text = table.Rows[0]["Nombre_comp"].ToString();

                ddTipoDePersona.Items.FindByValue(table.Rows[0]["Tipo_persona"].ToString()).Selected = true;
                LlenarCFDI(Convert.ToInt32(table.Rows[0]["Tipo_persona"]));

                if (ddTipoDePersona.SelectedValue == "0")
                {
                    txtCURP.Enabled = false;
                }

                txtNombrCom.Text = table.Rows[0]["Nombre_comercial"].ToString();

                txtCURP.Text = table.Rows[0]["CURP"].ToString();

                txtAnosNegocio.Text = table.Rows[0]["tiempo_negocio"].ToString();

                txtDirecFiscal.Text = table.Rows[0]["Direccion"].ToString();

                txtCP.Text = table.Rows[0]["codigo_postal"].ToString();


                //Obtener pais
                string  Pais = ddPais.SelectedValue;
                ddPais.Items.FindByValue(Pais).Selected = false;
                ddPais.Items.FindByValue(table.Rows[0]["Pais"].ToString()).Selected = true;

                LlenarEstado(ddEstado, Convert.ToInt32(table.Rows[0]["Pais"]));
                ddEstado.Items.FindByValue(table.Rows[0]["Estado"].ToString()).Selected = true;

                LlenarCiudad(ddCiudad, Convert.ToInt32(table.Rows[0]["Estado"]));
                ddCiudad.Items.FindByValue(table.Rows[0]["Ciudad"].ToString()).Selected = true;

            }

            //========================================Campos de info_bancaria=================================================
            if (dtBanco.Rows.Count > 0)
            {
                if (dtBanco.Rows[0]["Nombre_banco"].ToString() != "")
                {
               
                ddUsoCFDI.Items.FindByValue(dtBanco.Rows[0]["Uso_CFDI"].ToString()).Selected = true;

                ddMoneda.Items.FindByValue(dtBanco.Rows[0]["Moneda"].ToString()).Selected = true;

                ddFormaPago.Items.FindByValue(dtBanco.Rows[0]["Forma_pago"].ToString()).Selected = true;

                ddMetodoPago.Items.FindByValue(dtBanco.Rows[0]["Metodo_pago"].ToString()).Selected = true;

                txtBanco.Text = dtBanco.Rows[0]["Nombre_banco"].ToString();

                txtBancoRFC.Text = dtBanco.Rows[0]["rfc_banco"].ToString();

                txtNoCuenta.Text = dtBanco.Rows[0]["no_cuenta"].ToString();

                txtClaveBancaria.Text = dtBanco.Rows[0]["clabe_bancaria"].ToString();

                }
            }

        }
        protected void btnNext_Click(object sender, EventArgs e){

            string resultado = RegistrarInfo();           //lblresultado.Text = resultado;

            if(resultado != "succes1")
            {
                ScriptManager.RegisterStartupScript(UpdatePanel8, typeof(string), "Simular", "MensajeError('"+resultado+"')", true);
            }
            else /*if(resultado=="succes1")*/{

                ScriptManager.RegisterStartupScript(UpdatePanel8, typeof(string), "Simular", "MensajeSucces()", true);                
            }          
        }

        protected void LlenarPaisCB(DropDownList dropDown){
            lstPais = new List<wsUbicacion.ListaPais>();
            lstPais = wsUbicacion.llenarCbPais();
                // ddPais.Items.Clear();

                dropDown.Items.Add(new ListItem("...", "0", true));

                for (int i = 0; i < lstPais.Count; i++)
                {
                    item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                    dropDown.Items.Add(item);
                }
        }

        protected void LlenarEstado(DropDownList dropDown, int id)
            {
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
            
            lstPais = new List<wsUbicacion.ListaPais>();

            lstPais = wsUbicacion.llenarCbCiudades(id);


            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDownList.Items.Add(item);
            }

            dropDownList.DataBind();
        }
        protected void LlenarCiudadFra(DropDownList dropDownList, int id)
        {
            lstPais = new List<wsUbicacion.ListaPais>();
            var estado = Convert.ToInt32(ddEstadoFra.SelectedItem.Value);

            lstPais = wsUbicacion.llenarCbCiudades(estado);


            for (int i = 0; i < lstPais.Count; i++)
            {
                item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                dropDownList.Items.Add(item);
            }

            dropDownList.DataBind();
        }
        protected void ddPais_SelectedIndexChanged(object sender, EventArgs e)
            {
                ddEstado.Items.Clear();
                ddCiudad.Items.Clear();
                var pais = Convert.ToInt32(ddPais.SelectedItem.Value);
                LlenarEstado(ddEstado, pais);
               string id = ddTipoDePersona.SelectedItem.Value;

            if (ddPais.SelectedItem.Value == "231")
            {
               ddTipoDePersona.Enabled = false;
                ddTipoDePersona.Items.FindByValue(id).Selected = false;
                ddTipoDePersona.Items.FindByValue("2").Selected = true;
                lblRFC.Text = "W9/Tax ID";
                lblCP.Text = "Zip code";
                pDatosBancarios.Enabled = false;
                pDatosBancarios.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);
                txtCURP.Enabled = false;
                Response.Cookies.Add(new HttpCookie("tipo", "extranjero"));

                


                RequiredFieldValidator7.Enabled = false;
                RequiredFieldValidator8.Enabled = false;
                RequiredFieldValidator9.Enabled = false;
                RequiredFieldValidator10.Enabled = false;   
            }
            else
            {
                pDatosBancarios.Enabled = true;
                pDatosBancarios.BackColor = System.Drawing.Color.White;

                ddTipoDePersona.Enabled = true;
                ddTipoDePersona.Items.FindByValue(id).Selected = false;
                ddTipoDePersona.Items.FindByValue("0").Selected = true;
                Response.Cookies.Add(new HttpCookie("tipo", "moral"));


                lblCP.Text = "CP";
                lblRFC.Text = "RFC";
                RequiredFieldValidator7.Enabled = true;
                RequiredFieldValidator8.Enabled = true;
                RequiredFieldValidator9.Enabled = true;
                RequiredFieldValidator10.Enabled = true;
            }
        }

        protected void ddEstado_SelectedIndexChanged(object sender, EventArgs e)
            {
                ddCiudad.Items.Clear();

                lstPais = new List<wsUbicacion.ListaPais>();
                var estado = Convert.ToInt32(ddEstado.SelectedItem.Value);

                lstPais = wsUbicacion.llenarCbCiudades(estado);


                for (int i = 0; i < lstPais.Count; i++)
                {
                    item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                    ddCiudad.Items.Add(item);
                }

                ddCiudad.DataBind();
            }

        protected void ddPaisFra_SelectedIndexChanged(object sender, EventArgs e)
            {
                ddEstadoFra.Items.Clear();
                ddCiudadFra.Items.Clear();
                var pais = Convert.ToInt32(ddPaisFra.SelectedItem.Value);
                LlenarEstado(ddEstadoFra, pais);

            }

        protected void chkDireccionIgual_CheckedChanged(object sender, EventArgs e)
            {
                if (chkDireccionIgual.Checked)
                {
                    pFra.Enabled = true;
                    pFra.BackColor = System.Drawing.Color.White;
                    RFValidator_DirFra.Enabled = true;
                    RFValidator_PaisFra.Enabled = true;
                    RFValidator_EstadoFra.Enabled = true;
                    RFValidator_EstadoFra.Enabled = true;
                    RFValidator_CPFra.Enabled = true;


            }
                else
                {
                    pFra.Enabled = false;
                    pFra.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);
                RFValidator_DirFra.Enabled = false;
                RFValidator_PaisFra.Enabled = false;
                RFValidator_EstadoFra.Enabled = false;
                RFValidator_EstadoFra.Enabled = false;
                RFValidator_CPFra.Enabled = false;
            }
            }

        protected void ddTipoDePersona_SelectedIndexChanged(object sender, EventArgs e)
            {
                int regimen = Convert.ToInt32(ddTipoDePersona.SelectedValue);
            string id = ddPais.SelectedItem.Value;
            ddEstado.Items.Clear();
            ddEstado.Items.Add(new ListItem("..."));
            ddCiudad.Items.Clear();
            ddCiudad.Items.Add(new ListItem("..."));
            string TipoRegistro = cbTipoRegistro.SelectedValue;

            if (regimen == 2)
                {
                   // Context.Response.Write("<script language=javascript>alert('Opción invalida');</script>");
                   
                lblRFC.Text = "W9/Tax ID";
                lblCP.Text = "Zip code";
                pDatosBancarios.Enabled = false;
                pDatosBancarios.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);
                txtCURP.Enabled = false;
                Response.Cookies.Add(new HttpCookie("tipo", "extranjero"));

                ddPais.Items.FindByValue(id).Selected = false;
                ddPais.Items.FindByValue("231").Selected = true;
                LlenarEstado(ddEstado, 231);

                RequiredFieldValidator7.Enabled = false;
                RequiredFieldValidator8.Enabled = false;
                RequiredFieldValidator9.Enabled = false;
                RequiredFieldValidator10.Enabled = false;

            }
            else
                {
                lblCP.Text = "CP";
                lblRFC.Text = "RFC";

                if (TipoRegistro != "proveedor")
                {
                    pDatosBancarios.Enabled = true;
                    pDatosBancarios.BackColor = System.Drawing.Color.White;
                    RequiredFieldValidator7.Enabled = true;
                    RequiredFieldValidator8.Enabled = true;
                    RequiredFieldValidator9.Enabled = true;
                    RequiredFieldValidator10.Enabled = true; 
                }
                ddPais.Items.FindByValue(id).Selected = false;
                ddPais.Items.FindByValue("142").Selected = true;
                LlenarEstado(ddEstado, 142);
                if (regimen == 0)
                    {
                    txtCURP.Enabled = false;
                        Response.Cookies.Add(new HttpCookie("tipo", "moral"));

                }
                else
                    {
                        txtCURP.Enabled = true;
                    Response.Cookies.Add(new HttpCookie("tipo", "fisica"));

                }
                LlenarCFDI(regimen);
                }
            }

        protected void LlenarCFDI(int regimen)
            {
                ddUsoCFDI.Items.Clear();

                List<wsUbicacion.CFDI> cfdi = new List<wsUbicacion.CFDI>();
                cfdi = wsUbicacion.llenarCFDI(regimen);

                for (int i = 0; i < cfdi.Count; i++)
                {
                    item = new ListItem(cfdi[i].clave + "-" + cfdi[i].descripcion, cfdi[i].clave);
                    ddUsoCFDI.Items.Add(item);
                }
            //ddUsoCFDI.Items.FindByValue("P01").Selected = true;
            }

        protected void llenarMetodoPago()
            {
                List<wsUbicacion.CFDI> cFDIs = new List<wsUbicacion.CFDI>();
                cFDIs = wsUbicacion.llenarFormaPago();
                for (int i = 0; i < cFDIs.Count; i++)
                {
                    item = new ListItem(cFDIs[i].clave + "-" + cFDIs[i].descripcion, cFDIs[i].clave);
                    ddFormaPago.Items.Add(item);
                }


            }
        protected void btnPrueba_Click(object sender, EventArgs e)
        {  
            string ID_compania, nombre_comp, nombre_comercial, rfc, CURP, direccion, cp, pais, estado, ciudad, fecha_registro, id_user, resultado="", resDir="";
            int tipo_persona, tiempo_negocio;
            ID_compania = txtRfc.Text.ToUpper();
            nombre_comp = txtNombreCompania.Text;
            nombre_comercial = txtNombrCom.Text;
            rfc = txtRfc.Text.ToUpper();
            CURP = txtCURP.Text.ToUpper();
            direccion = txtDirecFiscal.Text;
            cp = txtCP.Text;
            tipo_persona = Convert.ToInt32(ddTipoDePersona.SelectedValue);
            tiempo_negocio = Convert.ToInt32(txtAnosNegocio.Text);
            fecha_registro = DateTime.Now.ToString("yyyy-MM-dd");
            pais = ddPais.SelectedValue;
            ciudad = ddCiudad.SelectedValue;
            estado = ddEstado.SelectedValue;
            id_user = Request.Cookies.Get("id").Value;
            
            resultado = clsF14.Insertar_info_compania(ID_compania, nombre_comp, nombre_comercial, tipo_persona, rfc, CURP, tiempo_negocio, direccion, cp, pais, estado, ciudad, fecha_registro, id_user);
            if (chkDireccionIgual.Checked)
            {
               resDir = clsF14.Insertar_dir_fra(ID_compania, txtDirecFacturacion.Text, txtCPFra.Text, ddPaisFra.SelectedValue, ddEstadoFra.SelectedValue, ddCiudadFra.SelectedValue);
            }
            else
            {
                resDir = clsF14.Insertar_dir_fra(ID_compania, direccion, cp, pais, estado, ciudad);
            }
            lblresultado.Text = resultado + "  " + resDir;

            HttpCookie cookie = new HttpCookie("id_comp")
            {
                Value = ID_compania,
                Expires = DateTime.Now.AddMinutes(60d)
            };
            Response.Cookies.Add(cookie);
        }

        protected void BloquearOpcion(ref DropDownList dd, string val)
            {
                ListItem i = dd.Items.FindByValue(val);
                i.Attributes.Add("style", "color:gray;");
                i.Attributes.Add("disabled", "true");
            }

        protected void btnBanco_Click(object sender, EventArgs e){
            string ID_compania, Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda;
            ID_compania = txtRfc.Text;
            Nombre_banco = txtBanco.Text;
            rfc_banco = txtBancoRFC.Text;
            no_cuenta = txtNoCuenta.Text;
            clave_bancaria = txtClaveBancaria.Text;
            Uso_CFDI = ddUsoCFDI.SelectedValue;
            Metodo_pago = ddMetodoPago.SelectedValue;
            Forma_pago = ddFormaPago.SelectedValue;
            Moneda = ddMoneda.SelectedValue;
            
           lblresultado.Text = clsF14.Insertar_info_bancaria(ID_compania, Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda);
        
        }

        protected void ddEstadoFra_SelectedIndexChanged(object sender, EventArgs e)
            {
                ddCiudadFra.Items.Clear();

                lstPais = new List<wsUbicacion.ListaPais>();
                var estado = Convert.ToInt32(ddEstadoFra.SelectedItem.Value);

                lstPais = wsUbicacion.llenarCbCiudades(estado);

                for (int i = 0; i < lstPais.Count; i++)
                {
                    item = new ListItem(lstPais[i].fullname, lstPais[i].id);
                    ddCiudadFra.Items.Add(item);
                }
                ddCiudad.DataBind();
            }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("../../usuario/user_index.aspx");

        }

        protected void TipoRegistro(string rol)
        {
            switch (rol)
            {
                case "cliente":
                    step2.Visible = true;
                    step3.Visible = true;
                    step4.Visible = true;
                    lblDesc5.Text = "Paso 5";
                    lblstep5.Text = "5";
                    Response.Cookies.Add(new HttpCookie("ctipo", "cliente"));
                    DeshabilitarDatosBancarios(2);

                    break;
                case "proveedor":
                    step2.Visible = false;
                    step3.Visible = false;
                    step4.Visible = false;
                    lblDesc5.Text = "Paso 2";
                    lblstep5.Text = "2";

                    Response.Cookies.Add(new HttpCookie("ctipo", "proveedor"));

                    DeshabilitarDatosBancarios(1);

                    break;
            }
        }

        protected void cbTipoRegistro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string index = cbTipoRegistro.SelectedValue;
            TipoRegistro(index); 
        }

        protected void btnAdminH_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../admin/index.aspx");
        }

        protected void btnAdinSave_Click(object sender, EventArgs e)
        {
            //RegistrarNuevo usuario
            if (Request.QueryString["accion"] != null)
            {
                try
                {
                   string res = RegistrarInfo();
                    if(res == "error1")
                    {
                        //ExisteRFC()
                        ScriptManager.RegisterStartupScript(UpdatePanel7, typeof(string), "Simular", "ExisteRFC()", true);

                    }
                    else
                    {
                        string registro;
                        registro = RegistrarInfo();
                        
                        if (registro == "error2")
                        {
                            ScriptManager.RegisterStartupScript(UpdatePanel7, typeof(string), "Simular", "MensajeError()", true);
                        }
                        else if (registro == "succes1")
                        {

                            ScriptManager.RegisterStartupScript(UpdatePanel7, typeof(string), "Simular", "MensajeSucces()", true);


                        }
                       
                    }
                }
                catch (Exception ex)
                {
                    lblRegf14.Text = ex.Message;
                }
            }else if (Request.QueryString["rfc"] != null)
            {
               //lblSinContacto.Text= RegistrarInfo();
                string registro;
                registro = RegistrarInfo();
                
                if(registro == "succes1")
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel8, typeof(string), "Simular", "MensajeSucces()", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(UpdatePanel8, typeof(string), "Simular", "MensajeError("+registro+")", true);
                }
            }
        }

        private void DeshabilitarLinks()
        {
            step2.Enabled=false;
            step3.Enabled = false;
            step4.Enabled = false;
            step5.Enabled = false;
        }

        protected void btnAdminBack_Click(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["accion"] != null)
                {
                    Response.Redirect("../../admin/index.aspx");
                }
                else
                {
                    if (Request.QueryString["rfc"] != null)
                    {
                        Response.Redirect("../../admin/carpetilla/carpetilla.aspx?id=" + Request.QueryString["rfc"].ToString() + "&type=" + Request.Cookies["tipo"].Value, false);
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("../../admin/index.aspx");
            }

        }

        protected string RegistrarInfo()
        {
            //Insrtar informacion
            string Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda,
                ID_compania, nombre_comp, nombre_comercial, rfc, CURP, direccion, cp, pais, estado, ciudad, fecha_registro, id_user;

            string resultado = "", compania="", resDir = "", banco="", error="", documento="", temporal="";

            int tipo_persona, tiempo_negocio;

            ID_compania = txtRfc.Text.ToUpper();
            nombre_comp = txtNombreCompania.Text;
            nombre_comercial = txtNombrCom.Text;
            rfc = txtRfc.Text.ToUpper();
            CURP = txtCURP.Text.ToUpper();
            direccion = txtDirecFiscal.Text;
            cp = txtCP.Text;
            tipo_persona = Convert.ToInt32(ddTipoDePersona.SelectedValue);
            tiempo_negocio = Convert.ToInt32(txtAnosNegocio.Text);
            fecha_registro = DateTime.Now.Year + "-" + DateTime.Now.Month + "-" + DateTime.Now.Day;
            pais = ddPais.SelectedValue;
            ciudad = ddCiudad.SelectedValue;
            estado = ddEstado.SelectedValue;
            id_user = Request.Cookies.Get("id").Value;
            Nombre_banco = txtBanco.Text;
            rfc_banco = txtBancoRFC.Text;
            no_cuenta = txtNoCuenta.Text;
            clave_bancaria = txtClaveBancaria.Text;
            Uso_CFDI = ddUsoCFDI.SelectedValue;
            Metodo_pago = ddMetodoPago.SelectedValue;
            Forma_pago = ddFormaPago.SelectedValue;
            Moneda = ddMoneda.SelectedValue;

           
                try
            {

                if (Request.QueryString["accion"] != null)
                {
                    DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE RFC='" + txtRfc.Text + "'");

                    if (dt.Rows.Count >0)
                    {//Ya existe un regsitro con el RFC especificado
                        return "error1"; //Existe
                    }
                    else
                    {
                        compania = clsF14.Insertar_info_compania(ID_compania, nombre_comp, nombre_comercial, tipo_persona, rfc, CURP, tiempo_negocio, direccion, cp, pais, estado, ciudad, fecha_registro, "0");
                            temporal = clsHerramientaBD.ExecuteSql("INSERT INTO Table_Temporal(RFC,Tipo, registro) values ('"+ ID_compania + "','"+cbTipoRegistro.SelectedValue+"','"+DateTime.Now.ToString("dd-MM-yyyy")+"')");
                            if (chkDireccionIgual.Checked)
                        {
                            resDir = clsF14.Insertar_dir_fra(ID_compania, txtDirecFacturacion.Text, txtCPFra.Text, ddPaisFra.SelectedValue, ddEstadoFra.SelectedValue, ddCiudadFra.SelectedValue);
                        }
                        else
                        {
                            resDir = clsF14.Insertar_dir_fra(ID_compania, direccion, cp, pais, estado, ciudad);
                        }

                        if(cbTipoRegistro.SelectedValue == "cliente")
                            {
                                Response.Redirect("~/F14/Secciones/AgentesAduanales.aspx?accion=new&rfc=" + txtRfc.Text);

                            }
                            else
                            {
                                Response.Redirect("~/F14/Secciones/InformacionCadenaSuministro.aspx?accion=new&rfc=" + txtRfc.Text);

                            }
                        }
                }
                else
                {
                    compania = clsF14.Insertar_info_compania(ID_compania, nombre_comp, nombre_comercial, tipo_persona, rfc, CURP, tiempo_negocio, direccion, cp, pais, estado, ciudad, fecha_registro, id_user);
                    if (chkDireccionIgual.Checked)
                    {
                        resDir = clsF14.Insertar_dir_fra(ID_compania, txtDirecFacturacion.Text, txtCPFra.Text, ddPaisFra.SelectedValue, ddEstadoFra.SelectedValue, ddCiudadFra.SelectedValue);
                    }
                    else
                    {
                        resDir = clsF14.Insertar_dir_fra(ID_compania, direccion, cp, pais, estado, ciudad);
                    }
                }


                    
            }
            catch (Exception ex)
            {
                error += ex.Message;
            }
            finally
            {
                try
                {
                    if (chNTS.Checked)
                    {
                        banco += clsF14.Insertar_info_bancaria(ID_compania, "NTS", "NTS", "NTS", "NTS", Uso_CFDI, Metodo_pago, Forma_pago, Moneda);

                    }else if (chHTS.Checked)
                    {
                        banco += clsF14.Insertar_info_bancaria(ID_compania, "HTS", "HTS", "HTS", "HTS", Uso_CFDI, Metodo_pago, Forma_pago, Moneda);
                    }
                    else if (boolbanco) { 
                   banco += clsF14.Insertar_info_bancaria(ID_compania, Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda);
                    }
                    documento += clsF14.Insertar_Documento(ID_compania, "F14", "null", "20%");
                    
                }
                catch (Exception ex)
                {
                    error += ex.Message;
                }
            }
                if (error != "")
                {
                    resultado = error;
                }
                else
                {
                string listaContactos = ContactosCheckList(ID_compania);
                if(listaContactos == "")
                {
                    resultado = "succes1";
                }
                else
                {
                    resultado = listaContactos;
                }
                
            }
            

            //Creo la cookie
            if (Request.Cookies.Get("id_comp") == null)
            {
                HttpCookie cookie = new HttpCookie("id_comp")
                {
                    Value = ID_compania,
                    Expires = DateTime.Now.AddMinutes(60d)
                };
                Response.Cookies.Add(cookie);
            }
            else
            {
                Request.Cookies.Get("id_comp").Value = ID_compania;
            }

            return resultado;
        }

        protected void DataBind_Contactos()
        {
            string strSQL = "";
            if ( Request.Cookies.Get("id_comp") != null) { 
            
                strSQL = "SELECT * FROM Table_Contacto WHERE ID_compania = '" + Request.Cookies.Get("id_comp").Value + "' AND (Tipo = 'Comp' OR Tipo = 'Fra')";
                gvContactos.DataSource = clsHerramientaBD.Existe(strSQL);

            }
            else if (Request.QueryString["rfc"] != null)
            {
                 strSQL = "SELECT * FROM Table_Contacto WHERE ID_compania = '" + Request.QueryString["rfc"] + "' AND (Tipo = 'Comp' OR Tipo = 'Fra')";
            }else if (txtRfc.Text != "")
            {
                 strSQL = "SELECT * FROM Table_Contacto WHERE ID_compania ='"+txtRfc.Text+"' AND (Tipo = 'Comp' OR Tipo = 'Fra')";
                gvContactos.DataSource = clsHerramientaBD.Existe(strSQL);

            }
            else
            {
                 strSQL = "SELECT * FROM Table_Contacto WHERE ID_compania ='x' AND (Tipo = 'Comp' OR Tipo = 'Fra')";
            gvContactos.DataSource = clsHerramientaBD.Existe(strSQL);

            }

            gvContactos.DataBind();
        }

        protected void btnRegistrarC_Click(object sender, EventArgs e)
        {
            lblRes.Text = "";
            string Registro = "";
            string ID_compania = "", Nombre = "", Puesto = "", Telefono = "", Extension = "", Celular = "", Tipo = "", Correo = "";
            ID_compania = txtRfc.Text;
            Nombre = txtNombreC.Text;
            Puesto = ddTipoContacto.SelectedValue;
            Telefono = txtTelC.Text;
            Extension = txtExt.Text;
            Celular = txtCelC.Text;
            Correo = txtCorreoC.Text;

            if (chFactura.Checked)
            {
                Tipo = "Fra";
            }
            else
            {
                Tipo = "Comp";
            }
            if (Nombre !="" || Puesto!="" || Telefono!="" || Extension !="" || Celular!="" || Correo != "")
            {
                if((Telefono != "" && Celular=="") || (Telefono == "" && Celular != "" ) || (Telefono!="" && Celular!=""))
                {
                    Registro = clsF14.Insertar_contacto(ID_compania, Nombre, Puesto, Telefono, Extension, Celular, Tipo, Correo, "");

                    lblRes.Text = Registro;
                    txtNombreC.Text = "";
                    txtPuestoC.Text = "";
                    txtTelC.Text = "";
                    txtExt.Text = "";
                    txtCelC.Text = "";
                    txtCorreoC.Text = "";
                    chFactura.Checked = false;

                    DataBind_Contactos();
                }
                else
                {
                    lblRes.Text = "*Debe contar un numero de telefono o de celular";

                }

            }
            else
            {
                lblRes.Text = "*LLene los campos necesarios";
            }

        }

        protected void btnEditarC_Click(object sender, EventArgs e)
        {
            lblRes.Text = "";
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            
            string Id = gvContactos.Rows[rowIndex].Cells[0].Text;
            string nombre = gvContactos.Rows[rowIndex].Cells[1].Text;
            string puesto = gvContactos.Rows[rowIndex].Cells[2].Text;
            string correo = gvContactos.Rows[rowIndex].Cells[3].Text;
            string tel = gvContactos.Rows[rowIndex].Cells[4].Text;
            string ext = gvContactos.Rows[rowIndex].Cells[10].Text;
            string cel = gvContactos.Rows[rowIndex].Cells[6].Text;
            string fra = gvContactos.Rows[rowIndex].Cells[8].Text;
            string idComp = gvContactos.Rows[rowIndex].Cells[9].Text;
                        
            if(ext == "&amp;nbsp;" || ext== "&nbsp;")
            {
                ext = "";
            }
            if(cel == "&amp;nbsp;" || cel== "&nbsp;")
            {
                cel = "";
            }
            if (tel == "&amp;nbsp;" || tel == "&nbsp;")
            {
                tel = "";
            }

            hfIdC.Value = Id;
            hfIDComp.Value = idComp;
            txtNombreC.Text = nombre;
            txtPuestoC.Text = puesto;
            txtCorreoC.Text = correo;
            txtTelC.Text = tel;
            txtCelC.Text = cel;
            txtExt.Text = ext;
            if(fra == "Fra")
            {
                chFactura.Checked = true;
            }
            else
            {
                chFactura.Checked = false;

            }

            Panel_Contacto.Visible = true;
            btnRegistrarC.Visible = false;
        }

        protected string ContactosCheckList(string ID_compania)
        {
            string missingcontacts = "";

            // Declaración del diccionario
            Dictionary<string, bool> contactos = new Dictionary<string, bool>()
        {
            { "Contabilidad", false },
            { "Facturacion", false },
            { "Gerencia", false },
            { "Operaciones", false },
            { "Referencia", false }
        };
            DataTable tContactos = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE ID_compania='"+ID_compania+"'");
            if (tContactos.Rows.Count > 0)
            {
                foreach (DataRow row in tContactos.Rows)
                {
                    switch (row["Puesto"].ToString())
                    {
                        case "Contabilidad":
                            contactos["Contabilidad"] = true;
                            break;
                        case "Facturacion":
                            contactos["Facturacion"] = true;
                            break; 
                        case "Gerencia":
                            contactos["Gerencia"] = true;
                            break;
                        case "Operaciones":
                            contactos["Operaciones"] = true;
                            break;
                        case "Referencia":
                            contactos["Referencia"] = true;
                            break;                           
                    }
                }
                //Recorro diccionario e busca de valores falsos
                foreach (KeyValuePair<string, bool> contacto in contactos)
                {
                    if (contacto.Value == false)
                    {
                        if(missingcontacts == "")
                        {
                            missingcontacts = "Debe registrar al menos un contacto de:<br>";
                        }
                        missingcontacts += contacto.Key+"<br>";
                    }
                }

            }
            else
            {
                missingcontacts = "Debe registrar al menos un contacto de facturacion, contabilidad, operaciones, gerencia y referencia";
            }

            return missingcontacts;
        }

        protected void btnDelC_Click(object sender, EventArgs e)
        {
            lblRes.Text = "";
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            string id = gvContactos.Rows[rowIndex].Cells[0].Text;

            string res = clsHerramientaBD.ExecuteSql("DELETE FROM [Table_Contacto] WHERE ID = '"+id+"'");
            if (res == "")
            {
                lblRes.Text = "Contacto eliminado";
            }
            else
            {
                lblRes.Text = res;
            }

            DataBind_Contactos();

        }

        protected void btnAproveC_Click(object sender, EventArgs e)
        {
            lblRes.Text = "";
            string tipo = "";
            if (chFactura.Checked)
            {
                tipo = "Fra";
            }
            else
            {
                tipo = "Comp";
            }

            lblRes.Text = clsF14.Insertar_contacto(hfIDComp.Value, txtNombreC.Text, ddTipoContacto.SelectedValue, txtTelC.Text, txtExt.Text, txtCelC.Text, tipo, txtCorreoC.Text, hfIdC.Value);


            hfIdC.Value = "";
            txtNombreC.Text = "";
            txtPuestoC.Text = "";
            txtCorreoC.Text = "";
            txtTelC.Text = "";
            txtExt.Text = "";
            txtCelC.Text = "";
            chFactura.Checked = false;


            DataBind_Contactos();
            Panel_Contacto.Visible = false;
            btnRegistrarC.Visible = true;
        }

        protected void btnCancelC_Click(object sender, EventArgs e)
        {
            lblRes.Text = "";
            hfIdC.Value = "";
            txtNombreC.Text = "";
            txtPuestoC.Text = "";
            txtCorreoC.Text = "";
            txtTelC.Text = "";
            txtCelC.Text = "";

            txtExt.Text = "";
            chFactura.Checked = false;

            Panel_Contacto.Visible = false;
            btnRegistrarC.Visible = true;
        }

        protected void chNTS_CheckedChanged(object sender, EventArgs e)
        {
            if (chNTS.Checked)
            {
                DeshabilitarDatosBancarios(1);
                chHTS.Checked = false;  
            }
            else
            {
                DeshabilitarDatosBancarios(2);
            }
        }

        protected void btnAdminNext_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null)
            {
                if (Request.Cookies.Get("ctipo") != null)
                {
                    if (Request.Cookies.Get("ctipo").Value == "proveedor")
                    {
                        Response.Redirect("~/f14/secciones/InformacionCadenaSuministro.aspx?rfc=" + Request.QueryString["rfc"]);

                    }
                    else
                    {
                        Response.Redirect("~/f14/secciones/AgentesAduanales.aspx?rfc=" + Request.QueryString["rfc"]);

                    }
                }
                Response.Redirect("~/f14/secciones/AgentesAduanales.aspx?rfc=" + Request.QueryString["rfc"]);
            }
        }

        protected void chHTS_CheckedChanged(object sender, EventArgs e)
        {
            if (chHTS.Checked)
            {
                DeshabilitarDatosBancarios(1);
                chNTS.Checked = false;
            }
            else
            {
                DeshabilitarDatosBancarios(2);
            }
        }

       
        private void DeshabilitarDatosBancarios(int tipo)
        {
            if (tipo == 1)
            {
                //Deshabilito las opciones de banco, deshabilito los validadores y limpio campos.
                //Limpiar campos
                txtBanco.Text = "";
                txtBancoRFC.Text = "";
                txtNoCuenta.Text = "";
                txtClaveBancaria.Text = "";

                //deshabilitar campos               
                pDatosBancarios.Enabled = false;
                pDatosBancarios.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);

                //Deshabilito los validadores
                RequiredFieldValidator7.Enabled = false;
                RequiredFieldValidator8.Enabled = false;
                RequiredFieldValidator9.Enabled = false;
                RequiredFieldValidator10.Enabled = false;
            }
            else
            {
                //habilito opciones
                pDatosBancarios.Enabled = true;
                pDatosBancarios.BackColor = System.Drawing.Color.White;
                //Habilito validadores
                RequiredFieldValidator7.Enabled = true;
                RequiredFieldValidator8.Enabled = true;
                RequiredFieldValidator9.Enabled = true;
                RequiredFieldValidator10.Enabled = true;
            }
        }

    }
}
