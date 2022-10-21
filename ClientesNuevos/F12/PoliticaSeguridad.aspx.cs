using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClientesNuevos.F14;
using System.Globalization;

namespace ClientesNuevos.F12
{
    public partial class PoliticaSeguridad : System.Web.UI.Page
    {
        DataTable data, respuestas, ctpat, politica;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                data = Obtener_informacion();
                respuestas = Respuestas(Request.Cookies.Get("id_comp").Value);
                ctpat = CadenaSuministro();

                politica = clsHerramientaBD.Existe("SELECT * FROM Table_PoliticaSeguridad WHERE ID_compania='"+ Request.Cookies.Get("id_comp").Value + "'");

                lblNombre.Text = data.Rows[0]["Nombre_comp"].ToString();
                lblDireccion.Text = data.Rows[0]["Direccion"].ToString();
                lblEmpresa1.Text = data.Rows[0]["Nombre_comp"].ToString();
                lblFecha.Text = DateTime.Now.ToString("dd 'de' MMMM 'de' yyyy");

                //Es miembro o esta en proceso de ser miembro de CTPAT
                if (respuestas.Rows[0]["p130"].ToString() == "SI")
                {
                    si2.Checked = true;
                    si1.Checked = true;
                    txtnumeroCuenta.Text = respuestas.Rows[0]["p100"].ToString();
                }
                else
                {
                    no2.Checked = true;
                    no1.Checked = true;
                }

                //Nuestra compania es elegible para ser miembro ctpat
                if (respuestas.Rows[0]["p120"].ToString() == "SI")
                {
                    si3.Checked = true;
                    pPrgunta4.Visible = false;
                }
                else
                {
                    no3.Checked = true;
                    pPrgunta4.Visible = true;
                }
                //Esta usted respondiendo por todas las unidades de negocio de su compania
                if (respuestas.Rows[0]["p160"].ToString() == "SI")
                {
                    si7.Checked = true;
                }
                else
                {
                    no7.Checked = true;
                }
                //Nuestra compania comprende las normas minimas de seguridad de CTPAT
                if (respuestas.Rows[0]["p140"].ToString() == "SI")
                {
                    si4.Checked = true;
                }
                else
                {
                    no4.Checked = true;
                }
                //SI hay programas, obtengo la lista de los programas de seguridad 
                if (ctpat.Rows[0]["Programas"].ToString() == "si")
                {
                    si6.Checked = true;
                    gvProgramas.DataSource = clsHerramientaBD.Existe("SELECT Descripcion, codigo_certificacion FROM Table_ProgramaSeguridad WHERE ID_compania='" + Request.Cookies.Get("id_comp").Value + "'");
                    gvProgramas.DataBind();
                }
                else
                {
                    no6.Checked = true;
                }
                
                if(politica.Rows.Count > 0)
                {
                    string fecha = "", newFormat="";
                    //Obtengo fecha, y selecciono solo la fecha ya que viene con tiempo
                    fecha = politica.Rows[0]["Fecha"].ToString().Substring(0, 10);

                    //Nuevo formaate de fecha pasa de 21/10/2022 a '21 de octubre de 2022'
                    newFormat = DateTime.ParseExact(fecha, "dd'/'MM'/'yyyy", CultureInfo.InvariantCulture).ToString("dd 'de' MMMM 'de' yyyy");
                    
                    lblFecha.Text = newFormat;
                    txtNombre.Text = politica.Rows[0]["Representante"].ToString();
                    if (politica.Rows[0]["Firma"].ToString() == "si")
                    {
                        chFirma.Checked = true;
                    }

                    if (politica.Rows[0]["OEA"].ToString() != "")
                    {
                        si5.Checked = true;
                        lblpregunta5.Text = "Somos participantes en el programa de seguridad de la cadena de suministro de nuestro País. Nuevo Esquema de Empresas Certificadas OEA. Con Número:";
                        txtPregunta5.Visible = true;
                        txtPregunta5.Text = politica.Rows[0]["OEA"].ToString();
                      
                    }
                    else
                    {
                        no5.Checked = true;
                        lblpregunta5.Text = "Somos participantes en el programa de seguridad de la cadena de suministro de nuestro País. Nuevo Esquema de Empresas Certificadas OEA.";
                        txtPregunta5.Visible = false;
                    }

                }
            }
        }

        private DataTable Obtener_informacion()
        {
            DataTable dt = new DataTable();
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            dt = wsBaseDatos.getCompania(Request.Cookies.Get("id").Value);

            return dt;
        }

        protected void si5_CheckedChanged(object sender, EventArgs e)
        {
            if (si5.Checked)
            {
                lblpregunta5.Text = "Somos participantes en el programa de seguridad de la cadena de suministro de nuestro País. Nuevo Esquema de Empresas Certificadas OEA. Con Número:";
                txtPregunta5.Visible = true;
            }
            else
            {
                lblpregunta5.Text = "Somos participantes en el programa de seguridad de la cadena de suministro de nuestro País. Nuevo Esquema de Empresas Certificadas OEA.";
                txtPregunta5.Visible = false;
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            string strRes = "", OEA="", repre="";
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            if (si5.Checked)
            {
                OEA = txtPregunta5.Text;
            }else if (no5.Checked)
            {
                OEA = "no";
            }
            repre = txtNombre.Text;

            if (chFirma.Checked)
            {
                strRes = wsPoliticaSeguridad.Insertar_PoliticaSeguridad(Request.Cookies.Get("id_comp").Value, OEA, repre, "si");
                if(strRes != "")
                {
                    strRes += wsBaseDatos.InsertarDocumento(Request.Cookies.Get("id_comp").Value, "F12", "", "revision");
                    
                    lblError.Text = strRes;
                    lblError.Visible = true;

                    Response.Redirect("~/usuario/user_index.aspx");

                }
            }
            else
            {
                lblError.Visible = true;
            }
            
        }

        //Obtiene respuestas de la tabla de respuestas de F5 parte 1
        private DataTable Respuestas(string id)
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            DataTable dt;
            dt = wsBaseDatos.Existe("SELECT * FROM Table_CuestionarioCTPAT WHERE ID_Cuestionario='"+id+"F5C'");

            return dt;
        }

        //Obtiene nombre y codigo de los programas de cadena de suministro
        private DataTable CadenaSuministro()
        {
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            DataTable dt;
            dt = wsBaseDatos.Existe("SELECT * FROM Table_ctpat WHERE ID_compania='"+Request.Cookies.Get("id_comp").Value+"'");

            return dt;
        }
    }
}