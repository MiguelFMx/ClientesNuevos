﻿<%@ Page Title="Autoevaluacion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="autoevaluacion.aspx.cs" Inherits="ClientesNuevos.F5.Autoevaluacion.autoevaluacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>
    <script src="../../Scripts/sweetalert2.all.min.js"></script>
    <script src="../Evaluacion.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <asp:HiddenField ID="hfCultura" runat="server" />

        <!-- barra de progreso -->
        <div class="row">
            <div class="col">
                <div class="progress" style="height: 20px;">
                    <div class="progress-bar bg-warning progress-bar-striped" style="width: 1%;" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="barradeprogreso"></div>
                </div>
                <br />
            </div>
        </div>
        <!-- Tabla -->

        <div class="row" >
            <span class="font-weight-bolder" style="font-weight:bolder">
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources: autoevaluacion, lblInstrucciones %>"></asp:Literal>
            </span>
            <div class="col">
                <div class="card mb-3" style="width:100%;">
                    <div class="table-responsive">
                        <table class="table table-hover" id="tPreguntas">
                            <caption>1 de 8</caption>
                            <thead class="table-primary border-primary">
                                <tr>
                                    <th>
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources: autoevaluacion,lblNumero %>"></asp:Literal></th>
                                    <th>
                                        <asp:Literal ID="Literal3" runat="server" Text="<%$Resources: autoevaluacion, lblPregunta %>"></asp:Literal></th>
                                    <th colspan="4">
                                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources: autoevaluacion,lblOpciones  %>"></asp:Literal></th>
                                    <th style="width: 300px;">
                                        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources: autoevaluacion, lblObservaciones %>"></asp:Literal></th>
                                </tr>
                            </thead>
                            <tbody class="border-primary">
                                <tr>
                                    <td><span>1.0.1</span> </td>

                                    <td><span>La empresa cuenta con procesos verificables y por escrito para la selección de .. </span></td>
                                    <td>
                                        <input type="radio" name="name" value="5" /></td>
                                    <td>
                                        <input type="radio" name="name" value="3" />
                                    </td>
                                    <td>
                                        <input type="radio" name="name" value="0" />
                                    </td>
                                    <td>
                                        <input type="radio" name="name" value="0" />
                                    </td>
                                    <td>
                                        <input type="text" name="txtObservacion" value="" id="txtObservacion" />
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot></tfoot>

                        </table>
                    </div>
                </div>

            </div>

        </div>
        <!-- Botones -->
        <div class="row">
            <div class="col" style="display: flex; justify-content: flex-start;">
                <button class="btn btn-secondary" id="btnAnterior" type="button"><i class="bi bi-chevron-left"></i> <asp:Literal ID="Literal7" runat="server" Text="<%$Resources: InformacionCompania, lblBtnAtras %>"></asp:Literal></button>
            </div>
            <div class="col" style="display: flex; justify-content: flex-end;">
                <button class="btn btn-warning text-white" id="btnSiguiente" type="button">
                    <asp:Literal ID="Literal6" runat="server" Text="<%$Resources:InformacionCompania, lblBtnContinuar %>"></asp:Literal> <i class="bi bi-chevron-right"></i></button>
            </div>
        </div>

        <div>
            <button id="btnCheck" type="button" hidden>guardar respuesta</button>
            <button id="btnMostrar" type="button" hidden>Mostrar respuestas</button>

            <button id="btnMostrar2" type="button" hidden>respuestas</button>
        </div>
    </div>


</asp:Content>
