using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClientesNuevos.App_Code;
using ClientesNuevos.F14;


namespace ClientesNuevos.admin.carpetilla
{
    public partial class carpetilla1 : System.Web.UI.Page
    {
        DataTable data;
        string id_comp = "",id_user="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Request.QueryString["id"] != null && Request.QueryString["type"] != null)
                {
                    

                    Ocultar(Request.QueryString["type"].ToString());
                    data = Obtener_inf(Request.QueryString["id"].ToString());
                    if (data.Rows.Count > 0)
                    {
                        //Muestro el nombre comercial en el encabezado de card de carpetilla
                        lblCompania.Text += " " + data.Rows[0]["Nombre_comercial"].ToString();

                        id_comp = Request.QueryString["id"].ToString();
                        id_user = data.Rows[0]["ID_user"].ToString();

                        hfRegimen.Value = data.Rows[0]["Tipo_persona"].ToString();
                    //Nombre completo
                    lblNombreComp.Text = data.Rows[0]["Nombre_comp"].ToString();

                    //Fecha de registro
                    lblFechaReg.Text = data.Rows[0]["Fecha_registro"].ToString().Substring(0, 10);

                    //Direccion
                    lblDireccion.Text = data.Rows[0]["Direccion"].ToString();

                    //Ubicacion
                    lblUbicacion.Text = data.Rows[0]["Ciudad"].ToString() + ", " + data.Rows[0]["Estado"].ToString() + ", " + data.Rows[0]["Pais"].ToString();
                    if (data.Rows[0]["Estatus"].ToString() == "inactivo")
                    {
                        lblEstatusA.Text = "inactivo";
                        lblEstatusA.CssClass = "etiqueta peligro";

                            chkEstatus.Checked = false;
                    }
                    else
                    {
                        chkEstatus.Checked = true;
                    }
                    //Metodo que obtiene los documentos con los que cuenta el cliente
                    Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

                    //Cargo el porcentaje de progreso
                    BarraProgreso(id_user, id_comp);

                    //Genero cookies, necesarias para obtener la info de los formularios
                    Response.Cookies.Add(new HttpCookie("id_comp", id_comp));
                    Response.Cookies.Add(new HttpCookie("tipo", Request.QueryString["type"].ToString()));
                    }

                    //-----------------cargar info bancaria------------------
                    Obtener_infoBancaria(Request.QueryString["id"].ToString());
                    
                }
            }
            

        }
        private void Ocultar(string tipo)
        {
            switch (tipo)
            {
                case "moral":
                    row_CNAP.Visible = false;
                    row_W9.Visible = false;
                    row_CURP.Visible = false;

                    break;
                case "fisica":
                    row_W9.Visible = false;
                    row_AC.Visible = false;
                    break;                
                case "extranjero":
                    row_CNAP.Visible = false;
                    row_RFC.Visible = false;
                    row_CURP.Visible = false;
                    row_IRL.Visible = false;
                    row_PRL.Visible = false;
                    row_OP.Visible = false;
                    row_AC.Visible = false;

                    break;
                default:              
                    break;
            }
        }
        private void Obtener_Documentos(string id_comp, string id_user)
        {
            DataTable data;
            data = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE ID_compania='" + id_comp + "' OR ID_compania='"+id_user+"'");

            if (data.Rows.Count > 0)
            {
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    var fila = data.Rows[i];
                    //==================================================F5
                    if (fila["Documento"].ToString() == "F5")
                    {                        
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF5_estatus.Text = "completado";
                            lblF5_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblF5_estatus.Text = "revision";
                            lblF5_estatus.CssClass = "etiqueta revision";

                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblF5_estatus.Text = "actualizar";
                            lblF5_estatus.CssClass = "etiqueta actualizar";

                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF5_estatus.Text = "actualizado";
                            lblF5_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblF5_estatus.Text = "pendiente: " + fila["Estatus"].ToString();
                            lblF5_estatus.CssClass = "etiqueta pendiente";
                        }
                        lblF5_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_F5.Enabled= true;
                        btnVer_F5.CssClass = btnVer_F5.CssClass.Replace("disabled", "");
                        btnActualizar_F5.CssClass = btnActualizar_F5.CssClass.Replace("disabled", "");
                        btnCheck_F5.CssClass = btnCheck_F5.CssClass.Replace("disabled", "");


                    }

                    //==================================================W9
                    if (fila["Documento"].ToString() == "W9")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblW9_estatus.Text = "completado";
                            lblW9_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblW9_estatus.Text = "revision";
                            lblW9_estatus.CssClass = "etiqueta revision";

                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblW9_estatus.Text = "actualizar";
                            lblW9_estatus.CssClass = "etiqueta actualizar";

                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblW9_estatus.Text = "actualizado";
                            lblW9_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblW9_estatus.Text = "pendiente: " + fila["Estatus"].ToString();
                            lblW9_estatus.CssClass = "etiqueta pendiente";
                        }
                        lblW9_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);

                        txtW9.Text = fila["Ruta"].ToString();

                        btnVer_W9.Enabled = true;
                        btnVer_W9.CssClass = btnVer_W9.CssClass.Replace("disabled", "");
                        btnActualizar_W9.CssClass = btnActualizar_W9.CssClass.Replace("disabled", "");
                        btnCheck_W9.CssClass = btnCheck_W9.CssClass.Replace("disabled", "");

                    }
                    //==================================================F43
                    if (fila["Documento"].ToString() == "F43")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF43_estatus.Text = "completado";
                            lblF43_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblF43_estatus.Text = "revision";
                            lblF43_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblF43_estatus.Text = "actualizar";
                            lblF43_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF43_estatus.Text = "actualizado";
                            lblF43_estatus.CssClass = "etiqueta updated";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF43_estatus.Text = "actualizado";
                            lblF43_estatus.CssClass = "etiqueta updated";
                        }
                        btnVer_F43.Enabled = true;
                        lblF43_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnCheck_F43.CssClass = btnCheck_F43.CssClass.Replace("disabled", "");
                        btnActualizar_F43.CssClass = btnActualizar_F43.CssClass.Replace("disabled", "");

                    }
                    //==================================================F12
                    if (fila["Documento"].ToString() == "F12")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF12_estatus.Text = "completado";
                            lblF12_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblF12_estatus.Text = "revision";
                            lblF12_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblF12_estatus.Text = "actualizar";
                            lblF12_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF12_estatus.Text = "actualizado";
                            lblF12_estatus.CssClass = "etiqueta updated";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF12_estatus.Text = "actualizado";
                            lblF12_estatus.CssClass = "etiqueta updated";
                        }
                        btnVer_F12.Enabled = true;
                        lblF12_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_F12.CssClass = btnVer_F12.CssClass.Replace("disabled", "");
                        btnCheck_F12.CssClass = btnCheck_F12.CssClass.Replace("disabled", "");
                        btnActualizar_F12.CssClass = btnActualizar_F12.CssClass.Replace("disabled", "");

                    }
                    //==================================================F14
                    if (fila["Documento"].ToString() == "F14")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF14_estatus.Text = "completado";
                            lblF14_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblF14_estatus.Text = "actualizar";
                            lblF14_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "pendiente")
                        {
                            lblF14_estatus.Text = "pendiente: " + fila["Estatus"].ToString();
                            lblF14_estatus.CssClass = "etiqueta pendiente";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblF14_estatus.Text = "revision";
                            lblF14_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF14_estatus.Text = "actualizado";
                            lblF14_estatus.CssClass = "etiqueta updated";
                        }
                            btnVer_F14.Enabled= true;   

                        lblF14_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_F14.CssClass = btnVer_F14.CssClass.Replace("disabled", "");
                        btnActualizar_F14.CssClass = btnActualizar_F14.CssClass.Replace("disabled", "");
                        btnCheck_F14.CssClass = btnCheck_F14.CssClass.Replace("disabled", "");

                    }
                    //==================================================RFC
                    if (fila["Documento"].ToString() == "RFC")
                    {
                        txtRFC.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblRFC_estatus.Text = "completado";
                            lblRFC_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblRFC_estatus.Text = "revision";
                            lblRFC_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblRFC_estatus.Text = "actualizar";
                            lblRFC_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblRFC_estatus.Text = "actualizado";
                            lblRFC_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblRFC_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_RFC.Enabled = true;
                        lblRFC_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_RFC.CssClass = btnVer_RFC.CssClass.Replace("disabled", "");
                        btnActualizar_RFC.CssClass = btnActualizar_RFC.CssClass.Replace("disabled", "");
                        btnCheck_RFC.CssClass = btnCheck_RFC.CssClass.Replace("disabled", "");

                    }
                    //=================================================CURP                
                    if (fila["Documento"].ToString() == "CURP")
                    {
                        txtCURP.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblCURP_estatus.Text = "completado";
                            lblCURP_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblCURP_estatus.Text = "revision";
                            lblCURP_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblCURP_estatus.Text = "actualizar";
                            lblCURP_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblCURP_estatus.Text = "actualizado";
                            lblCURP_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblCURP_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_CURP.Enabled = true;
                        lblCURP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnActualizar_CURP.CssClass = btnActualizar_CURP.CssClass.Replace("disabled", "");
                        btnVer_CURP.CssClass = btnVer_CURP.CssClass.Replace("disabled", "");
                        btnCheck_CURP.CssClass = btnCheck_CURP.CssClass.Replace("disabled", "");

                    }
                    //=================================================CNAP
                    if (fila["Documento"].ToString() == "Carta de no antecedentes penales")
                    {
                        txtCNAP.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblCNAP_estatus.Text = "completado";
                            lblCNAP_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblCNAP_estatus.Text = "revision";
                            lblCNAP_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblCNAP_estatus.Text = "actualizar";
                            lblCNAP_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblCNAP_estatus.Text = "actualizado";
                            lblCNAP_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblCNAP_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_CNAP.Enabled = true;
                        lblCNAP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_CNAP.CssClass = btnVer_CNAP.CssClass.Replace("disabled", "");
                        btnActualizar_CNAP.CssClass = btnActualizar_CNAP.CssClass.Replace("disabled", "");
                        btnCheck_CNAP.CssClass = btnCheck_CNAP.CssClass.Replace("disabled", "");

                    }
                    //==============================================CompDom
                    if (fila["Documento"].ToString() == "Comprobante de domicilio")
                    {
                        txtCompDom.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblCompDom_estatus.Text = "completado";
                            lblCompDom_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblCompDom_estatus.Text = "revision";
                            lblCompDom_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblCompDom_estatus.Text = "actualizar";
                            lblCompDom_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblCompDom_estatus.Text = "actualizado";
                            lblCompDom_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblCompDom_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_CompDom.Enabled = true;
                        lblCompDom_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_CompDom.CssClass = btnVer_CompDom.CssClass.Replace("disabled", "");
                        btnActualizar_CompDom.CssClass = btnActualizar_CompDom.CssClass.Replace("disabled", "");
                        btnCheck_CompDom.CssClass = btnCheck_CompDom.CssClass.Replace("disabled", "");

                    }
                    //===================================================IRL
                    if (fila["Documento"].ToString() == "Identificacion de representante legal")
                    {
                        txtIRL.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblIRL_estatus.Text = "completado";
                            lblIRL_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblIRL_estatus.Text = "revision";
                            lblIRL_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblIRL_estatus.Text = "actualizar";
                            lblIRL_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblIRL_estatus.Text = "actualizado";
                            lblIRL_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblIRL_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_IRL.Enabled = true;
                        lblIRL_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_IRL.CssClass = btnVer_IRL.CssClass.Replace("disabled", "");
                        btnActualizar_IRL.CssClass = btnActualizar_IRL.CssClass.Replace("disabled", "");
                        btnCheck_IRL.CssClass = btnCheck_IRL.CssClass.Replace("disabled", "");

                    }
                    //====================================Poder de representante legal
                    if (fila["Documento"].ToString() == "Poder de representante legal")
                    {
                        txtPRL.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblPRL_estatus.Text = "completado";
                            lblPRL_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblPRL_estatus.Text = "revision";
                            lblPRL_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblPRL_estatus.Text = "actualizar";
                            lblPRL_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblPRL_estatus.Text = "actualizado";
                            lblPRL_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblPRL_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_PRL.Enabled = true;
                        lblPRL_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_PRL.CssClass = btnVer_PRL.CssClass.Replace("disabled", "");
                        btnActualizar_PRL.CssClass = btnActualizar_PRL.CssClass.Replace("disabled", "");
                        btnCheck_PRL.CssClass = btnCheck_PRL.CssClass.Replace("disabled", "");

                    }
                    //==================================================OP
                    if (fila["Documento"].ToString() == "Opinion positiva")
                    {
                        txtOP.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblOP_estatus.Text = "completado";
                            lblOP_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblOP_estatus.Text = "revision";
                            lblOP_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblOP_estatus.Text = "actualizar";
                            lblOP_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblOP_estatus.Text = "actualizado";
                            lblOP_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblOP_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_OP.Enabled = true;
                        lblOP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_OP.CssClass = btnVer_OP.CssClass.Replace("disabled", "");
                        btnActualizar_OP.CssClass = btnActualizar_OP.CssClass.Replace("disabled", "");
                        btnCheck_OP.CssClass = btnCheck_OP.CssClass.Replace("disabled", "");

                    }
                    //===================================================CTPAT
                    if (fila["Documento"].ToString() == "Certificación C-TPAT")
                    {
                        txtCTPAT.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblCTPAT_estatus.Text = "completado";
                            lblCTPAT_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblCTPAT_estatus.Text = "revision";
                            lblCTPAT_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblCTPAT_estatus.Text = "actualizar";
                            lblCTPAT_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblCTPAT_estatus.Text = "actualizado";
                            lblCTPAT_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblCTPAT_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_CTPAT.Enabled = true;
                        lblCTPAT_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_CTPAT.CssClass = btnVer_CTPAT.CssClass.Replace("disabled", "");
                        btnActualizar_CTPAT.CssClass = btnActualizar_CTPAT.CssClass.Replace("disabled", "");
                        btnCheck_CTPAT.CssClass = btnCheck_CTPAT.CssClass.Replace("disabled", "");

                    }
                    //===================================================OEA
                    if (fila["Documento"].ToString() == "Certificación OEA")
                    {
                        txtOEA.Text = fila["Ruta"].ToString();
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblOEA_estatus.Text = "completado";
                            lblOEA_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblOEA_estatus.Text = "revision";
                            lblOEA_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblOEA_estatus.Text = "actualizar";
                            lblOEA_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblOEA_estatus.Text = "actualizado";
                            lblOEA_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblOEA_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        btnVer_OEA.Enabled = true;
                        lblOEA_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        btnVer_OEA.CssClass = btnVer_OEA.CssClass.Replace("disabled", "");
                        btnActualizar_OEA.CssClass = btnActualizar_OEA.CssClass.Replace("disabled", "");
                        btnCheck_OEA.CssClass = btnCheck_OEA.CssClass.Replace("disabled", "");

                    }
                    //===================================================F16
                    if (fila["Documento"].ToString() == "F16")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF16_estatus.Text = "completado";
                            lblF16_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblF16_estatus.Text = "revision";
                            lblF16_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblF16_estatus.Text = "actualizar";
                            lblF16_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF16_estatus.Text = "actualizado";
                            lblF16_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblF16_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblF16_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                        
                        txtF16.Text = fila["Ruta"].ToString();
                        btnVer_F16.Enabled = true;
                        btnVer_F16.CssClass = btnVer_F16.CssClass.Replace("disabled", "");
                        btnCheck_F16.CssClass = btnCheck_F16.CssClass.Replace("disabled", "");

                    }
                    //====================Acta constitutiva====================
                    if (fila["Documento"].ToString() == "Acta constitutiva")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblAC_estatus.Text = "completado";
                            lblAC_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblAC_estatus.Text = "revision";
                            lblAC_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblAC_estatus.Text = "actualizar";
                            lblAC_estatus.CssClass = "etiqueta actualizar";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblAC_estatus.Text = "actualizado";
                            lblAC_estatus.CssClass = "etiqueta updated";
                        }
                        else
                        {
                            lblAC_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblAC_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);

                        txtAC.Text = fila["Ruta"].ToString();
                        btnVer_AC.Enabled = true;
                        btnVer_AC.CssClass = btnVer_AC.CssClass.Replace("disabled", "");
                        btnActualizar_AC.CssClass = btnActualizar_AC.CssClass.Replace("disabled", "");
                        btnCheck_AC.CssClass = btnCheck_AC.CssClass.Replace("disabled", "");
                    }
                    //===================================================F20
                    if (fila["Documento"].ToString() == "F20" && fila["ID_compania"].ToString() == id_user)
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF20_estatus.Text = "completado";
                            lblF20_estatus.CssClass = "etiqueta";
                        }
                        else if (fila["Estatus"].ToString() == "revision")
                        {
                            lblF20_estatus.Text = "revision";
                            lblF20_estatus.CssClass = "etiqueta revision";
                        }
                        else if (fila["Estatus"].ToString() == "act")
                        {
                            lblF20_estatus.Text = "actualizar";
                            lblF20_estatus.CssClass = "etiqueta actualizar";
                        }
                        else
                        {
                            lblF20_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblF20_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);

                    }
                }
            }
        }
        //========================CURP=================================
        protected void btnClick(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_CURP")
            {
                AbrirArchivo(txtCURP.Text);
                lblPrueba.Text = "Ver curp";
            }
            else if (buttonId == "btnCheck_CURP")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "CURP", "100%");
                //Response.Redirect(Request.RawUrl);
            }
            else if (buttonId == "btnActualizar_CURP")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "CURP", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        private DataTable Obtener_inf(string id)
        {
            DataTable data;

            data = clsHerramientaBD.Existe("exec select_compania @id_comp='" + id + "', @accion='compania'");

            return data;
        }
        private void Obtener_infoBancaria(string id)
        {
            DataTable data;

            data = clsHerramientaBD.Existe("exec Master_TablaInfoBancaria @ID_compania='" + id + "', @accion='infobanco'");
            if (data.Rows.Count > 0)
            {
                hfBanco.Value = data.Rows[0]["Nombre_banco"].ToString().Trim();
                lblBanco1.Text = data.Rows[0]["Nombre"].ToString();
                lblBanco2.Text = data.Rows[0]["RFC"].ToString();
                lblBanco3.Text = data.Rows[0]["Direccion"].ToString();
                lblBanco4.Text = data.Rows[0]["CP_fra"].ToString();
                lblBanco5.Text = data.Rows[0]["MetodoPago"].ToString();
                lblBanco6.Text = data.Rows[0]["FormaPago"].ToString();
                lblBanco7.Text = data.Rows[0]["Moneda"].ToString();
                lblBanco8.Text = data.Rows[0]["UsoCFDI"].ToString();
                lblBanco9.Text = data.Rows[0]["Nombre_banco"].ToString();
                lblBanco10.Text = data.Rows[0]["rfc_banco"].ToString();
                lblBanco11.Text = data.Rows[0]["no_cuenta"].ToString();
                lblBanco12.Text = data.Rows[0]["clabe_bancaria"].ToString();
                lblBanco13.Text = data.Rows[0]["regimen"].ToString();
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../index.aspx");
        }

        //========================RFC========================================
        protected void btnRFC_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_RFC")
            {
                AbrirArchivo(txtRFC.Text);
                lblPrueba.Text = "Ver rfc";

            }
            else if (buttonId == "btnCheck_RFC")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "RFC", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_RFC")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "RFC", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //========Carta de no antecedentes=================================
        protected void btnCNAP_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_CNAP")
            {
                AbrirArchivo(txtCNAP.Text);

                lblPrueba.Text = "Ver CNAP";
            }
            else if (buttonId == "btnCheck_CNAP")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Carta de no antecedentes penales", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_CNAP")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Carta de no antecedentes penales", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //=============Comprobante de domicilio============================
        protected void btnCompDom_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_CompDom")
            {
                AbrirArchivo(txtCompDom.Text);

                lblPrueba.Text = "Ver comprobante";
            }
            else if (buttonId == "btnCheck_CompDom")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Comprobante de domicilio", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_CompDom")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Comprobante de domicilio", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //=============Identificacion representante legal==================
        protected void btnIRL_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_IRL")
            {
                AbrirArchivo(txtIRL.Text);

                lblPrueba.Text = "Ver IRL";
            }
            else if (buttonId == "btnCheck_IRL")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Identificacion de representante legal", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_IRL")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Identificacion de representante legal", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //=============Acta constitutiva=================
        protected void btnAC_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_AC")
            {
                AbrirArchivo(txtAC.Text);

                //lblPrueba.Text = "Ver AC";
            }
            else if (buttonId == "btnCheck_AC")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Acta constitutiva", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_AC")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Acta constitutiva", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //============= W9 =================
        protected void btnW9_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_W9")
            {
                AbrirArchivo(txtW9.Text);

                lblPrueba.Text = "Ver W9";
            }
            else if (buttonId == "btnCheck_W9")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "W9", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_W9")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "W9", "act");
                //Response.Redirect(Request.RawUrl);
            }
        }

        //==============Poder de representante==============================
        protected void btnPRL_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_PRL")
            {
                AbrirArchivo(txtPRL.Text);

                lblPrueba.Text = "Ver PRL";
            }
            else if (buttonId == "btnCheck_PRL")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Poder de representante legal", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);


            }
            else if (buttonId == "btnActualizar_PRL")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Poder de representante legal", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //=================Certificación ctpat==============================
        protected void btnCTPAT_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_CTPAT")
            {
                AbrirArchivo(txtCTPAT.Text);

                lblPrueba.Text = "Ver ctpat";
            }
            else if (buttonId == "btnCheck_CTPAT")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Certificación C-TPAT", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_CTPAT")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Certificación C-TPAT", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //===============Certificacion OEA==================================
        protected void btnOEA_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_OEA")
            {
                AbrirArchivo(txtOEA.Text);

                lblPrueba.Text = "Ver OEA";
            }
            else if (buttonId == "btnCheck_OEA")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Certificación OEA", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_OEA")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Certificación OEA", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //===================================Opinion positiva================
        protected void btnOP_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_OP")
            {
                AbrirArchivo(txtOP.Text);

                //lblPrueba.Text = "Ver OP";
            }
            else if (buttonId == "btnCheck_OP")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Opinion positiva", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_OP")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Opinion positiva", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //=======================F5===========================================
        protected void btnF5_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_F5")
            {
                lblPrueba.Text = "Ver F5";
                

                Response.Redirect("~/F5/autoevaluacion/Resultados.aspx?rfc=" + id_comp);
                //Response.Cookies.Add(new HttpCookie("id_comp", id_comp));
            }
            else if (buttonId == "btnCheck_F5")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F5", "100%");
                // Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_F5")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F5", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //====================F14=============================================
        protected void btnF14_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_F14")
            {
                lblPrueba.Text = "Ver F14";
                Response.Redirect("~/F14/secciones/informacioncompania.aspx?rfc=" + id_comp);
            }
            else if (buttonId == "btnCheck_F14")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F14", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_F14")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F14", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //=====================F12============================================
        protected void btnF12_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_F12")
            {
                lblPrueba.Text = "Ver F12";
                Response.Redirect("../../F12/politicaseguridad?rfc=" + id_comp);


            }
            else if (buttonId == "btnCheck_F12")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F12", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            else if (buttonId == "btnActualizar_F12")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F12", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        //=====================F43============================================
        protected void btnF43_Click(object sender, EventArgs e)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;
            id_comp = Request.QueryString["id"].ToString();

            if (buttonId == "btnVer_F43")
            {
                lblPrueba.Text = "Ver F43";
                Response.Redirect("../../F43/MapeoFlujo.aspx?rfc=" + id_comp);

            }
            else if (buttonId == "btnCheck_F43")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F43", "100%");
                //Response.Redirect(Request.RawUrl);
                Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

            }
            //else if (buttonId == "btnActualizar_F43")
            //{
            //    //lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F43", "act");
            //    //Response.Redirect(Request.RawUrl);
            //}
        }

        protected void btnCheck_F16_Click(object sender, EventArgs e)
        {
            id_comp = Request.QueryString["id"].ToString();
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F16", "100%");
            //Response.Redirect(Request.RawUrl);
            Obtener_Documentos(Request.QueryString["id"].ToString(), id_user);

        }

        protected void btnVer_F16_Click(object sender, EventArgs e)
        {
            AbrirArchivo(txtF16.Text);
        }

        protected void AbrirArchivo(string flocation)
        {
            string FilePath = Server.MapPath(flocation);
            WebClient wClient = new WebClient();

            try
            {
                Byte[] FileBuffer = wClient.DownloadData(FilePath);

                if (FileBuffer != null)
                {
                    //Response.ContentType = "application/pdf";
                    //Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    //Response.BinaryWrite(FileBuffer);
                    Session["buffer"] = FileBuffer;
                    Response.Redirect("~/Viewer.aspx");
                    //Response.Write("<script>window.open ('../Viewer.aspx','_blank');</script>");


                }
            }
            catch (Exception ex)
            {

                lblPrueba.Text = ex.Message + "\n" + "No se encontro el archivo";
            }

        }

        protected void chkEstatus_CheckedChanged(object sender, EventArgs e)
        {
            string cambio;
           
            if(lblEstatusA.Text == "inactivo")
            {
                cambio = clsHerramientaBD.ExecuteSql("UPDATE Table_compania SET Estatus='activo' WHERE ID_compania='" + Request.QueryString["id"] + "'");
                if(cambio == "")
                {
                    lblCambio.Text = "Status actualizado";
                    lblEstatusA.Text = "activo";
                    lblEstatusA.CssClass = "etiqueta";
                }
                else
                {
                    lblCambio.Text = cambio;
                }
            }
            else if(lblEstatusA.Text == "activo")
            {
                cambio = clsHerramientaBD.ExecuteSql("UPDATE Table_compania SET Estatus='inactivo' WHERE ID_compania='" + Request.QueryString["id"] + "'");
                if (cambio == "")
                {
                    lblCambio.Text = "Status actualizado";
                    lblEstatusA.Text = "inactivo";
                    lblEstatusA.CssClass = "etiqueta peligro";

                }
                else
                {
                    lblCambio.Text = cambio;
                }
            }
        }

       
        protected void BarraProgreso(string id_user, string id_comp)
        {
            DataTable data = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE (ID_compania='" + id_comp + "' OR ID_compania='" + id_user + "') AND Estatus='100%'");
            string tipo = Request.QueryString["type"];
            string porcentaje = "";
            int totalDocs;
            double prog;
            if(tipo == "moral")
            {
                totalDocs = 14;
            }else if(tipo == "fisica")
            {
                totalDocs = 15;
            }
            else
            {
                totalDocs = 10;
            }
            if(data.Rows.Count != 0)
            {
                prog = ((data.Rows.Count * 100) / totalDocs);
                porcentaje = Convert.ToString(Math.Round(prog))+"%";
            }
            else
            {
                porcentaje = "0%";
            }

            pbProgress.Style.Add("width", porcentaje);
            lblPorcentaje.Text = porcentaje;
        }

    }
}
