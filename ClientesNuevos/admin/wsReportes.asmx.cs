using ClientesNuevos.App_Code;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;


namespace ClientesNuevos.admin
{
    /// <summary>
    /// Descripción breve de wsReportes
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class wsReportes : System.Web.Services.WebService
    {

        public class ListaCorreo
        {
            public string Nombre { get; set; }
            public string Puesto { get; set; }
            public string Correo { get; set; }
            public string OP { get; set; }
            public string RFC { get; set; }
            public string Compania { get; set; }

        }
        [WebMethod]
        public List<ListaCorreo> GetCorreosOP()
        {
            List<ListaCorreo> correos = new List<ListaCorreo>();
            correos = ContadorOP();
            return correos;
        }



        protected List<ListaCorreo> ContadorOP()
        {
            DataTable dtComp = new DataTable();
            DataTable dtDoc = new DataTable();
            DataTable dtActDoc = new DataTable();
            DataTable dtContacto = new DataTable();
            int cantidad = 0;
            string lapso = "";

            List<ListaCorreo> lstCorreo = new List<ListaCorreo>();
            ListaCorreo objC;

            //Selecciono el archivo que quiero comparar en este caso OP(opinion positiva)
            dtActDoc = clsHerramientaBD.Existe("SELECT * FROM Act_Docs WHERE Documento='OP'");

            //Se encontro, obtengo la cantidad de mes/anios 
            if (dtActDoc.Rows.Count > 0)
            {
                cantidad = Convert.ToInt32(dtActDoc.Rows[0]["cantidad"].ToString());
                lapso = dtActDoc.Rows[0]["lapso"].ToString();

            }

            //obtengo las empresas registradas
            dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE Estatus='activo' AND Tipo_persona!='2'");
            if (dtComp.Rows.Count > 0)
            {
                //Recorro la tabla
                for (int i = 0; i < dtComp.Rows.Count; i++)
                {
                    //obtengo RFC
                    string id = dtComp.Rows[i]["ID_compania"].ToString();

                    //Checo si el tipo de persona no es extranjero
                    if (dtComp.Rows[i]["Tipo_persona"].ToString() != "2")
                    {
                        //Veo si esta registrada la opinion positiva en la tabla de documentos.
                        dtDoc = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE Documento='Opinion positiva' AND ID_compania='" + id + "'");

                        //si count es mayor a 0, significa que si esta registrado
                        if (dtDoc.Rows.Count > 0)
                        {

                            int mesDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(3, 2));
                            int anioDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(6, 4));
                            int diaDoc = Convert.ToInt32(dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(0, 2));

                            DateTime FechaRegistrada = new DateTime(anioDoc, mesDoc, diaDoc);
                            DateTime fechaActualizacion = DateTime.Now.Date;


                            dtContacto = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE ID_compania = '" + id + "' AND (Tipo='Comp' OR Tipo='Fra')");

                            switch (lapso)
                            {
                                case "mensual": //year, month, day
                                                //si es la fecha actual es mayor que la fecha del documento significa que esta actualizado
                                    FechaRegistrada = FechaRegistrada.AddMonths(cantidad);
                                    if (FechaRegistrada.Month <= fechaActualizacion.Month )
                                    {
                                        for (int index = 0; index < dtContacto.Rows.Count; index++)
                                        {
                                            objC = new ListaCorreo
                                            {
                                                RFC = dtContacto.Rows[index]["ID_compania"].ToString(),
                                                Correo = dtContacto.Rows[index]["Correo"].ToString(),
                                                OP = "si",
                                                Nombre = dtContacto.Rows[index]["Nombre"].ToString(),
                                                Puesto = dtContacto.Rows[index]["Puesto"].ToString(),
                                                Compania = dtComp.Rows[i]["Nombre_comercial"].ToString()
                                            };
                                            lstCorreo.Add(objC);
                                        }

                                    }
                                    break;
                                case "anual":
                                    FechaRegistrada = FechaRegistrada.AddYears(cantidad);
                                    if (FechaRegistrada.Year == fechaActualizacion.Year)
                                    {
                                        for (int index = 0; index < dtContacto.Rows.Count; index++)
                                        {
                                            objC = new ListaCorreo
                                            {
                                                RFC = dtContacto.Rows[index]["ID_compania"].ToString(),
                                                Correo = dtContacto.Rows[index]["Correo"].ToString(),
                                                OP = "si",
                                                Nombre = dtContacto.Rows[index]["Nombre"].ToString(),
                                                Puesto = dtContacto.Rows[index]["Puesto"].ToString()
                                            };
                                            lstCorreo.Add(objC);
                                        }
                                    }
                                    break;
                            }
                        }
                        else
                        {
                            dtContacto = clsHerramientaBD.Existe("SELECT * FROM Table_Contacto WHERE ID_compania = '" + id + "' AND (Tipo='Comp' OR Tipo='Fra')");
                            //dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE ID_compania ='" + id + "'");
                            for (int index = 0; index < dtContacto.Rows.Count; index++)
                            {
                                objC = new ListaCorreo
                                {
                                    RFC = dtContacto.Rows[index]["ID_compania"].ToString(),
                                    Correo = dtContacto.Rows[index]["Correo"].ToString(),
                                    OP = "no",
                                    Nombre = dtContacto.Rows[index]["Nombre"].ToString(),
                                    Puesto = dtContacto.Rows[index]["Puesto"].ToString(),
                                    Compania = dtComp.Rows[i]["Nombre_comercial"].ToString()

                                };
                                lstCorreo.Add(objC);
                            }

                        }
                    }
                }
            }
            return lstCorreo;
        }

        public DataTable getTabla(string tipo)
        {
            List<ListaCorreo> listaCorreos = ContadorOP();
            DataTable result = new DataTable();
            //Agregamos las columnas
            /*
              public string Nombre { get; set; }
            public string Puesto { get; set; }
            public string Correo { get; set; }
            public string OP { get; set; }
            public string RFC { get; set; }
            public string Compania { get; set; }
             */
            result.Columns.Add("Nombre");
            result.Columns.Add("Puesto");
            result.Columns.Add("Correo");
            result.Columns.Add("OP");
            result.Columns.Add("RFC");
            result.Columns.Add("Compania");
            

            for (int i = 0; i < listaCorreos.Count; i++)
            {
                if(tipo == "si" )
                {
                    if (listaCorreos[i].OP == "si")
                    {
                        result.Rows.Add(new Object[] { listaCorreos[i].Nombre, listaCorreos[i].Puesto, listaCorreos[i].Correo, listaCorreos[i].OP,
                listaCorreos[i].RFC, listaCorreos[i].Compania});
                    }
                }
                else
                {
                    if(listaCorreos[i].OP == "no")
                    {
                        result.Rows.Add(new Object[] { listaCorreos[i].Nombre, listaCorreos[i].Puesto, listaCorreos[i].Correo, listaCorreos[i].OP,
                listaCorreos[i].RFC, listaCorreos[i].Compania});
                    }
                }
                
            }

            return result;
        }

    }
}
