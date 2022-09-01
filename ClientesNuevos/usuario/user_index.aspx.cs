using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using ClientesNuevos.App_Code;

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
                        }
                        else
                        {
                            lblF5_estatus.Text = "Pendiente:"+ Docs[i].Estatus;
                        }
                        lblF5_fecha.Text = Docs[i].Fecha.Substring(0, 10);
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
    }
}