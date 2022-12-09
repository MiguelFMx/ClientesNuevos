using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Net.Sockets;
using System.Net;
using ClientesNuevos.App_Code;

namespace ClientesNuevos.admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                if(DateTime.Now.ToString("dd") == "01")
                {
                    clsConfiguracion.ActualizarOP();
                }
            }



        }

       
    }
}