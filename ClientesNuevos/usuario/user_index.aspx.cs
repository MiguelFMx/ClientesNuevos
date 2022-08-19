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
                if(dt.Rows.Count > 0)
                {
                    lblCompania.Text = dt.Rows[0]["Nombre_comercial"].ToString();
                    cook = new HttpCookie("id_comp", dt.Rows[0]["ID_compania"].ToString());
                    Response.Cookies.Add(cook);
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

    }
}