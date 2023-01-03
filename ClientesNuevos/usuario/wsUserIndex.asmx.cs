using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace ClientesNuevos.usuario
{
    /// <summary>
    /// Descripción breve de wsUserIndex
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class wsUserIndex : System.Web.Services.WebService
    {

        [WebMethod]
        public string CambioPass()
        {
            DataTable dt = new DataTable();
            string RFC = "", res = "";
            if (Context.Request.Cookies.Get("id") != null)
            {
                dt = clsHerramientaBD.Existe("SELECT * FROM Usuarios WHERE Id='" + Context.Request.Cookies.Get("id").Value + "'", clsHerramientaBD.strConnAdmon);
                RFC = dt.Rows[0]["RFC"].ToString();

                dt = clsHerramientaBD.Existe("SELECT * FROM Logins WHERE RFC='" + RFC + "'", clsHerramientaBD.strConnAdmon);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["PasswordChanged"].ToString() == "0")
                    {
                        res = "0";
                    }
                    else
                    {
                        res = "1";
                    }
                }
            }

            return res;
        }

    }
}
