using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Optimization;
using System.Net;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.F14.Seccioness
{
    public partial class InformacionCadenaSuministro : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            /*Quitar esta parte
             if (Request.Cookies.Get("ctipo").Value == "proveedor")
             {
                 step2.Visible = false;
                 step3.Visible = false;
                 step4.Visible = false;
                 lblDesc5.Text = "Paso 2";
                 lblstep5.Text = "2";
             }*/

            if (!IsPostBack)
            {
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

                if (Request.QueryString["id"] != null && Request.QueryString["admin"] != null)
                {
                    CambiarLinks();
                }

                gvProgramas.DataSource = clsHerramientaBD.Existe("SELECT * FROM Table_ProgramaSeguridad WHERE ID_compania='" + Request.Cookies.Get("id_comp").Value + "'");
                gvProgramas.DataBind();

            }
        }
        private void CambiarLinks()
        {
            step1.NavigateUrl = "~/F14/Secciones/InformacionCompania.aspx?admin=si&id=" + Request.QueryString["id"];
            step2.NavigateUrl = "~/F14/Secciones/AgentesAduanales.aspx?admin=si&id=" + Request.QueryString["id"];
            step3.NavigateUrl = "~/F14/Secciones/CompaniaFilial.aspx?admin=si&id=" + Request.QueryString["id"];
            step4.NavigateUrl = "~/F14/Secciones/TipoServicioProductos.aspx?admin=si&id=" + Request.QueryString["id"];
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
            string FilePath = @flocation;
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
            gvProgramas.DataSource = clsHerramientaBD.Existe("SELECT * FROM Table_ProgramaSeguridad WHERE ID_compania='" + Request.Cookies.Get("id_comp").Value + "'");
            gvProgramas.DataBind();
        }
        protected void gvProgramas_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = gvProgramas.SelectedIndex;
            gvProgramas.EditIndex = e.NewEditIndex;

            BindData();

           
            
        }

        protected void gvProgramas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProgramas.EditIndex = -1;
            BindData();
        }

        protected void btnVer_Click1(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            txtCodigo.Text = gvProgramas.Rows[rowIndex].Cells[2].Text;
            txtDescripcion.Text = gvProgramas.Rows[rowIndex].Cells[1].Text; 
        }
    }
}