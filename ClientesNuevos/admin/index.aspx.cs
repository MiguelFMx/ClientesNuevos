using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Net.Sockets;

namespace ClientesNuevos.admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsIdentity ident = User.Identity as FormsIdentity;
            FormsAuthenticationTicket authTicket = ident.Ticket;

            string userInfo = authTicket.UserData;
            string[] info = userInfo.Split(';');
            string id = info[1];

            if (Request.IsAuthenticated)
            {                
                lblNuevo.Text += "  " + authTicket.UserData + "  "+id;
            }
        }

       
    }
}