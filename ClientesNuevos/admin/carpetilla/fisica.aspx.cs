using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.admin.carpetilla
{
    public partial class fisica : System.Web.UI.Page
    {
        DataTable data;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    Obtener_Documentos(Request.QueryString["id"].ToString());
                    data = Obtener_inf(Request.QueryString["id"].ToString());
                    lblCompania.Text +=" "+data.Rows[0]["Nombre_comp"].ToString();
                }
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
                        lblF5_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "F4")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF14_estatus.Text = "completado";
                            lblF14_estatus.CssClass = "etiqueta";
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
                        lblF43_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "F12")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblF12_estatus.Text = "completado";
                            lblF12_estatus.CssClass = "etiqueta";
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
                        lblF14_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                    if (fila["Documento"].ToString() == "RFC")
                    {
                        if (fila["Estatus"].ToString() == "100%")
                        {
                            lblRFC_estatus.Text = "completado";
                            lblRFC_estatus.CssClass = "etiqueta";
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
                        else
                        {
                            lblOEA_estatus.Text = "Pendiente:" + fila["Estatus"].ToString();
                        }
                        lblOEA_fecha.Text = fila["Fecha_creacion"].ToString().Substring(0, 10);
                    }
                }
            }
        }

        protected void btnClick(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;

            if(buttonId == "btnVer_CURP")
            {
                lblPrueba.Text = "Ver curp";
            }else if (buttonId == "btnCheck_CURP") 
            {
                lblPrueba.Text = "chck curp";

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
    }
}