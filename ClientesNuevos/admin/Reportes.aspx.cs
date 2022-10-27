﻿using ClientesNuevos.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ClientesNuevos.admin
{
    public partial class Reportes : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //llenarGrid();
                ActivosInactivos();
                ContadorOP();
            }
        }


        protected void llenarGrid()
        {
            DataTable dt = new DataTable();
            DataTable dt_Display = new DataTable();
            dt = clsHerramientaBD.Existe("SELECT * FROM Table_compania");
            string nombre, nombreCompleto, fecha, estatus, RFC, tipo;
            string clase = "";

            dt_Display.Columns.Add(new DataColumn("nombre"));
            dt_Display.Columns.Add(new DataColumn("nombreCompleto"));
            dt_Display.Columns.Add(new DataColumn("fecha"));
            dt_Display.Columns.Add(new DataColumn("estatus"));
            dt_Display.Columns.Add(new DataColumn("clase"));
            dt_Display.Columns.Add(new DataColumn("rfc"));
            dt_Display.Columns.Add(new DataColumn("tipo"));

            foreach (DataRow row in dt.Rows)
            {
                

                nombre = row["Nombre_comp"].ToString();
                nombreCompleto = row["Nombre_comercial"].ToString();
                fecha = row["Fecha_registro"].ToString().Substring(0, 10);
                estatus = row["Estatus"].ToString();

                if(row["Estatus"].ToString() == "activo")
                {
                    clase = "etiqueta";
                }
                else if(row["Estatus"].ToString() == "inactivo")
                {
                    clase = "etiqueta peligro";
                }

                RFC = row["RFC"].ToString();

                if (row["Tipo_persona"].ToString() == "1")
                {
                    tipo = "moral";
                }
                else if (row["Tipo_persona"].ToString() == "0")
                {
                    tipo = "fisica";
                }
                else
                {
                    tipo = "extranjero";
                }


                dt_Display.Rows.Add(new Object[] { nombre, nombreCompleto, fecha, estatus, clase, RFC, tipo });
            }


           // gvComp.DataSource = dt_Display;
           // gvComp.DataBind();

        }

        protected void ActivosInactivos()
        {
            DataTable dtRegistros = new DataTable();
            int cant = 0;
            int inac = 0;
            int op = 0;
            string fecha="";
            string mes = "";
            dtRegistros = clsHerramientaBD.Existe("SELECT * FROM Table_compania");

            if(dtRegistros.Rows.Count > 0)
            {
                for (int i = 0; i < dtRegistros.Rows.Count; i++)
                {
                    
                    if (dtRegistros.Rows[i]["Estatus"].ToString() == "activo")
                    {
                        cant++;
                    }
                    else
                    {
                        inac++;
                    }
                    //if(dtRegistros.Rows[i]["Fecha_registro"].ToString().Substring())
                    
                }
            }           

            lblActivos.Text = cant.ToString();
            lblInactivos.Text = inac.ToString();
            lblOP.Text = op.ToString();
        }
        /*
         fecha = dtRegistros.Rows[i]["Fecha_registro"].ToString().Substring(3, 2);
                    mes = DateTime.Now.ToString("MM");
         
         */
        protected void ContadorOP()
        {
            DataTable dtComp = new DataTable();
            DataTable dtDoc = new DataTable();
            int sinOP = 0;
            int OPdes = 0;
            dtComp = clsHerramientaBD.Existe("SELECT * FROM Table_compania WHERE Estatus='activo'");
            if (dtComp.Rows.Count > 0)
            {
                for (int i = 0; i < dtComp.Rows.Count; i++)
                {
                    string id = dtComp.Rows[i]["ID_compania"].ToString();
                    dtDoc = clsHerramientaBD.Existe("SELECT * FROM Table_Documentos WHERE Documento='Opinion positiva' AND ID_compania='"+id+"'");
                    if(dtDoc.Rows.Count > 0)
                    {
                        string mes = DateTime.Now.ToString("MM");
                        string fecha = dtDoc.Rows[0]["Fecha_creacion"].ToString().Substring(3, 2);

                        if(fecha != mes)
                        {
                            OPdes++;
                        }
                    }
                    else
                    {
                        sinOP++;
                    }
                }
            }

            lblOP.Text = OPdes.ToString();
            lblSinOP.Text = sinOP.ToString();
        }
    }
}