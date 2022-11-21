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
                if (User.IsInRole("1"))
                {
                    pUser.Visible = true;
                    lblEstatus.Visible = false;
                }
                else
                {
                    pUser.Visible = false;
                    lblEstatus.Visible = true;
                }

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

                            lblEstatus.Text = "inactivo";
                            lblEstatus.CssClass = "etiqueta peligro";

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
                    }
                    //==================================================F4
                    if (fila["Documento"].ToString() == "F4")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF14_estatus.Text = "completado";
                            lblF14_estatus.CssClass = "etiqueta";
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
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF14_estatus.Text = "actualizado";
                            lblF14_estatus.CssClass = "etiqueta updated";
                        }
                        lblF14_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblF43_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblF12_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF14_estatus.Text = "actualizado";
                            lblF14_estatus.CssClass = "etiqueta updated";
                        }
                        else if (fila["Estatus"].ToString() == "updated")
                        {
                            lblF14_estatus.Text = "actualizado";
                            lblF14_estatus.CssClass = "etiqueta updated";
                        }
                        lblF14_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblRFC_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblCURP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblCNAP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblCompDom_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblIRL_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblPRL_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblOP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblCTPAT_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                        lblOEA_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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

                lblPrueba.Text = "Ver AC";
            }
            else if (buttonId == "btnCheck_AC")
            {
                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "Acta constitutiva", "100%");
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
            }
            else if (buttonId == "btnActualizar_W9")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "W9", "act");
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
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
                Response.Redirect(Request.RawUrl);
            }
            else if (buttonId == "btnActualizar_F43")
            {

                lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F43", "act");
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnCheck_F16_Click(object sender, EventArgs e)
        {
            id_comp = Request.QueryString["id"].ToString();
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            lblPrueba.Text = wsBaseDatos.Actualizar_Estado(id_comp, "F16", "100%");
            Response.Redirect(Request.RawUrl);
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
            DataTable data = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE ID_compania='" + id_comp + "' OR ID_compania='" + id_user + "'");
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
