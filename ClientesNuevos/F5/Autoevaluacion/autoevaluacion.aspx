<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="autoevaluacion.aspx.cs" Inherits="ClientesNuevos.F5.Autoevaluacion.autoevaluacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Autoevaluación</title>
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>
    <script src="../Evaluacion.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <!-- Como llenar xd
            automatico
            capturar la informacion del usuario
            
            -->
        <!-- barra de progreso -->
        <!-- Tabla -->

        <div class="row">
            <div class="progress">
                <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>

        <div class="row">

            <div class="col">
                <table class="table table-hover" id="tPreguntas">
                    <thead>
                        <tr>
                            <th>Numero</th>
                            <th>Pregunta</th>
                            <th>Si</th>
                            <th>Parcial</th>
                            <th>No</th>
                            <th>N/A</th>
                            <th>Observciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> <span>1.0.1</span> </td>
                            <td> <span>La empresa cuenta con procesos verificables y por escrito para la selección de socios comerciales, incluyendo transportistas, otros fabricantes, proveedores de productos y vendedores.. </span> </td>
                            <td>  <input type="radio" name="name" value="5" />    </td>
                            <td> <input type="radio" name="name" value="3" /> </td>
                            <td> <input type="radio" name="name" value="0" /> </td>
                             <td> <input type="radio" name="name" value="0" /> </td>
                            <td> <input type="text" name="name" value="" id="txtObservacion" /> </td> 
                        </tr>
                    </tbody>
                    <tfoot></tfoot>

                </table>
            </div>

        </div>
        <div class="row"></div>
    </div>

    <script type="text/javascript">

        cargarTabla();

    </script>

</asp:Content>
