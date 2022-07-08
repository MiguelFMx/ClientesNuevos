<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MapeoFlujo.aspx.cs" Inherits="ClientesNuevos.F43.MapeoFlujo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.6.0.slim.min.js"></script>
    <script src="MapeoFlujoJS.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col">
                <h4>Mapeo de flujo de carga y socios</h4>
            </div>
        </div>

        <div class="row" >
            <div class="col">

                 <table class="table  table-hover " id="tMapeo">
                    <thead  style="text-align:center">
                        <tr class="table-warning">
                            <th colspan="8">Flujo de carga-hungaros</th>
                        </tr>
                        <tr>
                            <th colspan="8">Flujo de carga, identificacion de clientes y procesos</th>
                        </tr>
                        <tr class="table-warning" style="text-align:left;">
                            <th colspan="4">Cliente</th>
                            <th colspan="4">Fecha</th>
                        </tr>
                        <tr>
                            <th>Cliente</th>
                            <th>Proceso</th>
                            <th>Movimiento de carga</th>
                            <th>Detalles de porveedor</th>
                            <th>Dias en que el cargamento esta en reposo</th>
                            <th>Modo de transporte N/A</th>
                            <th>Si la entidad maneja la carga fisicamente,¿quién lo selecciona como proveedor?</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="6"></td>
                            <td>
                                <span>Auditor:</span>
                                <input type="text" name="txtAuditor" value="" id="txtAuditor" class="form-control" />
                            </td>
                        </tr>

                    </tfoot>
                     
                </table>

            </div>
        </div>

        <div class="row"></div>
    </div>
    <script type="text/javascript">
        
    </script>
</asp:Content>
