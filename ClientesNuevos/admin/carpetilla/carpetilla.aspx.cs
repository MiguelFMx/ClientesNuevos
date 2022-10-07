using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
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
        string id_comp = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null && Request.QueryString["type"]!=null)
                {
                    Ocultar(Request.QueryString["type"].ToString());
                    Obtener_Documentos(Request.QueryString["id"].ToString());
                    data = Obtener_inf(Request.QueryString["id"].ToString());
                    lblCompania.Text += " " + data.Rows[0]["Nombre_comp"].ToString();
                    id_comp = Request.QueryString["id"].ToString();

                    Response.Cookies.Add(new HttpCookie("id_comp", id_comp));
                    Response.Cookies.Add(new HttpCookie("tipo", Request.QueryString["type"].ToString()));
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
        private void Obtener_Documentos(string id_comp)
        {
            DataTable data;
            data = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE ID_compania='" + id_comp + "'");

            if (data.Rows.Count > 0)
            {
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    var fila = data.Rows[i];
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
                        else
                        {
                            lblF5_estatus.Text = "pendiente: " + fila["Estatus"].ToString();
                            lblF5_estatus.CssClass = "etiqueta pendiente";
                        }
                        lblF5_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
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
                        lblF14_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
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
                        lblF43_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
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
                        lblF12_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
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
                        else
                        {

                        }
                        lblF14_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "RFC")
                    {
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
                        else
                        {
                            lblRFC_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblRFC_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    //                
                    if (fila["Documento"].ToString() == "CURP")
                    {
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
                        else
                        {
                            lblCURP_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblCURP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "Carta de no antecedentes penales")
                    {
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
                        else
                        {
                            lblCNAP_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblCNAP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "Comprobante de domicilio")
                    {
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
                        else
                        {
                            lblCompDom_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblCompDom_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "Identificacion de representante legal")
                    {
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
                        else
                        {
                            lblIRL_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblIRL_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    //Poder de representante legal
                    if (fila["Documento"].ToString() == "Poder de representante legal")
                    {
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
                        else
                        {
                            lblPRL_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblPRL_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "Opinion positiva")
                    {
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
                        else
                        {
                            lblOP_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblOP_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "Certificación C-TPAT")
                    {
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
                        else
                        {
                            lblCTPAT_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblCTPAT_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "Certificación OEA")
                    {
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
                        else
                        {
                            lblOEA_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblOEA_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
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
                        else
                        {
                            lblF16_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblF16_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
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

            data = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_compania='" + id + "'");

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
                lblPrueba.Text = "Ver OP";
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
                

                Response.Redirect("../../F5/autoevaluacion/Resultados.aspx?id=" + id_comp+"&admin=si");
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
                Response.Redirect("../../F14/secciones/informacioncompania.aspx?id=" + id_comp+"&admin=si");
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
                Response.Redirect("../../F43/MapeoFlujo.aspx?id=" + id_comp + "&admin=si");

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
            lblPrueba.Text = wsBaseDatos.InsertarDocumento(id_comp, "F16", "", "100%");
            
        }
    }
}
