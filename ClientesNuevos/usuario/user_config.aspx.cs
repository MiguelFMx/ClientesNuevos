using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;
using System.Data;
using System.Globalization;

namespace ClientesNuevos.usuario
{
    public partial class user_config : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ddIdioma_SelectedIndexChanged(object sender, EventArgs e)
        {
            string index = ddIdioma.SelectedItem.Value;
            CultureInfo cul;
            switch (index)
            {
                case "es-MX":
                   cul = CultureInfo.CreateSpecificCulture("es");

                    System.Threading.Thread.CurrentThread.CurrentUICulture = cul;
                    System.Threading.Thread.CurrentThread.CurrentCulture = cul;

                    break;
                case "en-US":
                   cul = CultureInfo.CreateSpecificCulture("en");
                    System.Threading.Thread.CurrentThread.CurrentUICulture = cul;
                    System.Threading.Thread.CurrentThread.CurrentCulture = cul;
                    break;
            }

        }

        protected void CambiarPass_CancelButtonClick(object sender, EventArgs e)
        {

        }

        protected void CambiarPass_ChangingPassword(object sender, LoginCancelEventArgs e)
        {

            lblPass.Text = "";
            if (CambiarPass.CurrentPassword != CambiarPass.NewPassword)
            {
                int affectedRow = 0;
                string SqlStr = "UPDATE [Usuarios] SET [Password] = @NewPass WHERE [RFC] = @RFC AND [Password] = @CurrentPass";

                SqlConnection con = new SqlConnection(clsHerramientaBD.strConnAdmon);
                SqlCommand cmd = new SqlCommand(SqlStr, con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                cmd.Parameters.AddWithValue("@RFC", this.Page.User.Identity.Name);
                cmd.Parameters.AddWithValue("@CurrentPass", CambiarPass.CurrentPassword);
                cmd.Parameters.AddWithValue("@NewPass", CambiarPass.NewPassword);
                try
                {
                    con.Open();
                    affectedRow = cmd.ExecuteNonQuery();
                    con.Close();


                    if (affectedRow > 0)
                    {
                        CambiarEstadoPass(this.Page.User.Identity.Name);
                        lblPass.ForeColor = Color.Green;
                        lblPass.Text = "La contraseña ha sido actualizada";
                        Response.Redirect("~/login.aspx?pass=success");

                        //CambiarPass.SuccessTemplate.InstantiateIn(CambiarPass);
                        //CambiarPass.ChangePasswordTemplateContainer.Visible = false;
                    }
                    else
                    {
                        lblPass.ForeColor = Color.Red;
                        lblPass.Text = "La contraseña actual es incorrecta";
                    }
                }
                catch (SqlException ex)
                {
                    lblPass.Text = "Ocurrio un error: " + ex.Message;
                }
               
            }
            else
            {
                lblPass.Text = "La nueva contraseña no puede ser igual a la actual";
            }
            e.Cancel = true;
        }

        protected void CancelPushButton_Click(object sender, EventArgs e)
        {
            CambiarPass.Attributes.Clear();
        }

        

        protected void btnTest_Click(object sender, EventArgs e)
        {
        }

        protected void CambiarEstadoPass(string RFC)
        {
            /* DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Logins WHERE RFC ='" + RFC + "'", clsHerramientaBD.strConnAdmon);
             int PassChange = Convert.ToInt32(dt.Rows[0]["PasswordChanged"].ToString());
             PassChange++;
             string cambios = clsHerramientaBD.ExecuteSql("UPDATE Logins SET [PasswordChanged] = '" + PassChange + "' WHERE RFC='"+RFC+"'", clsHerramientaBD.strConnAdmon);
             */
            string cambios = "";
            DataTable dt = clsHerramientaBD.Existe("SELECT * FROM Usuarios WHERE RFC = '" + RFC + "'", clsHerramientaBD.strConnAdmon);
            if( dt.Rows.Count > 0)
            {
                cambios = clsHerramientaBD.ExecuteSql("UPDATE Usuarios SET password_changed = 1 WHERE RFC='" + RFC + "'", clsHerramientaBD.strConnAdmon);
            }

        }

        protected void CambiarPass_ChangedPassword(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx?pass=success");
        }

        protected void CambiarPass_ContinueButtonClick(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx?pass=success");

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //Cambiar idioma

        }
    }
}