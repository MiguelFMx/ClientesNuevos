using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ClientesNuevos.cliente.F14
{
    public partial class ClienteNuevo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public class listaContactoCompañia
        {
            public string Nombre { get; set; }
            public string Puesto { get; set; }
            public string Correo { get; set; }
            public string telefono { get; set; }
            public string celular { get; set; }

        }

        List<listaContactoCompañia> lstContactos = new List<listaContactoCompañia>();

        public List<listaContactoCompañia> MostrarContacto()
        {
            return lstContactos;
        }

        public void AddContactosCompañia(string nombre, string puesto, string correo, string telefono, string celular)
        {           
            listaContactoCompañia objLista = new listaContactoCompañia();
            objLista.Nombre = nombre;
            objLista.Puesto = puesto;
            objLista.Correo = correo;
            objLista.telefono = telefono;
            objLista.celular = celular;

            lstContactos.Add(objLista);
        }

        public void eliminarContacto(int index)
        {
            lstContactos.RemoveAt(index);
            MostrarContacto();
        }

    }
}