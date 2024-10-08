﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Optimization;
using System.Net;
using ClientesNuevos.App_Code;
using System.IO;
using System.Xml.Linq;
using System.Data;
using System.Web.UI.HtmlControls;
using Microsoft.Ajax.Utilities;
using System.Runtime.Remoting.Contexts;
using static System.Net.WebRequestMethods;
using System.Runtime.InteropServices;
using Antlr.Runtime;

namespace ClientesNuevos.F14.Seccioness
{
    public partial class InformacionCadenaSuministro : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                btnModal.Visible = false;
                //Admin / user
                if (User.IsInRole("1") || User.IsInRole("2"))
                {
                    pUser.Visible = false;
                    pAdmin.Visible = true;
                    btnAdminSave.Visible = true;
                    btnAdminNext.Text = "finalizar";
                    btnAdminNext.Visible = false;
                    btnRgistrar.Visible = false;
                    if (Request.Cookies.Get("ctipo") != null)
                    {
                        if (Request.Cookies.Get("ctipo").Value == "proveedor")
                        {
                            step2.Visible = false;
                            step3.Visible = false;
                            step4.Visible = false;
                            lblDesc5.Text = "Paso 2";
                            lblstep5.Text = "2";
                        }
                    }

                    if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
                    {
                        BindDataAdmin(Request.QueryString["rfc"]);
                    }
                    else if (Request.QueryString["rfc"] != null)
                    {
                        BindDataAdmin(Request.QueryString["rfc"]);
                        CambiarLinks();
                        LLenarInfo();

                    }
                }
                else if (User.IsInRole("3") || User.IsInRole("4"))
                {
                    pUser.Visible = true;
                    pAdmin.Visible = false;

                    BindData();
                    LLenarInfo();

                    if (User.IsInRole("4"))
                    {
                        //Proveedor, oculto pasos no necesarios
                        step2.Visible = false;
                        step3.Visible = false;
                        step4.Visible = false;
                        lblDesc5.Text = "Paso 2";
                        lblstep5.Text = "2";

                    }
                }
            }
        }
        private void CambiarLinks()
        {
            step1.NavigateUrl = "~/F14/Secciones/InformacionCompania.aspx?rfc=" + Request.QueryString["rfc"];
            step2.NavigateUrl = "~/F14/Secciones/AgentesAduanales.aspx?rfc=" + Request.QueryString["rfc"];
            step3.NavigateUrl = "~/F14/Secciones/CompaniaFilial.aspx?rfc=" + Request.QueryString["rfc"];
            step4.NavigateUrl = "~/F14/Secciones/TipoServicioProductos.aspx?rfc=" + Request.QueryString["rfc"];
        }
        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            if (User.IsInRole("4"))
            {
                HttpContext.Current.Response.Redirect("informacionCompania.aspx");
            }
            else
            {
                HttpContext.Current.Response.Redirect("tiposervicioproductos.aspx");
            }
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
                    // Response.Write("<script>window.open ('../Viewer.aspx','_blank');</script>");
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message + "\n" + "No se encontro el archivo";
            }

        }

        protected void btnVer_Click(object sender, EventArgs e)
        {

        }
        private void BindData()
        {
            DataTable dt = new DataTable();
            if (User.IsInRole("1") || User.IsInRole("2"))
            {
                BindDataAdmin(Request.QueryString["rfc"]);

            }
            else
            {
                if (Request.Cookies.Get("id_comp") != null)
                {
                    dt = clsHerramientaBD.Existe("SELECT * FROM Table_ProgramaSeguridad WHERE ID_compania='" + Request.Cookies.Get("id_comp").Value + "'");
                    gvProgramas.DataSource = dt;
                    gvProgramas.DataBind();
                    ViewState["dirState"] = dt;
                    ViewState["sortdr"] = "Asc";
                }

            }
        }

        private void BindDataAdmin(string id)
        {
            DataTable dt = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM Table_ProgramaSeguridad WHERE ID_compania='" + id + "'");
            gvProgramas.DataSource = dt;
            gvProgramas.DataBind();
            ViewState["dirState"] = dt;
            ViewState["sortdr"] = "Asc";
        }
        protected void gvProgramas_RowEditing(object sender, GridViewEditEventArgs e)
        {
            /* Obtengo el texto de cada celda del gridview */
        }

        protected void gvProgramas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProgramas.EditIndex = -1;
            BindData();
        }

        protected void btnVer_Click1(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            string id = "", ruta = "";

            id = gvProgramas.Rows[rowIndex].Cells[0].Text;
            txtDescripcion.Text = gvProgramas.Rows[rowIndex].Cells[2].Text;
            txtCodigo.Text = gvProgramas.Rows[rowIndex].Cells[3].Text;
            ruta = gvProgramas.Rows[rowIndex].Cells[4].Text;

            AbrirArchivo(ruta);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            //string id_program = "";
            string codigo = "";
            string descripcion = "";
            string IDcompania = "";

            Byte[] file = null;
            codigo = txtCodigo.Text;
            descripcion = txtDescripcion.Text;

            if (fileCertificado.HasFiles)
            {
                if (Path.GetExtension(fileCertificado.FileName) != ".pdf")
                {
                    lblSucces.Text = "Extension de archivo invalida";
                }
                else
                {
                    string nombre = "";
                    BinaryReader reader = new BinaryReader(fileCertificado.PostedFile.InputStream);
                    file = reader.ReadBytes(fileCertificado.PostedFile.ContentLength);
                    string fname = "";

                    if(Request.Cookies.Get("id_comp")!= null)
                    {
                        IDcompania = Request.Cookies.Get("id_comp").Value;

                    }
                    else
                    {
                        if (Request.QueryString["rfc"] != null)
                        {
                            IDcompania = Request.QueryString["rfc"];
                        }
                    }
                    string fecha = DateTime.Now.ToString("dd-MM-yyyy-HH-mm-ss");

                    DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE RFC='" + IDcompania + "'");
                    if (dt.Rows.Count > 0)
                    {
                        nombre = dt.Rows[0]["Nombre_comercial"].ToString().Trim();
                    }

                    string link = "/Archivos/" + nombre + "/certificados";

                    //Checho si existe la carpeta del usuario
                    if (!Directory.Exists(Server.MapPath(link)))
                    {
                        DirectoryInfo di = System.IO.Directory.CreateDirectory(Server.MapPath(link));

                    }
                    //Ejemplo: 14-11-2022-10:19:30_F16
                    fname = link + "/" + fecha + "_" + descripcion + fileCertificado.FileName.Substring(fileCertificado.FileName.Length - 4, 4);
                    string location = Server.MapPath(fname);
                    fileCertificado.SaveAs(location);

                    //Guardo la ruta completa para ser alamacenada en la base de datos
                    string ruta = fname.ToString();

                    lblSucces.Text = clsF14.Insertar_ProgramaSeguridad(IDcompania, descripcion, codigo, ruta); ;

                }
            }
            else
            {
                if(Request.Cookies.Get("id_comp") != null)
                {
                    IDcompania = Request.Cookies.Get("id_comp").Value;
                }
                else
                {
                IDcompania = Request.QueryString["rfc"];
                }

                lblSucces.Text = "No hay documento:" + clsF14.Insertar_ProgramaSeguridad(IDcompania, descripcion, codigo, "null");

            }

            BindData();


        }

        protected void gvProgramas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            TableCell cell = gvProgramas.Rows[e.RowIndex].Cells[0];
            TableCell url = gvProgramas.Rows[e.RowIndex].Cells[3];
            TableCell compania = gvProgramas.Rows[e.RowIndex].Cells[1];
            string id = cell.Text;

            try
            {
                lblError.Text = clsHerramientaBD.ExecuteSql("DELETE FROM Table_ProgramaSeguridad WHERE ID='" + id + "' AND ID_compania='" + compania.Text + "'");

            }
            catch (Exception ex)
            {

                lblError.Text = ex.Message;
            }
            finally
            {
                if (url.Text != "null")
                {
                    System.IO.File.Delete(MapPath(url.Text));
                }
            }
            BindData();
            lblExito.Text = "Registro eliminado con exito";
        }

        protected void gvProgramas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
        //boton en tabla
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvProgramas.Rows[rowIndex].Cells[0].Text;
            string Descripcion = gvProgramas.Rows[rowIndex].Cells[2].Text;
            string codigo = gvProgramas.Rows[rowIndex].Cells[3].Text;
            string Url = gvProgramas.Rows[rowIndex].Cells[4].Text;

            txtCodigo.Text = codigo;
            txtDescripcion.Text = Descripcion;
            hfID.Value = Id;
            hfRuta.Value = Url;

            btnAdd.Visible = false;
            btnEditar.Visible = true;
            btnCancelar.Visible = true;
            lblEditando.Visible = true;
        }

        //boton editar registro
        protected void btnEditar_Click(object sender, EventArgs e)
        {

            string codigo = "";
            string descripcion = "";
            string IDcompania = "";

            Byte[] file = null;
            codigo = txtCodigo.Text;
            descripcion = txtDescripcion.Text;
            IDcompania = hfID.Value;
            if (fileCertificado.HasFile)
            {
                //si hay archivo subido en FileUpload
                if (Path.GetExtension(fileCertificado.FileName) != ".pdf")
                {
                    lblSucces.Text = "Extension de archivo invalida";
                }
                else
                {
                    BinaryReader reader = new BinaryReader(fileCertificado.PostedFile.InputStream);
                    file = reader.ReadBytes(fileCertificado.PostedFile.ContentLength);
                    string fname = "";

                    if (Request.Cookies.Get("id_comp") != null)
                    {
                        IDcompania = Request.Cookies.Get("id_comp").Value;

                    }
                    else if (Request.QueryString["rfc"] != null)
                    {
                        IDcompania = Request.QueryString["rfc"];

                    }
                    string fecha = DateTime.Now.ToString("dd-MM-yyyy");

                    string link = "/Archivos/" + IDcompania + "/certificados";

                    //Checho si existe la carpeta del usuario
                    if (!Directory.Exists(Server.MapPath(link)))
                    {
                        DirectoryInfo di = System.IO.Directory.CreateDirectory(Server.MapPath(link));

                    }
                    //Ejemplo: 14-11-2022-10:19:30_F16
                    fname = link + "/" + fecha + "_" + descripcion + fileCertificado.FileName.Substring(fileCertificado.FileName.Length - 4, 4);
                    string location = Server.MapPath(fname);
                    fileCertificado.SaveAs(location);

                    //Guardo la ruta completa para ser alamacenada en la base de datos
                    string ruta = fname.ToString();

                    lblSucces.Text = "Se guardo el archivo " + clsF14.Insertar_ProgramaSeguridad(IDcompania, descripcion, codigo, ruta, hfID.Value);

                    //Response.Redirect(Request.RawUrl);

                }

            }
            else
            {
                //Si hay o no un archivo 
                if (Request.QueryString["rfc"]!= null)
                {
                    lblExito.Text = clsF14.Insertar_ProgramaSeguridad(Request.QueryString["rfc"], txtDescripcion.Text, txtCodigo.Text, hfRuta.Value, hfID.Value);

                }
                else if(Request.Cookies.Get("id_comp") != null)
                {
                    lblExito.Text = clsF14.Insertar_ProgramaSeguridad(Request.Cookies.Get("id_comp").Value, txtDescripcion.Text, txtCodigo.Text, hfRuta.Value, hfID.Value);

                }
            }

            btnEditar.Visible = false;
            btnCancelar.Visible = false;
            btnAdd.Visible = true;
            txtCodigo.Text = "";
            txtDescripcion.Text = "";
            lblEditando.Visible = false;

            BindData();
        }
        //cancelar registro
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            btnCancelar.Visible = false;
            btnEditar.Visible = false;
            lblEditando.Visible = false;
            btnAdd.Visible = true;


            txtCodigo.Text = "";
            txtDescripcion.Text = "";

        }


        protected void gvProgramas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            BindData();
            gvProgramas.PageIndex = e.NewPageIndex;
            gvProgramas.DataBind();
        }

        protected void gvProgramas_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtslt = (DataTable)ViewState["dirState"];
            if (dtslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }

                gvProgramas.DataSource = dtslt;
                gvProgramas.DataBind();
            }

        }

        protected void btnAdminBack_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null)
            {
                if (Request.Cookies.Get("ctipo") != null)
                {
                    if (Request.Cookies.Get("ctipo").Value == "proveedor")
                    {
                        Response.Redirect("~/f14/secciones/InformacionCompania.aspx?rfc=" + Request.QueryString["rfc"]);

                    }
                    else
                    {
                        Response.Redirect("~/f14/secciones/TipoServicioProductos.aspx?rfc=" + Request.QueryString["rfc"]);

                    }
                }
                Response.Redirect("~/f14/secciones/TipoServicioProductos.aspx?rfc=" + Request.QueryString["rfc"]);
            }
            else if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                Response.Redirect("~/f14/secciones/TipoServicioProductos.aspx?accion=new&rfc=" + Request.QueryString["rfc"]);

            }
        }

        protected void btnAdminH_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/admin/index.aspx");
        }

        protected void btnAdminNext_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["rfc"] != null)
            {
                if (Request.Cookies.Get("tipo") != null)
                {
                    wsBaseDatos wsBaseDatos = new wsBaseDatos();
                    wsBaseDatos.Actualizar_Estado(Request.QueryString["rfc"], "F14", "100%");

                    //AlertSucces
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "AlertSucces();", true);

                    Response.Redirect("~/admin/carpetilla/carpetilla.aspx?id=" + Request.QueryString["rfc"] + "&type=" + Request.Cookies.Get("tipo").Value);
                }
                else
                {
                    wsBaseDatos wsBaseDatos = new wsBaseDatos();
                    wsBaseDatos.Actualizar_Estado(Request.QueryString["rfc"], "F14", "100%");

                    //AlertSucces
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", "AlertSucces();", true);

                    Response.Redirect("~/admin/index.aspx");
                }

            }
            else if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
            {
                if (Request.Cookies.Get("tipo") != null)
                {
                    Response.Redirect("~/admin/carpetilla/carpetilla.aspx?id=" + Request.QueryString["rfc"] + "&type=" + Request.Cookies.Get("tipo").Value);
                }
                //Response.Redirect("~/F43/MapeoFlujo.aspx?accion=new&rfc=" + Request.QueryString["rfc"]);
            }
        }

        protected void LLenarInfo()
        {
            //Obtengo la pregunta xd
            if (Request.Cookies.Get("id_comp") != null)
            {
                DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_ctpat WHERE ID_compania = '" + Request.Cookies.Get("id_comp").Value + "'");
                if (dt.Rows.Count > 0)
                {
                    //Llenar campos
                    if (dt.Rows[0]["Estatus"].ToString() == "0")
                    {
                        divFecha.Visible = false;
                    }

                    btnRgistrar.Text = "actualizar";
                    if (dt.Rows[0]["Programas"].ToString() == "si")
                    {
                        radCertificadoSi.Checked = true;
                        pV2.Visible= true;  
                    }
                    else
                    {
                        radCertificadoNo.Checked = true;

                    }
                }

            }
            else if (Request.QueryString["rfc"] != null)
            {
                DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Table_ctpat WHERE ID_compania = '" + Request.QueryString["rfc"] + "'");
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["Programas"].ToString() == "si")
                    {
                        radCertificadoSi.Checked = true;
                        pV2.Visible = true;

                    }
                    else
                    {
                        radCertificadoNo.Checked = true;

                    }
                }
            }

        }

        protected void btnOpcionSi_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/F43/MapeoFlujo.aspx?res=Exito");
        }

        protected void btnOpcionNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/usuario/user_index.aspx?res=f14");
        }

        protected void btnModal_Click(object sender, EventArgs e)
        {
            
            if (gvProgramas.Rows.Count != 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Trigger", "$('#btnModalJS').trigger('click');", true);

            }
            else
            {
                lblError.Text = "Por favor ingrese un certificado.";
            }

        }

        protected void btnCasa_Click(object sender, EventArgs e)
        {
            string ctpat = ddstatus.SelectedValue;
            string fecha = dtFechaVal.Text;
            string cuenta = txtCTPATCuenta.Text;
            string opcion = "";
            wsBaseDatos wsBaseDatos = new wsBaseDatos();

            if (radCertificadoSi.Checked)
            {
                opcion = "si";
            }
            else if (radCertificadoNo.Checked)
            {
                opcion = "no";
            }

            if (ctpat != "0")
            {
                if (Convert.ToInt32(fecha.Substring(0, 4)) < 2000)
                {
                    lblfechaVal.Visible = true;
                }
                else if (cuenta == "")
                {
                    lblcuentaVal.Visible = true;

                }
                else if (Convert.ToInt32(fecha.Substring(0, 4)) < 2000 && cuenta == "")
                {
                    lblfechaVal.Visible = true;
                    lblcuentaVal.Visible = true;

                }
                else
                {
                    if (Request.Cookies.Get("id_comp") != null)
                    {
                        //validar campos

                        lblError.Text = wsBaseDatos.insertar_estatus(Request.Cookies.Get("id_comp").Value, ctpat, fecha, cuenta, opcion);

                        lblError.Text += clsF14.Insertar_Documento(Request.Cookies.Get("id_comp").Value, "F14", "null", "revision");

                        Response.Redirect("~/usuario/user_index.aspx?res=f14");

                    }
                    else
                    {
                        lblError.Text = "Error en el registro";
                    }
                }
            }
            else
            {
                if (Request.Cookies.Get("id_comp") != null)
                {
                    //validar campos

                    lblError.Text = wsBaseDatos.insertar_estatus(Request.Cookies.Get("id_comp").Value, ctpat, fecha, "", opcion);
                    lblError.Text += clsF14.Insertar_Documento(Request.Cookies.Get("id_comp").Value, "F14", "null", "revision");
                    Response.Redirect("~/usuario/user_index.aspx?res=f14");


                }
                else
                {
                    lblError.Text = "Error en el registro";
                }
            }
        }

        protected void btnAdminSave_Click1(object sender, EventArgs e)
        {
            string ctpat = ddstatus.SelectedValue;
            string fecha = dtFechaVal.Text;
            string cuenta = txtCTPATCuenta.Text;
            string opcion = "";
            string rfc = Request.QueryString["rfc"];
            wsBaseDatos wsBaseDatos = new wsBaseDatos();

            if (radCertificadoSi.Checked)
            {
                opcion = "si";
            }
            else if (radCertificadoNo.Checked)
            {
                opcion = "no";
            }

            if (ctpat != "0")
            {
                if (fecha!=null)
                {
                    if (Convert.ToInt32(fecha.Substring(0, 4)) < 2000)
                    {
                        lblfechaVal.Visible = true;
                    } 
                }
                 if (cuenta == "")
                {
                    lblcuentaVal.Visible = true;

                }
                 if (Convert.ToInt32(fecha.Substring(0, 4)) < 2000 && cuenta == "")
                {
                    lblfechaVal.Visible = true;
                    lblcuentaVal.Visible = true;

                }
                else
                {
                    if (rfc != string.Empty)
                    {
                        //validar campos

                        lblError.Text = wsBaseDatos.insertar_estatus(rfc, ctpat, fecha, cuenta, opcion);

                        lblError.Text += clsF14.Insertar_Documento(rfc, "F14", "null", "revision");

                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "Trigger", "$('#btnModalJS').trigger('click');", true);
                        lblError.Text = "Informacion actualizada";
                    }
                    else
                    {
                        lblError.Text = "Error en el registro";
                    }
                }

                 btnAdminNext.Visible = true;  
            }
            else
            {
                if (rfc != null)
                {
                    //validar campos
                    lblError.Text = wsBaseDatos.insertar_estatus(rfc, ctpat, fecha, "", opcion);
                    lblError.Text += clsF14.Insertar_Documento(rfc, "F14", "null", "revision");
                    lblError.Text = "Informacion actualizada";
                    btnAdminNext.Visible = true;

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Trigger", "$('#btnModalJS').trigger('click');", true);
                }
                else
                {
                    lblError.Text = "Error en el registro";
                }
            }

            if(opcion == "si")
            {
                pV2.Visible = true;
            }
            else
            {
                pV2.Visible = false;
            }

        }

        protected void ddstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            string opcion = ddstatus.SelectedValue;
            switch (opcion)
            {
                case "0":
                    divFecha.Visible = false;
                    txtCTPATCuenta.Text = string.Empty;
                    dtFechaVal.Text = string.Empty;
                    break;
                case "1":
                    divFecha.Visible = true;
                    break;
                case "2":
                    divFecha.Visible = true;

                    break;
                default:
                    break;
            }

        }

        protected void btnRgistrar_Click(object sender, EventArgs e)
        {
            lblfechaVal.Visible = false;
            lblcuentaVal.Visible = false;
            lblOpciones.Visible = false;


            string ctpat = ddstatus.SelectedValue;
            string fecha = dtFechaVal.Text;
            string cuenta = txtCTPATCuenta.Text;
            string opcion = "";
            wsBaseDatos wsBaseDatos = new wsBaseDatos();

            if (radCertificadoSi.Checked)
            {
                opcion = "si";
            }
            else if (radCertificadoNo.Checked)
            {
                opcion = "no";
            }
            else
            {
                lblOpciones.Visible = true;    
            }

            if (ctpat != "0")
            {
                int error = 0;
                if (fecha != string.Empty)
                {
                    if (Convert.ToInt32(fecha.Substring(0, 4)) < 2000)
                    {
                        lblfechaVal.Visible = true;
                        error++;
                    }
                    if (cuenta == "")
                    {
                        lblcuentaVal.Visible = true;
                        error++;    
                    }
                    if (Convert.ToInt32(fecha.Substring(0, 4)) < 2000 && cuenta == "")
                    {
                        lblfechaVal.Visible = true;
                        lblcuentaVal.Visible = true;
                        error++;    
                    }
                }
                else
                {
                    lblfechaVal.Text = "Seleccione una fecha";
                    lblfechaVal.Visible = true;
                    error++;
                }
                if (cuenta == "")
                {
                    lblcuentaVal.Visible = true;
                    error++;

                }
                 if (fecha == "" && cuenta == "")
                {
                    lblfechaVal.Text = "Seleccione una fecha";

                    lblfechaVal.Visible = true;
                    lblcuentaVal.Visible = true;
                    error++;

                }

                 if(error == 0 )
                {
                    if (Request.Cookies.Get("id_comp") != null)
                    {
                        if (radCertificadoSi.Checked)
                        {

                            lblError.Text = wsBaseDatos.insertar_estatus(Request.Cookies.Get("id_comp").Value, ctpat, fecha, cuenta, opcion);

                            lblError.Text += clsF14.Insertar_Documento(Request.Cookies.Get("id_comp").Value, "F14", "", "revision");

                            pV2.Visible = true;
                            btnModal.Visible = true;

                            

                        }
                        else if (radCertificadoNo.Checked)
                        {
                            pV2.Visible = false;
                            btnModal.Visible = false;

                            lblError.Text = wsBaseDatos.insertar_estatus(Request.Cookies.Get("id_comp").Value, ctpat, fecha, cuenta, opcion);

                            lblError.Text += clsF14.Insertar_Documento(Request.Cookies.Get("id_comp").Value, "F14", "", "revision");


                            Page.ClientScript.RegisterStartupScript(this.GetType(), "Trigger", "$('#btnModalJS').trigger('click');", true);

                        }
                        else
                        {
                            lblOpciones.Visible = true;
                        }
                    }
                    else
                    {
                        lblError.Text = "Error en el registro";

                    }
                }
            }
            else
            {

                if (Request.Cookies.Get("id_comp") != null) {
                    //validar campos

                    if (radCertificadoSi.Checked)
                    {
                        lblError.Text = wsBaseDatos.insertar_estatus(Request.Cookies.Get("id_comp").Value, ctpat, fecha, cuenta, opcion);

                        lblError.Text += clsF14.Insertar_Documento(Request.Cookies.Get("id_comp").Value, "F14", "", "revision");

                        pV2.Visible = true;
                        btnModal.Visible = true;

                    }
                    else if (radCertificadoNo.Checked)
                    {
                        pV2.Visible = false;
                        btnModal.Visible = false;

                        lblError.Text = wsBaseDatos.insertar_estatus(Request.Cookies.Get("id_comp").Value, ctpat, fecha, cuenta, opcion);

                        lblError.Text += clsF14.Insertar_Documento(Request.Cookies.Get("id_comp").Value, "F14", "", "revision");


                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Trigger", "$('#btnModalJS').trigger('click');", true);

                    }
                    else
                    {
                        lblOpciones.Visible = true;
                    }
                }
                else
                {
                    lblError.Text = "Error en el registro";
                }
            }


           
        }
    }
}

 