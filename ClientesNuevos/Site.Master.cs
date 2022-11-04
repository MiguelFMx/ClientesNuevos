using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Web.Services;
using System.Web.Security;

namespace ClientesNuevos
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Cambia la direccion de los url al home
            if(Page.User.IsInRole("1") || Page.User.IsInRole("2"))
            {
                hlHome.NavigateUrl = "~/admin/index.aspx";
                hlHomeBar.NavigateUrl = "~/admin/index.aspx";
            }
        }
    }
}