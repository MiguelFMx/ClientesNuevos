using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientesNuevos.App_Code;
using static System.Net.Mime.MediaTypeNames;

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
                    btnAtras.Text = "<i class=\"bi bi-arrow-left\"></i>";
                    btnAtras.Attributes["title"] = "Regresar";
                    if (Request.QueryString["rfc"]!= null)
                    {
                        dt = clsHerramientaBD.Existe("SELECT * FROM Table_F5 WHERE ID_compania='" + Request.QueryString["rfc"].ToString() + "'");
                        data = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_compania='" + Request.QueryString["rfc"].ToString() + "'");

                        if (dt.Rows.Count != 0)
                        {
                            lblFecha.Text = dt.Rows[0]["Fecha"].ToString().Substring(0, 10);
                        }
                        lblEmpresa.Text = data.Rows[0]["Nombre_comp"].ToString();

                        
                        if(Request.Cookies.Get("id_comp") != null && Request.Cookies.Get("tipo") != null)
                        {
                            btnAtras.PostBackUrl = "~/admin/carpetilla/carpetilla?id=" + Request.Cookies.Get("id_comp").Value + "&type=" + Request.Cookies.Get("tipo").Value;
                        }
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

                ObtenerCuestionario();
            }
        }

       
        protected void ObtenerCuestionario()
        {
            DataTable dtCuestionario = new DataTable();
            if (Request.QueryString["rfc"] != null)
            {
                dtCuestionario = clsHerramientaBD.Existe("SELECT * FROM Table_CuestionarioCTPAT WHERE ID_Cuestionario = '" + Request.QueryString["rfc"] + "F5C'");
            }
            else if (Request.Cookies.Get("id_comp") != null)
            {
                dtCuestionario = clsHerramientaBD.Existe("SELECT * FROM Table_CuestionarioCTPAT WHERE ID_Cuestionario = '" +Request.Cookies.Get("id_comp").Value+ "F5C'");
            }

            if(dtCuestionario.Rows.Count > 0)
            {
                lbl100c.Text = dtCuestionario.Rows[0]["p100"].ToString();
                lbl120c.Text = dtCuestionario.Rows[0]["p120"].ToString();
                lbl130c.Text = dtCuestionario.Rows[0]["p130"].ToString();
                if(lbl130c.Text == "SI")
                {
                    preguntaDinamicaSi.Visible = true;
                    tr1311c.Visible = true;
                    lbl1311c.Text = dtCuestionario.Rows[0]["p1311"].ToString();

                   
                    tr1313c.Visible = true;
                    string res1312 = "";
                    switch (dtCuestionario.Rows[0]["p1312"].ToString())
                    {
                        case "0":
                            res1312 = "Certificado";
                            break;
                        case "1":
                            res1312 = "Certificado validado";
                            break;
                        case "2":
                            res1312 = "Certificado no validado";
                            break;
                        default:
                            break;
                    }
                    lbl1312c.Text = res1312 ;

                    string res1313 = "";
                    switch (dtCuestionario.Rows[0]["p1313"].ToString())
                    {
                        case "0":
                            res1313 = "Actualizado";
                            break;
                        case "1":
                            res1313 = "En revision";
                            break;
                       
                        default:
                            break;
                    }
                    lbl1313c.Text = res1313;

                }
                else
                {
                    preguntaDinamicaNo.Visible = true;
                    tr1321c.Visible = true;
                    lbl1321c.Text = dtCuestionario.Rows[0]["p1321"].ToString();

                    tr1322c.Visible = true;
                    lbl1322c.Text = dtCuestionario.Rows[0]["p1322"].ToString();
                }
                lbl140c.Text = dtCuestionario.Rows[0]["p140"].ToString();
                lbl150c.Text = dtCuestionario.Rows[0]["p150"].ToString();
                lbl160c.Text = dtCuestionario.Rows[0]["p160"].ToString();



            }
        }
    }
}