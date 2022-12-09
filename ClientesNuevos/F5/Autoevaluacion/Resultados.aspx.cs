using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.F5.Autoevaluacion
{
    public partial class Resultados : System.Web.UI.Page
    {
        DataTable dt, data;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(User.IsInRole("1") || User.IsInRole("2"))
                {
                    btnFinalizar.PostBackUrl = "~/admin/index.aspx";

                    if (Request.QueryString["rfc"]!= null)
                    {
                        dt = clsHerramientaBD.Existe("SELECT * FROM Table_F5 WHERE ID_compania='" + Request.QueryString["rfc"].ToString() + "'");
                        data = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_compania='" + Request.QueryString["rfc"].ToString() + "'");

                        if (dt.Rows.Count != 0)
                        {
                            lblFecha.Text = dt.Rows[0]["Fecha"].ToString().Substring(0, 10);
                        }
                        lblEmpresa.Text = data.Rows[0]["Nombre_comp"].ToString();

                        
                    }
                }
                else if (User.IsInRole("3") || User.IsInRole("4"))
                {
                    dt = clsHerramientaBD.Existe("SELECT * FROM Table_F5 WHERE ID_compania='" + Request.Cookies.Get("id_comp").Value + "'");
                    data = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_user='" + Request.Cookies.Get("id").Value + "'");
                    if (dt.Rows.Count != 0)
                    {
                        lblFecha.Text = dt.Rows[0]["Fecha"].ToString().Substring(0, 10);
                    }
                    else
                    {
                        lblFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");

                    }
                    lblEmpresa.Text = data.Rows[0]["Nombre_comp"].ToString();
                }
            }
        }

       

    }
}