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
                dt = wsBaseDatos.Existe("SELECT * FROM Table_compania WHERE ID_user = '"+id_user+"'");
                if(dt.Rows.Count > 0)
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

            string resultado = RegistrarInfo();
            //lblresultado.Text = resultado;
            
            Response.Redirect("AgentesAduanales.aspx?res=" + resultado);
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
            string ID_compania, nombre_comp, nombre_comercial, rfc, CURP, direccion, cp, pais, estado, ciudad, fecha_registro, id_user, resultado, resDir;
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
            
            resultado = ClsF14.Insertar_info_compania(ID_compania, nombre_comp, nombre_comercial, tipo_persona, rfc, CURP, tiempo_negocio, direccion, cp, pais, estado, ciudad, fecha_registro, id_user);
            if (chkDireccionIgual.Checked)
            {
                resDir = ClsF14.Insertar_dir_fra(ID_compania, txtDirecFacturacion.Text, txtCPFra.Text, ddPaisFra.SelectedValue, ddEstadoFra.SelectedValue, ddCiudadFra.SelectedValue);
            }
            else
            {
                resDir = ClsF14.Insertar_dir_fra(ID_compania, direccion, cp, pais, estado, ciudad);
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
            
            lblresultado.Text = ClsF14.Insertar_info_bancaria(ID_compania, Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda);
        
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
                compania = ClsF14.Insertar_info_compania(ID_compania, nombre_comp, nombre_comercial, tipo_persona, rfc, CURP, tiempo_negocio, direccion, cp, pais, estado, ciudad, fecha_registro, id_user);
                if (chkDireccionIgual.Checked)
                {
                    resDir = ClsF14.Insertar_dir_fra(ID_compania, txtDirecFacturacion.Text, txtCPFra.Text, ddPaisFra.SelectedValue, ddEstadoFra.SelectedValue, ddCiudadFra.SelectedValue);
                }
                else
                {
                    resDir = ClsF14.Insertar_dir_fra(ID_compania, direccion, cp, pais, estado, ciudad);
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
                    banco += ClsF14.Insertar_info_bancaria(ID_compania, Nombre_banco, rfc_banco, no_cuenta, clave_bancaria, Uso_CFDI, Metodo_pago, Forma_pago, Moneda);

                    documento += ClsF14.Insertar_Documento(ID_compania, "F14", "null", "20%");
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
    }
}
