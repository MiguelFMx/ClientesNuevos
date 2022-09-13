using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using ClientesNuevos.App_Code;
using ClientesNuevos.F14;
using System.Web.Security;

namespace ClientesNuevos.usuario
{
    public partial class Index : System.Web.UI.Page
    {
        DataTable dt;
        HttpCookie cook;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                getCompania();
                if (dt.Rows.Count > 0)
                {
                    lblCompania.Text = dt.Rows[0]["Nombre_comercial"].ToString();
                    cook = new HttpCookie("id_comp", dt.Rows[0]["ID_compania"].ToString());
                    Response.Cookies.Add(cook);
                    try
                    {

                        Documentos();
                        prueba.Text = User.Identity.Name;
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;

                    }
                }
                else
                {
                    Response.Redirect("../F20/CriteriosMinimos.aspx");
                }
            }
        }
        

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            dt = new DataTable();
            getCompania();
            //Guarda el documento
            string uploadFolder = Request.PhysicalApplicationPath + "archivos\\";
            // string getCompania_id
            string compania_id = dt.Rows[0]["ID_compania"].ToString();
            Directory.CreateDirectory(uploadFolder + "\\usuario");

            if (inputFile.HasFile)
            {
                string documento = inputFile.PostedFile.FileName;
                string extension = documento.Substring(documento.Length - 4, 4);

                if(extension == ".pdf")
                {
                    inputFile.SaveAs(uploadFolder + "\\usuario\\" + compania_id+"_"+ documento);
                    lblError.Text = "Archivo guardado con exito"+ uploadFolder;
                }
            }


        }

        protected void getCompania()
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            dt = new DataTable();
            
            
            string id_user = Request.Cookies.Get("id").Value;
            dt = wsBaseDatos.getCompania(id_user);

            
        }

        protected void Documentos()
        {
            try
            {
                List<clsUserIndex.ControlDocumento> Docs = clsUserIndex.Obtener_Documentos( HttpContext.Current.Request.Cookies.Get("id_comp").Value );

                for (int i = 0; i < Docs.Count ; i++)
                {
                    if(Docs[i].Documento == "F14")
                    {
                        if(Docs[i].Estatus == "100%")
                        {
                            lblF14_estatus.Text = "completado";
                            lblF14_estatus.CssClass = "etiqueta";

                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblF14_estatus.Text = "en revision";
                            lblF14_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblF14_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        
                        lblF14_fecha.Text = Docs[i].Fecha.Substring(0, 10);

                    }
                    if (Docs[i].Documento == "F43")
                    {
                        if(Docs[i].Estatus == "100%")
                        {
                            lblF43_estatus.Text = "completado";
                            lblF43_estatus.CssClass = "etiqueta";
                        }else if(Docs[i].Estatus == "revision")
                        {
                            lblF43_estatus.Text = "en revision";
                            lblF43_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblF43_estatus.Text = "Pendiente";
                        }
                        lblF43_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "F5")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblF5_estatus.Text = "completado";
                            lblF5_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblF5_estatus.Text = "en revision";
                            lblF5_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblF5_estatus.Text = "Pendiente:"+ Docs[i].Estatus;
                        }
                        lblF5_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "F12")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblF12_estatus.Text = "completado";
                            lblF12_estatus.CssClass = "etiqueta";
                        }else if(Docs[i].Estatus == "revision")
                        {
                            lblF12_estatus.Text = "en revision";
                            lblF12_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblF12_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblF12_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "RFC")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblRFC_estatus.Text = "completado";
                            lblRFC_estatus.CssClass = "etiqueta";
                        }else if(Docs[i].Estatus == "revision"){
                            lblRFC_estatus.Text = "en revision";
                            lblRFC_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblRFC_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblRFC_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    //
                    
                    if (Docs[i].Documento == "CURP")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblCURP_estatus.Text = "completado";
                            lblCURP_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblCURP_estatus.Text = "en revision";
                            lblCURP_estatus.CssClass = "etiqueta revision";
                        }
                        else if (Docs[i].Estatus == "act")
                        {
                            lblCURP_estatus.Text = "actualizar";
                            lblCURP_estatus.CssClass = "etiqueta actualizar";
                        }
                        else
                        {
                            lblCURP_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblCURP_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "Carta de no antecedentes penales")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblCNAP_estatus.Text = "completado";
                            lblCNAP_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblCNAP_estatus.Text = "en revision";
                            lblCNAP_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblCNAP_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblCNAP_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "Comprobante de domicilio")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblCompDom_estatus.Text = "completado";
                            lblCompDom_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblCompDom_estatus.Text = "en revision";
                            lblCompDom_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblCompDom_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblCompDom_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "Identificacion de representante legal")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblIRL_estatus.Text = "completado";
                            lblIRL_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblIRL_estatus.Text = "en revision";
                            lblIRL_estatus.CssClass = "etiqueta revision";

                        }
                        else
                        {
                            lblIRL_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblIRL_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    //Poder de representante legal
                    if (Docs[i].Documento == "Poder de representante legal")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblPRL_estatus.Text = "completado";
                            lblPRL_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblPRL_estatus.Text = "en revision";
                            lblPRL_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblPRL_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblPRL_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "Opinion positiva")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblOP_estatus.Text = "completado";
                            lblOP_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblOP_estatus.Text = "en revision";
                            lblOP_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblOP_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblOP_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "Certificación C-TPAT")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblCTPAT_estatus.Text = "completado";
                            lblCTPAT_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblCTPAT_estatus.Text = "en revision";
                            lblCTPAT_estatus.CssClass = "etiqueta revision";
                        }
                        else
                        {
                            lblCTPAT_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblCTPAT_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                    if (Docs[i].Documento == "Certificación OEA")
                    {
                        if (Docs[i].Estatus == "100%")
                        {
                            lblOEA_estatus.Text = "completado";
                            lblOEA_estatus.CssClass = "etiqueta";
                        }else if (Docs[i].Estatus == "revision")
                        {
                            lblOEA_estatus.Text = "en revision";
                            lblOEA_estatus.CssClass = "etiqueta revision";

                        }
                        else
                        {
                            lblOEA_estatus.Text = "Pendiente:" + Docs[i].Estatus;
                        }
                        lblOEA_fecha.Text = Docs[i].Fecha.Substring(0, 10);
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            string estatus_f14 = Obtener_estatus_f14();
            if (estatus_f14 == "20%")
            {
                Response.Redirect("../F14/secciones/agentesaduanales.aspx");

            }
            else if (estatus_f14 == "40%")
            {
                Response.Redirect("../F14/companiafilial.aspx");

            }
            else if (estatus_f14 == "60%")
            {
                Response.Redirect("../F14/secciones/tiposervicioproductos.aspx");

            }
            else if (estatus_f14 == "80%")
            {
                Response.Redirect("../F14/secciones/informacioncadenasuministro.aspx");

            }
            else
            {
                Response.Redirect("../F14/secciones/informacioncompania.aspx");
            }
        }

        protected void btnMapeo_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("../F43/mapeoflujo.aspx");

        }

        protected string Obtener_estatus_f14()
        {
            string res="";

            try
            {
                List<clsUserIndex.ControlDocumento> Docs = clsUserIndex.Obtener_Documentos(HttpContext.Current.Request.Cookies.Get("id_comp").Value);

                for (int i = 0; i < Docs.Count; i++)
                {
                    if (Docs[i].Documento == "F14")
                    {
                        res = Docs[i].Estatus;

                        break;
                    }
                }
            }
            catch (Exception)
            {

                res = "";
            }

            return res;
        }


        protected string Obtener_estatus_f5()
        {
            string res = "";

            try
            {
                List<clsUserIndex.ControlDocumento> Docs = clsUserIndex.Obtener_Documentos(HttpContext.Current.Request.Cookies.Get("id_comp").Value);

                for (int i = 0; i < Docs.Count; i++)
                {
                    if (Docs[i].Documento == "F5")
                    {
                        res = Docs[i].Estatus;

                        break;
                    }
                }
            }
            catch (Exception)
            {

                res = "";
            }

            return res;
        }

        protected void btnCartaCompromiso_Click(object sender, EventArgs e)
        {
            Response.Redirect("../F12/politicaseguridad.aspx");
        }

        protected void btnEvaluacion_Click(object sender, EventArgs e)
        {
            string estatus = Obtener_estatus_f5();
            if(estatus == "50%")
            {
                Response.Redirect("../F5/Autoevaluacion/autoevaluacion.aspx");
            }else if(estatus == "100%")
            {
                Response.Redirect("../F5/Autoevaluacion/Resultados.aspx");
            }
            else
            {
                Response.Redirect("../F5/evaluacionseguridad.aspx");
            }
        }
    }
}