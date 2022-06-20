using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;

namespace ClientesNuevos.F5
{
    /// <summary>
    /// Descripción breve de wsAutoevaluacion
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class wsAutoevaluacion : System.Web.Services.WebService
    {
        public static string strConnction = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        [WebMethod]
        public string HelloWorld()
        {
            return "Hola a todos";
        }
    }
}
