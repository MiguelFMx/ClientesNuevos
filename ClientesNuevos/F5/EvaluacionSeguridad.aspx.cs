using ClientesNuevos.App_Code;
using ClientesNuevos.F5;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClientesNuevos.F14;
using System.Data;
using static ClientesNuevos.F14.wsBaseDatos;

namespace ClientesNuevos.cliente.F5
{
    public partial class EvaluacionSeguridadRiesgoBussinessPartner : System.Web.UI.Page
    {

        List<wsBaseDatos.Estatus> lststatus = new List<wsBaseDatos.Estatus>();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lststatus = Obtener_Estatus();
                if(lststatus.Count > 0)
                {
                    txt100.Text = lststatus[0].No_cuenta;
                    txt1311.Text = lststatus[0].No_cuenta;
                    if (lststatus[0].Status == "1")
                    {
                        cb1312.Items.FindByValue("1").Selected = true;
                    }else if(lststatus[0].Status == "2")
                    {
                        cb1312.Items.FindByValue("2").Selected = true;

                    }
                }
                string idF5 = GetID() + "F5C";
                DataTable dtF5 = clsHerramientaBD.Existe("SELECT * FROM Table_CuestionarioCTPAT WHERE ID_Cuestionario='"+idF5+"'");
                if(dtF5.Rows.Count > 0)
                {
                    CargarRespuestas(dtF5);
                }
            }
        }

        private void CargarRespuestas(DataTable dtF5)
        {
            switch(dtF5.Rows[0]["p120"].ToString())
            {
                case "SI":
                    radio120.SelectedValue = "SI";
                    break;
                case "NO":
                    radio120.SelectedValue = "NO";
                    break;
                case "N/A":
                    radio120.SelectedValue = "N/A";
                    break;
            }
            if (dtF5.Rows[0]["p130"].ToString()=="SI")
            {
                radio130.SelectedValue = "SI";
                PanelSi.Visible = true;
                PanelNo.Visible = false;

                txt1311.Text = dtF5.Rows[0]["p1311"].ToString();

                string id0 = cb1312.SelectedItem.Text;
                cb1312.Items.FindByText(id0).Selected = false;
                cb1312.Items.FindByValue(dtF5.Rows[0]["p1312"].ToString()).Selected = true;

                string id1 = cb1313.SelectedItem.Text;
                cb1313.Items.FindByText(id1).Selected = false;
                cb1313.Items.FindByValue(dtF5.Rows[0]["p1313"].ToString()).Selected = true;
            }
            else
            {
                if(dtF5.Rows[0]["p130"].ToString() == "NO")
                {
                    radio130.SelectedValue = "NO";
                }
                else
                {
                    radio130.SelectedValue = "N/A";
                }
                PanelNo.Visible = true;
                PanelSi.Visible = false;

                switch (dtF5.Rows[0]["p1321"].ToString())
                {
                    case "SI":
                        radio1321.SelectedValue = "SI";
                        break;
                    case "NO":
                        radio1321.SelectedValue = "NO";
                        break;
                    case "N/A":
                        radio1321.SelectedValue = "N/A";
                        break;
                }
                switch (dtF5.Rows[0]["p1322"].ToString())
                {
                    case "SI":
                        radio1322.SelectedValue = "SI";
                        break;
                    case "NO":
                        radio1322.SelectedValue = "NO";
                        break;
                    case "N/A":
                        radio1322.SelectedValue = "N/A";
                        break;
                }
            }
            switch (dtF5.Rows[0]["p140"].ToString())
            {
                case "SI":
                    radio140.SelectedValue = "SI";
                    break;
                case "NO":
                    radio140.SelectedValue = "NO";
                    break;
                case "N/A":
                    radio140.SelectedValue = "N/A";
                    break;
            }
            switch (dtF5.Rows[0]["p150"].ToString())
            {
                case "SI":
                    radio150.SelectedValue = "SI";
                    break;
                case "NO":
                    radio150.SelectedValue = "NO";
                    break;
                case "N/A":
                    radio150.SelectedValue = "N/A";
                    break;
            }
            switch (dtF5.Rows[0]["p160"].ToString())
            {
                case "SI":
                    radio160.SelectedValue = "SI";
                    break;
                case "NO":
                    radio160.SelectedValue = "NO";
                    break;
                case "N/A":
                    radio160.SelectedValue = "N/A";
                    break;
            }
        }

        protected void radioMiembro_SelectedIndexChanged(object sender, EventArgs e)
        {
            string radio = radio130.SelectedValue;
            if (radio == "SI" || radio =="YES")
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
            wsAutoevaluacion wsAutoevaluacion = new wsAutoevaluacion();
            string res = "";
            res = wsAutoevaluacion.Registrar_cuestionario(ID_cuestionario, p100, p120, p130, p140, p150, p160, p1311, p1312, p1313, p1321, p1322);

            return res;
        }

        private string GetID()
        {
            string id;
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            id = wsBaseDatos.GetID();

            return id;
        }

        private List<wsBaseDatos.Estatus> Obtener_Estatus()
        {
            List<wsBaseDatos.Estatus> estatus = new List<wsBaseDatos.Estatus>();
            wsBaseDatos wsBaseDatos = new wsBaseDatos();
            estatus = wsBaseDatos.ObtenerEstatus(GetID());

            return estatus;
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            //Boton de home, guarda respuestas y se actualiza el avance en 50%; redireccion a index
            wsBaseDatos wsBaseDatos = new wsBaseDatos();

            //Dclaracion de variables
            string rad130, rad120, rad140, rad150, rad160, rad1321, rad1322, p1311, p1312, p1313, res = "", id = "", id_custionario = "", id_evaluacion = "";
            string no_cuenta = "", doc="";
            id = GetID();
            id_custionario = id + "F5C";
            id_evaluacion = id + "F5E";

            //Asignacion d valores
            no_cuenta = txt100.Text;
            rad120 = radio120.SelectedValue;
            rad130 = radio130.SelectedValue;
            rad140 = radio140.SelectedValue;
            rad150 = radio150.SelectedValue;
            rad160 = radio160.SelectedValue;
            rad1321 = radio1321.SelectedValue;
            rad1322 = radio1322.SelectedValue;
            p1311 = txt1311.Text;
            p1312 = cb1312.SelectedValue;
            p1313 = cb1313.SelectedValue;

            if (rad130 == "SI")
            {
                //Si la respuesta a 1.3.0 es si
                res = Guardar_respuestas(id_custionario, no_cuenta, rad120, rad130, rad140, rad150, rad160, p1311, p1312, p1313, "", "");
            }
            else if (rad130 == "NO" || rad130 == "N/A")
            {
                //Si la respuesta a 1.3.0 es no o n/a

                res = Guardar_respuestas(id_custionario, no_cuenta, rad120, rad130, rad140, rad150, rad160, "", "", "", rad1321, rad1322);
            }

            lbluno.Text = res;

            doc = wsBaseDatos.InsertarDocumento(GetID(), "F5", "", "50%");
            Registrar_F5();
            lbluno.Text = doc;

            Response.Redirect("../usuario/user_index.aspx?res="+doc);

        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            //Boton continuar, redirecciona a la autoevaluacion, s guarda elavance en 50%

            //Declaracion de variables
            string rad130, rad120, rad140, rad150, rad160, rad1321, rad1322, p1311, p1312, p1313, res = "", id = "", id_custionario = "", id_evaluacion = "";
            string no_cuenta = "";
            id = GetID();
            id_custionario = id + "F5C";
            id_evaluacion = id + "F5E";

            //asignacion de valores
            
            no_cuenta = txt100.Text;
            rad120 = radio120.SelectedValue;
            rad130 = radio130.SelectedValue;
            rad140 = radio140.SelectedValue;
            rad150 = radio150.SelectedValue;
            rad160 = radio160.SelectedValue;
            rad1321 = radio1321.SelectedValue;
            rad1322 = radio1322.SelectedValue;
            p1311 = txt1311.Text;
            p1312 = cb1312.SelectedValue;
            p1313 = cb1313.SelectedValue;

            if(rad120 == "YES")
            {
                rad120 = "SI";
            }
            if(rad130 == "YES")
            {
                rad130 = "SI";
            }
            if(rad140 == "YES")
            {
                rad140 = "SI";
            }
            if(rad150 == "YES")
            {
                rad150 = "SI";
            }
            if(rad160 == "YES")
            {
                rad160 = "SI";
            }
            if(rad1321 == "YES")
            {
                rad1321 = "SI";
            }
            if(rad1322 == "YES")
            {
                rad1322 = "SI";
            }


            if (rad130 == "SI" || rad130=="YES")
            {
                //Si la respuesta a la pregunta es 1.3.0 es si.
                res = Guardar_respuestas(id_custionario, no_cuenta, rad120, rad130, rad140, rad150, rad160, p1311, p1312, p1313, "", "");
            }
            else if (rad130 == "NO" || rad130 == "N/A")
            {
                //Si la respuesta a la pregunta es 1.3.0 es no o n/a.
                res = Guardar_respuestas(id_custionario, no_cuenta, rad120, rad130, rad140, rad150, rad160, "", "", "", rad1321, rad1322);
            }
            Registrar_F5();
            lbluno.Text = res;
            Response.Redirect("Autoevaluacion/autoevaluacion.aspx");
        }

        protected void Registrar_F5()
        {
            wsAutoevaluacion wsAutoevaluacion = new wsAutoevaluacion();
            //Registra en la tabla
            string str = "";
            string id = "";
            id = GetID();
            str = wsAutoevaluacion.Registrar_F5(id, id + "F5C", id+"F5E");
        }

    }

}
    

