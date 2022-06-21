<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="autoevaluacion.aspx.cs" Inherits="ClientesNuevos.F5.Autoevaluacion.autoevaluacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Autoevaluación</title>
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>
    <script src="../Evaluacion.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" >
        <!-- Como llenar xd
            automatico
            capturar la informacion del usuario
            
            -->
        <!-- barra de progreso -->
       
        <div class="row">
            <div class="progress" style="height: 20px;">
                <div class="progress-bar bg-warning progress-bar-striped" style="width: 1%;" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="barradeprogreso"></div>
            </div>
        </div>
 <!-- Tabla -->

        <div class="row">

            <div class="col">
                <table class="table table-hover" id="tPreguntas">
                    <caption>1 de 8</caption>
                    <thead class="table-dark">
                        <tr>
                            <th>Numero</th>
                            <th>Pregunta</th>
                            <th>Si</th>
                            <th>Parcial</th>
                            <th>No</th>
                            <th>N/A</th>
                            <th>Observaciones</th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>  

                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> <span>1.0.1</span> </td>
                            <td> <span>La empresa cuenta con procesos verificables y por escrito para la selección de .. </span> </td>
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
        <!-- Botones -->
        <div class="row">
            <div class="col-1">
                <button class="btn btn-secondary" style="font-size:15px;" id="btnAntrior" >Anterior</button>
            </div>
            <div class="col-5"></div>
            <div class="col-5"></div>
            <div class="col-1"> 
                <button class="btn btn-warning" style="font-size:15px;" id="btnSiguiente">Siguiente</button>
            </div>
        </div>
    </div>


</asp:Content>
