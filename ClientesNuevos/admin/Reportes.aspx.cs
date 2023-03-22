using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.admin
{
    public partial class Reportes : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //llenarGrid();
                ActivosInactivos();
                ContadorOP();
                BindGrid();
            }
        }


        protected void llenarGrid()
        {
            DataTable dt = new DataTable();
            DataTable dt_Display = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania");
            string nombre, nombreCompleto, fecha, estatus, RFC, tipo;
            string clase = "";

            dt_Display.Columns.Add(new DataColumn("nombre"));
            dt_Display.Columns.Add(new DataColumn("nombreCompleto"));
            dt_Display.Columns.Add(new DataColumn("fecha"));
            dt_Display.Columns.Add(new DataColumn("estatus"));
            dt_Display.Columns.Add(new DataColumn("clase"));
            dt_Display.Columns.Add(new DataColumn("rfc"));
            dt_Display.Columns.Add(new DataColumn("tipo"));

            foreach (DataRow row in dt.Rows)
            {


                nombre = row["Nombre_comp"].ToString();
                nombreCompleto = row["Nombre_comercial"].ToString();
                fecha = row["Fecha_registro"].ToString().Substring(0, 10);
                estatus = row["Estatus"].ToString();

                if (row["Estatus"].ToString() == "activo")
                {
                    clase = "etiqueta";
                }
                else if (row["Estatus"].ToString() == "inactivo")
                {
                    clase = "etiqueta peligro";
                }

                RFC = row["RFC"].ToString();

                if (row["Tipo_persona"].ToString() == "1")
                {
                    tipo = "fisica";
                }
                else if (row["Tipo_persona"].ToString() == "0")
                {
                    tipo = "moral";
                }
                else
                {
                    tipo = "extranjero";
                }


                dt_Display.Rows.Add(new Object[] { nombre, nombreCompleto, fecha, estatus, clase, RFC, tipo });
            }


            // gvComp.DataSource = dt_Display;
            // gvComp.DataBind();

        }

        protected void ActivosInactivos()
        {
            DataTable dtRegistros = new DataTable();
            int cant = 0;
            int inac = 0;
            int op = 0;
            string fecha = "";
            string mes = "";
            dtRegistros = clsHerramientaBD.Existe("SELECT * FROM Table_compania");

            if (dtRegistros.Rows.Count > 0)
            {
                for (int i = 0; i < dtRegistros.Rows.Count; i++)
                {

                    if (dtRegistros.Rows[i]["Estatus"].ToString() == "activo")
                    {
                        cant++;
                    }
                    else
                    {
                        inac++;
                    }
                    //if(dtRegistros.Rows[i]["Fecha_registro"].ToString().Substring())

                }
            }

            lblActivos.Text = cant.ToString();
            lblInactivos.Text = inac.ToString();
            lblOP.Text = op.ToString();
        }
        /*
         fecha = dtRegistros.Rows[i]["Fecha_registro"].ToString().Substring(3, 2);
                    mes = DateTime.Now.ToString("MM");
         
         */



        protected void ContadorOP()
        {
            DataTable dtComp = new DataTable();
            DataTable dtDoc = new DataTable();
            DataTable dtActDoc = new DataTable();
            int sinOP = 0;
            int OPdes = 0;
            int cantidad = 0;
            string lapso = "";
            string update = "";
            dtActDoc = clsHerramientaBD.Existe("SELECT * FROM Act_Docs WHERE Documento='OP'");
            if (dtActDoc.Rows.Count > 0)
            {
                cantidad = Convert.ToInt32(dtActDoc.Rows[0]["cantidad"].ToString());
                lapso = dtActDoc.Rows[0]["lapso"].ToString();

            }

            dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE Estatus='activo' AND Tipo_persona!='2'");
            if (dtComp.Rows.Count > 0)
            {
                for (int i = 0; i < dtComp.Rows.Count; i++)
                {
                    string id = dtComp.Rows[i]["ID_compania"].ToString();
                    if (dtComp.Rows[i]["Tipo_persona"].ToString() != "2")
                    {
                        dtDoc = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE Documento='Opinion positiva' AND ID_compania='" + id + "'");
                        if (dtDoc.Rows.Count > 0)
                        {
                            string mesA = DateTime.Now.ToString("MM");
                            string anioA = DateTime.Now.ToString("yyyy");
                            //08/12/2022
                            int mesDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(3, 2));
                            int anioDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(6, 4));
                            int diaDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(0, 2));

                            DateTime FechaRegistrada = new DateTime(anioDoc, mesDoc, diaDoc);
                            DateTime fechaActualizacion = DateTime.Now.Date;
                            switch (lapso)
                            {
                                case "mensual": //year, month, day
                                                //si es la fecha actual es mayor que la fecha del documento significa que esta actualizado
                                    FechaRegistrada = FechaRegistrada.AddMonths(cantidad);
                                    if (FechaRegistrada.Month == fechaActualizacion.Month || FechaRegistrada.Month < fechaActualizacion.Month)
                                    {
                                        update = CambiarEstado(id);
                                        if(update != "")
                                        {
                                            ScriptManager.RegisterStartupScript(upScript, typeof(string), "Simular", "alert('" + update + "')", true);

                                           // ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+update+"')", true);
                                            break;
                                        }
                                        else
                                        {
                                            OPdes++;

                                        }

                                    }
                                    break;
                                case "anual":
                                    FechaRegistrada = FechaRegistrada.AddYears(cantidad);
                                    if (FechaRegistrada.Year == fechaActualizacion.Year)
                                    {
                                        update = CambiarEstado(id);
                                        if (update != "")
                                        {
                                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + update + "')", true);
                                            break;
                                        }
                                        else
                                        {
                                            OPdes++;
                                        }
                                    }
                                    break;
                            }
                        }
                        else
                        {
                            sinOP++;
                        }
                    }
                }
            }
            lblOP.Text = OPdes.ToString();
            lblSinOP.Text = sinOP.ToString();
        }

        public string CambiarEstado(string rfc)
        {
            string accion = clsHerramientaBD.ExecuteSql("UPDATE Table_Documentos SET Estatus = 'act' WHERE ID_compania='" + rfc + "' AND Documento='Opinion positiva'");
            if(accion != "")
            {
                return "Error: " + accion;
            }
            else
            {
                return "";
            }
        }

        protected void ddCorreo_SelectedIndexChanged(object sender, EventArgs e)
        {
            (lvCorreo.FindControl("DataPager2") as DataPager).PageSize = Convert.ToInt32(ddCorreo.SelectedValue);
            BindGrid();
        }

        protected void btnBuscarCorreo_Click(object sender, EventArgs e)
        {
            string tipo = btnBuscarCorreo.Attributes["data-accion"].ToString(); //data-accion="buscar"
            if (tipo == "buscar")
            {
                btnBuscarCorreo.Attributes["data-accion"] = "limpiar";
                btnBuscarCorreo.Text = "<i class='bi bi-x-lg'></i>";
            }
            else
            {
                btnBuscarCorreo.Attributes["data-accion"] = "buscar";
                btnBuscarCorreo.Text = "<i class='bi bi-search'></i>";
                txtBuscarCorreo.Text = "";
            }
            BindGrid();
        }

        protected void lvCorreo_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Mail")
            {
                txtPara.Text += e.CommandArgument.ToString() + ", ";
            }
        }

        protected void lvCorreo_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {

        }

        protected void lvCorreo_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvCorreo.FindControl("DataPager2") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindGrid();
        }

        private void BindGrid()
        {
            wsReportes wsReportes = new wsReportes();
            DataTable data = wsReportes.getTabla();
            if (txtBuscarCorreo.Text != "")
            {
                string dato = txtBuscarCorreo.Text;
                
                string consulta = "Nombre LIKE '%"+dato+"%' or Puesto LIKE '%"+dato+"%' or Correo LIKE '%"+dato+"%' or Compania LIKE '%"+dato+"%'";
                //DataRow[] founds  = data.Select(consulta, "Compania");
                data.DefaultView.RowFilter = consulta;
            }

            data.DefaultView.Sort = "Compania";
            lvCorreo.DataSource = data;
            lvCorreo.DataBind();
           
        }

    }
}