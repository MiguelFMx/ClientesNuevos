using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.cliente.F5
{
    public partial class EvaluacionSeguridadRiesgoBussinessPartner : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            string rad130, res="";
            rad130 = radio130.SelectedValue;
            if( rad130 == "SI")
            {
                res = Guardar_respuestas("", txt100.Text,radio120.SelectedValue,radio130.SelectedValue, radio140.SelectedValue, radio150.SelectedValue,radio160.SelectedValue
                    , "", "", "", "", "");
            }
            else if (rad130 == "NO" || rad130=="N/A")
            {
                res = Guardar_respuestas("", "", "", "", "", "", "", "", "", "", "", "");

            }
        }

        protected void radioMiembro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string radio = radio130.SelectedValue;
            if (radio == "SI")
            {
                PanelSi.Visible = true;
                PanelNo.Visible = false;
                radio1321.ClearSelection();
                radio1322.ClearSelection();

            }
            else if (radio == "NO" || radio == "N/A")
            {
                txt1311.Text = "";

                PanelSi.Visible = false;
                PanelNo.Visible = true;
            }
        }



        private string Guardar_respuestas(string ID_cuestionario, string p100, string p120, string p130, string p140, string p150, string p160, string p1311, string p1312, string p1313, string p1321, string p1322)
        {
            string res = "";


            return res;
        }
    }
}
    

