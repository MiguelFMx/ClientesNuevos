using System;
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

namespace ClientesNuevos.F14.Seccioness
{
    public partial class InformacionCadenaSuministro : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //Admin / user
                if(User.IsInRole("1") || User.IsInRole("2"))
                {
                    pUser.Visible=false;
                    pAdmin.Visible = true;
                    if (Request.QueryString["rfc"] != null && Request.QueryString["accion"] != null)
                    {
                       
                    }
                    else if(Request.QueryString["rfc"] != null)
                    {
                        BindDataAdmin(Request.QueryString["rfc"]);
                        CambiarLinks();
                    }
                }else if(User.IsInRole("3") || User.IsInRole("4"))
                {
                    pUser.Visible = true;
                    pAdmin.Visible = false;

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
                
                /*
                if (Request.QueryString["res"] != null)
                {
                    string resultado = HttpContext.Current.Request.QueryString["res"].ToString();
                    if (resultado == "Exito")
                    {
                        pAlert.Visible = true;
                    }
                }
                else
                {
                    pAlert.Visible = false;
                }

                

                */
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
            if(Request.Cookies.Get("ctipo").Value == "proveedor")
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
                dt = clsHerramientaBD.Existe("SELECT * FROM Table_ProgramaSeguridad WHERE ID_compania='" + Request.Cookies.Get("id_comp").Value + "'");
                gvProgramas.DataSource = dt;
                gvProgramas.DataBind();
                ViewState["dirState"] = dt;
                ViewState["sortdr"] = "Asc";
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
            string id = "", ruta="";

            id = gvProgramas.Rows[rowIndex].Cells[0].Text;
            txtDescripcion.Text = gvProgramas.Rows[rowIndex].Cells[1].Text;
            txtCodigo.Text = gvProgramas.Rows[rowIndex].Cells[2].Text;
            ruta = gvProgramas.Rows[rowIndex].Cells[3].Text;

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
                    BinaryReader reader = new BinaryReader(fileCertificado.PostedFile.InputStream);
                    file = reader.ReadBytes(fileCertificado.PostedFile.ContentLength);

                    IDcompania = Request.Cookies.Get("id_comp").Value;
                    string fecha = DateTime.Now.ToString("dd-MM-yyyy");
                    string fname = "/Archivos/usuario/" + fecha + "_" + descripcion + "_" + fileCertificado.FileName;
                    fileCertificado.SaveAs(Server.MapPath(fname));

                    lblSucces.Text = "Se guardo el archivo " + clsF14.Insertar_ProgramaSeguridad(IDcompania, descripcion, codigo, fname.ToString()); ;

                    Response.Redirect(Request.RawUrl);

                }
            }
            else
            {
                lblSucces.Text = "No hay documento " + clsF14.Insertar_ProgramaSeguridad(IDcompania, descripcion, codigo, "null");
                Response.Redirect(Request.RawUrl);
            }

        }

        protected void gvProgramas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            TableCell cell = gvProgramas.Rows[e.RowIndex].Cells[0];
            TableCell url = gvProgramas.Rows[e.RowIndex].Cells[3];
            string id = cell.Text;

            try
            {
                lblError.Text = clsHerramientaBD.ExecuteSql("DELETE FROM Table_ProgramaSeguridad WHERE ID='" + id + "' AND ID_compania='" + Request.Cookies.Get("id_comp").Value + "'");

            }
            catch (Exception ex)
            {

                lblError.Text=ex.Message;
            }
            finally
            {
                if(url.Text != "null")
                {
                    File.Delete(MapPath(url.Text));
                }
            }
            Response.Redirect(Request.RawUrl);
            //lblExito.Text = "Registro eliminido con exito";
        }

        protected void gvProgramas_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
        //boton en tabla
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;

            string Id = gvProgramas.Rows[rowIndex].Cells[0].Text;
            string Descripcion = gvProgramas.Rows[rowIndex].Cells[1].Text;
            string codigo = gvProgramas.Rows[rowIndex].Cells[2].Text;
            string Url = gvProgramas.Rows[rowIndex].Cells[3].Text;

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
            btnEditar.Visible = false;
            btnCancelar.Visible = false;
            btnAdd.Visible = true;
            txtCodigo.Text = "";
            txtDescripcion.Text = "";
            lblEditando.Visible = false;

            if (fileCertificado.HasFile)
            {
                //si hay archivo subido en FileUpload


            }
            else
            {
                //Si hay o no un archivo 
                lblExito.Text = clsF14.Insertar_ProgramaSeguridad(Request.Cookies.Get("id_comp").Value, txtDescripcion.Text, txtCodigo.Text, hfRuta.Value, hfID.Value);
            }

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


        protected void GuardarDocumento()
        {
            
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
            if(dtslt.Rows.Count > 0)
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

        }

        protected void btnAdminSave_Click(object sender, EventArgs e)
        {

        }
    }
} 