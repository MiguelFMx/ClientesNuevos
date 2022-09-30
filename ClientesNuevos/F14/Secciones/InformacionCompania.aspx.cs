using System;
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
using System.Web.Services;


namespace ClientesNuevos.F14.Seccioness
{

    public partial class ImformacionCompania : System.Web.UI.Page
    {
        wsUbicacion wsUbicacion = new wsUbicacion();
        wsBaseDatos wsBaseDatos = new wsBaseDatos();

        List<wsUbicacion.ListaPais> lstPais;
        ListItem item;
        DataTable dt, dtBanco;
        
        string id_user = HttpContext.Current.Request.Cookies.Get("id").Value;

        protected void Page_Load(object sender, EventArgs e)
        {            
            BloquearOpcion(ref ddTipoDePersona, "2");

            

            if (!IsPostBack)
            {

                LlenarPaisCB(ddPais);
                LlenarPaisCB(ddPaisFra);
                llenarMetodoPago();

                dt = new DataTable();

                if (Request.QueryString["admin"] != null && Request.QueryString["id"] != null)
                {
                    if (Request.Cookies.Get("id_comp").Value != null)
                    {
                        dt = wsBaseDatos.Existe("SELECT * FROM Table_compania WHERE ID_compania = '" + Request.Cookies.Get("id_comp").Value + "'");

                    }
                    pAdminControl.Visible = true;
                    pUserControl.Visible = false;

                }
                else
                {
                    dt = wsBaseDatos.Existe("SELECT * FROM Table_compania WHERE ID_user = '" + id_user + "'");
                }


                if(Request.Cookies.Get("lang") != null)
                {
                    if (Request.Cookies.Get("lang").Value == "en")
                    {
                        Traducir();
                    }
                }

                    if (dt.Rows.Count > 0)
                {                    
                    dtBanco = new DataTable();
                    dtBanco = wsBaseDatos.Existe("SELECT * FROM Table_infoBancaria WHERE ID_compania = '" + dt.Rows[0]["ID_compania"].ToString() + "'");
                    llenarCampos(dt);
                }

                
            }
        }


        protected void llenarCampos(DataTable table)
        {

            //======================================Informacion de compañia=================================================
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

            ddPais.Items.FindByValue(table.Rows[0]["Pais"].ToString()).Selected = true;

            LlenarEstado(ddEstado, Convert.ToInt32(table.Rows[0]["Pais"]));
            ddEstado.Items.FindByValue(table.Rows[0]["Estado"].ToString()).Selected = true;

            LlenarCiudad(ddCiudad, Convert.ToInt32(table.Rows[0]["Estado"]));
            ddCiudad.Items.FindByValue(table.Rows[0]["Ciudad"].ToString()).Selected = true;

            //========================================Campos de info_bancaria=================================================
            ddUsoCFDI.Items.FindByValue(dtBanco.Rows[0]["Uso_CFDI"].ToString()).Selected = true;

            ddMoneda.Items.FindByValue(dtBanco.Rows[0]["Moneda"].ToString()).Selected = true;

            ddFormaPago.Items.FindByValue(dtBanco.Rows[0]["Forma_pago"].ToString()).Selected = true;

            ddMetodoPago.Items.FindByValue(dtBanco.Rows[0]["Metodo_pago"].ToString()).Selected = true;

            txtBanco.Text = dtBanco.Rows[0]["Nombre_banco"].ToString();

            txtBancoRFC.Text = dtBanco.Rows[0]["rfc_banco"].ToString();

            txtNoCuenta.Text = dtBanco.Rows[0]["no_cuenta"].ToString();

            txtClaveBancaria.Text = dtBanco.Rows[0]["clabe_bancaria"].ToString();

            
        }
        protected void btnNext_Click(object sender, EventArgs e){

            string resultado = RegistrarInfo();           //lblresultado.Text = resultado;
            

            if (Request.Cookies.Get("ctipo").Value == "proveedor")
            {
                Response.Redirect("InformacionCadenaSuministro.aspx?res=" + resultado);

            }
            else
            {
                Response.Redirect("AgentesAduanales.aspx?res=" + resultado);

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
            var estado = Convert.ToInt32(ddEstado.SelectedItem.Value);

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

            if(ddPais.SelectedItem.Value == "231")
            {
               ddTipoDePersona.Enabled = false;
                
            }
            else
            {
                ddTipoDePersona.Enabled = true;

            }
        }

        protected void ddCiudad_SelectedIndexChanged(object sender, EventArgs e)
            {

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

                }
                else
                {
                    pFra.Enabled = false;
                    pFra.BackColor = System.Drawing.Color.FromArgb(233, 236, 239);
                }
            }

        protected void ddTipoDePersona_SelectedIndexChanged(object sender, EventArgs e)
            {
                int regimen = Convert.ToInt32(ddTipoDePersona.SelectedValue);

                if (regimen == 2)
                {
                    Context.Response.Write("<script language=javascript>alert('Opción invalida');</script>");
                }
                else
                {
                    if (regimen == 0)
                    {
                        txtCURP.Enabled = false;
                    }
                    else
                    {
                        txtCURP.Enabled = true;

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
            ID_compania = txtRfc.Text;
            nombre_comp = txtNombreCompania.Text;
            nombre_comercial = txtNombrCom.Text;
            rfc = txtRfc.Text;
            CURP = txtCURP.Text;
            direccion = txtDirecFiscal.Text;
            cp = txtCP.Text;
            tipo_persona = Convert.ToInt32(ddTipoDePersona.SelectedValue);
            tiempo_negocio = Convert.ToInt32(txtAnosNegocio.Text);
            fecha_registro = DateTime.Now.Year + "-" + DateTime.Now.Month + "-" + DateTime.Now.Day;
            pais = ddPais.SelectedValue;
            ciudad = ddCiudad.SelectedValue;
            estado = ddEstado.SelectedValue;
            id_user = Request.Cookies.Get("id").Value;
            
           // resultado = clsF14.Insertar_info_compania(ID_compania, nombre_comp, nombre_comercial, tipo_persona, rfc, CURP, tiempo_negocio, direccion, cp, pais, estado, ciudad, fecha_registro, id_user);
            if (chkDireccionIgual.Checked)
            {
              // resDir = clsF14.Insertar_dir_fra(ID_compania, txtDirecFacturacion.Text, txtCPFra.Text, ddPaisFra.SelectedValue, ddEstadoFra.SelectedValue, ddCiudadFra.SelectedValue);
            }
            else
            {
              //  resDir = clsF14.Insertar_dir_fra(ID_compania, direccion, cp, pais, estado, ciudad);
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
            
         //  lblresultado.Text = clsF14.Insertar_info_bancaria(ID_compania, Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda);
        
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

        protected void cbTipoRegistro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string index = cbTipoRegistro.SelectedValue;
            if(index == "cliente")
            {
                step2.Visible = true;
                step3.Visible = true;
                step4.Visible = true;
                lblDesc5.Text = "Paso 5";
                lblstep5.Text = "5";
                Response.Cookies.Add(new HttpCookie("ctipo", "cliente"));

            }
            else
            {
                step2.Visible = false;
                step3.Visible = false;
                step4.Visible = false;
                lblDesc5.Text = "Paso 2";
                lblstep5.Text = "2";

                Response.Cookies.Add(new HttpCookie("ctipo", "proveedor"));

            }
        }

        protected void btnAdminH_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../admin/index.aspx");
        }

        protected void btnAdinSave_Click(object sender, EventArgs e)
        {
            Traducir();
        }

        protected void btnAdminBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("../../admin/carpetilla/carpetilla.aspx?id="+ Request.QueryString["id"].ToString()+"&type="+Request.Cookies["tipo"].Value);

        }

        protected string RegistrarInfo()
        {
            //Insrtar informacion
            string Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda,
                ID_compania, nombre_comp, nombre_comercial, rfc, CURP, direccion, cp, pais, estado, ciudad, fecha_registro, id_user;

            string resultado = "", compania="", resDir = "", banco="", error="", documento="";

            int tipo_persona, tiempo_negocio;

            ID_compania = txtRfc.Text;
            nombre_comp = txtNombreCompania.Text;
            nombre_comercial = txtNombrCom.Text;
            rfc = txtRfc.Text;
            CURP = txtCURP.Text;
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
                compania = clsF14.Insertar_info_compania(ID_compania, nombre_comp, nombre_comercial, tipo_persona, rfc, CURP, tiempo_negocio, direccion, cp, pais, estado, ciudad, fecha_registro, id_user);
                if (chkDireccionIgual.Checked)
                {
                  resDir = clsF14.Insertar_dir_fra(ID_compania, txtDirecFacturacion.Text, txtCPFra.Text, ddPaisFra.SelectedValue, ddEstadoFra.SelectedValue, ddCiudadFra.SelectedValue);
                }
                else
                {
                   resDir = clsF14.Insertar_dir_fra(ID_compania, direccion, cp, pais, estado, ciudad);
                }
                
                HttpCookie cookie = new HttpCookie("id_comp")
                {
                    Value = ID_compania,
                    Expires = DateTime.Now.AddMinutes(60d)
                };
                Response.Cookies.Add(cookie);
            }
            catch (Exception ex)
            {
                error += ex.Message;
            }
            finally
            {
                try
                {
                   banco += clsF14.Insertar_info_bancaria(ID_compania, Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda);

                    documento += clsF14.Insertar_Documento(ID_compania, "F14", "null", "20%");
                }
                catch (Exception ex)
                {
                    error += ex.Message;
                }
            }

            if(error != "")
            {
                resultado = error;
            }
            else
            {
                resultado = "Informacion de empresa registrada con exito";
            }

            return resultado;
        }

        protected void Traducir()
        {
            //cbBox
            lblRegistro.Text = "Business partner type:";
            cbClient.Text = "Customer";
            cbProv.Text = "Provider";

            //Wizard
            lblDesc1.Text = "Step 1";
            lblDesc2.Text = "Step 2";
            lblDesc3.Text = "Step 3";
            lblDesc4.Text = "Step 4";
            lblDesc5.Text = "Step 5";
            lblsub1.Text = "Company information";
            lblsub2.Text = "Customs broker";
            lblsub3.Text = "Foreign manufacturing company information";
            lblsub4.Text = "Requested service type";
            lblsub5.Text = "Supply chain security program information";

            //Infromacion de la compañia
            lblTitulo_infoCom.Text = "Company information";
            lblNombreComercial.Text = "Doing business as:";
            lblNombreCompania.Text = "Name of the company:";
            lblTipoPersona.Text = "Person type (SAT):";
            lblRFC.Text = "RFC or TaxID number:";
            lblAnosNegocio.Text = "Years in business:";
            lblCURP.Text = "CURP (Mexico):";
            lblDirecFiscal.Text = "Fiscal address:";
            lblCP.Text = "Postal code:";
            lblCiudad.Text = "City:";
            lblEstado.Text = "State";
            lblPais.Text = "Country";

            //informacion de fra
            lblTitulo_DatosFra.Text = "Billing information(bill to party):";
            lblDireccionIgual.Text = "Billing address and fiscal address are different";
            lblDirecFacturacion.Text = "Billing address:";
            lblPaisFact.Text = "Country";
            lblEstadoFra.Text = "State";
            lblCiudadFact.Text = "City:";

            //Datos bancarios
            lblTitulo_DatosBancarios.Text = "Bank details";
            lblBanco.Text = "Bank name:";
            lblMoneda.Text = "Currency:";
            lblNoCuenta.Text = "Account number";
            lblClaveBancaria.Text = "Bank code:";


            //Contacto
            lblTitulo_DatosContacto.Text = "Contac details";
            lblNombreCont.Text = "Name:";
            lblpuestoCont.Text = "Tittle:";
            lblCorreoCont.Text = "E-mail:";
            lblFactura.Text = "Send invoice";
            lblTelCont.Text = "Phone:";
            lblCelCont.Text = "Celphone:";
            lblExtension.Text = "Extension:";
            pInfo_en.Visible = true;
            pInfo_es.Visible = false;

            lbl_tNombre.Text = "Name";
            lbl_tPuesto.Text = "Titlte";
            lbl_tCorreo.Text = "E-mail";
            lbl_tTel.Text = "Phone";
            lbl_tCel.Text = "Cephone";
            lbl_tFra.Text = "Invoice";

            btnContact.Text = "Add contact";
            lbl_tCaption.Text = "Registered contacts";

            lbl_btnNext.Text = "Next";
        }
    }
}
