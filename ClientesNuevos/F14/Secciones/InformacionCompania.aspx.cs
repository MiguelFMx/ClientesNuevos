using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace ClientesNuevos.F14.Seccioness
{
    public partial class ImformacionCompania : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {

            var nombre = txtNombreCompania.Text;

            txtTest.Text = nombre;
        }

        protected void btnNext_Command(object sender, CommandEventArgs e)
        {
           

            
        }
    }
}