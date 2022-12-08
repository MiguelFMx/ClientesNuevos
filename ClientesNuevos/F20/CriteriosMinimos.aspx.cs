using ClientesNuevos.F14;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.F20
{
    public partial class CriteriosMinimos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            string id = Request.Cookies.Get("id").Value;
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            string res;

            if (chFirma.Checked)
            {
                res = wsBaseDatos.InsertarDocumento(id, "F20", "", "100%");
                if (res != "")
                {
                    Response.Redirect("~/usuario/user_index.aspx");
                }
            }
            else
            {
                lblFirma.Visible = true;
            }
        }
    }
}